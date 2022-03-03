<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Question_group_model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getGroup(){
    	return $this->db->get('question_group')->result();
    }
    function getGroupById($id){
        return $this->db->get_where('question_group', array('id'=>$id))->row();
    }


}    