<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!function_exists('_d')) {

    function _d($data, $exit = TRUE) {
        print '<pre>';
        print_r($data);
        print '</pre>';
        if ($exit)
            exit;
    }

}

if (!function_exists('get_settings')) {
    function get_settings($key = '')
    {
        $CI    = &get_instance();
        $CI->db->where('key', $key);
        $result = $CI->db->get('global_settings')->row('value');
        return $result;
    }
}

if (!function_exists('ellipsis')) {
    // Checks if a video is youtube, vimeo or any other
    function ellipsis($long_string, $max_character = 30)
    {
        $short_string = strlen($long_string) > $max_character ? mb_substr($long_string, 0, $max_character) . "..." : $long_string;
        return $short_string;
    }
}
if ( ! function_exists('active_link'))
{
    function active_link($controller)
    {
        $CI = &get_instance();
         
        $class = $CI->router->fetch_class();
 
        return ($class == $controller) ? 'active' : '';
    }
}
if (!function_exists('logged_in_user_id')) {

    function logged_in_user_id() {
        $logged_in_id = 0;
        $CI = & get_instance();
        if ($CI->session->userdata('id') && $CI->session->userdata('role_id')):
            $logged_in_id = $CI->session->userdata('id');
        endif;
        return $logged_in_id;
    }

}

if (!function_exists('logged_in_role_id')) {

    function logged_in_role_id() {
        $logged_in_role_id = 0;
        $CI = & get_instance();
        if ($CI->session->userdata('role_id')):
            $logged_in_role_id = $CI->session->userdata('role_id');
        endif;
        return $logged_in_role_id;
    }

}
function create_unique_slug($string,$table,$field='slug',$key=NULL,$value=NULL)
{
    $t =& get_instance();
    $slug = url_title($string);
    $slug = strtolower($slug);
    $i = 0;
    $params = array ();
    $params[$field] = $slug;
 
    if($key)$params["$key !="] = $value; 
 
    while ($t->db->where($params)->get($table)->num_rows())
    {   
        if (!preg_match ('/-{1}[0-9]+$/', $slug ))
            $slug .= '-' . ++$i;
        else
            $slug = preg_replace ('/[0-9]+$/', ++$i, $slug );
         
        $params [$field] = $slug;
    }   
    return $slug;   
}
function encrypt_url($string) {
    $output = false;
    /*
     * read security.ini file & get encryption_key | iv | encryption_mechanism value for generating encryption code
    */
    $security = parse_ini_file('security.ini');
    $secret_key = $security['encryption_key'];
    $secret_iv = $security['iv'];
    $encrypt_method = $security['encryption_mechanism'];
    // hash
    $key = hash('sha256', $secret_key);
    // iv – encrypt method AES-256-CBC expects 16 bytes – else you will get a warning
    $iv = substr(hash('sha256', $secret_iv), 0, 16);
    //do the encryption given text/string/number
    $result = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
    $output = base64_encode($result);
    return $output;
}
function decrypt_url($string) {
    $output = false;
    /*
     * read security.ini file & get encryption_key | iv | encryption_mechanism value for generating encryption code
     */
    $security = parse_ini_file('security.ini');
    $secret_key = $security['encryption_key'];
    $secret_iv = $security['iv'];
    $encrypt_method = $security['encryption_mechanism'];
    // hash
    $key = hash('sha256', $secret_key);
    // iv – encrypt method AES-256-CBC expects 16 bytes – else you will get a warning
    $iv = substr(hash('sha256', $secret_iv), 0, 16);
    //do the decryption given text/string/number
    $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
    return $output;
}
if (!function_exists('slugify')) {
    function slugify($text)
    {
        $text = preg_replace('~[^\\pL\d]+~u', '-', $text);
        $text = trim($text, '-');
        $text = strtolower($text);
        //$text = preg_replace('~[^-\w]+~', '', $text);
        if (empty($text))
            return 'n-a';
        return $text;
    }
}
if (!function_exists('logged_in_user_type')) {

    function logged_in_user_type() {
        $logged_in_type = 0;
        $CI = & get_instance();
        if ($CI->session->userdata('user_type')):
            $logged_in_id = $CI->session->userdata('user_type');
        endif;
        return $logged_in_type;
    }

}

if (!function_exists('success')) {

    function success($message) {
        $CI = & get_instance();
        $CI->session->set_userdata('success', $message);
        return true;
    }

}
function check_password($entered_password,$db_password){
    if(password_verify($entered_password, $db_password)){
        return true;
    }else{
        return false;
    }
}
function validate_email($email){
    $pattern = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/i";
    if(preg_match($pattern, $email)){
        return true;
    }else{
        return false;
    }
}
function rand_string( $length ) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return substr(str_shuffle($chars),0,$length);
}
function rand_otp_string( $length ) {
    $chars = "0123456789";
    return substr(str_shuffle($chars),0,$length);
}
if (!function_exists('error')) {

    function error($message) {
        $CI = & get_instance();
        $CI->session->set_userdata('error', $message);
        return true;
    }

}
function censor_word($string,$len,$replace){
    return str_pad(substr($string, -$len), strlen($string), $replace, STR_PAD_LEFT);
}
if (!function_exists('warning')) {

    function warning($message) {
        $CI = & get_instance();
        $CI->session->set_userdata('warning', $message);
        return true;
    }

}

if (!function_exists('info')) {

    function info($message) {
        $CI = & get_instance();
        $CI->session->set_userdata('info', $message);
        return true;
    }

}

if (!function_exists('get_slug')) {

    function get_slug($slug) {
        if (!$slug) {
            return;
        }

        $char = array("!", "’", "'", ":", ",", "_", "`", "~", "@", "#", "$", "%", "^", "&", "*", "(", ")", "+", "=", "{", "}", "[", "]", "/", ";", '"', '<', '>', '?', "'\'",);
        $slug = str_replace($char, "", $slug);
        return $str = strtolower(str_replace(' ', "-", $slug));
    }

}
if(!function_exists('get_course_status')){
    function get_course_status(){
        $data = array();
        $data['active'] = get_phrase('active');
        $data['pending'] = get_phrase('pending');
        $data['save_to_draft'] = get_phrase('save_to_draft');
        return $data;
    }
}
if(!function_exists('mediaType')){
    function mediaType(){
        $media_type                             = array();
        $media_type['image/jpeg']               = "Image";
        $media_type['video']                    = "Video";
        $media_type['text/plain']               = "Text";
        $media_type['application/zip']          = "Zip";
        $media_type['application/x-rar']        = "Rar";
        $media_type['application/pdf']          = "Pdf";
        $media_type['application/msword']       = "Word";
        $media_type['application/vnd.ms-excel'] = "Excel";
        $media_type['other']                    = "Other";
        return $media_type;
    }
}
if(!function_exists('userReportType')){
    function userReportType(){
        $report_type                            =   array();
        $report_type['progress']                =   "Progress";
        $report_type['scores']                  =   "Scores";
        /*$report_type['score_summary']           =   "Score Summary";*/
        //$report_type['skills']                  =   "Skills";
        /*$report_type['rewards']                 =   "Rewards";
        $report_type['competency']              =   "Competency";*/
        return $report_type;
    }
}
if(!function_exists('courseReportType')){
    function courseReportType(){
        $report_type                            =   array();
        $report_type['progress']                =   "Progress";
        return $report_type;
    }
}
if (!function_exists('get_status')) {
    function get_status($status) {
        $ci = & get_instance();
        if ($status == 1) {
            return get_phrase('active');
        } elseif ($status == 2) {
            return get_phrase('in_active');
        } elseif ($status == 3) {
            return get_phrase('trash');
        }
    }
}
if (!function_exists('template_types')) {
    function template_types() {
        $ci = & get_instance();
        return array(
            'register' => 'register',
        );
    }
}

if (!function_exists('verify_email_format')) {

    function verify_email_format($email) {
        $email = trim($email);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return '';
        } else {
            return $email;
        }
    }

}
if (!function_exists('get_user_by_role')) {

    function get_user_by_role($role_id, $user_id) {

        $ci = & get_instance();

        if ($role_id == STUDENT) {
            
        } elseif ($role_id == TEACHER) {
            $ci->db->select('T.*, U.email, U.role_id, R.name AS role');
            $ci->db->from('teachers AS T');
            $ci->db->join('users AS U', 'U.id = T.user_id', 'left');
            $ci->db->join('roles AS R', 'R.id = U.role_id', 'left');
            $ci->db->where('T.user_id', $user_id);
            return $ci->db->get()->row();
        } else {
            $ci->db->select('E.*, U.email, U.role_id, R.name AS role, D.name AS designation, SG.grade_name');
            $ci->db->from('employees AS E');
            $ci->db->join('users AS U', 'U.id = E.user_id', 'left');
            $ci->db->join('roles AS R', 'R.id = U.role_id', 'left');
            $ci->db->join('designations AS D', 'D.id = E.designation_id', 'left');
            $ci->db->join('salary_grades AS SG', 'SG.id = E.salary_grade_id', 'left');
            $ci->db->where('E.user_id', $user_id);
            return $ci->db->get()->row();
        }

        $ci->db->last_query();
    }

}


if (!function_exists('get_user_by_id')) {

    function get_user_by_id($user_id) {

        $ci = & get_instance();

        $ci->db->select('U.id, U.role_id');
        $ci->db->from('users AS U');
        $ci->db->where('U.id', $user_id);
        $user = $ci->db->get()->row();

        if ($user->role_id == STUDENT) {

            $ci->db->select('S.*, E.roll_no, U.email, U.role_id,  C.name AS class_name, SE.name AS section');
            $ci->db->from('enrollments AS E');
            $ci->db->join('students AS S', 'S.id = E.student_id', 'left');
            $ci->db->join('users AS U', 'U.id = S.user_id', 'left');
            $ci->db->join('classes AS C', 'C.id = E.class_id', 'left');
            $ci->db->join('sections AS SE', 'SE.id = E.section_id', 'left');
            $ci->db->where('S.user_id', $user_id);            
            return $ci->db->get()->row();
            
        } elseif ($user->role_id == INSTRUCTOR) {
            
            $ci->db->select('T.*, U.email, U.role_id');
            $ci->db->from('teachers AS T');
            $ci->db->join('users AS U', 'U.id = T.user_id', 'left');
            $ci->db->where('T.user_id', $user_id);
            return $ci->db->get()->row();
            
        } else {
            
            $ci->db->select('E.*, U.email, U.role_id');
            $ci->db->from('employees AS E');
            $ci->db->join('users AS U', 'U.id = E.user_id', 'left');
            $ci->db->where('E.user_id', $user_id);
            return $ci->db->get()->row();
        }

       // $ci->db->last_query();
    }

}

if( !function_exists('convertNumberToWord') ){
        function convertNumberToWord($num = false) {
            $num = str_replace(array(',', ' '), '' , trim($num));
            if(! $num) {
                return false;
            }
            $num = (int) $num;
            $words = array();
            $list1 = array('', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
                'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
            );
            $list2 = array('', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety', 'hundred');
            $list3 = array('', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion', 'septillion',
                'octillion', 'nonillion', 'decillion', 'undecillion', 'duodecillion', 'tredecillion', 'quattuordecillion',
                'quindecillion', 'sexdecillion', 'septendecillion', 'octodecillion', 'novemdecillion', 'vigintillion'
            );
            $num_length = strlen($num);
            $levels = (int) (($num_length + 2) / 3);
            $max_length = $levels * 3;
            $num = substr('00' . $num, -$max_length);
            $num_levels = str_split($num, 3);
            for ($i = 0; $i < count($num_levels); $i++) {
                $levels--;
                $hundreds = (int) ($num_levels[$i] / 100);
                $hundreds = ($hundreds ? ' ' . $list1[$hundreds] . ' hundred' . ' ' : '');
                $tens = (int) ($num_levels[$i] % 100);
                $singles = '';
                if ( $tens < 20 ) {
                    $tens = ($tens ? ' ' . $list1[$tens] . ' ' : '' );
                } else {
                    $tens = (int)($tens / 10);
                    $tens = ' ' . $list2[$tens] . ' ';
                    $singles = (int) ($num_levels[$i] % 10);
                    $singles = ' ' . $list1[$singles] . ' ';
                }
                $words[] = $hundreds . $tens . $singles . ( ( $levels && ( int ) ( $num_levels[$i] ) ) ? ' ' . $list3[$levels] . ' ' : '' );
            } //end for loop
            $commas = count($words);
            if ($commas > 1) {
                $commas = $commas - 1;
            }
            return implode(' ', $words);
        }
    }
if (!function_exists('get_week_days')) {

    function get_week_days() {
        $ci = & get_instance();
        return array(
            'saturday' => get_phrase('saturday'),
            'sunday' => get_phrase('sunday'),
            'monday' => get_phrase('monday'),
            'tuesday' => get_phrase('tuesday'),
            'wednesday' => get_phrase('wednesday'),
            'thursday' => get_phrase('thursday'),
            'friday' => get_phrase('friday')
        );
    }

}

if (!function_exists('get_months')) {

    function get_months() {
        $ci = & get_instance();
        return array(
            'january' => get_phrase('january'),
            'february' => get_phrase('february'),
            'march' => get_phrase('march'),
            'april' => get_phrase('april'),
            'may' => get_phrase('may'),
            'june' => get_phrase('june'),
            'july' => get_phrase('july'),
            'august' => get_phrase('august'),
            'september' => get_phrase('september'),
            'october' => get_phrase('october'),
            'november' => get_phrase('november'),
            'december' => get_phrase('december')
        );
    }

}
if (!function_exists('level_info')) {
    function level_info() {
        
        $data = array();
        $data['beginner'] = get_phrase('beginner');
        $data['intermediate'] = get_phrase('intermediate');
        $data['advanced'] = get_phrase('advanced');
        return $data;
    }
}

if (!function_exists('getModuleReportType')) {
    function getModuleReportType() {
        
        $data = array();
        //$date['basic_report'] = get_phrase('basic_report');
        $data['score_summary'] = get_phrase('score_summary');
        //$date['deep_dive'] = get_phrase('deep_dive');
        //$data['skill']      =   get_phrase('skill');
        //$data['course']         =   get_phrase('course');
        //$data['module_reward_point']    =   get_phrase('module_reward_point');
        return $data;
    }
}
function get_table_fields(){
    $ci = & get_instance();
    return $ci->db->list_fields('languages');
}
if (!function_exists('get_genders')) {

    function get_genders() {
        $ci = & get_instance();
        return array(
            'male' => get_phrase('male'),
            'female' => get_phrase('female')
        );
    }

}

if (!function_exists('get_paid_types')) {

    function get_paid_status($status) {
        $ci = & get_instance();
        $data = array(
            'paid' => get_phrase('paid'),
            'unpaid' => get_phrase('unpaid'),
            'partial' => get_phrase('partial')
        );
        return $data[$status];
    }

}

if (!function_exists('get_payment_methods')) {

    function get_payment_methods() {
        $ci = & get_instance();

        $methods = array('cash' => get_phrase('cash'), 'cheque' => get_phrase('cheque'));
     
        $ci = & get_instance();
        $ci->db->select('PS.*');
        $ci->db->from('payment_settings AS PS');
        $data = $ci->db->get()->row();
        
        if ($data->paypal_status) {
            $methods['paypal'] = get_phrase('paypal');
        }
        /*
        if ($data->stripe_status) {
            $methods['stripe'] = get_phrase('stripe');
        }
        if ($data->ccavenue_status) {
            $methods['ccavenue'] = get_phrase('ccavenue');
        }*/
        if ($data->payumoney_status) {
            $methods['payumoney'] = get_phrase('payumoney');
        }
        if ($data->paytm_status) {
            $methods['paytm'] = get_phrase('paytm');
        }
        if ($data->stack_status) {
            $methods['paystack'] = get_phrase('pay_stack');
        }

        return $methods;
    }

}

if (!function_exists('get_sms_gateways')) {

    function get_sms_gateways() {
        $ci = & get_instance();
        $gateways = array();
        $ci = & get_instance();
        $ci->db->select('SS.*');
        $ci->db->from('sms_settings AS SS');
        $data = $ci->db->get()->row();

        if ($data->clickatell_status) {
            $gateways['clicktell'] = get_phrase('clicktell');
        }
        if ($data->twilio_status) {
            $gateways['twilio'] = get_phrase('twilio');
        }
        if ($data->bulk_status) {
            $gateways['bulk'] = get_phrase('bulk');
        }
        if ($data->msg91_status) {
            $gateways['msg91'] = get_phrase('msg91');
        }
        if ($data->plivo_status) {
            $gateways['plivo'] = get_phrase('plivo');
        }
        if ($data->textlocal_status) {
            $gateways['text_local'] = get_phrase('text_local');
        }
        if ($data->smscountry_status) {
            $gateways['sms_country'] = get_phrase('sms_country');
        }

        return $gateways;
    }

}


if (!function_exists('get_group_by_type')) {

    function get_group_by_type() {
        $ci = & get_instance();
        return array(
            'daily' => get_phrase('daily'),
            'monthly' => get_phrase('monthly'),
            'yearly' => get_phrase('yearly')
        );
    }

}


if (!function_exists('get_template_tags')) {

    function get_template_tags($role_id) {
        $tags = array();
        $tags[] = '[name]';
        $tags[] = '[email]';
        $tags[] = '[phone]';

        if ($role_id == STUDENT) {

            $tags[] = '[class_name]';
            $tags[] = '[section]';
            $tags[] = '[roll_no]';
            $tags[] = '[dob]';
            $tags[] = '[gender]';
            $tags[] = '[religion]';
            $tags[] = '[blood_group]';
            $tags[] = '[registration_no]';
            $tags[] = '[group]';
            $tags[] = '[created_at]';
            $tags[] = '[guardian]';
            
        }else if ($role_id == INSTRUCTOR) {
            $tags[] = '[responsibility]';
            $tags[] = '[gender]';
            $tags[] = '[blood_group]';
            $tags[] = '[religion]';
            $tags[] = '[dob]';
            $tags[] = '[joining_date]';
        } else {
            $tags[] = '[designation]';
            $tags[] = '[gender]';
            $tags[] = '[blood_group]';
            $tags[] = '[religion]';
            $tags[] = '[dob]';
            $tags[] = '[joining_date]';
        }

        $tags[] = '[present_address]';
        $tags[] = '[permanent_address]';

        return $tags;
    }

}

if (!function_exists('get_formatted_body')) {

    function get_formatted_body($body, $role_id, $user_id) {

        $tags = get_template_tags($role_id);
        $user = get_user_by_role($role_id, $user_id);
        $arr = array('[', ']');
        foreach ($tags as $tag) {
            $field = str_replace($arr, '', $tag);
            
            if($field == 'created_at'){                
                $body = str_replace($tag, date('M-d-Y', strtotime($user->created_at)), $body);                
            }else{
                $body = str_replace($tag, $user->{$field}, $body);
            }            
            
        }

        return $body;
    }
}

if (!function_exists('get_formatted_certificate_text')) {

    function get_formatted_certificate_text($body, $role_id, $user_id) {

        $tags = get_template_tags($role_id);
        $user = get_user_by_role($role_id, $user_id);
              
        $arr = array('[', ']');
        foreach ($tags as $tag) {
            $field = str_replace($arr, '', $tag);
            
            if($field == 'created_at'){                
                $body = str_replace($tag, '<span>'.date('M-d-Y', strtotime($user->created_at)).'</span>', $body);                
            }else{
                $body = str_replace($tag, '<span>'.$user->{$field}.'</span>', $body);
            }            
        }

        return $body;
    }
}



if (!function_exists('get_nice_time')) {

    function get_nice_time($date) {

        $ci = & get_instance();
        $setting        =   $ci->db->get('settings')->row();
        date_default_timezone_set($setting->default_time_zone);
        if (empty($date)) {
            return "2 months ago"; //"No date provided";
        }

        $periods = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
        $lengths = array("60", "60", "24", "7", "4.35", "12", "10");

        $now = time();
        $unix_date = strtotime($date);

        // check validity of date
        if (empty($unix_date)) {
            return "2 months ago"; // "Bad date";
        }

        // is it future date or past date
        if ($now > $unix_date) {
            $difference = $now - $unix_date;
            $tense = "ago";
        } else {
            $difference = $unix_date - $now;
            $tense = "from now";
        }

        for ($j = 0; $difference >= $lengths[$j] && $j < count($lengths) - 1; $j++) {
            $difference /= $lengths[$j];
        }

        $difference = round($difference);

        if ($difference != 1) {
            $periods[$j] .= "s";
        }
        return "$difference $periods[$j] {$tense}";
    }

}
if (!function_exists('get_nice_count')) {

    function get_nice_count($number) {

        $ci = & get_instance();
        $abbrevs = [12 => 'T', 9 => 'B', 6 => 'M', 3 => 'K', 0 => ''];
        foreach ($abbrevs as $exponent => $abbrev) {
            if (abs($number) >= pow(10, $exponent)) {
                $display = $number / pow(10, $exponent);
                $decimals = ($exponent >= 3 && round($display) < 100) ? 1 : 0;
                $number = number_format($display, $decimals).$abbrev;
                break;
            }
        }

        return $number;
    }

}
if (!function_exists('get_operation_by_module')) {

    function get_operation_by_module($module_id) {
        $ci = & get_instance();
        $ci->db->select('O.*');
        $ci->db->from('operations AS O');
        $ci->db->where('O.module_id', $module_id);
        return $ci->db->get()->result();
    }

}

if (!function_exists('get_permission_by_operation')) {

    function get_permission_by_operation($role_id, $operation_id) {
        $ci = & get_instance();
        $ci->db->select('P.*');
        $ci->db->from('privileges AS P');
        $ci->db->where('P.role_id', $role_id);
        $ci->db->where('P.operation_id', $operation_id);
        return $ci->db->get()->row();
    }

}

if (!function_exists('get_lang')) {

    function get_lang() {
        $ci = & get_instance();
        get_phrase('dashboard');
    }

}

if (!function_exists('get_default_lang_list')) {

    function get_default_lang_list($lang) {
        $lang_lists = array();
        $lang_lists['english'] = 'english';

        if (isset($lang_lists[$lang]) && !empty($lang_lists[$lang])) {
            return true;
        } else {
            return FALSE;
        }
    }

}


if (!function_exists('get_timezones')) {
    function get_timezones() {
        $timezones = array(           
            'Pacific/Midway' => "(GMT-11:00) Midway Island",
            'US/Samoa' => "(GMT-11:00) Samoa",
            'US/Hawaii' => "(GMT-10:00) Hawaii",
            'US/Alaska' => "(GMT-09:00) Alaska",
            'US/Pacific' => "(GMT-08:00) Pacific Time (US &amp; Canada)",
            'America/Tijuana' => "(GMT-08:00) Tijuana",
            'US/Arizona' => "(GMT-07:00) Arizona",
            'US/Mountain' => "(GMT-07:00) Mountain Time (US &amp; Canada)",
            'America/Chihuahua' => "(GMT-07:00) Chihuahua",
            'America/Mazatlan' => "(GMT-07:00) Mazatlan",
            'America/Mexico_City' => "(GMT-06:00) Mexico City",
            'America/Monterrey' => "(GMT-06:00) Monterrey",
            'Canada/Saskatchewan' => "(GMT-06:00) Saskatchewan",
            'US/Central' => "(GMT-06:00) Central Time (US &amp; Canada)",
            'US/Eastern' => "(GMT-05:00) Eastern Time (US &amp; Canada)",
            'US/East-Indiana' => "(GMT-05:00) Indiana (East)",
            'America/Bogota' => "(GMT-05:00) Bogota",
            'America/Lima' => "(GMT-05:00) Lima",
            'America/Caracas' => "(GMT-04:30) Caracas",
            'Canada/Atlantic' => "(GMT-04:00) Atlantic Time (Canada)",
            'America/La_Paz' => "(GMT-04:00) La Paz",
            'America/Santiago' => "(GMT-04:00) Santiago",
            'Canada/Newfoundland' => "(GMT-03:30) Newfoundland",
            'America/Buenos_Aires' => "(GMT-03:00) Buenos Aires",
            'Greenland' => "(GMT-03:00) Greenland",
            'Atlantic/Stanley' => "(GMT-02:00) Stanley",
            'Atlantic/Azores' => "(GMT-01:00) Azores",
            'Atlantic/Cape_Verde' => "(GMT-01:00) Cape Verde Is.",
            'Africa/Casablanca' => "(GMT) Casablanca",
            'Europe/Dublin' => "(GMT) Dublin",
            'Europe/Lisbon' => "(GMT) Lisbon",
            'Europe/London' => "(GMT) London",
            'Africa/Monrovia' => "(GMT) Monrovia",
            'Europe/Amsterdam' => "(GMT+01:00) Amsterdam",
            'Europe/Belgrade' => "(GMT+01:00) Belgrade",
            'Europe/Berlin' => "(GMT+01:00) Berlin",
            'Europe/Bratislava' => "(GMT+01:00) Bratislava",
            'Europe/Brussels' => "(GMT+01:00) Brussels",
            'Europe/Budapest' => "(GMT+01:00) Budapest",
            'Europe/Copenhagen' => "(GMT+01:00) Copenhagen",
            'Europe/Ljubljana' => "(GMT+01:00) Ljubljana",
            'Europe/Madrid' => "(GMT+01:00) Madrid",
            'Europe/Paris' => "(GMT+01:00) Paris",
            'Europe/Prague' => "(GMT+01:00) Prague",
            'Europe/Rome' => "(GMT+01:00) Rome",
            'Europe/Sarajevo' => "(GMT+01:00) Sarajevo",
            'Europe/Skopje' => "(GMT+01:00) Skopje",
            'Europe/Stockholm' => "(GMT+01:00) Stockholm",
            'Europe/Vienna' => "(GMT+01:00) Vienna",
            'Europe/Warsaw' => "(GMT+01:00) Warsaw",
            'Europe/Zagreb' => "(GMT+01:00) Zagreb",
            'Europe/Athens' => "(GMT+02:00) Athens",
            'Europe/Bucharest' => "(GMT+02:00) Bucharest",
            'Africa/Cairo' => "(GMT+02:00) Cairo",
            'Africa/Harare' => "(GMT+02:00) Harare",
            'Europe/Helsinki' => "(GMT+02:00) Helsinki",
            'Europe/Istanbul' => "(GMT+02:00) Istanbul",
            'Asia/Jerusalem' => "(GMT+02:00) Jerusalem",
            'Europe/Kiev' => "(GMT+02:00) Kyiv",
            'Europe/Minsk' => "(GMT+02:00) Minsk",
            'Europe/Riga' => "(GMT+02:00) Riga",
            'Europe/Sofia' => "(GMT+02:00) Sofia",
            'Europe/Tallinn' => "(GMT+02:00) Tallinn",
            'Europe/Vilnius' => "(GMT+02:00) Vilnius",
            'Asia/Baghdad' => "(GMT+03:00) Baghdad",
            'Asia/Kuwait' => "(GMT+03:00) Kuwait",
            'Africa/Nairobi' => "(GMT+03:00) Nairobi",
            'Asia/Riyadh' => "(GMT+03:00) Riyadh",
            'Asia/Tehran' => "(GMT+03:30) Tehran",
            'Europe/Moscow' => "(GMT+04:00) Moscow",
            'Asia/Baku' => "(GMT+04:00) Baku",
            'Europe/Volgograd' => "(GMT+04:00) Volgograd",
            'Asia/Muscat' => "(GMT+04:00) Muscat",
            'Asia/Tbilisi' => "(GMT+04:00) Tbilisi",
            'Asia/Yerevan' => "(GMT+04:00) Yerevan",
            'Asia/Kabul' => "(GMT+04:30) Kabul",
            'Asia/Karachi' => "(GMT+05:00) Karachi",
            'Asia/Tashkent' => "(GMT+05:00) Tashkent",
            'Asia/Kolkata' => "(GMT+05:30) Kolkata",
            'Asia/Kathmandu' => "(GMT+05:45) Kathmandu",
            'Asia/Yekaterinburg' => "(GMT+06:00) Ekaterinburg",
            'Asia/Almaty' => "(GMT+06:00) Almaty",
            'Asia/Dhaka' => "(GMT+06:00) Dhaka",
            'Asia/Novosibirsk' => "(GMT+07:00) Novosibirsk",
            'Asia/Bangkok' => "(GMT+07:00) Bangkok",
            'Asia/Jakarta' => "(GMT+07:00) Jakarta",
            'Asia/Krasnoyarsk' => "(GMT+08:00) Krasnoyarsk",
            'Asia/Chongqing' => "(GMT+08:00) Chongqing",
            'Asia/Hong_Kong' => "(GMT+08:00) Hong Kong",
            'Asia/Kuala_Lumpur' => "(GMT+08:00) Kuala Lumpur",
            'Australia/Perth' => "(GMT+08:00) Perth",
            'Asia/Singapore' => "(GMT+08:00) Singapore",
            'Asia/Taipei' => "(GMT+08:00) Taipei",
            'Asia/Ulaanbaatar' => "(GMT+08:00) Ulaan Bataar",
            'Asia/Urumqi' => "(GMT+08:00) Urumqi",
            'Asia/Irkutsk' => "(GMT+09:00) Irkutsk",
            'Asia/Seoul' => "(GMT+09:00) Seoul",
            'Asia/Tokyo' => "(GMT+09:00) Tokyo",
            'Australia/Adelaide' => "(GMT+09:30) Adelaide",
            'Australia/Darwin' => "(GMT+09:30) Darwin",
            'Asia/Yakutsk' => "(GMT+10:00) Yakutsk",
            'Australia/Brisbane' => "(GMT+10:00) Brisbane",
            'Australia/Canberra' => "(GMT+10:00) Canberra",
            'Pacific/Guam' => "(GMT+10:00) Guam",
            'Australia/Hobart' => "(GMT+10:00) Hobart",
            'Australia/Melbourne' => "(GMT+10:00) Melbourne",
            'Pacific/Port_Moresby' => "(GMT+10:00) Port Moresby",
            'Australia/Sydney' => "(GMT+10:00) Sydney",
            'Asia/Vladivostok' => "(GMT+11:00) Vladivostok",
            'Asia/Magadan' => "(GMT+12:00) Magadan",
            'Pacific/Auckland' => "(GMT+12:00) Auckland",
            'Pacific/Fiji' => "(GMT+12:00) Fiji",
        );

        return $timezones;
    }
}


if (!function_exists('get_date_format')) {
    function get_date_format() {
        
        $date = array();
        $date['Y-m-d'] = '2001-03-15';
        $date['d-m-Y'] = '15-03-2018';
        $date['d/m/Y'] = '15/03/2018';
        $date['m/d/Y'] = '03/15/2018';
        $date['m.d.Y'] = '03.10.2018';
        $date['j, n, Y'] = '14, 7, 2018';
        $date['F j, Y'] = 'July 15, 2018';
        $date['M j, Y'] = 'Jul 13, 2018';
        $date['j M, Y'] = '13 Jul, 2018';
        
        return $date;
    }
}



if (!function_exists('get_mail_protocol')) {
    function get_mail_protocol() {
        
        $protocol = array();
        $protocol['mail'] = 'mail';
        $protocol['sendmail'] = 'sendmail';
        $protocol['smtp'] = 'smtp';        
        
        return $protocol;
    }
}

if (!function_exists('get_smtp_crypto')) {
    function get_smtp_crypto() {
        
        $smtp_crypto = array();
        $smtp_crypto['tls'] = 'tls';
        $smtp_crypto['ssl'] = 'ssl';
        
        return $smtp_crypto;
    }
}


if (!function_exists('get_char_set')) {
    function get_char_set() {
        
        $char_set = array();
        $char_set['utf-8'] = 'utf-8';
        $char_set['iso-8859-1'] = 'iso-8859-1';
        
        return $char_set;
    }
}

if (!function_exists('get_email_priority')) {
    function get_email_priority() {
        
        $priority = array();
        $priority['1'] = 'highest';
        $priority['3'] = 'normal';
        $priority['5'] = 'lowest';       
        
        return $priority;
    }
}

if (!function_exists('get_card_bottom_text_align')) {
    function get_card_bottom_text_align() {
        
        $text_align = array();
        $text_align['center'] = 'center';
        $text_align['left'] = 'left';
        $text_align['right'] = 'right';       
        
        return $text_align;
    }
}



if (!function_exists('check_permission')) {

    function check_permission($action) {

        $ci = & get_instance();
        $role_id = $ci->session->userdata('role_id');
        $operation_slug = $ci->router->fetch_class();
        $module_slug = $ci->router->fetch_module();

        if ($module_slug == '') {
            $module_slug = $operation_slug;
        }

        $module_slug = 'my_' . $module_slug;

        $data = $ci->config->item($operation_slug, $module_slug);

        $result = $data[$role_id];
        if (!empty($result)) {
            $array = explode('|', $result);
            if (!$array[$action]) {
                error(get_phrase('permission_denied'));
                redirect('dashboard');
            }
        } else {
            error(get_phrase('permission_denied'));
            redirect('dashboard');
        }

        return TRUE;
    }

}

if (!function_exists('has_permission')) {

    function has_permission($action, $module_slug = null, $operation_slug = null) {

        $ci = & get_instance();
        $role_id = $ci->session->userdata('role_id');

        if ($module_slug == '') {
            $module_slug = $operation_slug;
        }

        $module_slug = 'my_' . $module_slug;

        $data = $ci->config->item($operation_slug, $module_slug);

        $result = @$data[$role_id];

        if (!empty($result)) {
            $array = explode('|', $result);
            return $array[$action];
        } else {
            return FALSE;
        }
    }

}

if (!function_exists('create_log')) {

    function create_log($activity = null) {

        $ci = & get_instance();
        $data = array();
        $data['user_id'] = logged_in_user_id();
        $data['role_id'] = logged_in_role_id();
        
        if(!$data['user_id']){return;}
        
        $user = get_user_by_id($data['user_id']);
        $data['name'] =  $user->name ? $user->name : '';
        $data['phone'] = $user->phone ? $user->phone : '';
        $data['ip_address'] = $_SERVER['REMOTE_ADDR'];
        $data['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
        $data['activity'] = $activity;
        $data['status'] = 1;
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['created_by'] = logged_in_user_id();
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();
        $ci->db->insert('activity_logs', $data);
    }
}

// RANDOM NUMBER GENERATOR FOR ELSEWHERE
if (!function_exists('phpFileUploadErrors')) {
    function phpFileUploadErrors($error_code)
    {
        $phpFileUploadErrorsArray = array(
            0 => 'There is no error, the file uploaded with success',
            1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
            2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
            3 => 'The uploaded file was only partially uploaded',
            4 => 'No file was uploaded',
            6 => 'Missing a temporary folder',
            7 => 'Failed to write file to disk.',
            8 => 'A PHP extension stopped the file upload.',
        );
        return $phpFileUploadErrorsArray[$error_code];
    }
}

