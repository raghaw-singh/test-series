<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Usercredential extends MY_Controller {

   public function __construct() {
        parent::__construct();
                
        $this->load->model('Administrator_Model', 'administrator', true);
        $this->data['roles'] = $this->administrator->get_list('roles', array('status' => 1, 'is_super_admin'=>0), '','', '', 'id', 'ASC');
    }

    public $data = array();

   

    /*****************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : Load user filtering interface                 
     *                      
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function index(){
        
        
        check_permission(VIEW);
        
        $this->data['users'] = '';
        
         if ($_POST) {
             
            $role_id  = $this->input->post('role_id');   
            $user_id  = $this->input->post('user_id');  
            
            $this->data['users'] = $this->administrator->get_user_list($role_id, $user_id);
                      
            $this->data['role_id'] = $role_id;
            $this->data['user_id'] = $user_id;
         }         
        
        $this->layout->title(get_phrase('user').' '.get_phrase('credential'). ' | ' . SMS);
        $this->layout->view('credential/index', $this->data); 
    }

}
