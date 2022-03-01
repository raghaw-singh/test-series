<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Subject extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Subject_Model', 'subject_model', true);
        
    }
    function index(){
        $this->data['subjectData']      =    $this->subject_model->getSubject();
    	$this->layout->title(get_phrase('subject'));
        $this->layout->view('academic/subject/index',$this->data);
    }

    function add(){
        $this->data['teachers_info'] =   $this->subject_model->getTeacher();
        $this->data['class_info']    =   $this->subject_model->getClass();
        $this->layout->title(get_phrase('add_subject'));
        $this->layout->view('academic/subject/add',$this->data);
    }
    function save_add(){
        $this->form_validation->set_rules('type', get_phrase('type'), 'trim|required');
        $this->form_validation->set_rules('pass_mark', get_phrase('pass_mark'), 'trim|required|numeric');
        $this->form_validation->set_rules('final_mark', get_phrase('final_mark'), 'trim|required|numeric');
        $this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
        $this->form_validation->set_rules('teacher_name', get_phrase('teacher_name'), 'trim|required');
        $this->form_validation->set_rules('subject_name', get_phrase('subject_name'), 'trim|required');
        $this->form_validation->set_rules('subject_code', get_phrase('subject_code'), 'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'type'=>      form_error('type'),
                'pass_mark'=>  form_error('pass_mark'),
                'final_mark'=>      form_error('final_mark'),
                'teacher_name'=>  form_error('teacher_name'),
                'class'=>      form_error('class'),
                'subject_code'=>  form_error('subject_code'),
                'subject_name'=>      form_error('subject_name'),
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{

            $save['class']          =    $this->input->post('class');
            $save['teacher_name']    =    $this->input->post('teacher_name');
            $save['pass_mark']        =    $this->input->post('pass_mark');
            $save['final_mark']        =    $this->input->post('final_mark');
            $save['type']               =    $this->input->post('type');
            $save['subject_name']        =    $this->input->post('subject_name');
            $save['subject_code']         =    $this->input->post('subject_code');

            $insert   =   $this->db->insert('subject',$save);
            if($insert){
                echo json_encode(array('status'=>'true', 'message'=>'Added successfully'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'Something went wrong try again later'));
            }
        }
    }
    function edit($id){
        $this->data['subject_info']     =   $this->subject_model->getSubjectById($id);
        $this->data['class_info']       =   $this->subject_model->getClass();
        $this->data['teachers_info']    =   $this->subject_model->getTeacher();
        $this->layout->title(get_phrase('edit_subject'));
        $this->layout->view('academic/subject/edit',$this->data);
    }
    function save_edit(){
        $this->form_validation->set_rules('type', get_phrase('type'), 'trim|required');
        $this->form_validation->set_rules('pass_mark', get_phrase('pass_mark'), 'trim|required|numeric');
        $this->form_validation->set_rules('final_mark', get_phrase('final_mark'), 'trim|required|numeric');
        $this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
        $this->form_validation->set_rules('teacher_name', get_phrase('teacher_name'), 'trim|required');
        $this->form_validation->set_rules('subject_name', get_phrase('subject_name'), 'trim|required');
        $this->form_validation->set_rules('subject_code', get_phrase('subject_code'), 'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'type'=>      form_error('type'),
                'pass_mark'=>  form_error('pass_mark'),
                'final_mark'=>      form_error('final_mark'),
                'teacher_name'=>  form_error('teacher_name'),
                'class'=>      form_error('class'),
                'subject_code'=>  form_error('subject_code'),
                'subject_name'=>      form_error('subject_name'),
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{

            $id                    =    $this->input->post('id');
            $save['class']          =    $this->input->post('class');
            $save['teacher_name']    =    $this->input->post('teacher_name');
            $save['pass_mark']        =    $this->input->post('pass_mark');
            $save['final_mark']        =    $this->input->post('final_mark');
            $save['type']               =    $this->input->post('type');
            $save['subject_name']        =    $this->input->post('subject_name');
            $save['subject_code']         =    $this->input->post('subject_code');

            $this->db->where('id',$id);
            $update   =   $this->db->update('subject',$save);
            if($update){
                echo json_encode(array('status'=>'true', 'message'=>'update successfully'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'Something went wrong try again later'));
            }
        }
    }

    function delete($id){
        $this->db->where('id',$id);
        $this->db->delete('subject');

        redirect(base_url('academic/subject'));
    }


}    