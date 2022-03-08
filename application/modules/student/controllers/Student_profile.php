<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Student_profile extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Student_Model', 'student_model', true);
        
    }
    function index($id=''){
    	$this->data['studentData']     =    $this->student_model->getStudentData();
    	$this->layout->title(get_phrase('student_profile'));
        $this->layout->view('student/profile',$this->data);
    }
}