<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Emails extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Setting_Model', 'setting', true);  
        
        $this->data['setting'] = $this->setting->get_single('email_settings', array('status'=>1));               
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "email Setting" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);       
               
     
        $this->layout->title(get_phrase('email') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('email/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "email Settings" user interface                 
    *                    and process to store "email Settings" into database
    *                    for the first time settings 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        if ($_POST) {
            $this->_prepare_setting_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_setting_data();

                $insert_id = $this->setting->insert('email_settings', $data);
                if ($insert_id) {
                    success(get_phrase('insert_success'));
                    redirect('setting/emails');
                } else {
                    error(get_phrase('insert_failed'));
                    redirect('setting/emails/add');
                }
            } else {
                $this->data = $_POST;
            }
        }
       
        $this->layout->title(get_phrase('email') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('email/index', $this->data);
    }

    
        
    /*****************Function edit**********************************
    * @type            : Function
    * @function name   : edit
    * @description     : Load Update "Email Settings" user interface                 
    *                    with populate "Email Settings" value 
    *                    and process to update "General Settings" into database    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function edit() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_setting_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_setting_data();               
                $updated = $this->setting->update('email_settings', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    success(get_phrase('update_success'));
                    redirect('setting/emails');
                } else {
                    error(get_phrase('update_failed'));
                    redirect('setting/emails/edit/' . $this->input->post('id'));
                }
            }
        }
        
        $this->layout->title(get_phrase('email') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('email/index', $this->data);
    }

        
    /*****************Function _prepare_setting_validation**********************************
    * @type            : Function
    * @function name   : _prepare_setting_validation
    * @description     : Process "email Settings" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_setting_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');

        $this->form_validation->set_rules('mail_protocol', get_phrase('email') . ' ' . get_phrase('protocol'), 'trim|required');
        
        if($this->input->post('mail_protocol') == 'smtp'){
            $this->form_validation->set_rules('smtp_host', get_phrase('smtp') . ' ' . get_phrase('host'), 'trim|required');
            $this->form_validation->set_rules('smtp_port', get_phrase('smtp') . ' ' . get_phrase('port'), 'trim|required');
            $this->form_validation->set_rules('smtp_user', get_phrase('smtp') . ' ' . get_phrase('username'), 'trim|required');
            $this->form_validation->set_rules('smtp_pass', get_phrase('smtp') . ' ' . get_phrase('password'), 'trim|required');        
        }
        
        $this->form_validation->set_rules('smtp_timeout', get_phrase('smtp') . ' ' . get_phrase('time_out'), 'trim');
        $this->form_validation->set_rules('smtp_crypto', get_phrase('smtp') . ' ' . get_phrase('security'), 'trim');
        $this->form_validation->set_rules('char_set', get_phrase('email') . ' ' . get_phrase('char_set'), 'trim');
        $this->form_validation->set_rules('priority', get_phrase('email') . ' ' . get_phrase('priority'), 'trim');        
        $this->form_validation->set_rules('from_name', get_phrase('email') . ' ' . get_phrase('from') . ' ' . get_phrase('name'), 'trim');
        $this->form_validation->set_rules('from_address', get_phrase('email') . ' ' . get_phrase('from') . ' ' . get_phrase('address'), 'trim');
        
    }

     
    

    /*****************Function _get_posted_setting_data**********************************
    * @type            : Function
    * @function name   : _get_posted_setting_data
    * @description     : Prepare "Email Settings" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_setting_data() {

        $items = array();
         
        $items[] = 'mail_protocol';
        
        $items[] = 'smtp_host';
        $items[] = 'smtp_port';
        $items[] = 'smtp_timeout';
        $items[] = 'smtp_user';
        $items[] = 'smtp_pass'; 
        $items[] = 'smtp_crypto';
        
        $items[] = 'char_set';
        $items[] = 'priority'; 
        $items[] = 'from_name';
        $items[] = 'from_address';
        
        $data = elements($items, $_POST);

        $data['mail_type'] = 'html';

        if($data['mail_protocol'] != 'smtp'){
            
            $data['smtp_host'] = '';
            $data['smtp_port'] = '';
            $data['smtp_timeout'] = '';
            $data['smtp_user'] = '';
            $data['smtp_pass'] = ''; 
            $data['smtp_crypto'] = '';
            
        }
        
        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
        }
        
        return $data;
    }
}
