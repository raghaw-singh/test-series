<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Category extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Report_Model', 'report_model', true);   
        $this->setting      =   $this->report_model->get_single('settings',array('status'=>1));
    }

    function index(){
        $this->layout->title('Report By Category');
        $this->layout->view('reports/category/index');
    }
}