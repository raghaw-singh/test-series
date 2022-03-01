<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Student_Class extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Student_Class_Model', 'student_class_model', true);
        
    }

    function index(){
        $this->data['classData']      =    $this->student_class_model->getClass();
    	$this->layout->title(get_phrase('class'));
        $this->layout->view('academic/class/index',$this->data);
    }

    function add_class(){
        $this->data['teachers_info']    =   $this->student_class_model->getTeacher();
    	$this->layout->title(get_phrase('add_class'));
        $this->layout->view('academic/class/add_class',$this->data);
    }

    function save_class(){
        $this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
        $this->form_validation->set_rules('teacher_name', get_phrase('teacher_name'), 'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'class'=>      form_error('class'),
                'teacher_name'=>  form_error('teacher_name')
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{

            $save['class']           =    $this->input->post('class');
            $save['teacher_name']    =    $this->input->post('teacher_name');

            $insert   =   $this->db->insert('class',$save);
            if($insert){
                echo json_encode(array('status'=>'true', 'message'=>'Class inserted'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'class not inserted'));

            }
        }
    }
    function edit($id){
        $this->data['classData']      =    $this->student_class_model->getClassById($id);
        $this->data['teachers_info']    =   $this->student_class_model->getTeacher();
        $this->layout->title(get_phrase('edit_class'));
        $this->layout->view('academic/class/edit_class',$this->data);
    }

    function save_edit(){
        $this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
        $this->form_validation->set_rules('teacher_name', get_phrase('teacher_name'), 'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'class'=>      form_error('class'),
                'teacher_name'=>  form_error('teacher_name')
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{
            $id                     =     $this->input->post('id');
            $save['class']           =    $this->input->post('class');
            $save['teacher_name']    =    $this->input->post('teacher_name');
            $this->db->where('id',$id);
            $update   =   $this->db->update('class',$save);
            if($update){
                echo json_encode(array('status'=>'true', 'message'=>'Class updated'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'class not updated'));

            }
        }
    }

    function delete($id){
        $this->db->where('id',$id);
        $this->db->delete('class');

        redirect(base_url('academic/student_class'));
    }




}    