<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Section extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Section_Model', 'section_model', true);
        
    }
    function index(){
        $this->data['sectionData']      =    $this->section_model->getSection();
    	$this->layout->title(get_phrase('section'));
        $this->layout->view('academic/section/index',$this->data);
    }
    function add(){
        $this->data['teachers_info']    =   $this->section_model->getTeacher();
        $this->data['class_info']    =   $this->section_model->getClass();
    	$this->layout->title(get_phrase('add_section'));
        $this->layout->view('academic/section/add',$this->data);
    }

    function save_add(){
        $this->form_validation->set_rules('section', get_phrase('section'), 'trim|required');
        $this->form_validation->set_rules('capacity', get_phrase('capacity'), 'trim|required');
        $this->form_validation->set_rules('category', get_phrase('category'), 'trim|required');
        $this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
        $this->form_validation->set_rules('teacher_name', get_phrase('teacher_name'), 'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'section'=>      form_error('section'),
                'capacity'=>  form_error('capacity'),
                'category'=>      form_error('category'),
                'teacher_name'=>  form_error('teacher_name'),
                'class'=>      form_error('class'),
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{

            $save['class']           =    $this->input->post('class');
            $save['teacher_name']    =    $this->input->post('teacher_name');
            $save['capacity']        =    $this->input->post('capacity');
            $save['category']        =    $this->input->post('category');
            $save['section']         =    $this->input->post('section');

            $insert   =   $this->db->insert('section',$save);
            if($insert){
                echo json_encode(array('status'=>'true', 'message'=>'Added successfully'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'Something went wrong try again later'));

            }
        }
    }
    function edit($id){
    	$this->data['section_info']     =   $this->section_model->getSectionById($id);
        $this->data['class_info']       =   $this->section_model->getClass();
        $this->data['teachers_info']    =   $this->section_model->getTeacher();
        $this->layout->title(get_phrase('edit_section'));
        $this->layout->view('academic/section/edit',$this->data);
    }

    function save_edit(){
        $this->form_validation->set_rules('section', get_phrase('section'), 'trim|required');
        $this->form_validation->set_rules('capacity', get_phrase('capacity'), 'trim|required');
        $this->form_validation->set_rules('category', get_phrase('category'), 'trim|required');
        $this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
        $this->form_validation->set_rules('teacher_name', get_phrase('teacher_name'), 'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'section'=>      form_error('section'),
                'capacity'=>  form_error('capacity'),
                'category'=>      form_error('category'),
                'teacher_name'=>  form_error('teacher_name'),
                'class'=>      form_error('class'),
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{
            $id                      =    $this->input->post('id');
            $save['class']           =    $this->input->post('class');
            $save['teacher_name']    =    $this->input->post('teacher_name');
            $save['capacity']        =    $this->input->post('capacity');
            $save['category']        =    $this->input->post('category');
            $save['section']         =    $this->input->post('section');

            $this->db->where('id',$id);
            $update   =   $this->db->update('section',$save);
            if($update){
                echo json_encode(array('status'=>'true', 'message'=>'Updated successfully'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'Something went wrong try again later'));

            }
        }
    }
    function delete($id){
        $this->db->where('id',$id);
        $this->db->delete('section');

        redirect(base_url('academic/section'));
    }


}    