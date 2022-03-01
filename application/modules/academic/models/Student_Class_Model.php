<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Student_Class_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getTeacher(){
    	return $this->db->get('teacher')->result();
    }
    function getClass(){
    	return $this->db->get('class')->result();
    }

    function getClassById($id){
    	return $this->db->get_where('class',array('id'=>$id))->row();
    }
}    