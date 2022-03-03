<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Question_Bank_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function questionBank(){
    	return $this->db->get('question_bank')->result();
    }
    function questionBankById($id){
        return $this->db->get_where('question_bank', array('id'=>$id))->row();
    }

    function getGroup(){
    	return $this->db->get('question_group')->result();
    }
    function getAnswerById($id){
        return $this->db->get_where('answers', array('question_id'=>$id))->result();
    }
}    