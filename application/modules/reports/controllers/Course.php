<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Course extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Report_Model', 'report_model', true);   
        $this->load->helper('report');  
        $this->setting      =   $this->report_model->get_single('settings',array('status'=>1));
    }

    function index(){
        if($this->input->get()){
            $category_id                                    =   $this->input->get('category_id');
            $course_id                                      =   $this->input->get('course_id');
            $report_type                                    =   $this->input->get('report_type');
            $this->data['course_id']                        =   $course_id;
            $this->data['report_type']                      =   $report_type;
            $this->data['category_id']                      =   $category_id;
            $this->data['userReport']                       =   $this->report_model->get_report_by_course($category_id,$course_id,$report_type);
        }else{
            $this->data['course_id']                        =   '';
            $this->data['report_type']                      =   '';
            $this->data['category_id']                      =   '';
        }
        $this->data['courseList']                           =   $this->report_model->get_course_list(1);
        $this->layout->title('Report By Course');
        $this->layout->view('reports/course/index',$this->data);
    }
}