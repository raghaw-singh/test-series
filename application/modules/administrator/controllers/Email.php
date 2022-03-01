<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Email extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Administrator_Model', 'administrator', true);
        $this->data['roles'] = $this->administrator->get_list('roles', array('status' => 1), '','', '', 'id', 'ASC');
    }


    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load reset email user interface                 
    *                    and reset user email processing    
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
            $this->form_validation->set_rules('email', get_phrase('email'), 'trim|required|valid_email|callback_email');
            
             if ($this->form_validation->run() === TRUE) {
                $data['email']      = $this->input->post('email');
                $data['modified_at'] = date('Y-m-d H:i:s');
                $data['modified_by'] = logged_in_user_id();
                $this->administrator->update('users', $data, array('id'=> $this->input->post('user_id')));
                success(get_phrase('update_success'));
                
                $user = $this->administrator->get_single('users', array('id' => $this->input->post('user_id')));
                redirect('administrator/email');
             }
        }
        $this->layout->title(get_phrase('reset_user_email'). ' | ' . SMS);
        $this->layout->view('email/index', $this->data);
    }
    
    
        
                    
    /*****************Function email**********************************
    * @type            : Function
    * @function name   : email
    * @description     : Unique check for "User Email" data/value                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function email() {
        if ($this->input->post('user_id') == '') {
            $email = $this->administrator->duplicate_check($this->input->post('email'));
            if ($email) {
                $this->form_validation->set_message('email', get_phrase('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else if ($this->input->post('user_id') != '') {
            $email = $this->administrator->duplicate_check($this->input->post('email'), $this->input->post('user_id'));
            if ($email) {
                $this->form_validation->set_message('email', get_phrase('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else {
            return TRUE;
        }
    }
    
}
