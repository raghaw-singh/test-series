<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->model('Dashboard_Model', 'dashboard', true);
    }

    public $data = array();
    public function index() {
    	if($this->session->userdata('role_id') ==1){
	        $this->layout->title(get_phrase('dashboard') . ' | ' . SMS);
	        $this->layout->view('dashboard', $this->data);
	    }
    	else if($this->session->userdata('role_id') ==2){
	    	$this->layout->title(get_phrase('student_dashboard') . ' | ' . SMS);
	        $this->layout->view('teacher_dashboard', $this->data);
	    } else{
	    	$this->data['user_info']		=		$this->dashboard->getUser();
	    	$this->layout->title(get_phrase('dashboard') . ' | ' . SMS);
	    	// print_r($this->data['user_info']); die; 
	        $this->layout->view('student_dashboard', $this->data);
	    }
	}    
}
