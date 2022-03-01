<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ajax_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_user_list($type) {
        
        if ($type == 'instructor') {
            
            $this->db->select('I.name, I.user_id, U.email, U.role_id');
            $this->db->from('instructor AS I');
            $this->db->join('users AS U', 'U.id = I.user_id', 'left');  
            $this->db->order_by('I.id', 'ASC');
            return $this->db->get()->result();
            
        } elseif ($type == 'employee') { 
            
            $this->db->select('E.name, E.user_id, SG.grade_name, U.email, U.role_id, D.name AS designation');
            $this->db->from('employees AS E');
            $this->db->join('users AS U', 'U.id = E.user_id', 'left');
            $this->db->order_by('E.id', 'ASC');
            return $this->db->get()->result();
            
        } else {
            return array();
        }
    }
    function get_sub_category_list($category_id){
        $this->db->select('S.*');
        $this->db->from('sub_category as S');
        $this->db->where('S.category_id',$category_id);
        return $this->db->get()->result();
    }
    function get_course_by_author($author_id){
        $this->db->select('C.id,C.title');
        $this->db->from('course as C');
        $this->db->where('C.user_id',$author_id);
        $this->db->where('C.status','active');
        return $this->db->get()->result();
    }
    function get_course_by_category($category_id){
        $this->db->select('C.id,C.title');
        $this->db->from('course as C');
        $this->db->where('C.category_id',$category_id);
        return $this->db->get()->result();
    }
}
