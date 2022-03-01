<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Web extends CI_Controller {

    public $data = array();
    public $setting = array();
    
    function __construct() {
        parent::__construct();
        
        $this->load->model('Web_Model', 'web_model', true);   
        $this->data['settings'] = $this->web_model->get_single('settings', array('status' => 1));
        if($this->data['settings']){
            $this->setting = $this->data['settings'];
        }
        if(isset($this->setting->enable_frontend) && empty($this->setting->enable_frontend)){
            redirect('web');
        }
        
    }
    public function index() {
        $this->layout->title('Home');
        $this->layout->view('index',$this->data);
    }

    public function contact() {
        $this->layout->title('Contact');
        $this->layout->view('contact',$this->data);
    }

    public function guintabus() {
        $this->layout->title('Guintabus');
        $this->layout->view('guintabus',$this->data);
    }

    public function MilazzoAeroportoCatania() {
        $this->layout->title('MilazzoAeroportoCatania');
        $this->layout->view('MilazzoAeroportoCatania',$this->data);
    }

    public function MessinaPellegrino() {
        $this->layout->title('MessinaPellegrino');
        $this->layout->view('MessinaPellegrino',$this->data);
    }

    public function MilazzoMessina() {
        $this->layout->title('MilazzoMessina');
        $this->layout->view('MilazzoMessina',$this->data);
    }
    
    public function MessinaMilazzo() {
        $this->layout->title('MessinaMilazzo');
        $this->layout->view('MessinaMilazzo',$this->data);
    }    
    
    


}
