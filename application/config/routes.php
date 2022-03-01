<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] 				= 	'welcome';
$route['404_override'] 						= 	'';
$route['translate_uri_dashes'] 				= 	FALSE;

$route['admin/auth/v1']						=	'welcome';
$route['forgot'] 							= 	'auth/forgot';
$route['logout'] 							= 	'auth/logout';
$route['reset/(:any)'] 						= 	'auth/reset/$1';
$route['404_override'] 						= 	'';
$route['translate_uri_dashes'] 				= 	FALSE;