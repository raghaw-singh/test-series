<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_employee_list(){
        $this->db->select('U.*,E.name,E.is_view_on_web,S.name as student_name,T.name as teacher_name,T.is_show_web');
        $this->db->from('users as U');
        $this->db->join('employees as E','E.user_id=U.id','left');
        $this->db->join('students as S','S.user_id=U.id','left');
        $this->db->join('teachers as T','T.user_id=U.id','left');
        return $this->db->get()->result();
    }
    public function get_single_employee($id){
        
        $this->db->select('E.*, U.email, U.role_id, R.name AS role');
        $this->db->from('employees AS E');
        $this->db->join('users AS U', 'U.id = E.user_id', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->where('E.id', $id);
        return $this->db->get()->row();
        
    }function duplicate_check($email, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('email', $email);
        return $this->db->get('users')->num_rows();            
    }
}
