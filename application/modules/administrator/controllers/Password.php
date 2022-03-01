<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Password extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('Administrator_Model', 'administrator', true);
         $this->data['roles'] = $this->administrator->get_list('roles', array('status' => 1), '','', '', 'id', 'ASC');
    }


    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load reset password user interface                 
    *                    and reset user password processing    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */ 
   public function index() {

       check_permission(EDIT);
       
        if($_POST){
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
            $this->form_validation->set_rules('role_id', get_phrase('user'). ' ' .get_phrase('type'), 'trim|required');
            if($this->input->post('role_id') == STUDENT){
                $this->form_validation->set_rules('class_id', get_phrase('class'), 'trim|required');  
            }
            $this->form_validation->set_rules('user_id', get_phrase('user'), 'trim|required');
            $this->form_validation->set_rules('password', get_phrase('password'), 'trim|required|min_length[5]|max_length[12]');
            $this->form_validation->set_rules('conf_password', get_phrase('password').' '.get_phrase('confirm'), 'trim|required|matches[password]');
            
             if ($this->form_validation->run() === TRUE) {
                $data['password']      = md5($this->input->post('password'));
                $data['temp_password'] = base64_encode($this->input->post('password'));
                $data['modified_at'] = date('Y-m-d H:i:s');
                $data['modified_by'] = logged_in_user_id();
                $this->administrator->update('users', $data, array('id'=> $this->input->post('user_id')));
                success(get_phrase('update_success'));
                
                $user = $this->administrator->get_single('users', array('id' => $this->input->post('user_id')));
                redirect('administrator/password');
             }
        }
        $this->layout->title(get_phrase('reset_user_password'). ' | ' . SMS);
        $this->layout->view('password/index', $this->data);
    }
    
    
}
