<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Student_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getStudent(){
        $this->db->select('S.*,U.first_name,U.last_name,U.email,U.photo,U.phone');
        $this->db->from('student as S');
        $this->db->join('users as U','U.id=S.user_id','left');
    	return $this->db->get()->result();
    }
    function getStudentById($id){
        $this->db->select('S.*,U.first_name,U.last_name,U.email,U.photo,U.phone');
        $this->db->from('student as S');
        $this->db->join('users as U','U.id=S.user_id','left');
        $this->db->where('S.user_id',$id);
        return $this->db->get()->row();
    }
}    