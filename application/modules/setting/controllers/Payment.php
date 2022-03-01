<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Payment extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Setting_Model', 'setting', true);
        $this->data['setting'] = $this->setting->get_single('payment_settings', array('status' => 1));
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Payment Setting" user interface                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        $this->data['paypal'] = TRUE;
        $this->layout->title(get_phrase('payment') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

            
    /*****************Function paypal**********************************
    * @type            : Function
    * @function name   : paypal
    * @description     : Load "Paypal Setting Tab" user interface                 
    *                     and process to save paypal setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function paypal() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_paypal_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Paypal payment gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Paypal payment gateway setting');                        
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/payment/paypal');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['paypal'] = TRUE;
        $this->layout->title(get_phrase('payment') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

        
    /*****************Function _prepare_paypal_validation**********************************
    * @type            : Function
    * @function name   : _prepare_paypal_validation
    * @description     : Process "paypal" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_paypal_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        $this->form_validation->set_rules('paypal_email', get_phrase('paypal') . ' ' . get_phrase('email'), 'trim|required');
        $this->form_validation->set_rules('paypal_demo', get_phrase('is_demo'), 'trim|required');
        $this->form_validation->set_rules('paypal_status', get_phrase('is_active'), 'trim|required');
    }

                
    /*****************Function stripe**********************************
    * @type            : Function
    * @function name   : stripe
    * @description     : Load "Stripe Setting Tab" user interface                 
    *                     and process to save stripe setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function stripe() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_stripe_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Stripe payment gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Stripe payment gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/payment/stripe');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['stripe'] = TRUE;
        $this->layout->title(get_phrase('payment') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

            
    /*****************Function _prepare_stripe_validation**********************************
    * @type            : Function
    * @function name   : _prepare_stripe_validation
    * @description     : Process "stripe" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_stripe_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('stripe_api_key', get_phrase('stripe_api_key'), 'trim|required');
        $this->form_validation->set_rules('stripe_publishable_key',get_phrase('stripe_publishable_key'),'trim|required|xss_clean');
        $this->form_validation->set_rules('stripe_currency',get_phrase('stripe_currency'),'trim|required|xss_clean');
        $this->form_validation->set_rules('stripe_demo', get_phrase('is_demo'), 'trim|required');
        $this->form_validation->set_rules('stripe_status', get_phrase('is_active'), 'trim|required');
    }

                
    /*****************Function payumoney**********************************
    * @type            : Function
    * @function name   : payumoney
    * @description     : Load "Payumoney Setting Tab" user interface                 
    *                     and process to save payumoney setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function payumoney() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_payumoney_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated payUMoney payment gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added payUMoney payment gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/payment/payumoney');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['payumoney'] = TRUE;
        $this->layout->title(get_phrase('payment') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

                
    /*****************Function _prepare_payumoney_validation**********************************
    * @type            : Function
    * @function name   : _prepare_payumoney_validation
    * @description     : Process "payumoney" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_payumoney_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('payumoney_key', get_phrase('payumoney') . ' ' . get_phrase('key'), 'trim|required');
        $this->form_validation->set_rules('payumoney_salt', get_phrase('payumoney') . ' ' . get_phrase('key_salt'), 'trim|required');
        $this->form_validation->set_rules('payumoney_demo', get_phrase('is_demo'), 'trim|required');
        $this->form_validation->set_rules('payumoney_status', get_phrase('is_active'), 'trim|required');
    }

    
    
    
    
                
    /*****************Function paytm**********************************
    * @type            : Function
    * @function name   : paytm
    * @description     : Load "PayTM Setting Tab" user interface                 
    *                     and process to save paytm setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function paytm() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_paytm_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated PauTM payment gateway setting');
                        success(get_phrase('update_success'));
                    } else {
                        error(get_phrase('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added PayTM payment gateway setting');
                        success(get_phrase('insert_success'));
                    } else {
                        error(get_phrase('insert_failed'));
                    }
                }
                redirect('setting/payment/paytm');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['paytm'] = TRUE;
        $this->layout->title(get_phrase('payment') . ' ' . get_phrase('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

                
    /*****************Function _prepare_paytm_validation**********************************
    * @type            : Function
    * @function name   : _prepare_paytm_validation
    * @description     : Process "PayTM" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_paytm_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('paytm_merchant_key', get_phrase('paytm') . ' ' . get_phrase('merchant_key'), 'trim|required');
        $this->form_validation->set_rules('paytm_merchant_mid', get_phrase('paytm') . ' ' . get_phrase('merchant_mid'), 'trim|required');
        $this->form_validation->set_rules('paytm_merchant_website', get_phrase('paytm') . ' ' . get_phrase('website'), 'trim|required');
        $this->form_validation->set_rules('paytm_demo', get_phrase('is_demo'), 'trim|required');
        $this->form_validation->set_rules('paytm_industry_type', get_phrase('paytm') . ' ' . get_phrase('industry_type'), 'trim|required');
        $this->form_validation->set_rules('paytm_status', get_phrase('is_active'), 'trim|required');
    }

    
       
    /*****************Function _get_posted_payment_data**********************************
    * @type            : Function
    * @function name   : _get_posted_payment_data
    * @description     : Prepare "Payment Settings" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_payment_data() {

        $items = array();

        if ($this->input->post('paypal')) {
            $items[] = 'paypal_email';
            $items[] = 'paypal_demo';
            $items[] = 'paypal_status';
            $items[] = 'paypal_extra_charge';
        }

       
        if ($this->input->post('payumoney')) {
            $items[] = 'payumoney_key';
            $items[] = 'payumoney_salt';
            $items[] = 'payumoney_demo';
            $items[] = 'payumoney_status';
            $items[] = 'payu_extra_charge';
        }
        
                
        if ($this->input->post('paytm')) {
            $items[] = 'paytm_merchant_key';
            $items[] = 'paytm_merchant_mid';
            $items[] = 'paytm_merchant_website';
            $items[] = 'paytm_industry_type';
            $items[] = 'paytm_demo';
            $items[] = 'paytm_status';
            $items[] = 'paytm_extra_charge';
        }
        
        if ($this->input->post('stripe')) {
            
            $items[] = 'stripe_publishable_key';
            $items[] = 'stripe_api_key';
            $items[] = 'stripe_demo';
            $items[] = 'stripe_extra_charge';
            $items[] = 'stripe_status';
            $items[] = 'stripe_currency';       
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
