<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Setting extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Setting_Model', 'setting', true);        
        $this->data['fields'] = $this->setting->get_table_fields('languages');
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "General Setting" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);
        $this->data['setting'] = $this->setting->get_single('settings', array('status' => 1));

        $this->layout->title(get_phrase('general') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('index', $this->data);
    }

    function getSchsetting(){
        $data                   =   $this->setting->getSetting();
        echo json_encode($data);
    }


    function ajax_schedit(){
        if ($_POST) {
            $this->form_validation->set_rules('system_name', get_phrase('system_name'), 'trim|required');
            $this->form_validation->set_rules('address', get_phrase('address'), 'trim|required');
            $this->form_validation->set_rules('phone', get_phrase('phone'), 'trim|required');
            $this->form_validation->set_rules('email', get_phrase('email'), 'trim|required');
            $this->form_validation->set_rules('currency', get_phrase('currency'), 'trim|required');
            $this->form_validation->set_rules('currency_symbol', get_phrase('currency_symbol'), 'trim|required');
            $this->form_validation->set_rules('language', get_phrase('language'), 'trim|required');
            $this->form_validation->set_rules('footer', get_phrase('footer'), 'trim|required');
            $this->form_validation->set_rules('sms_date_format', get_phrase('date_format'), 'trim|required');
            $this->form_validation->set_rules('default_time_zone', get_phrase('default_time_zone'), 'trim|required');
            $this->form_validation->set_rules('invoice_id_prefix',get_phrase('invoice_prefix'),'trim|required|xss_clean');
            $this->form_validation->set_rules('invoice_id_start_from',get_phrase('invoice_start_from'),'trim|required|xss_clean');
            $this->form_validation->set_rules('gstin_no',get_phrase('gstin_no'),'trim|required|xss_clean');
            if($this->form_validation->run()==false){
                $msg                    =   array(
                    'system_name'=>form_error('system_name'),
                    'address'=>form_error('address'),
                    'phone'=>form_error('phone'),
                    'email'=>form_error('email'),
                    'currency'=>form_error('currency'),
                    'currency_symbol'=>form_error('currency_symbol'),
                    'language'=>form_error('language'),
                    'footer'=>form_error('footer'),
                    'sms_date_format'=>form_error('sms_date_format'),
                    'default_time_zone'=>form_error('default_time_zone'),
                    'gstin_no'=>form_error('gstin_no'),
                    'invoice_id_prefix'=>form_error('invoice_id_prefix'),
                    'invoice_id_start_from'=>form_error('invoice_id_start_from')
                );
                $array = array('status' => 'error', 'message' => $msg);
                echo json_encode($array);
            }else{
                if(!empty($this->input->post('sch_id'))){
                    $save['invoice_id_start_from']  =   $this->input->post('invoice_id_start_from');
                    $save['invoice_id_prefix']      =   $this->input->post('invoice_id_prefix');
                    $save['gstin_no']               =   $this->input->post('gstin_no');
                    $save['system_name']            =   $this->input->post('system_name');
                    $save['address']                =   $this->input->post('address');
                    $save['phone']                  =   $this->input->post('phone');
                    $save['email']                  =   $this->input->post('email');
                    $save['language']               =   $this->input->post('language');
                    $save['enable_rtl']             =   $this->input->post('enable_rtl');
                    $save['default_time_zone']      =   $this->input->post('default_time_zone');
                    $save['sms_date_format']        =   $this->input->post('sms_date_format');
                    $save['currency']               =   $this->input->post('currency');
                    $save['currency_symbol']        =   $this->input->post('currency_symbol');
                    $save['google_analytics']       =   $this->input->post('google_analytics');
                    $save['facebook_url']           =   $this->input->post('facebook_url');
                    $save['twitter_url']            =   $this->input->post('twitter_url');
                    $save['linkedin_url']           =   $this->input->post('linkedin_url');
                    $save['google_plus_url']        =   $this->input->post('google_plus_url');
                    $save['youtube_url']            =   $this->input->post('youtube_url');
                    $save['instagram_url']          =   $this->input->post('instagram_url');
                    $save['pinterest_url']          =   $this->input->post('pinterest_url');
                    $save['theme_name']             =   $this->input->post('theme_name');
                    $save['modified_at']            =   date('Y-m-d H:i:s');
                    $save['modified_by']            =   logged_in_user_id();
                    $save['footer']                 =   $this->input->post('footer');
                    $this->db->where('id',$this->input->post('sch_id'));
                    $update                         =   $this->db->update('settings',$save);
                    if($update){
                        //$this->update_lang();                        
                        $array = array('status' => 'true', 'message' => get_phrase('update_success'));
                        echo json_encode($array);    
                    }else{
                        $array = array('status' => 'false', 'message' => get_phrase('update_failed'));
                        echo json_encode($array);    
                    }
                    
                }else{
                    $array = array('status' => 'false', 'message' => get_phrase('update_failed'));
                    echo json_encode($array);
                }
            }
        } 
    }

    function ajax_editlogo() {
        $this->form_validation->set_rules('id', 'ID', 'trim|required');
        $this->form_validation->set_rules('file', 'Image', 'callback_handle_upload');
        if ($this->form_validation->run() == false) {
            $data = array(
                'file' => form_error('file')
            );
            $array = array('success' => 'error', 'message' => $data);
            echo json_encode($array);
        } else {
            $id = $this->input->post('id');

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/logo/" . $img_name);
            }
            $data_record = array('id' => $id, 'logo' => $img_name,'front_logo' => $img_name);
            $this->setting->add($data_record);
            $array = array('success' => 'true', 'message' => 'Record Updated Successfully');
            echo json_encode($array);
        }
    }
    function ajax_applogo(){
        $this->form_validation->set_rules('id', 'ID', 'trim|required');
        $this->form_validation->set_rules('file', 'Image', 'callback_handle_upload');
        if ($this->form_validation->run() == false) {
            $data = array(
                'file' => form_error('file')
            );
            $array = array('success' => 'error', 'message' => $data);
            echo json_encode($array);
        } else {
            $id = $this->input->post('id');

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $fileInfo = pathinfo($_FILES["file"]["name"]);
                $img_name = 'favicon_'.$id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/logo/" . $img_name);
            }
            $data_record = array('id' => $id, 'favicon_icon' => $img_name);
            $this->setting->add($data_record);
            $array = array('success' => 'true', 'message' => 'Record Updated Successfully');
            echo json_encode($array);
        }
    }   
    function handle_upload() {
        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
            $allowedExts = array('jpg', 'jpeg', 'png');
            $temp = explode(".", $_FILES["file"]["name"]);
            $extension = end($temp);
            if ($_FILES["file"]["error"] > 0) {
                $error .= "Error opening the file<br />";
            }
            if ($_FILES["file"]["type"] != 'image/gif' &&
                    $_FILES["file"]["type"] != 'image/jpeg' &&
                    $_FILES["file"]["type"] != 'image/png') {
                $this->form_validation->set_message('handle_upload', 'File type not allowed');
                return false;
            }
            if (!in_array(strtolower($extension), $allowedExts)) {
                $this->form_validation->set_message('handle_upload', 'Extension not allowed');
                return false;
            }
            if ($_FILES["file"]["size"] > 102400) {
                $this->form_validation->set_message('handle_upload', 'File size shoud be less than 100 kB');
                return false;
            }
            return true;
        } else {
            $this->form_validation->set_message('handle_upload', 'Logo file is required');
            return false;
        }
    }
}
