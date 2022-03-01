<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Order_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function get_order_list($payment_status='',$from_date='',$to_date=''){
        $this->db->select('OD.*,S.name as student_name,P.course_id,C.user_id');
        $this->db->from('order_details as OD');
        $this->db->join('students as S','S.user_id=OD.user_id','left');
        $this->db->join('payment as P','P.order_id=OD.id','left');
        $this->db->join('course as C','C.id=P.course_id','left');

        if($this->session->userdata('role_id')==3){
            $this->db->where('C.user_id',logged_in_user_id());
        }
        if(!empty($payment_status)){
            if($payment_status=='success'){
                $status         =   'succeeded';
                $this->db->where('OD.payment_status',$status);
            }
        }
        if(!empty($from_date)){
            $this->db->where('OD.created_at>=',date('Y-m-d',strtotime($from_date)));
        }
        if(!empty($to_date)){
            $this->db->where('OD.created_at<=',date('Y-m-d',strtotime($to_date)));
        }
        $this->db->order_by('OD.id','desc');
        return $this->db->get()->result();
    }
    function get_single_order_info($order_id){
        $this->db->select('OD.*,S.name as student_name,S.present_address,S.phone as student_phone,U.email as student_email');
        $this->db->from('order_details as OD');
        $this->db->join('students as S','S.user_id=OD.user_id','left');
        $this->db->join('users as U','U.id=OD.user_id','left');
        $this->db->where('OD.id',$order_id);
        return $this->db->get()->row();
    }
}
