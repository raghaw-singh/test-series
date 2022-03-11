<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Take_exam extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Take_Exam_Model', 'take_exam_model', true);
    }

    function index($id=''){
    	$this->data['instruction']        =     $this->take_exam_model->get_exam_details($id);
    	$this->data['assigned_ques']      =     $this->take_exam_model->get_assigned_ques($id);
        $this->layout->title(get_phrase('exam'));
        $this->layout->view('online_exam/take_exam/show_exam',$this->data);
    }
    function question_save(){
        $user_id                        =   $this->session->userdata('id');
        //print_r($user_id); die;
        //print_r($_POST);die;
        $save['question_id']            =   $this->input->post('ques_id');
        $save['question_no']            =   $this->input->post('question_no');
        $answer                         =   $this->input->post('answer');
        $save['answer']                 =   $answer;
        $exam_id                        =   $this->input->post('exam_id');
        $save['user_id']                =   $user_id;
        $question_no                    =   $this->input->post('question_no');
        $save['exam_id']                =   $exam_id;

        $checkRecord                    =   $this->db->get_where('exam_answers',array('user_id'=>$user_id,'exam_id'=>$exam_id,'question_no'=>$question_no))->row();
        
        if($checkRecord){
            $this->db->where('exam_id',$exam_id);
            $this->db->where('user_id',$this->session->userdata('id'));
            $this->db->where('question_no',$question_no);
            $update                     =   $this->db->update('exam_answers',$save);
        }else{
            if($answer !='0'){
                $insert                         =   $this->db->insert('exam_answers',$save);
            }
        }
    }


}    