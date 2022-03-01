<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('get_phrase'))
{
	function get_phrase($label = '') {
		$CI	=&	get_instance();
		$CI->load->database();
		$current_language	=	$CI->session->userdata('current_language');
		
		if ( $current_language	==	'') {
			$current_language	=	$CI->db->get('settings')->row()->language;
			$CI->session->set_userdata('current_language' , $current_language);
		}


		$query	=	$CI->db->get_where('languages' , array('label' => $label));
		$row   	=	$query->row();
		
		/*** insert blank phrases initially and populating the language db */
		$check_phrase	=	$CI->db->get_where('languages' , array('label' => $label))->row()->label;
		if ( $check_phrase	!=		$label)
			$CI->db->insert('languages' , array('label' => $label));
			
			
		//return $row->$current_language;
		if (isset($row->$current_language) && $row->$current_language !="")
			return $row->$current_language;
		else 
			return ucwords(str_replace('_',' ',$label));
	}
}

// ------------------------------------------------------------------------
/* End of file language_helper.php */
/* Location: ./system/helpers/language_helper.php */