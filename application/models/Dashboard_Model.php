<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    function get_user_by_role(){
        
       $this->db->select('COUNT(U.role_id) AS total_user, R.name');
       $this->db->from('users AS U');
       $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
       $this->db->group_by('U.role_id'); 
       $this->db->where('U.status', 1);
       return $this->db->get()->result();    
    }
    
    function get_total_student(){
        
        $this->db->select('COUNT(S.id) AS total_student');
        $this->db->from('student AS S');
        $this->db->where('S.status', 1);       
        return $this->db->get()->row()->total_student;  
       
    }
    function get_total_teacher(){
        $this->db->select('COUNT(T.id) AS total_teacher');
        $this->db->from('teacher AS T');
        $this->db->where('T.status', 1);
        return $this->db->get()->row()->total_teacher;    
    }

    // function get_total_courses(){
    //     $this->db->select('COUNT(C.id) AS total_coursse');
    //     $this->db->from('course AS C');
    //     $this->db->where('C.status','active');
    //     return $this->db->get()->row()->total_coursse;    
    // }
    // function get_courses_type($is_free_course){
    //     $this->db->select('COUNT(C.id) AS total_coursse');
    //     $this->db->from('course AS C');
    //     $this->db->where('C.status','active');
    //     $this->db->where('C.is_free_course',$is_free_course);
    //     return $this->db->get()->row()->total_coursse;    
    // }

    // function get_total_income(){
    //     $this->db->select('SUM(OD.payable_amount) AS payable_amount');
    //     $this->db->from('order_details AS OD');
    //     $this->db->where('OD.payment_status','succeeded');
    //     return $this->db->get()->row()->payable_amount;       
    // }
    function getUser(){
        $this->db->get('users')->row();
    }
}
