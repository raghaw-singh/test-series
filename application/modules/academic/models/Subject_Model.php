<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Subject_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getTeacher(){
    	return $this->db->get('teacher')->result();
    }
    function getClass(){
    	return $this->db->get('class')->result();
    }
    function getSubject(){
    	return $this->db->get('subject')->result();
    }
    function getSubjectById($id){
    	return $this->db->get_where('subject',array('id'=>$id))->row();
    }
}    