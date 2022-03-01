<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class User extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Report_Model', 'report_model', true);   
        $this->load->helper('report');
        $this->setting      =   $this->report_model->get_single('settings',array('status'=>1));
    }

    function index(){

        if($this->input->get()){
            $user_id                                    =   $this->input->get('user_id');
            $report_type                                =   $this->input->get('report_type');
            $this->data['user_id']                      =   $user_id;
            $this->data['report_type']                  =   $report_type;
            $this->data['userReport']                   =   $this->report_model->get_report_by_user($user_id,$report_type);
        }else{
            $this->data['user_id']                      =   '';
            $this->data['report_type']                  =   '';
        }
        $this->data['userList']                         =   $this->report_model->getStudentList();
        $this->layout->title('Report By User');
        $this->layout->view('reports/user/index',$this->data);
    }
}