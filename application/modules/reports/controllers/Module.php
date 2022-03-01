<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Module extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Report_Model', 'report_model', true);  
        $this->load->helper('report'); 
        $this->setting      =   $this->report_model->get_single('settings',array('status'=>1));
    }

    function index(){

        if($this->input->get()){
            $skill                                          =   $this->input->get('skill');
            $category_id                                    =   $this->input->get('category_id');
            $report_type                                    =   $this->input->get('report_type');
            $this->data['moduleReport']                     =   $this->report_model->get_report_by_module($skill,$category_id);
            $this->data['skill']                            =   $skill;
            $this->data['category_id']                      =   $category_id;
            $this->data['report_type']                      =   $report_type;
        }else{
            $this->data['skill']                            =   '';
            $this->data['category_id']                      =   '';
            $this->data['report_type']                      =   '';
        }

        $this->data['courseList']                           =   $this->report_model->get_course_list(1);
        $this->layout->title('Report By Module');
        $this->layout->view('reports/module/index',$this->data);
    }
}