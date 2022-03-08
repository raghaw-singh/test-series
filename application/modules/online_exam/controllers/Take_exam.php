<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Take_exam extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Take_Exam_Model', 'take_exam_model', true);
    }

    function index($id=''){
    	$this->data['instruction']        =     $this->take_exam_model->get_exam_details($id);
    	$this->data['assigned_ques']      =     $this->take_exam_model->get_assigned_ques($id);
        $this->layout->title(get_phrase('exam'));
        //_d($this->data['assigned_ques']); die;
        $this->layout->view('online_exam/take_exam/show_exam',$this->data);
    }
}    