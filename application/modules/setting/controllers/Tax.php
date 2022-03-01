<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Tax extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Setting_Model', 'setting', true);  
        
        $this->data['setting'] = $this->setting->get_single('settings', array('status'=>1));           
    }

        
    public function index() {

        check_permission(VIEW);       
               
        $this->data['taxs'] = $this->setting->get_alltax_type();
        $this->data['list'] = TRUE;
        $this->layout->title(get_phrase('email') . ' ' . get_phrase('tax_type') . ' | ' . SMS);
        $this->layout->view('tax/index', $this->data);
    }

    public function add() {

        check_permission(ADD);
       
        $this->layout->title(get_phrase('tax_type'). ' | ' . SMS);
        $this->layout->view('tax/index', $this->data);
    }
    public function edit($id = null) {
        check_permission(EDIT);
        $this->data['edit']     =   TRUE;
        $this->data['tax']      =   $this->setting->get_single('tax_type',array('id'=>$id));
        $this->layout->title(get_phrase('manage') . ' ' . get_phrase('tax') . ' | ' . SMS);
        $this->layout->view('tax/index', $this->data);
    }

    function saveTax(){
        if(isset($_POST)){
            $this->form_validation->set_rules('name',get_phrase('name'),'trim|required');
            $this->form_validation->set_rules('percentage',get_phrase('percentage'),'trim|required');

            if($this->form_validation->run()==false){
                if($this->input->post('id') !=''){
                    $this->data['edit']         =   TRUE;
                    $this->layout->title(get_phrase('tax_type'). ' | ' . SMS);
                    $this->layout->view('tax/index', $this->data);
                }else{
                    $this->data['add']         =   TRUE;
                    $this->layout->title(get_phrase('tax_type'). ' | ' . SMS);
                    $this->layout->view('tax/index', $this->data);
                }
            }else{
                $save['name']               =   $this->input->post('name');
                $save['percentage']         =   $this->input->post('percentage');
                $save['status']             =   'active';
                if(!empty($this->input->post('id'))){
                    $this->db->where('id',$this->input->post('id'));
                    $update                 =   $this->db->update('tax_type',$save);
                    if($update){
                        create_log('Has been updated a name : '.$save['name']);  
                    
                        success(get_phrase('update_success'));
                        redirect('setting/tax/index'); 
                    }else{
                        error(get_phrase('update_failed'));
                        redirect('setting/tax/edit/' . $this->input->post('id'));
                    }
                }else{
                    $insert                 =   $this->db->insert('tax_type',$save);
                    if($insert){
                        create_log('Has been created a name : '.$save['name']);  
                    
                        success(get_phrase('insert_success'));
                        redirect('setting/tax/index'); 
                    }else{
                        error(get_phrase('insert_failed'));
                        redirect('setting/tax/add/' . $this->input->post('id'));
                    }
                }
            }
        }
    }

    public function delete($id = null) {
        check_permission(DELETE);
        if(!is_numeric($id)){
            error(get_phrase('unexpected_error'));
            redirect('setting/tax');            
        }
        $tax = $this->setting->get_single('tax_type', array('id' => $id));
        
        if ($this->setting->delete('tax_type', array('id' => $id))) { 
            create_log('Has been deleted a tax : '.$tax->name);
            success(get_phrase('delete_success'));
        } else {
            error(get_phrase('delete_failed'));
        }
        redirect('setting/tax');
    }
}
