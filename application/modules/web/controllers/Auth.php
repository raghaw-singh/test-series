<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends Front_Controller {

    public $data = array();
    public $setting = array();
    
    function __construct() {
        parent::__construct();
        
        $this->load->model('Facebook_Model','facebook_model',true) ;  
        $this->load->model('Web_Model','web_model',true);
        $this->load->model('Email_Model','email_model',true);
        $this->data['settings'] = $this->web_model->get_single('settings', array('status' => 1));
        
        if($this->data['settings']){
            $this->setting = $this->data['settings'];
        }
        
        
    }

    public function fb_validate_login($access_token = "", $fb_user_id = "") {
        $this->facebook_model->fb_validate_login($access_token, $fb_user_id);
    }
    public function index() {
        $this->data['list'] = TRUE;
        $this->layout->title(get_phrase('login') . ' | ' . SMS);
        $this->load->view('auth/login', $this->data);
    }

    function validateOTP(){
        $otp                    =   $this->input->post('otp');
        if(isset($_POST)){
            $this->form_validation->set_rules('otp','OTP','trim|required|xss_clean|numeric|max_length[6]');
            if($this->form_validation->run()==false){
                $msg            =   array(
                    'otp'=>form_error('otp')
                );
                $arr            =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                
                $getData            =   $this->web_model->validateUserOTP();
                if($getData){
                    $currentDate    =   date('Y-m-d H:i');
                    if($currentDate < $getData->otp_expire_at){
                        $data['otp']    =   '';
                        $data['otp_expire_at']  =   '';
                        $data['phone_verify']   =   'verify';

                        $this->db->where('id',$getData->id);
                        $this->db->update('users',$data);
                        $arr            =   array('status'=>'true','message'=>'OTP Verification success');
                        echo json_encode($arr);
                    }else{
                        $arr            =   array('status'=>'false','message'=>'OTP Expire');
                        echo json_encode($arr);
                    }
                }else{
                    $arr            =   array('status'=>'false','message'=>'Invalid OTP');
                    echo json_encode($arr);
                }
            }
        }
    }
    function userLogin(){
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules('emailaddress','Email','trim|required|valid_email|xss_clean');
            $this->form_validation->set_rules('password','Password','trim|required|xss_clean');

            if($this->form_validation->run()==false){
                $msg                    =   array(
                    'emailaddress'  =>  form_error('emailaddress'),
                    'password'      =>  form_error('password')
                );

                $arr                =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $email              =   $this->input->post('emailaddress');
                $password           =   $this->input->post('password');
                $getData            =   $this->web_model->validateLogin($email,$password);
                $url                =   $_SERVER['HTTP_REFERER'];
                if($getData){
                    if($getData->status==1){
                        if($getData->role_id=='3'){
                            $fullname       =   $getData->first_name.' '.$getData->last_name;
                            $this->session->set_userdata('id',$getData->id);
                            $this->session->set_userdata('user_id',$getData->id);
                            $this->session->set_userdata('role_id',$getData->role_id);
                            $this->session->set_userdata('email',$getData->email);
                            $this->session->set_userdata('name',$fullname);
                            $redirect   =   base_url('dashboard');
                            $arr            =   array('status'=>'true','message'=>'Please wait while redirecting to dashboard','redirect'=>$redirect);
                            echo json_encode($arr);
                        }else{
                            $fullname       =   $getData->first_name.' '.$getData->last_name;
                            $this->session->set_userdata('student_name',$fullname);
                            $this->session->set_userdata('student_id',$getData->id);
                            $this->session->set_userdata('s_role_id',$getData->role_id);
                            $this->session->set_userdata('student_email',$getData->email);
                            $redirect   =   base_url('web/index');
                            $arr            =   array('status'=>'true','message'=>'Please wait while redirecting to dashboard','redirect'=>$redirect);
                            echo json_encode($arr);
                        }
                        //redirect(base_url().'web/student/dashboard');
                    }else{
                        $arr            =   array('status'=>'false','message'=>'Your account is suspended by admin');
                        echo json_encode($arr);
                    }
                }else{
                    $arr            =   array('status'=>'false','message'=>'Invalid Credentials');
                    echo json_encode($arr);
                }
            }
        }
    }
    function createStudentAccount(){
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules('first_name',get_phrase('first_name'),'trim|required|xss_clean');
            $this->form_validation->set_rules('last_name',get_phrase('last_name'),'trim|required|xss_clean');
            $this->form_validation->set_rules('email',get_phrase('email'),'trim|required|xss_clean|valid_email|is_unique[users.email]');
            $this->form_validation->set_rules('password',get_phrase('password'),'trim|required|xss_clean');
            $this->form_validation->set_rules('phone',get_phrase('contact_number'),'trim|required|xss_clean|numeric|max_length[12]');
            if($this->form_validation->run()==false){
                $msg                        =   array(
                    'password'=>form_error('password'),
                    'first_name'=>form_error('first_name'),
                    'last_name'=>form_error('last_name'),
                    'email'=>form_error('email'),
                    'phone'=>form_error('phone')
                );
                $arr                        =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $email                      =   $this->input->post('email');
                if(validate_email($email)){
                    $currentDate                =   date('Y-m-d H:i');
                    $first_name                 =   $this->input->post('first_name');
                    $last_name                  =   $this->input->post('last_name');
                    $password                   =   $this->input->post('password');
                    $phone                      =   $this->input->post('phone');
                    $activation_code            =   rand_string(12);
                    $ins_array                  =   array(
                        'role_id'=>'4',
                        'temp_password'=>base64_encode($password),
                        'email'=>$email,
                        'first_name'=>$first_name,
                        'last_name'=>$last_name,
                        'password'=>password_hash($password, PASSWORD_BCRYPT),
                        'email_verify'=>'pending',
                        'phone_verify'=>'pending',
                        'activation_key'=>$activation_code,
                        'expire_at'=>date('Y-m-d H:i',strtotime($currentDate. ' + 1 days')),
                        'status'=>'1',
                        'created_at'=>date('Y-m-d h:i:s'),
                        'otp'=>rand_otp_string(6),
                        'otp_expire_at'=>date('Y-m-d H:i',strtotime($currentDate. ' + 15 minutes')),
                        'watch_history'=>'[]'
                    );
                    $this->session->set_userdata('otp_verify_mobile',$phone);
                    $check_email                =   $this->web_model->get_single('users',array('email'=>$email));
                    if($check_email){
                        $arr                    =   array('status'=>'false','message'=>get_phrase('email_already_existed'));
                        echo json_encode($arr);
                    }else{
                        $insert                 =   $this->db->insert('users',$ins_array);
                        if($insert){
                            $last_id            =   $this->db->insert_id();
                            $fullname           =   $first_name.' '.$last_name;
                            $save['user_id']    =   $last_id;
                            $save['phone']      =   $phone;
                            $save['name']       =   $first_name.' '.$last_name;
                            $save['status']     =   '1';
                            $save['created_at'] =   date('Y-m-d h:i:s');
                            $save['created_by'] =   $this->db->insert_id();
                            $this->db->insert('students',$save);
                            $this->email_model->account_created_mail($email,$last_id,$fullname);
                            $this->email_model->send_verification_link($email,$fullname,$activation_code);
                            $arr                =   array('status'=>'true','message'=>get_phrase('account_created'));
                            echo json_encode($arr);
                        }else{
                            $arr                =   array('status'=>'false','message'=>get_phrase('something_went_wrong'));
                            echo json_encode($arr);
                        }
                    }
                }else{
                    $arr                    =   array('status'=>'false','message'=>'Email is invalid');
                    echo json_encode($arr);
                }
            }
        }
    }

    function createInstructorAccount(){
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules('first_name',get_phrase('first_name'),'trim|required|xss_clean');
            $this->form_validation->set_rules('last_name',get_phrase('last_name'),'trim|required|xss_clean');
            $this->form_validation->set_rules('email',get_phrase('email'),'trim|required|xss_clean|valid_email|is_unique[users.email]');
            $this->form_validation->set_rules('password',get_phrase('password'),'trim|required|xss_clean');
            $this->form_validation->set_rules('phone',get_phrase('contact_number'),'trim|required|xss_clean|numeric|max_length[12]');
            if($this->form_validation->run()==false){
                $msg                        =   array(
                    'password'=>form_error('password'),
                    'first_name'=>form_error('first_name'),
                    'last_name'=>form_error('last_name'),
                    'email'=>form_error('email'),
                    'phone'=>form_error('phone')
                );
                $arr                        =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $email                      =   $this->input->post('email');
                if(validate_email($email)){
                    $currentDate                =   date('Y-m-d H:i');
                    $currentDate                =   date('Y-m-d H:i');
                    $first_name                 =   $this->input->post('first_name');
                    $last_name                  =   $this->input->post('last_name');
                    $password                   =   $this->input->post('password');
                    $phone                      =   $this->input->post('phone');
                    $activation_code            =   rand_string(12);
                    $ins_array                  =   array(
                        'role_id'=>'3',
                        'temp_password'=>base64_encode($password),
                        'email'=>$email,
                        'first_name'=>$first_name,
                        'last_name'=>$last_name,
                        'password'=>password_hash($password, PASSWORD_BCRYPT),
                        'email_verify'=>'pending',
                        'phone_verify'=>'pending',
                        'activation_key'=>$activation_code,
                        'expire_at'=>date('Y-m-d H:i',strtotime($currentDate. ' + 1 days')),
                        'status'=>'1',
                        'created_at'=>date('Y-m-d h:i:s'),
                        'otp'=>rand_otp_string(6),
                        'otp_expire_at'=>date('Y-m-d H:i',strtotime($currentDate. ' + 15 minutes'))
                    );
                    $this->session->set_userdata('otp_verify_mobile',$phone);
                    $check_email                =   $this->web_model->get_single('users',array('email'=>$email));
                    if($check_email){
                        $arr                    =   array('status'=>'false','message'=>get_phrase('email_already_existed'));
                        echo json_encode($arr);
                    }else{
                        $insert                 =   $this->db->insert('users',$ins_array);
                        if($insert){
                            $last_id            =   $this->db->insert_id();
                            $fullname           =   $first_name.' '.$last_name;
                            $save['user_id']    =   $last_id;
                            $save['phone']      =   $phone;
                            $save['name']       =   $first_name.' '.$last_name;
                            $save['status']     =   '1';
                            $save['created_at'] =   date('Y-m-d h:i:s');
                            $save['created_by'] =   $this->db->insert_id();
                            $this->db->insert('teachers',$save);
                            $this->email_model->account_created_mail($email,$last_id,$fullname);
                            $this->email_model->send_verification_link($email,$fullname,$activation_code);
                            $arr                =   array('status'=>'true','message'=>get_phrase('account_created'));
                            echo json_encode($arr);
                        }else{
                            $arr                =   array('status'=>'false','message'=>get_phrase('something_went_wrong'));
                            echo json_encode($arr);
                        }
                    }
                }else{
                    $arr                    =   array('status'=>'false','message'=>'Email is invalid');
                    echo json_encode($arr);
                }
            }
        }
    }
    function reset($key){

        if(!empty($key)){
            $getData                        =   $this->db->get_where('users',array('reset_key'=>$key))->row();
            $this->data['getData']          =   $getData;
        }
        $this->data['title']                =   'Reset Password | '. SMS;
        $this->load->view('auth/reset-password',$this->data);
    }
    
    function resetPassword(){
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules('password','Password','trim|required|xss_clean|min_length[6]');
            $this->form_validation->set_rules('confirm_password','Confirm Password','trim|required|xss_clean|min_length[6]|matches[password]');
            $this->form_validation->set_rules('reset_key','Reset key','trim|required');
            if($this->form_validation->run()==false){
                $msg                    =   array(
                    'password'=>form_error('password'),
                    'confirm_password'=>form_error('confirm_password'),
                    'reset_key'=>form_error('reset_key')
                );
                $arr                    =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $key                            =   $this->input->post('reset_key');
                $validateUser                   =   $this->db->get_where('users',array('reset_key'=>$key))->row();
                $currentDate    =   date('Y-m-d H:i');
                if($currentDate < $validateUser->expire_at){
                    $data['password']               =   password_hash($this->input->post('password'), PASSWORD_BCRYPT);
                    $data['temp_password']          =   base64_encode($this->input->post('password'));
                    $data['reset_key']              =   NULL;
                    $data['expire_at']              =   '';
                    $data['modified_at']            =   date('Y-m-d H:i:s');
                    $this->web_model->update('users', $data, array('id' => $this->input->post('id')));
                    $full_name                      =   $validateUser->first_name.' '.$validateUser->last_name;

                    $this->email_model->password_changed_mail($validateUser->email,$validateUser->id,$full_name);
                    $arr                    =   array('status'=>'true','message'=>get_phrase('update_success'));
                    echo json_encode($arr);
                }else{
                    $arr                    =   array('status'=>'false','message'=>get_phrase('link_expire'));
                    echo json_encode($arr);
                } 
            }
        }
    }
    function forgotPassword(){
        if(isset($_POST['submit'])){
            $this->form_validation->set_rules('emailaddress','Email','trim|required|xss_clean|valid_email');

            if($this->form_validation->run()==false){
                $msg                =   array(
                    'emailaddress'=>form_error('emailaddress')
                );
                $arr                =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $email              =   $this->input->post('emailaddress');
                $checkEmail         =   $this->web_model->get_single('users',array('email'=>$email));
                if($checkEmail){
                    $fullname       =   $checkEmail->first_name.' '.$checkEmail->last_name;
                    $sendmail       =   $this->email_model->send_forgot_password_email($email,$checkEmail->id,$fullname);
                    if($sendmail){
                        $arr        =   array('status'=>'true','message'=>'Email send to you, check your inbox');
                        echo json_encode($arr);
                    }else{
                        $arr            =   array('status'=>'false','message'=>'Mail not send, access denied');
                        echo json_encode($arr);    
                    }
                }else{  
                    $arr            =   array('status'=>'false','message'=>'This email is not associated with us');
                    echo json_encode($arr);
                }
            }
        }
    }
    function logout(){
        $this->session->unset_userdata('student_name');
        $this->session->unset_userdata('student_id');
        $this->session->unset_userdata('s_role_id');
        redirect(base_url().'web');
    }

}
    