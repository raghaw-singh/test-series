<?php

defined("BASEPATH") or exit("No direct script access allowed");

class Question_Bank extends MY_Controller
{
    public $data = [];

    function __construct()
    {
        parent::__construct();
        $this->load->model("Question_Bank_Model", "question_bank_model", true);
    }
    function index()
    {   
        $this->data['questionData']    =     $this->question_bank_model->questionBank();
        $this->layout->title("question_bank");
        $this->layout->view("online_exam/question_bank/index", $this->data);
    }
    function add()
    {   
        $this->data['questionGroup']    =    $this->question_bank_model->getGroup();
        $this->layout->title("add_question_bank");
        $this->layout->view("online_exam/question_bank/add", $this->data);
    }
    function save_question_bank()
    {
        //print_r($this->input->post('opt_answer'));die;
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules("type",get_phrase("question_type"), "trim|required");
            $this->form_validation->set_rules('question_group',get_phrase('question_group'),'trim|required');
            $this->form_validation->set_rules("totalOption", get_phrase("total_option"),"trim|required");
            $this->form_validation->set_rules('main_question',get_phrase('main_question'),'trim|required');
            $this->form_validation->set_rules('mark',get_phrase('mark'),'trim|required|numeric');
            $this->form_validation->set_rules('difficult_level',get_phrase('difficult_level'),'trim|required');
            $type                                   =   $this->input->post('type');
            if($type==3){
                $this->form_validation->set_rules('opt_answer[]',get_phrase('answer'),'trim|required');
            }else{
                $this->form_validation->set_rules('opt_answer[]',get_phrase('answer'),'trim|required');
                $this->form_validation->set_rules('option[]',get_phrase('option'),'trim|required');
                $this->form_validation->set_rules('image_ajax[]',get_phrase('image_ajax'),'trim');
            }
            if ($this->form_validation->run() == false) {
                $error['question_group']			=	form_error('question_group');
                $error['mark']                      =   form_error('mark');
                $error['question_type']             =   form_error('question_type');
                $error['main_question']             =   form_error('main_question');
                $error['totalOption']               =   form_error('totalOption');
                $error['difficult_level']           =   form_error('difficult_level');
                if($type==3){
                    $error['opt_answer']            =   form_error('opt_answer[]');
                }else{
                    $error['opt_answer']            =   form_error('opt_answer[]');
                    $error['option']                =   form_error('option[]');
                    $error['image_ajax']            =   form_error('image_ajax[]');
                }
                $arr = array("status" => "error", "message" => $error);
                echo json_encode($arr);
            } else {
                $save["question_group"]             =   $this->input->post("question_group");
                $save["mark"]                       =   $this->input->post("mark");
                $save["question_type"]              =   $this->input->post("type");
                $save["question"]                   =   $this->input->post("main_question");
                $save["total_option"]               =   $this->input->post("totalOption");
                $save["difficult_level"]            =   $this->input->post("difficult_level");
                $save["upload"]                     =   $this->input->post('imagename');

                $insert = $this->db->insert("question_bank", $save);
                $last_id = $this->db->insert_id();
                $type                               =   $this->input->post('type');
                if ($insert) {
                    echo json_encode(array('status'=>'true','message'=>get_phrase('question_created_successfully')));
                    if($type ==3){
                        $optionArray                =   array();
                        $answers                    =   $this->input->post('opt_answer');
                        $total_option               =   $this->input->post('totalOption');
                        for($i=0; $i<$total_option;$i++){
                            if(!empty($answers[$i])){
                                $new_row            =   array(
                                    'answers'=>$answers[$i],
                                    'question_id'=>$last_id
                                );
                            }
                            array_push($optionArray,$new_row);
                        }
                        $this->db->insert_batch('answers',$optionArray);
                    }  else{
                        $optionArray                =   array();
                        $options                    =   $this->input->post('option');
                        $opt_answer                 =   $this->input->post('opt_answer');
                        $image_ajaxs                =   $this->input->post('image_ajax');
                        $total_option               =   $this->input->post('totalOption');
                        for($i=0; $i<$total_option;$i++){
                            $new_row            =   array(
                                'answers'=>$opt_answer[$i],
                                'options'=>$options[$i],
                                'images'=>$image_ajaxs[$i],
                                'question_id'=>$last_id
                            );
                            array_push($optionArray,$new_row);
                        }
                        $this->db->insert_batch('answers',$optionArray);
                    }
                }else{
                    echo json_encode(array('status'=>'false','message'=>get_phrase('something_went_wrong')));
                }
            }
        }
    }
    function uploadOptionImage()
    {
        $file = $_FILES["photo-file"];
        //print_r($file);die;
        $path = "./uploads/question_bank/";
        // Define file rules
        $initialize = $this->upload->initialize([
            "upload_path" => $path,
            "allowed_types" => "mp4|webm|png|jpg|jpeg",
            "remove_spaces" => true,
            "max_size" => 8388608,
            "overwrite" => true,
        ]);
        if (!$this->upload->do_upload("photo-file")) {
            $error = ["error" => $this->upload->display_errors()];
            $this->upload->display_errors();
        } else {
            $data = $this->upload->data();
            $imagename = $data["file_name"];

            if (
                $data["file_ext"] == ".jpg" ||
                $data["file_ext"] == ".png" ||
                $data["file_ext"] == ".jpeg"
            ) {
                $uploaded_file_path =
                    '<img width="200" src="' .
                    base_url() .
                    "uploads/question_bank/" .
                    $imagename .
                    '" id="preview_image" style="height: 56px; width: 72px; border: 0; border-radius: 5px; margin-top: 12px;">';
                $arr = [
                    "status" => "image",
                    "uploaded_file_path" => $uploaded_file_path,
                    "file_type" => "image",
                    "imagename" => $imagename,
                ];
                echo json_encode($arr);
            } else {
                $uploaded_file_path =
                    ' <video width="200" height="150" controls id="preview_image"><source src="' .
                    base_url() .
                    "uploads/question_bank/" .
                    $imagename .
                    '" type="video/mp4"><source src="' .
                    base_url() .
                    "uploads/question_bank/" .
                    $imagename .
                    '" type="video/webm">Your browser does not support the video tag.</video>';
                $arr = [
                    "status" => "video",
                    "uploaded_file_path" => $uploaded_file_path,
                    "file_type" => "video",
                    "imagename" => $imagename,
                ];
                echo json_encode($arr);
            }
        }
    }
    function uploadMediaFile()
    {
        $file = $_FILES["photo-file"];
        //print_r($file);die;
        $path = "./uploads/question-images/";
        // Define file rules
        $initialize = $this->upload->initialize([
            "upload_path" => $path,
            "allowed_types" => "mp4|webm|png|jpg|jpeg",
            "remove_spaces" => true,
            "max_size" => 8388608,
            "overwrite" => true,
        ]);
        if (!$this->upload->do_upload("photo-file")) {
            $error = ["error" => $this->upload->display_errors()];
            $this->upload->display_errors();
        } else {
            $data = $this->upload->data();
            $imagename = $data["file_name"];

            if (
                $data["file_ext"] == ".jpg" ||
                $data["file_ext"] == ".png" ||
                $data["file_ext"] == ".jpeg"
            ) {
                $uploaded_file_path =
                    '<img width="200" src="' .
                    base_url() .
                    "uploads/question_bank/" .
                    $imagename .
                    '" id="preview_image" style="height: 56px; width: 72px; border: 0; border-radius: 5px; margin-top: 12px;">';
                $arr = [
                    "status" => "image",
                    "uploaded_file_path" => $uploaded_file_path,
                    "file_type" => "image",
                    "imagename" => $imagename,
                ];
                echo json_encode($arr);
            } else {
                $uploaded_file_path = ' <video width="200" height="150" controls id="preview_image"><source src="'.base_url() ."uploads/question_bank/" .
                    $imagename .
                    '" type="video/mp4"><source src="' .
                    base_url() .
                    "uploads/question_bank/" .
                    $imagename .
                    '" type="video/webm">Your browser does not support the video tag.</video>';
                $arr = [
                    "status" => "video",
                    "uploaded_file_path" => $uploaded_file_path,
                    "file_type" => "video",
                    "imagename" => $imagename,
                ];
                echo json_encode($arr);
            }
        }
    }
    function edit($id=''){
        $this->data['question_bank_info']    =    $this->question_bank_model->questionBankById($id);
        $this->data['answers_info']          =    $this->question_bank_model->getAnswerById($id);
        $this->data['questionGroup']         =    $this->question_bank_model->getGroup();
        $this->layout->title("edit_question_bank");
        $this->layout->view("online_exam/question_bank/edit", $this->data);
    }
    function update_question_bank()
    {
        //print_r($this->input->post('opt_answer'));die;
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules("type",get_phrase("question_type"), "trim|required");
            $this->form_validation->set_rules('question_group',get_phrase('question_group'),'trim|required');
            $this->form_validation->set_rules("totalOption", get_phrase("total_option"),"trim|required");
            $this->form_validation->set_rules('main_question',get_phrase('main_question'),'trim|required');
            $this->form_validation->set_rules('mark',get_phrase('mark'),'trim|required|numeric');
            $this->form_validation->set_rules('difficult_level',get_phrase('difficult_level'),'trim|required');
            $type                                   =   $this->input->post('type');
            if($type==3){
                $this->form_validation->set_rules('opt_answer[]',get_phrase('answer'),'trim|required');
            }else{
                $this->form_validation->set_rules('opt_answer[]',get_phrase('answer'),'trim|required');
                $this->form_validation->set_rules('option[]',get_phrase('option'),'trim|required');
                $this->form_validation->set_rules('image_ajax[]',get_phrase('image_ajax'),'trim');
            }
            if ($this->form_validation->run() == false) {
                $error['question_group']            =   form_error('question_group');
                $error['mark']                      =   form_error('mark');
                $error['question_type']             =   form_error('question_type');
                $error['main_question']             =   form_error('main_question');
                $error['totalOption']               =   form_error('totalOption');
                $error['difficult_level']           =   form_error('difficult_level');
                if($type==3){
                    $error['opt_answer']            =   form_error('opt_answer[]');
                }else{
                    $error['opt_answer']            =   form_error('opt_answer[]');
                    $error['option']                =   form_error('option[]');
                    $error['image_ajax']            =   form_error('image_ajax[]');
                }
                $arr = array("status" => "error", "message" => $error);
                echo json_encode($arr);
            } else {
                $id                                 =   $this->input->post('id');
                $save["question_group"]             =   $this->input->post("question_group");
                $save["mark"]                       =   $this->input->post("mark");
                $save["question_type"]              =   $this->input->post("type");
                $save["question"]                   =   $this->input->post("main_question");
                $save["total_option"]               =   $this->input->post("totalOption");
                $save["difficult_level"]            =   $this->input->post("difficult_level");
                $save["upload"]                     =   $this->input->post('imagename');

                $this->db->where('id',$id);
                $update = $this->db->update("question_bank", $save);

                $type                               =   $this->input->post('type');
                if ($update) {
                    echo json_encode(array('status'=>'true','message'=>get_phrase('question_updated_successfully')));
                    if($type ==3){
                        $optionArray                =   array();
                        $answers                    =   $this->input->post('opt_answer');
                        $total_option               =   $this->input->post('totalOption');
                        for($i=0; $i<$total_option;$i++){
                            if(!empty($answers[$i])){
                                $new_row            =   array(
                                    'answers'=>$answers[$i],
                                    
                                );
                                array_push($optionArray, $new_row);
                            }
                        }
                    }else{
                       // print_r($this->input->post('opt_answer'));
                        $optionArray                =   array();
                        $answer_ids                 =   $this->input->post('answer_id');
                        $options                    =   $this->input->post('option');
                        $opt_answers                =   $this->input->post('opt_answer');
                        $image_ajaxs                =   $this->input->post('image_ajax');
                        $total_option               =   $this->input->post('totalOption');
                        for($i=0; $i<$total_option;$i++){
                            $checkAns               =   $this->db->get_where('answers',array('id'=>$answer_ids[$i]))->row();

                            if($checkAns){
                                $save_ans                =   array(
                                    'answers'=>$opt_answers[$i],
                                    'options'=>$options[$i],
                                    'images'=>$image_ajaxs[$i],
                                    'question_id'=>$id
                                );
                                $this->db->where('id',$answer_ids[$i]);
                                $this->db->update('answers',$save_ans);
                            }else{
                                $new_row                =   array(
                                    'answers'=>$opt_answers[$i],
                                    'options'=>$options[$i],
                                    'images'=>$image_ajaxs[$i],
                                    'question_id'=>$id
                                );
                                $this->db->insert('answers',$new_row);
                            }
                        }
                    }
                }else{
                    echo json_encode(array('status'=>'false','message'=>get_phrase('something_went_wrong')));
                }
            }
        }
    }
    function view($id=''){
        $this->data['question_bank_info']    =    $this->question_bank_model->questionBankById($id);
        $this->data['answers_info']          =    $this->question_bank_model->getAnswerById($id);
        $this->layout->title("view_question");
        $this->layout->view("online_exam/question_bank/view", $this->data);
    }


}
