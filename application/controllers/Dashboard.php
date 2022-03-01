<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->model('Dashboard_Model', 'dashboard', true);
    }

    public $data = array();
    public function index() {
        $this->layout->title(get_phrase('dashboard') . ' | ' . SMS);
        $this->layout->view('dashboard', $this->data);
    }

}
