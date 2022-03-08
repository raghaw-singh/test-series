<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Take_Exam_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function get_assigned_ques($id){
    	$this->db->select('OE.*,AQ.question_id,QB.question,QB.upload,QB.question_type,QB.mark');
    	$this->db->from('online_exam as OE');
    	$this->db->join('assign_question as AQ','AQ.exam_id=OE.id','left');
    	$this->db->join('question_bank as QB','QB.id=AQ.question_id','left');
    	$this->db->where('OE.id',$id);
    	return $this->db->get()->result();
    }
    function get_exam_details($id){
        return $this->db->get_where('online_exam', array('id'=>$id))->row();
    }
}    