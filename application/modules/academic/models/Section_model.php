<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Section_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getTeacher(){
    	return $this->db->get('teacher')->result();
    }
    function getClass(){
    	return $this->db->get('class')->result();
    }
    function getSection(){
    	return $this->db->get('section')->result();
    }
    function getSectionById($id){
    	return $this->db->get_where('section',array('id'=>$id))->row();
    }
}    