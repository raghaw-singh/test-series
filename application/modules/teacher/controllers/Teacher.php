<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Teacher extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        	$this->load->model('Teacher_Model', 'teacher_model', true);
        // $this->data['settings'] = $this->teacher_model->get_single('settings', array('status' => 1));
    }
    function index(){
    	$this->data['teacherData']     =    $this->teacher_model->getTeacher();

    	$this->layout->title(get_phrase('teacher'));
        $this->layout->view('teacher/index',$this->data);
    }
    function add_teacher(){
    	$this->form_validation->set_rules('name', get_phrase('name'), 'trim|required');
    	$this->form_validation->set_rules('designation', get_phrase('designation'), 'trim|required');
    	$this->form_validation->set_rules('date_of_birth', get_phrase('date_of_birth'), 'trim|required');
    	$this->form_validation->set_rules('email', get_phrase('email'), 'trim|required|valid_email');
    	$this->form_validation->set_rules('date_of_joining', get_phrase('date_of_joining'), 'trim|required');
    	$this->form_validation->set_rules('password', get_phrase('password'), 'trim|required|min_length[6]');

    	if($this->form_validation->run()== false){
    		$error   =    array(
                    'name'=>      form_error('name'),
                    'designation'=>  form_error('designation'),
                    'date_of_birth'=>   form_error('date_of_birth'),
                    'date_of_joining' =>   form_error('date_of_joining'),
                    'email' =>    form_error('email'),
                    'password'=>  form_error('password'),
                );
                $arr     =    array('status'=>    'error', 'message'=>$error);
                echo json_encode($arr);
    	} else{
    		$save['first_name']           =    $this->input->post('name');
    		$save['email']          =    $this->input->post('email');
    		$save['phone']           =    $this->input->post('phone');
    		$save['created_at']      =    date('Y-m-d H:i:s');
            $save['role_id']         =  '4';
    		$save['password']        =   password_hash($this->input->post('password'), PASSWORD_BCRYPT);
    		$save['temp_password']   =   base64_encode($this->input->post('password'));

    		if(!empty($_FILES['image']['name'])){
                $save['photo']          =   $_FILES['image']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'],'uploads/teacher_image/'.$_FILES['image']['name']);
            }
            $insert    =     $this->db->insert('users',$save);
            $last_id    =   $this->db->insert_id();
            if($insert){
                $teacher['designation']     =    $this->input->post('designation');
                $teacher['date_of_birth']   =    $this->input->post('date_of_birth');
                $teacher['gender']          =    $this->input->post('gender');
                $teacher['religion']        =    $this->input->post('religion');
                $teacher['address']         =    $this->input->post('address');
                $teacher['email']          =    $this->input->post('email');
                $teacher['joining_date']    =    $this->input->post('date_of_joining');
                $teacher['created_at']         =    date('Y-m-d H:i:s');
                $teacher['status']          =    '1';
                $teacher['name']            =    $this->input->post('name');
                $teacher['user_id']         =    $last_id;

                $this->db->insert('teacher',$teacher);
            	echo json_encode(array('status'=>'true','message'=>'teacher added successfully'));
            }else{
            	echo json_encode(array('status'=>'false','message'=>'something went wrong...!'));
            }
    	}
    }

    function view($id=''){
    	$this->data['teacher_info']     =    $this->teacher_model->getTeacherById($id);
        $this->data['teacher_data']     =    $this->teacher_model->teacherData($id);
    	$this->layout->title(get_phrase('view teacher'));
        $this->layout->view('teacher/view',$this->data);
    }

    function edit($id=''){
        $this->data['teacher_info']     =    $this->teacher_model->getTeacherById($id);
        $this->data['teacher_data']     =    $this->teacher_model->teacherData($id);
        $this->layout->title(get_phrase('edit teacher'));
        $this->layout->view('teacher/edit',$this->data);
    }

    function save_edit(){
        $user_id                 =    $this->input->post('user_id');
        $save['first_name']      =    $this->input->post('name');
        $save['email']           =    $this->input->post('email');
        $save['phone']           =    $this->input->post('phone');
        $save['modified_at']     =    date('Y-m-d H:i:s');

        if(!empty($_FILES['image']['name'])){
            $save['photo']          =   $_FILES['image']['name'];
            move_uploaded_file($_FILES['image']['tmp_name'],'uploads/teacher_image/'.$_FILES['image']['name']);
        }

                        $this->db->where('id',$user_id);
        $update    =    $this->db->update('users',$save);

        if($update){  
            $id                      =    $this->input->post('id');
            $teacher['name']            =    $this->input->post('name');
            $teacher['designation']     =    $this->input->post('designation');
            $teacher['date_of_birth']   =    $this->input->post('date_of_birth');
            $teacher['joining_date']    =    $this->input->post('date_of_joining');
            $teacher['email']           =    $this->input->post('email');
            $teacher['gender']          =    $this->input->post('gender');
            $teacher['religion']        =    $this->input->post('religion');
            $teacher['phone']           =    $this->input->post('phone');
            $teacher['address']         =    $this->input->post('address');
            $teacher['phone']           =    $this->input->post('phone');
            $teacher['updated_at']      =    date('Y-m-d H:i:s');

            $this->db->where('id',$id);
            $this->db->update('teacher',$teacher);
            echo json_encode(array('status'=>'true', 'message'=>'Updated successfully'));
        }else{
            echo json_encode(array('status'=>'false', 'message'=>'Not updated try again later'));
        }
    }

    function delete(){
        $teacher_id                    =   $this->input->post('teacher_id');
        if(!empty($teacher_id)){
            $this->db->where('user_id',$teacher_id);
            $delete                     =   $this->db->delete('teacher');
            if($delete){
                $this->db->where('id',$teacher_id);
                $this->db->delete('users');
                echo json_encode(array('status'=>'true','message'=>get_phrase('teacher_deleted')));
            }
        }
    }
    function deleteModal($id=''){
        $this->data['id']          =    $id;
        echo $this->load->view('teacher/deleteModal',$this->data);
    }
    function update_status(){
        $id                         =   $this->input->post('id');       
        $save['status']             =   $this->input->post('status');
        $this->db->where('id =',$id);
        $update   =   $this->db->update('teacher',$save);

        echo json_encode(array('status'=>'true','message'=>'Status updated'));
    }    

}
