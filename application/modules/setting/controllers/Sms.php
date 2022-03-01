<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sms extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Setting_Model', 'setting', true);
        $this->data['setting'] = $this->setting->get_single('sms_settings', array('status' => 1));
    }

            
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "SMS Setting" user interface                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        $this->data['clickatell'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

                
    /*****************Function clickatell**********************************
    * @type            : Function
    * @function name   : clickatell
    * @description     : Load "Clickatell Setting Tab" user interface                 
    *                     and process to save Clickatell setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function clickatell() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_clickatell_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Clicktell SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Clicktell SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/clickatell');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['clickatell'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

        
    /*****************Function _prepare_clickatell_validation**********************************
    * @type            : Function
    * @function name   : _prepare_clickatell_validation
    * @description     : Process "Clickatell Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_clickatell_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');

        $this->form_validation->set_rules('clickatell_username', get_phrase('username'), 'trim|required');
        $this->form_validation->set_rules('clickatell_password', get_phrase('password'), 'trim|required');
        $this->form_validation->set_rules('clickatell_api_key', get_phrase('api_key'), 'trim|required');
        $this->form_validation->set_rules('clickatell_from_number', get_phrase('from_number'), 'trim|required');
        $this->form_validation->set_rules('clickatell_mo_no', get_phrase('mo_no'), 'trim|required');
        $this->form_validation->set_rules('clickatell_status', get_phrase('is_active'), 'trim|required');
    }

                    
    /*****************Function twilio**********************************
    * @type            : Function
    * @function name   : twilio
    * @description     : Load "Twilio Setting Tab" user interface                 
    *                     and process to save Twilio setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function twilio() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_twilio_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Twilio SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Twilio SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/twilio');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['twilio'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

            
    /*****************Function _prepare_twilio_validation**********************************
    * @type            : Function
    * @function name   : _prepare_twilio_validation
    * @description     : Process "Twilio Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_twilio_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('twilio_account_sid', get_phrase('account_sid'), 'trim|required');
        $this->form_validation->set_rules('twilio_auth_token', get_phrase('auth_token'), 'trim|required');
        $this->form_validation->set_rules('twilio_from_number', get_phrase('from_number'), 'trim|required');
        $this->form_validation->set_rules('twilio_status', get_phrase('is_active'), 'trim|required');
    }

                        
    /*****************Function bulk**********************************
    * @type            : Function
    * @function name   : bulk
    * @description     : Load "Bulk Setting Tab" user interface                 
    *                     and process to save Bulk setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function bulk() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_bulk_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated BULK SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added BULK SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/bulk');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['bulk'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

            
    /*****************Function _prepare_bulk_validation**********************************
    * @type            : Function
    * @function name   : _prepare_bulk_validation
    * @description     : Process "Bulk Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_bulk_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('bulk_username', get_phrase('username'), 'trim|required');
        $this->form_validation->set_rules('bulk_password', get_phrase('password'), 'trim|required');
        $this->form_validation->set_rules('bulk_status', get_phrase('is_active'), 'trim|required');
    }

                           
    /*****************Function msg91**********************************
    * @type            : Function
    * @function name   : msg91
    * @description     : Load "Msg91 Setting Tab" user interface                 
    *                     and process to save Msg91 setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function msg91() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_msg91_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated msg99 SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added msg99 SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/msg91');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['msg91'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

                
    /*****************Function _prepare_msg91_validation**********************************
    * @type            : Function
    * @function name   : _prepare_msg91_validation
    * @description     : Process "Msg91 Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_msg91_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('msg91_auth_key', get_phrase('auth_key'), 'trim|required');
        $this->form_validation->set_rules('msg91_sender_id', get_phrase('sender_id'), 'trim|required');
        $this->form_validation->set_rules('msg91_status', get_phrase('is_active'), 'trim|required');
    }

                               
    /*****************Function plivo**********************************
    * @type            : Function
    * @function name   : plivo
    * @description     : Load "Plivo Setting Tab" user interface                 
    *                     and process to save Plivo setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function plivo() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_plivo_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Plivo SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Plivo SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/plivo');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['plivo'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

    
                
    /*****************Function _prepare_plivo_validation**********************************
    * @type            : Function
    * @function name   : _prepare_plivo_validation
    * @description     : Process "Plivo Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_plivo_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('plivo_auth_id', get_phrase('auth_id'), 'trim|required');
        $this->form_validation->set_rules('plivo_auth_token', get_phrase('auth_token'), 'trim|required');
        $this->form_validation->set_rules('plivo_from_number', get_phrase('from_number'), 'trim|required');
        $this->form_validation->set_rules('plivo_status', get_phrase('is_active'), 'trim|required');
    }
                
    
    
                                   
    /*****************Function textlocal**********************************
    * @type            : Function
    * @function name   : textlocal
    * @description     : Load "Textlocal Setting Tab" user interface                 
    *                     and process to save Textlocal setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function textlocal() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_textlocal_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated TextLocal SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added TextLocal SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/textlocal');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['textlocal'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

    
    /*****************Function _prepare_textlocal_validation**********************************
    * @type            : Function
    * @function name   : _prepare_textlocal_validation
    * @description     : Process "Textlocal Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_textlocal_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('textlocal_username', get_phrase('text_local').' '.get_phrase('username'), 'trim|required');
        $this->form_validation->set_rules('textlocal_hash_key', get_phrase('text_local').' '.get_phrase('hash_key'), 'trim|required');
        $this->form_validation->set_rules('textlocal_sender_id', get_phrase('text_local').' '.get_phrase('sender_id'), 'trim|required');
        $this->form_validation->set_rules('textlocal_status', get_phrase('text_local').' '.get_phrase('is_active'), 'trim|required');
    }

       
    
                                   
    /*****************Function smscountry**********************************
    * @type            : Function
    * @function name   : smscountry
    * @description     : Load "SMS Country Setting Tab" user interface                 
    *                     and process to save SMS Country setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function smscountry() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_smscountry_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated SMScountry SMS gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added SMScountry SMS gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/smscountry');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['smscountry'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

    
    /*****************Function _prepare_smscountry_validation**********************************
    * @type            : Function
    * @function name   : _prepare_smscountry_validation
    * @description     : Process "SMS Country Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_smscountry_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('smscountry_username', get_phrase('sms_country').' '.get_phrase('username'), 'trim|required');
        $this->form_validation->set_rules('smscountry_password', get_phrase('sms_country').' '.get_phrase('password'), 'trim|required');
        $this->form_validation->set_rules('smscountry_sender_id', get_phrase('sms_country').' '.get_phrase('sender_id'), 'trim|required');
        $this->form_validation->set_rules('smscountry_status', get_phrase('sms_country').' '.get_phrase('is_active'), 'trim|required');
    }

   
      
        
    /*****************Function betasms**********************************
    * @type            : Function
    * @function name   : betasms
    * @description     : Load "betasms Setting Tab" user interface                 
    *                     and process to save betasms setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function betasms() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_betasms_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_sms_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('sms_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('sms_settings', $data);
                    if ($insert_id) {
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/sms/betasms');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['betasms'] = TRUE;
        $this->layout->title(get_phrase('sms') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('sms/index', $this->data);
    }

    
                
    /*****************Function _prepare_betasms_validation**********************************
    * @type            : Function
    * @function name   : _prepare_betasms_validation
    * @description     : Process "betasms Gateway" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_betasms_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('betasms_username', get_phrase('beta_sms').' '.get_phrase('username'), 'trim');
        $this->form_validation->set_rules('betasms_password', get_phrase('beta_sms').' '.get_phrase('password'), 'trim');
        $this->form_validation->set_rules('betasms_sender_id', get_phrase('beta_sms').' '.get_phrase('sender_id'), 'trim');
        $this->form_validation->set_rules('betasms_status', get_phrase('beta_sms').' '.get_phrase('is_active'), 'trim');
        
    }

    
        
    
    /*****************Function _get_posted_sms_data**********************************
    * @type            : Function
    * @function name   : _get_posted_sms_data
    * @description     : Prepare "SMS Gateway Settings" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_sms_data() {

        $items = array();

        if ($this->input->post('clickatell')) {
            $items[] = 'clickatell_username';
            $items[] = 'clickatell_password';
            $items[] = 'clickatell_api_key';
            $items[] = 'clickatell_from_number';
            $items[] = 'clickatell_mo_no';
            $items[] = 'clickatell_status';
        }

        if ($this->input->post('twilio')) {
            $items[] = 'twilio_account_sid';
            $items[] = 'twilio_auth_token';
            $items[] = 'twilio_from_number';
            $items[] = 'twilio_status';
        }

        if ($this->input->post('bulk')) {
            $items[] = 'bulk_username';
            $items[] = 'bulk_password';
            $items[] = 'bulk_status';
        }

        if ($this->input->post('msg91')) {
            $items[] = 'msg91_auth_key';
            $items[] = 'msg91_sender_id';
            $items[] = 'msg91_status';
        }
        
        if ($this->input->post('plivo')) {
            $items[] = 'plivo_auth_id';
            $items[] = 'plivo_auth_token';
            $items[] = 'plivo_from_number';
            $items[] = 'plivo_status';
        }
        
        if ($this->input->post('textlocal')) {
            $items[] = 'textlocal_username';
            $items[] = 'textlocal_hash_key';
            $items[] = 'textlocal_sender_id';
            $items[] = 'textlocal_status';
        }
        
        if ($this->input->post('smscountry')) {
            $items[] = 'smscountry_username';
            $items[] = 'smscountry_password';
            $items[] = 'smscountry_sender_id';
            $items[] = 'smscountry_status';
        }
        
        if ($this->input->post('betasms')) {
            
            $items[] = 'betasms_username';
            $items[] = 'betasms_password';
            $items[] = 'betasms_sender_id';
            $items[] = 'betasms_status';
        }

        $data = elements($items, $_POST);

        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            $data['status'] = 1;
        }

        return $data;
    }

}
