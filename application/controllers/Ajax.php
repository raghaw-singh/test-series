<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Ajax extends My_Controller {

    function __construct() {

        parent::__construct();
        $this->load->model('Ajax_Model', 'ajax', true);
    }

    public function get_user_by_role() {

        $role_id = $this->input->post('role_id');
        $user_id = $this->input->post('user_id');
        $message = $this->input->post('message');

        $users = array();
        if ($role_id == INSTRUCTOR) {
            $users = $this->ajax->get_list('teachers', array('status' => 1), '', '', '', 'id', 'ASC');
        } elseif ($role_id == STUDENT) {
            $users = $this->ajax->get_list('students', array('status' => 1), '', '', '', 'id', 'ASC');
        } else {
            $this->db->select('E.*');
            $this->db->from('employees AS E');
            $this->db->join('users AS U', 'U.id = E.user_id', 'left');
            $this->db->where('U.role_id', $role_id);
            $users = $this->db->get()->result();
        }

        $str = '<option value="">--' . get_phrase('select') . '--</option>';
        
        $select = 'selected="selected"';
        if (!empty($users)) {
            foreach ($users as $obj) {
                $selected = $user_id == $obj->user_id ? $select : '';
                $str .= '<option value="' . $obj->user_id . '" ' . $selected . '>' . $obj->name . '(' . $obj->id . ')</option>';
            }
        }

        echo $str;
    }

    public function get_tag_by_role() {

        $role_id = $this->input->post('role_id');
        $tags = get_template_tags($role_id);
        $str = '';
        foreach ($tags as $value) {
            $str .= '<span> ' . $value . ' </span>';
        }

        echo $str;
    }
    function get_sub_category_by_category(){
        $category_id                    =   $this->input->post('category_id');
        $sub_category_id                =   $this->input->post('sub_category_id');
        $str                            =   '';
        $str = '<option value="">--' . get_phrase('select') . '--</option>';
        $categoryList                   =   $this->ajax->get_sub_category_list($category_id);
        $select = 'selected="selected"';
        if (!empty($categoryList)) {
            foreach ($categoryList as $obj) {
                $selected = $sub_category_id == $obj->id ? $select : '';
                $str .= '<option value="' . $obj->id . '" ' . $selected . '>' . $obj->name .'</option>';
            }
        }

        echo $str;
    }

    public function get_section_by_class() {

        $class_id = $this->input->post('class_id');
        $section_id = $this->input->post('section_id');
        
        $sections = $this->ajax->get_list('section', array('class' => $class_id), '', '', '', 'id', 'ASC');
        
        $str = '<option value="">--' . get_phrase('choose_section') . '--</option>';
        
        $select = 'selected="selected"';
        if (!empty($sections)) {
            foreach ($sections as $obj) {
                $selected = $section_id == $obj->id ? $select : '';
                $str .= '<option value="' . $obj->id . '" ' . $selected . '>' . $obj->section . '</option>';
            }
        }

        echo $str;
    }


    function get_subject_by_class(){
        $class_id = $this->input->post('class_id');
        $subject_id = $this->input->post('subject_id');
        
        $sections = $this->ajax->get_list('subject', array('class' => $class_id), '', '', '', 'id', 'ASC');
        
        $str = '<option value="">--' . get_phrase('choose_subject') . '--</option>';
        
        $select = 'selected="selected"';
        if (!empty($sections)) {
            foreach ($sections as $obj) {
                $selected = $subject_id == $obj->id ? $select : '';
                $str .= '<option value="' . $obj->id . '" ' . $selected . '>' . $obj->subject_name . '</option>';
            }
        }

        echo $str;
    }
    /**     * *************Function update_user_status**********************************
     * @type            : Function
     * @function name   : update_user_status
     * @description     : this function used to update user status   
     * @param           : null 
     * @return          : boolean true/false 
     * ********************************************************** */
    public function update_user_status() {

        $user_id = $this->input->post('user_id');
        $status = $this->input->post('status');
        if ($this->ajax->update('users', array('status' => $status), array('id' => $user_id))) {
            echo TRUE;
        } else {
            echo FALSE;
        }
    }
    /** * *************Function get_email_template_by_role**********************************
     * @type            : Function
     * @function name   : get_email_template_by_role
     * @description     : this function used to populate template by role  
      for user interface
     * @param           : null 
     * @return          : $str string value with room list 
     * ********************************************************** */
    public function get_email_template_by_role() {

        $role_id = $this->input->post('role_id');

        $templates = $this->ajax->get_list('email_templates', array('status' => 1, 'role_id' => $role_id), '', '', '', 'id', 'ASC');
        $str = '<option value="">-- ' . get_phrase('select') . ' ' . get_phrase('template') . ' --</option>';
        if (!empty($templates)) {
            foreach ($templates as $obj) {
                $str .= '<option itemid="'.$obj->id.'" value="' . $obj->template . '">' . $obj->title . '</option>';
            }
        }

        echo $str;
    }
    
    
    /** * *************Function get_sms_template_by_role**********************************
     * @type            : Function
     * @function name   : get_sms_template_by_role
     * @description     : this function used to populate template by role  
      for user interface
     * @param           : null 
     * @return          : $str string value with room list 
     * ********************************************************** */
    public function get_sms_template_by_role() {

        $role_id = $this->input->post('role_id');

        $templates = $this->ajax->get_list('sms_templates', array('status' => 1, 'role_id' => $role_id), '', '', '', 'id', 'ASC');
        $str = '<option value="">-- ' . get_phrase('select') . ' ' . get_phrase('template') . ' --</option>';
        if (!empty($templates)) {
            foreach ($templates as $obj) {
                $str .= '<option itemid="'.$obj->id.'" value="' . $obj->template . '">' . $obj->title . '</option>';
            }
        }

        echo $str;
    }
    
    
    
    /*****************Function get_user_list_by_type**********************************
     * @type            : Function
     * @function name   : get_user_list_by_type
     * @description     : Load "Employee or Teacher Listing" by ajax call                
     *                    and populate user listing
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    
    public function get_user_list_by_type() {
        
         $payment_to  = $this->input->post('payment_to');
         $user_id  = $this->input->post('user_id');
         
         $users = $this->ajax->get_user_list($payment_to );
         
        $str = '<option value="">--' . get_phrase('select') . '--</option>';
        $select = 'selected="selected"';
        if (!empty($users)) {
            foreach ($users as $obj) {   
                $selected = $user_id == $obj->user_id ? $select : '';
                $str .= '<option value="' . $obj->user_id . '" ' . $selected . '>' . $obj->name .' [ '. $obj->designation . ' ]</option>';
            }
        }

        echo $str;
    }
    
    
    /*****************Function get_user_single_payment**********************************
     * @type            : Function
     * @function name   : get_user_single_payment
     * @description     : validate the paymeny to user already paid for selected month               
     *                    
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    
    public function get_user_single_payment() {
        
         $payment_to  = $this->input->post('payment_to');
         $user_id  = $this->input->post('user_id');
         $salary_month  = $this->input->post('salary_month');
         
         $exist = $this->ajax->get_single('salary_payments',array('user_id'=>$user_id, 'salary_month'=>$salary_month, 'payment_to'=>$payment_to ));
         
         if($exist){
             echo 1;
         }else{
             echo 2;
         }
         
    }
    

}
