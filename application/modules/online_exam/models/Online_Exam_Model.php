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
    function getClass(){
        return $this->db->get('class')->result();
    }
    function getSection(){
        return $this->db->get('section')->result();
    }
    function getGroup(){
        return $this->db->get('question_group')->result();
    }
    function getSubject(){
        return $this->db->get('subject')->result();
    }
}    