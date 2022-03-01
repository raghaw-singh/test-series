<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Report_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getStudentList(){
        $this->db->select('S.user_id,S.name');
        $this->db->from('students as S');
        $this->db->where('S.status',1);
        $this->db->order_by('S.name','asc');
        return $this->db->get()->result();
    }

    function get_report_by_user($user_id='',$report_type=''){
        $this->db->select('E.*,U.first_name,U.last_name,U.phone,U.email,C.title as course_title');
        $this->db->from('enrol as E');
        $this->db->join('users as U','U.id=E.user_id','left');
        $this->db->join('course as C','C.id=E.course_id','left');
        if(!empty($user_id)){
            if($user_id !='all'){
                $this->db->where('E.user_id',$user_id);
            }
        }
        $this->db->order_by('E.id','desc');
        return $this->db->get()->result();
    }
    function get_report_by_course($category_id='',$course_id='',$report_type=''){
        $this->db->select('E.*,U.first_name,U.last_name,U.phone,U.email,C.title as course_title');
        $this->db->from('enrol as E');
        $this->db->join('users as U','U.id=E.user_id','left');
        $this->db->join('course as C','C.id=E.course_id','left');
        if(!empty($course_id)){
            if($course_id !='all'){
                $this->db->where('E.course_id',$course_id);
            }
        }
        if(!empty($category_id)){
            if($category_id !='all'){
                $this->db->where('C.category_id',$category_id);
            }
        }
        $this->db->order_by('E.id','desc');
        return $this->db->get()->result();
    }
    function get_report_by_module($skill='',$category_id=''){
        $this->db->select('E.*,U.first_name,U.last_name,U.phone,U.email,C.title as course_title');
        $this->db->from('enrol as E');
        $this->db->join('users as U','U.id=E.user_id','left');
        $this->db->join('course as C','C.id=E.course_id','left');
        if(!empty($skill)){
            if($skill !='all'){
                $this->db->where('C.level',$skill);
            }
        }
        if(!empty($category_id)){
            if($category_id !='all'){
                $this->db->where('C.category_id',$category_id);
            }
        }
        $this->db->order_by('E.id','desc');
        return $this->db->get()->result();
    }
    function get_course_list($status){
        $this->db->select('C.*');
        $this->db->from('category as C');
        if($status !='all'){
            $this->db->where('C.status',$status);    
        }
        $this->db->order_by('C.name','asc');
        return $this->db->get()->result();
    }
}