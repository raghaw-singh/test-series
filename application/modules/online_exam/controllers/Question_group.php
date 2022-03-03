<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Question_group extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Question_group_model', 'question_group_model', true);
    }

    function index(){
        $this->data['groupList']    =    $this->question_group_model->getGroup();
        $this->layout->title(get_phrase('question_group'));
        $this->layout->view('online_exam/question_group/index',$this->data);
    }

    function add(){
    	$this->layout->title(get_phrase('add_question_group'));
        $this->layout->view('online_exam/question_group/add',$this->data);
    }

    function save_add(){
    	$this->form_validation->set_rules('title', get_phrase('title'),'trim|required');

    	if($this->form_validation->run()== false){
    		$error   =    array(
                'title'=>      form_error('title'),
            );
            echo json_encode(array('status'=> 'error', 'message'=>$error));
    	}else{
    		$save['title']     =     $this->input->post('title');

    		$insert   =   $this->db->insert('question_group',$save);
    		if($insert){
    			echo json_encode(array('status'=> 'true', 'message'=>'added successfully'));  
    		}else{
    			echo json_encode(array('status'=> 'false', 'message'=>'something went wrong'));
    		}
    	}
    }

    function edit($id=''){
    	$this->data['group_info']   =   $this->question_group_model->getGroupById($id);
    	$this->layout->title(get_phrase('edit_group'));
    	$this->layout->view('online_exam/question_group/edit',$this->data);
    }
    function save_edit($id=''){
    	$this->form_validation->set_rules('title', get_phrase('title'),'trim|required');

    	if($this->form_validation->run()== false){
    		$error   =    array(
                'title'=>      form_error('title'),
            );
            echo json_encode(array('status'=> 'error', 'message'=>$error));
    	}else{
    		$id                =     $this->input->post('id');
    		$save['title']     =     $this->input->post('title');
            $this->db->where('id',$id);
    		$insert   =   $this->db->update('question_group',$save);
    		if($insert){
    			echo json_encode(array('status'=> 'true', 'message'=>'updated successfully')); 
    		}else{
    			echo json_encode(array('status'=> 'false', 'message'=>'something went wrong'));
    		}
    	}
    }
    function delete($id){
    	$this->db->where('id',$id);
    	$this->db->delete('question_group');

    	redirect(base_url('online_exam/question_group'));
    }

}    