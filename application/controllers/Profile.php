<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends My_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->model('Profile_Model', 'profile', true);
    }

    public $data = array();

    /**     * *************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : this function used to load logged in user profile information            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */
    public function index() {

        $this->layout->title(get_phrase('my_profile') . ' | ' . SMS);

        $role_id = $this->session->userdata('role_id');
        $user_id = $this->session->userdata('user_id');
        $profile_id = $this->session->userdata('profile_id');

        $this->data['profile'] = get_user_by_role($role_id, $user_id);
        $this->data['info'] = TRUE;
        $this->layout->view('profile/employee', $this->data);
    }
    function password(){
        $this->layout->title(get_phrase('reset_password'));
        $this->layout->view('profile/password', $this->data);   
    }
    public function changepassword() {

        if ($_POST) {
            $this->form_validation->set_rules('current_password',get_phrase('current_password'),'trim|required|min_length[5]');
            $this->form_validation->set_rules('password', get_phrase('password'), 'trim|required|min_length[5]|max_length[12]');
            $this->form_validation->set_rules('conf_password', get_phrase('conf_password'), 'trim|required|matches[password]');

            if ($this->form_validation->run() === false) {
                $msg                            =   array(
                    'current_password'=>form_error('current_password'),
                    'password'=>form_error('password'),
                    'conf_password'=>form_error('conf_password')
                );
                $array                          =   array('status'=>'error','message'=>$msg);
                echo json_encode($array);
            }else{
                $current_password               =   $this->input->post('current_password');
                $password                       =   $this->input->post('password');
                $conf_password                  =   $this->input->post('conf_password');
                $user_info                      =   $this->profile->get_single('users',array('id'=>logged_in_user_id()));
                $check_password                 =   check_password($current_password,$user_info->password);
                if(!$check_password){
                    $arr                        =   array('status'=>'false','message'=>'Old Password Could not match');
                    echo json_encode($arr);
                }else{
                    $data                       =   array(
                        'password'=>password_hash($password, PASSWORD_BCRYPT),
                        'temp_password'=>base64_encode($password),
                        'modified_at'=>date('Y-m-d H:i:s'),
                        'modified_by'=>logged_in_user_id()
                    );
                    $data                       =   $this->security->xss_clean($data);
                    $this->db->where('id',logged_in_user_id());
                    $update                     =   $this->db->update('users',$data);
                    if($update){
                        $arr                        =   array('status'=>'true','message'=>get_phrase('update_success'));
                        echo json_encode($arr);

                        create_log('Update Password');
                    }else{
                        $arr                        =   array('status'=>'false','message'=>get_phrase('something_went_wrong'));
                        echo json_encode($arr);
                    }
                }
            }
        }
    }

    function saveProfileInfo(){
        if($_POST){
            $this->form_validation->set_rules('name',get_phrase('name'),'trim|required');
            $this->form_validation->set_rules('phone',get_phrase('phone'),'trim|required');
            $this->form_validation->set_rules('email',get_phrase('email'),'trim|required');
            $this->form_validation->set_rules('gender',get_phrase('gender'),'trim|required');
            $this->form_validation->set_rules('dob',get_phrase('dob'),'trim|required');

            if($this->form_validation->run()==false){
                $this->layout->title(get_phrase('my_profile'));
                $this->layout->view('profile/employee');
            }else{
                $full_name                          =   explode(' ',$this->input->post('name'));
                $data['first_name']                 =   $full_name[0];
                $data['last_name']                  =   $full_name[1];
                $data['email']                      =   $this->input->post('email');
                
                if(!empty($_FILES['photo']['name'])){
                    $save['photo']                  =   $_FILES['photo']['name'];
                    move_uploaded_file($_FILES['photo']['tmp_name'],'uploads/employee-photo/'.$_FILES['photo']['name']);
                }
                $data                               =   $this->security->xss_clean($data);
                $this->db->where('id',logged_in_user_id());
                $update                             =   $this->db->update('users',$data);
                if($update){
                    $this->db->where('user_id',logged_in_user_id());
                    $emp['name']                        =   $this->input->post('name');
                    $emp['religion']                    =   $this->input->post('religion');
                    $emp['phone']                       =   $this->input->post('phone');
                    $emp['gender']                      =   $this->input->post('gender');
                    $emp['dob']                         =   date('Y-m-d',strtotime($this->input->post('dob')));
                    $emp['national_id']                 =   $this->input->post('national_id');
                    $emp['present_address']             =   $this->input->post('present_address');
                    $emp['permanent_address']           =   $this->input->post('permanent_address');
                    $emp['joining_date']                =   date('Y-m-d',strtotime($this->input->post('joining_date')));
                    $emp['is_view_on_web']              =   $this->input->post('is_view_on_web');
                    $emp['facebook_url']                =   $this->input->post('facebook_url');
                    $emp['linkedin_url']                =   $this->input->post('linkedin_url');
                    $emp['twitter_url']                 =   $this->input->post('twitter_url');
                    $emp['google_plus_url']             =   $this->input->post('google_plus_url');
                    $emp['instagram_url']               =   $this->input->post('instagram_url');
                    $emp['youtube_url']                 =   $this->input->post('youtube_url');
                    $emp['pinterest_url']               =   $this->input->post('pinterest_url');
                    $emp['other_info']                  =   $this->input->post('other_info');
                    $emp                            =   $this->security->xss_clean($emp);
                    $this->db->update('employees',$emp);
                    $this->session->set_flashdata('success',get_phrase('update_success'));
                    redirect(base_url().'profile/index');
                }
            }
        }
    }
}
