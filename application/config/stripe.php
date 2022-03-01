<?php 
$CI=& get_instance();
$CI->load->database();

$stripe_info                		= 	$CI->db->get_where('payment_settings',array('stripe_status'=>'1'))->row();

$config['stripe_api_key']         	= 	$stripe_info->stripe_api_key; 
$config['stripe_publishable_key'] 	= 	$stripe_info->stripe_publishable_key; 
$config['stripe_currency']        	= 	$stripe_info->stripe_currency;