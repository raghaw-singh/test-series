<?php  defined('BASEPATH') OR exit('No direct script access allowed'); 
 

$CI=& get_instance();
$CI->load->database();

$paypal_info                		= 	$CI->db->get_where('payment_settings',array('paypal_status'=>'1'))->row();

if($paypal_info->paypal_demo==1){
	$paypal_demo 			=	TRUE;
}else{
	$paypal_demo 			=	FALSE;
}

$config['sandbox'] = $paypal_demo; // FALSE for live environment 
$config['business'] = $paypal_info->paypal_email; 
$config['paypal_lib_currency_code'] = 'USD'; 
// Where is the button located at? (optional) 
$config['paypal_lib_button_path'] = 'uploads/logo/1.png'; 
// If (and where) to log ipn response in a file 
$config['paypal_lib_ipn_log'] = FALSE; 
$config['paypal_lib_ipn_log_file'] = BASEPATH . 'logs/paypal_ipn.log';