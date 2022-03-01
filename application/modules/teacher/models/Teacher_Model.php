<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Teacher_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getTeacher(){
    	return $this->db->get('teacher')->result();
    }
    function getTeacherById($id){
    	return $this->db->get_where('teacher',array('user_id'=>$id))->row();
        
    }
    function teacherData($id){
        return $this->db->get_where('users',array('id'=>$id))->row();
    }
}    