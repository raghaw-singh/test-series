<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Online_Exam_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getExam(){
    	return $this->db->get('online_exam')->result();
    }
    function getExamById($id){
    	return $this->db->get_where('online_exam',array('id'=>$id))->row();
    }
}    