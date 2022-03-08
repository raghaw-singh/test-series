<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Online_Exam extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Online_Exam_Model', 'online_exam_model', true);
    }

    function index(){
        $this->data['exam_details']    =    $this->online_exam_model->getExam();
        $this->layout->title(get_phrase('online_exam'));
        $this->layout->view('online_exam/online_exam/index',$this->data);
    }

    function add_online_exam(){
        $this->data['classData']         =       $this->online_exam_model->getClass();
        $this->data['sectionData']       =       $this->online_exam_model->getSection();
        $this->data['groupData']         =       $this->online_exam_model->getGroup();
        $this->data['subjectData']       =       $this->online_exam_model->getSubject();
        $this->layout->title(get_phrase('add_online_exam'));
        $this->layout->view('online_exam/online_exam/add_online_exam',$this->data);
    }

    function save_online_exam(){
        $this->form_validation->set_rules('exam_title', get_phrase('exam_title'),'trim|required');
        $this->form_validation->set_rules('class', get_phrase('class'),'trim|required');
        $this->form_validation->set_rules('pass_value', get_phrase('pass_value'),'trim|required|numeric');
        $this->form_validation->set_rules('published', get_phrase('published'),'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'exam_title'=>      form_error('exam_title'),
                'pass_value'=>  form_error('pass_value'),
                'published'=>      form_error('published'),
                'class'=>      form_error('class'),
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{

            $save['class']           =    $this->input->post('class');
            $save['description']    =    $this->input->post('description');
            $save['pass_value']        =    $this->input->post('pass_value');
            $save['published']        =    $this->input->post('published');
            $save['section']         =    $this->input->post('section');
            $save['student_group']         =    $this->input->post('student_group');
            $save['subject']         =    $this->input->post('subject');
            $save['random_question']         =    $this->input->post('random_question');
            $save['duration']         =    $this->input->post('duration');
            $save['exam_title']         =    $this->input->post('exam_title');

            $insert   =   $this->db->insert('online_exam',$save);
            if($insert){
                echo json_encode(array('status'=>'true', 'message'=>'Added successfully'));
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'Something went wrong try again later'));

            }
        }
    }

    function edit_online_exam($id=''){
        $this->data['classData']         =       $this->online_exam_model->getClass();
        $this->data['sectionData']       =       $this->online_exam_model->getSection();
        $this->data['groupData']         =       $this->online_exam_model->getGroup();
        $this->data['subjectData']       =       $this->online_exam_model->getSubject();
        $this->data['exam_info']      =    $this->online_exam_model->getExamById($id);
        $this->layout->title(get_phrase('edit_online_exam'));
        $this->layout->view('online_exam/online_exam/edit_online_exam',$this->data);
    }

    function update_exam(){
        $this->form_validation->set_rules('exam_title', get_phrase('exam_title'),'trim|required');
        $this->form_validation->set_rules('class', get_phrase('class'),'trim|required');
        $this->form_validation->set_rules('pass_value', get_phrase('pass_value'),'trim|required|numeric');
        $this->form_validation->set_rules('published', get_phrase('published'),'trim|required');

        if($this->form_validation->run()== false){
            $error   =    array(
                'exam_title'=>      form_error('exam_title'),
                'pass_value'=>  form_error('pass_value'),
                'published'=>      form_error('published'),
                'class'=>      form_error('class'),
            );
            $arr     =    array('status'=>'error', 'message'=>$error);
            echo json_encode($arr);
        }else{
            $id                       =    $this->input->post('id');

            if($id){
                
                $save['class']            =    $this->input->post('class');
                $save['description']      =    $this->input->post('description');
                $save['pass_value']       =    $this->input->post('pass_value');
                $save['published']        =    $this->input->post('published');
                $save['section']          =    $this->input->post('section');
                $save['student_group']    =    $this->input->post('student_group');
                $save['subject']          =    $this->input->post('subject');
                $save['random_question']  =    $this->input->post('random_question');
                $save['duration']         =    $this->input->post('duration');
                $save['exam_title']       =    $this->input->post('exam_title');

                $this->db->where('id',$id);
                $update   =   $this->db->update('online_exam',$save);
                if($update){
                    echo json_encode(array('status'=>'true', 'message'=>'updated successfully'));
                }else{
                    echo json_encode(array('status'=>'false', 'message'=>'Something went wrong try again later'));

                }
            }else{
                echo json_encode(array('status'=>'false', 'message'=>'id not available'));
            }       
        }
    }

    function delete($id){
        $this->db->where('id',$id);
        $this->db->delete('online_exam');

        redirect(base_url('online_exam/online_exam'));
    }



}