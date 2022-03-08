<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Add_question extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Add_Question_Model', 'add_question_model', true);
    }

    function index($id=''){
        $this->data['exam_details']    =   $this->add_question_model->getExamById($id);
        $this->data['questionBank']    =   $this->add_question_model->getQuestionBank($id);
        $this->data['assigned_ques']   =   $this->add_question_model->getAssignQues($id);
        $this->layout->title(get_phrase('add_question'));
        $this->layout->view('online_exam/add_question/index',$this->data);
    }
    function fetch_question_data(){
        $postData    =    $this->input->post();
        $data        =    $this->add_question_model->fetch_question_data($postData);
        echo json_encode($data);
    }
    function assign_question(){

        $save['exam_id']        =       $this->input->post('exam_id');
        $save['question_id']    =       $this->input->post('question_id');

        $insert                 =       $this->db->insert('assign_question',$save);

        if($insert){
            echo json_encode(array('status'=>'true','message'=>'question added successfully'));
        }else{
            echo json_encode(array('status'=>'false','message'=>' something went wrong please try again later '));
        }
    }
    function delete_assign_ques(){
        $id     =        $this->input->post('ques_id');
        $this->db->where('id',$id);
        $delete    =    $this->db->delete('assign_question');
        if($delete){
            echo json_encode(array('status'=>'true', 'message'=>'Question deleted...'));    
        } else {
            echo json_encode(array('status'=>'false', 'message'=>'something went wrong'));
        }
    }


}    