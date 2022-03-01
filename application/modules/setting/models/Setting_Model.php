<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Setting_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    public function add($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('settings', $data);
        } else {
            $this->db->insert('settings', $data);
            return $this->db->insert_id();
        }
    }
    public function get_operation_list(){
        $this->db->select('O.*, M.module_name');
        $this->db->from('operations AS O');
        $this->db->join('modules AS M', 'M.id = O.module_id', 'left');
        $this->db->order_by('M.id');
        return $this->db->get()->result();
    }
    function get_alltax_type(){
        return $this->db->get('tax_type')->result();
    }
    public function getSetting() {

        $this->db->select('S.*');
        $this->db->from('settings as S');
        $this->db->order_by('S.id');

        $query = $this->db->get();

        return $query->row();
    }
}
