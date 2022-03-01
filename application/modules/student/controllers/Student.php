<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Student extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Student_Model', 'student_model', true);
        
    }
    function index(){
    	$this->data['studentData']     =    $this->student_model->getStudent();
    	$this->layout->title(get_phrase('student'));
        $this->layout->view('student/index',$this->data);
    }

    function add(){
    	$this->data['studentData']     =    $this->student_model->getStudent();
    	$this->layout->title(get_phrase('add student'));
        $this->layout->view('student/add',$this->data);
    }

    function add_student(){
    	$this->form_validation->set_rules('name', get_phrase('name'), 'trim|required');
    	$this->form_validation->set_rules('email', get_phrase('email'), 'trim|required|valid_email');
    	$this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
    	$this->form_validation->set_rules('section', get_phrase('section'), 'trim|required');
    	$this->form_validation->set_rules('register_no', get_phrase('register_no'), 'trim|required');
    	$this->form_validation->set_rules('roll', get_phrase('roll'), 'trim|required');
    	$this->form_validation->set_rules('password', get_phrase('password'), 'trim|required|min_length[6]');

    	if($this->form_validation->run()== false){
    		$error   =    array(
                    'name'=>      form_error('name'),
                    'class'=>  form_error('class'),
                    'section'=>   form_error('section'),
                    'register_no' =>   form_error('register_no'),
                    'roll' =>   form_error('roll'),
                    'email' =>    form_error('email'),
                    'password'=>  form_error('password'),
                );
                $arr     =    array('status'=>    'error', 'message'=>$error);
                echo json_encode($arr);
    	}else{
    		$save['first_name']      =    $this->input->post('name');
    		$save['email']           =    $this->input->post('email');
    		$save['phone']           =    $this->input->post('phone');
    		$save['created_at']      =    date('Y-m-d H:i:s');
    		$save['password']        =   password_hash($this->input->post('password'), PASSWORD_DEFAULT);
    		$save['temp_password']   =   base64_encode($this->input->post('password'));

    		if(!empty($_FILES['image']['name'])){
                $save['photo']          =   $_FILES['image']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'],'uploads/student_image/'.$_FILES['image']['name']);
            }
            $insert    =     $this->db->insert('users',$save);
            $last_id    =   $this->db->insert_id();

            if($insert){
                $student['guardian']        =    $this->input->post('guardian');
                $student['gender']          =    $this->input->post('gender');
                $student['religion']        =    $this->input->post('religion');
                $student['address']         =    $this->input->post('address');
                $student['state']           =    $this->input->post('state');
                $student['country']         =    $this->input->post('country');
                $student['class']           =    $this->input->post('class');
                $student['section']         =    $this->input->post('section');
                $student['group']           =    $this->input->post('group');
                $student['register_no']     =    $this->input->post('register_no');
                $student['roll']            =    $this->input->post('roll');
                $student['curricular']      =    $this->input->post('curricular');
                $student['remarks']         =    $this->input->post('remarks');
                $student['date_of_birth']   =    $this->input->post('date_of_birth');
                $student['created_at']      =    date('Y-m-d H:i:s');
                $student['status']          =    '1';
                $student['user_id']         =    $last_id;

                $this->db->insert('student',$student);
            	echo json_encode(array('status'=>'true','message'=>'student added successfully'));
            }else{
            	echo json_encode(array('status'=>'false','message'=>'something went wrong...!'));
            }
    	}
    }

    function update_status(){
        $id                         =   $this->input->post('id');       
        $save['status']             =   $this->input->post('status');
        $this->db->where('id =',$id);
        $update   =   $this->db->update('student',$save);

        echo json_encode(array('status'=>'true','message'=>'Status updated'));
    }

    function view($id=''){
    	$this->data['studentData']     =    $this->student_model->getStudentById($id);
    	$this->layout->title(get_phrase('view student'));
    	// print_r($this->data['studentData'] ); die;
        $this->layout->view('student/view',$this->data);
    }
    function edit($id=''){
        $this->data['student_info']     =    $this->student_model->getStudentById($id);
        $this->layout->title(get_phrase('edit student'));
        $this->layout->view('student/edit',$this->data);
    } 

    function save_edit(){
    	$this->form_validation->set_rules('name', get_phrase('name'), 'trim|required');
    	$this->form_validation->set_rules('email', get_phrase('email'), 'trim|required|valid_email');
    	$this->form_validation->set_rules('class', get_phrase('class'), 'trim|required');
    	$this->form_validation->set_rules('section', get_phrase('section'), 'trim|required');
    	$this->form_validation->set_rules('register_no', get_phrase('register_no'), 'trim|required');
    	$this->form_validation->set_rules('roll', get_phrase('roll'), 'trim|required');

    	if($this->form_validation->run()== false){
    		$error   =    array(
                    'name'=>      form_error('name'),
                    'class'=>     form_error('class'),
                    'section'=>   form_error('section'),
                    'register_no' =>   form_error('register_no'),
                    'roll' =>      form_error('roll'),
                    'email' =>     form_error('email')
                );
                $arr     =    array('status'=>    'error', 'message'=>$error);
                echo json_encode($arr);
    	}else{
	    	$user_id                 =    $this->input->post('user_id');
	        $save['first_name']      =    $this->input->post('name');
	        $save['email']           =    $this->input->post('email');
	        $save['phone']           =    $this->input->post('phone');
	        $save['modified_at']     =    date('Y-m-d H:i:s');

	        if(!empty($_FILES['image']['name'])){
	            $save['photo']          =   $_FILES['image']['name'];
	            move_uploaded_file($_FILES['image']['tmp_name'],'uploads/student_image/'.$_FILES['image']['name']);
	        }

	                        $this->db->where('id',$user_id);
	        $update    =    $this->db->update('users',$save);

	        if($update){  
	            $id                         =    $this->input->post('id');
	            $student['guardian']        =    $this->input->post('guardian');
	            $student['gender']          =    $this->input->post('gender');
	            $student['religion']        =    $this->input->post('religion');
	            $student['address']         =    $this->input->post('address');
	            $student['state']           =    $this->input->post('state');
	            $student['country']         =    $this->input->post('country');
	            $student['class']           =    $this->input->post('class');
	            $student['section']         =    $this->input->post('section');
	            $student['group']           =    $this->input->post('group');
	            $student['register_no']     =    $this->input->post('register_no');
	            $student['roll']            =    $this->input->post('roll');
	            $student['curricular']      =    $this->input->post('curricular');
	            $student['remarks']         =    $this->input->post('remarks');
	            $student['date_of_birth']   =    $this->input->post('date_of_birth');
	            $student['updated_at']      =    date('Y-m-d H:i:s');

	            $this->db->where('id',$id);
	            $this->db->update('student',$student);
	            echo json_encode(array('status'=>'true', 'message'=>'Updated successfully'));
	        }else{
	            echo json_encode(array('status'=>'false', 'message'=>'Not updated try again later'));
	        }
	    }    
    }

    function delete(){
        $student_id                    =   $this->input->post('student_id');
        if(!empty($student_id)){
            $this->db->where('user_id',$student_id);
            $delete                     =   $this->db->delete('student');
            if($delete){
                $this->db->where('id',$student_id);
                $this->db->delete('users');
                echo json_encode(array('status'=>'true','message'=>get_phrase('student_deleted')));
            }
        }
    }

    function deleteModal($id=''){
        $this->data['id']          =    $id;
        echo $this->load->view('student/deleteModel',$this->data);
    }
   

}    