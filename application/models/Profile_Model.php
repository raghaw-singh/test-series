<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Profile_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_single_employee($id){
        
        $this->db->select('E.*, U.email, U.role_id, D.name AS designtion');
        $this->db->from('employees AS E');
        $this->db->join('users AS U', 'U.id = E.user_id', 'left');
        $this->db->join('designations AS D', 'D.id = E.designation_id', 'left');
        $this->db->where('E.user_id', $id);
        return $this->db->get()->row();        
    }
    
}
