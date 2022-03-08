<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Auth extends CI_Controller {
    public $data = array();
    public $gsms_setting = array();

    public function __construct() {

        parent::__construct();
        $this->load->model('Auth_Model', 'auth', true);
        $this->load->model('Email_Model','email_model',true);
        $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();

        if($gsms_setting){
            $this->gsms_setting     =   $gsms_setting;
        }
    }

    /*     * ***************Function login**********************************
     * @type            : Function
     * @function name   : login
     * @description     : Authenticatte when uset try lo login. 
     *                    if autheticated redirected to logged in user dashboard.
     *                    Also set some session date for logged in user.   
     * @param           : null 
     * @return          : null 
     * ********************************************************** */

    public function validateLogin() {
        //print_r($_POST);die;
        if ($_POST) {
            
            $this->form_validation->set_rules('email','Email Address','trim|required');
            $this->form_validation->set_rules('password','Password','trim|required');
            if($this->form_validation->run()==false){
                $msg                =   array(
                    'email'=>form_error('email'),
                    'password'=>form_error('password')
                );
                $arr                =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $email              =   $this->input->post('email');
                $password           =   $this->input->post('password');

                $login = $this->auth->validateLogin($email,$password);
                //_d($login);
                if (!empty($login)) {
                    // check user active status
                    if ($login->status==0) {
                        $arr                =   array('status'=>'false','message'=>get_phrase('user_active_status'));
                        echo json_encode($arr);
                    }

                    // check is setting role permission by admin
                    $privileges = $this->auth->get_list('privileges', array('role_id' => $login->role_id));
                    if (empty($privileges)) {
                        $arr                =   array('status'=>'false','message'=>get_phrase('privilege_not_setting'));
                        echo json_encode($arr);
                    }

                    $profile = $this->auth->get_single('employees', array('user_id' => $login->id));


                    $this->session->set_userdata('role_id', $login->role_id);
                    $this->session->set_userdata('id', $login->id);
                    $this->session->set_userdata('email', $login->email);
                    $this->session->set_userdata('phone', $login->phone);
                    $this->session->set_userdata('name', $login->first_name);
                    $this->session->set_userdata('photo', $login->photo);

                    if (isset($profile->name)) {
                       $this->session->set_userdata('name', $profile->name);
                    }
                    if (isset($profile->phone)) {
                        $this->session->set_userdata('phone', $profile->phone);
                    }
                    if (isset($profile->photo)) {
                        $this->session->set_userdata('photo', $profile->photo);
                    }
                    if (isset($profile->user_id)) {                
                        $this->session->set_userdata('user_id', $profile->user_id);
                    }
                    if (isset($profile->id)) {
                        $this->session->set_userdata('profile_id', $profile->id);
                    }
                    // set appliction theme
                    //$theme = $this->auth->get_single('themes', array('is_active' => 1));
                    //$this->session->set_userdata('theme', $theme->slug);

                    // set appliction setting
                    $setting = $this->auth->get_single('settings', array('status' => 1));
                    
                    if (isset($setting->language)) {
                        $this->session->set_userdata('language', $setting->language);
                    }
                    if (isset($setting->enable_rtl)) {
                        $this->session->set_userdata('enable_rtl', $setting->enable_rtl);
                    }

                    $this->auth->update('users', array('last_logged_in' => date('Y-m-d H:i:s')), array('id' => logged_in_user_id()));
                    $arr                =   array('status'=>'true','message'=>get_phrase('login_success'));
                    echo json_encode($arr);
                    
                } else{
                    $arr            =   array('status'=>'false','message'=>'You have entered wrong credential');
                    echo json_encode($arr);
                }
            }
        }
    }

    /*     * ***************Function logout**********************************
     * @type            : Function
     * @function name   : logout
     * @description     : Log Out the logged in user and redirected to Login page  
     * @param           : null 
     * @return          : null 
     * ********************************************************** */

    public function logout($key = null) {
                
        $this->session->unset_userdata($key);
        $this->session->unset_userdata('id');
        $this->session->unset_userdata('role_id');
        $this->session->unset_userdata('email');

        $this->session->unset_userdata('name');
        $this->session->unset_userdata('phone');
        $this->session->unset_userdata('photo');
        $this->session->unset_userdata('user_id');
        $this->session->unset_userdata('profile_id');

        $this->session->unset_userdata('theme');

        // set appliction setting
        $this->session->unset_userdata('currency');
        $this->session->unset_userdata('currency_symbol');
        $this->session->unset_userdata('language');
        $this->session->unset_userdata('running_year');

        $this->session->sess_destroy();
        redirect(base_url().'admin/auth/v1');
        exit;
    }

    public function forgot() {
        
        $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();
        if($gsms_setting){           
            $this->gsms_setting = $gsms_setting;  
            date_default_timezone_set($this->gsms_setting->default_time_zone);
        }
        $this->load->helper('form');
        $data = array();
        $this->load->view('forgot', $data);

    }

    /*     * ***************Function forgotpass**********************************
     * @type            : Function
     * @function name   : forgotpass
     * @description     : this function is used to send recover forgot password  email 
     * @param           : null 
     * @return          : null 
     * ********************************************************** */

    function resetPassword(){
        if($_POST){
            $this->form_validation->set_rules('email',get_phrase('email'),'trim|required');

            if($this->form_validation->run()==false){
                $msg                        =   array(
                    'email'=>form_error('email')
                );
                $arr                        =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $email                      =   $this->input->post('email');
                $validateUser               =   $this->auth->get_single('users',array('email'=>$email,'status'=>1));
                if(!empty($validateUser)){
                    $full_name              =   $validateUser->first_name.' '.$validateUser->last_name;
                    $this->email_model->send_forgot_password_email($email,$validateUser->id,$full_name);
                    $arr                    =   array('status'=>'true','message'=>get_phrase('reset_email_success'));
                    echo json_encode($arr);
                }else{
                    $arr                    =   array('status'=>'false','message'=>get_phrase('wrong_email'));
                    echo json_encode($arr);
                }
            }
        }
    }

           
   
    /*     * ***************Function reset**********************************
     * @type            : Function
     * @function name   : reset
     * @description     : this function used to load password reset view file 
     * @param           : $key string parameter; 
     * @return          : null 
     * ********************************************************** */

    public function reset($key) {

        $data = array();
        $this->load->helper('form');
        $user = $this->auth->get_single('users', array('reset_key' => $key));
        $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();
        if($gsms_setting){           
            $this->gsms_setting = $gsms_setting;            
            date_default_timezone_set($this->gsms_setting->default_time_zone);
        }
        
        if (!empty($user)) {
            $data['user'] = $user;
            $data['key'] = $key;
            $this->load->view('reset', $data);
        } else {
            $this->session->set_flashdata('error', get_phrase('unexpected_error'));
            redirect();
        }
    }

    /*     * ***************Function resetpass**********************************
     * @type            : Function
     * @function name   : resetpass
     * @description     : this function used to reset user passwrd 
     *                    after sucessfull reset password it's redirected
     *                    user to log in page            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */

    public function resetpass() {

        if ($_POST) {

            $this->load->library('form_validation');
            $this->form_validation->set_rules('password', get_phrase('password'), 'trim|required|min_length[5]|max_length[12]');
            $this->form_validation->set_rules('conf_password', get_phrase('conf_password'), 'trim|required|matches[password]');

            if ($this->form_validation->run() == false) {
                $msg                    =   array(
                    'password'=>form_error('password'),
                    'conf_password'=>form_error('conf_password')
                );
                $arr                    =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            } else {
                $setting = $this->auth->get_single('settings', array('status' => 1));
                if(!empty($setting)){
                    date_default_timezone_set($this->gsms_setting->default_time_zone);
                }
                $key                            =   $this->input->post('key');
                $validateUser                   =   $this->auth->get_single('users',array('reset_key'=>$key));
                $currentTime                    =   date('Y-m-d h:i:s');
                if(strtotime($currentTime)>=strtotime($validateUser->expire_at)){
                    $date                   =   $validateUser->expire_at;
                    $arr                    =   array('status'=>'false','message'=>get_phrase('link_expire'),'date'=>$date);
                    echo json_encode($arr);
                }else{
                    $data['password']               =   password_hash($this->input->post('password'), PASSWORD_BCRYPT);
                    $data['temp_password']          =   base64_encode($this->input->post('password'));
                    $data['reset_key']              =   NULL;
                    $data['expire_at']              =   '';
                    $data['modified_at']            =   date('Y-m-d H:i:s');
                    $data['modified_by']            =   logged_in_user_id();
                    $this->auth->update('users', $data, array('id' => $this->input->post('id')));
                    $full_name                      =   $validateUser->first_name.' '.$validateUser->last_name;
                    $this->email->password_changed_mail($validateUser->email,$validateUser->id,$full_name);
                    $arr                    =   array('status'=>'true','message'=>get_phrase('update_success'));
                    echo json_encode($arr);
                }   
            }
        }
    }

}
