<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


if (!function_exists('logged_in_student_id')) {

    function logged_in_student_id() {
        $logged_in_student_id = 0;
        $CI = & get_instance();
        if ($CI->session->userdata('student_id') && $CI->session->userdata('s_role_id')):
            $logged_in_student_id = $CI->session->userdata('student_id');
        endif;
        return $logged_in_student_id;
    }

}
if (!function_exists('get_video_extension')) {
    // Checks if a video is youtube, vimeo or any other
    function get_video_extension($url)
    {
        if (strpos($url, '.mp4') > 0) {
            return 'mp4';
        } elseif (strpos($url, '.webm') > 0) {
            return 'webm';
        } else {
            return 'unknown';
        }
    }
}

if (!function_exists('logged_in_s_role_id')) {
    function logged_in_s_role_id() {
        $logged_in_s_role_id = 0;
        $CI = & get_instance();
        if ($CI->session->userdata('s_role_id')):
            $logged_in_s_role_id = $CI->session->userdata('s_role_id');
        endif;
        return $logged_in_s_role_id;
    }
}
if(!function_exists('checkRightAnswer')){
    function checkRightAnswer($id,$quiz_id,$correct_answers){
        $CI = & get_instance();
        $CI->db->select('Q.*');
        $CI->db->from('question as Q');
        $CI->db->where('Q.id',$id);
        $CI->db->where('Q.quiz_id',$quiz_id);
        $CI->db->where('Q.correct_answers',$correct_answers);
        return $CI->db->get()->row();
    }
}
if (!function_exists('student_info')) {
    function student_info() {
        $CI     =   & get_instance();
        $CI->db->select('U.id,U.role_id,U.first_name,U.last_name,U.phone,U.photo,U.phone_verify,U.email_verify');
        $CI->db->from('users as U');
        $CI->db->where('U.id',logged_in_student_id());
        return $CI->db->get()->row();
    }
}
if (!function_exists('user_info')) {
    function user_info() {
        $CI     =   & get_instance();
        $CI->db->select('U.id,U.role_id,U.first_name,U.last_name,U.phone,U.photo,U.phone_verify,U.email_verify');
        $CI->db->from('users as U');
        $CI->db->where('U.id',logged_in_user_id());
        return $CI->db->get()->row();
    }
}
if (!function_exists('get_id_by_slug')) {
    function get_id_by_slug($table_name,$slug = "")
    {
        $CI = & get_instance();
        if ($slug != "") {
            $CI->db->where('slug', $slug);
        }
        return $CI->db->get($table_name);
    }
}
if (!function_exists('featured_category_info')) {
    function featured_category_info() {
        $CI     = & get_instance();
        $CI->db->select('C.*');
        $CI->db->from('category as C');
        $CI->db->where('C.status',1);
        $CI->db->where('C.featured',1);
        return $CI->db->get()->result();
    }
}
if (!function_exists('category_count')) {
    function category_count($category_id='') {
        $CI = & get_instance();
        $CI->db->select('count(C.id) as total_count');
        $CI->db->from('course as C');
        $CI->db->where('C.category_id',$category_id);
        return $CI->db->get()->row()->total_count;
    }
}
if(!function_exists('get_meta_data')){
    function get_meta_data($table_name,$table_id){
        $CI = & get_instance();
        $CI->db->select('*');
        $CI->db->from($table_name);
        $CI->db->where('id',$table_id);
        return $CI->db->get()->row();
    }
}
if (!function_exists('courseCountByLevel')) {
    function courseCountByLevel($level='') {
        $CI = & get_instance();
        $CI->db->select('count(C.id) as total_count');
        $CI->db->from('course as C');
        if(!empty($level)){
            $CI->db->where('C.level',$level);    
        }
        return $CI->db->get()->row()->total_count;
    }
}
if (!function_exists('count_wishlist_by_logged_user')) {
    function count_wishlist_by_logged_user() {
        $CI = & get_instance();
        $CI->db->select('count(W.id) as total_count');
        $CI->db->from('wishlist as W');
        $CI->db->where('W.student_id',logged_in_student_id());    
        return $CI->db->get()->row()->total_count;
    }
}
if(!function_exists('countPaidCourse')){
    function countPaidCourse(){
        $CI = & get_instance();
        $CI->db->select('count(C.id) as total_count');
        $CI->db->from('course as C');
        $CI->db->where('C.is_free_course','1');    
        return $CI->db->get()->row()->total_count;
    }
}
if(!function_exists('countCourseByLanguage')){
    function countCourseByLanguage($lang){
        $CI = & get_instance();
        $CI->db->select('count(C.id) as total_count');
        $CI->db->from('course as C');
        $CI->db->where('C.language',$lang);    
        return $CI->db->get()->row()->total_count;
    }
}
if(!function_exists('countFreeCourse')){
    function countFreeCourse(){
        $CI = & get_instance();
        $CI->db->select('count(C.id) as total_count');
        $CI->db->from('course as C');
        $CI->db->where('C.is_free_course','0');    
        return $CI->db->get()->row()->total_count;
    }
}

if(!function_exists('getCourseLessons')){
    function getCourseLessons($course_id,$section_id){
        $CI = & get_instance();
        $CI->db->select('L.*');
        $CI->db->from('lesson as L');
        $CI->db->where('L.course_id',$course_id); 
        $CI->db->where('L.section_id',$section_id);   
        $CI->db->order_by('id','asc');
        return $CI->db->get()->result();
    }
}
if(!function_exists('getCourseSection')){
    function getCourseSection($course_id){
        $CI = & get_instance();
        $CI->db->select('S.*');
        $CI->db->from('section as S');
        $CI->db->where('S.course_id',$course_id);    
        $CI->db->order_by('S.id','asc');
        return $CI->db->get()->result();
    }
}
if(!function_exists('countLessonSectionBy')){
    function countLessonSectionBy($course_id,$section_id){
        $CI = & get_instance();
        $CI->db->select('count(L.id) as total_count');
        $CI->db->from('lesson as L');
        $CI->db->where('L.lesson_type!=','quiz');
        $CI->db->where('L.course_id',$course_id); 
        $CI->db->where('L.section_id',$section_id);      
        return $CI->db->get()->row()->total_count;
    }
}
if(!function_exists('countTotalLecturesByCourse')){
    function countTotalLecturesByCourse($course_id){
        $CI = & get_instance();
        $CI->db->select('count(L.id) as total_count');
        $CI->db->from('lesson as L');
        $CI->db->where('L.course_id',$course_id);     
        return $CI->db->get()->row()->total_count;
    }
}
if(!function_exists('sumOfAllLecturesByCouseSection')){
    function sumOfAllLecturesByCouseSection($course_id,$section_id){
        $CI = & get_instance();
        $CI->db->select('sum(L.duration) as total_duration');
        $CI->db->from('lesson as L');
        $CI->db->where('L.course_id',$course_id); 
        $CI->db->where('L.section_id',$section_id);      
        return $CI->db->get()->row()->total_duration;
    }
}
if(!function_exists('lessonDurtionBySection')){
    function lessonDurtionBySection($section_id){
        $CI = & get_instance();
        $CI->db->select('L.duration');
        $CI->db->from('lesson as L');
        $CI->db->where('L.section_id',$section_id);      
        return $CI->db->get()->result();
    }
}
if(!function_exists('lessonDurtionByCourse')){
    function lessonDurtionByCourse($course_id){
        $CI = & get_instance();
        $CI->db->select('L.duration');
        $CI->db->from('lesson as L');
        $CI->db->where('L.course_id',$course_id);      
        return $CI->db->get()->result();
    }
}
function AddPlayTime($times) {
    $minutes = 0; //declare minutes either it gives Notice: Undefined variable
    // loop throught all the times
    foreach ($times as $time) {
        list($hour, $minute) = explode(':', $time);
        $minutes += $hour * 60;
        $minutes += $minute;
    }

    $hours = floor($minutes / 60);
    $minutes -= $hours * 60;

    // returns the time already formatted
    return sprintf('%02d:%02d', $hours, $minutes);
}


if (!function_exists('course_progress')) {
    function course_progress($course_id = "",$return_type = "")
    {
        $CI    = &get_instance();
        $studentid = logged_in_student_id();
        $user_details = $CI->student_model->get_all_user($studentid)->row_array();

        $completed_lessons_ids = array();

        $completed_lessons_ids_for_single_course = array();

        $lesson_completed = 0;

        $watch_history_array = json_decode($user_details['watch_history'], true);

        $lessons_for_that_course = $CI->student_model->get_lessons('course', $course_id);

        $total_number_of_lessons = $lessons_for_that_course->num_rows();
        
        for ($i = 0; $i < count($watch_history_array); $i++) {
            $watch_history_for_each_lesson = $watch_history_array[$i];
            if ($watch_history_for_each_lesson['progress'] == 1) {
                array_push($completed_lessons_ids, $watch_history_for_each_lesson['lesson_id']);
            }
        }


        if ($return_type == "completed_lesson_ids") {
            foreach ($lessons_for_that_course->result_array() as $row) {
                if (in_array($row['id'], $completed_lessons_ids)) {
                    array_push($completed_lessons_ids_for_single_course, $row['id']);
                }
            }
            return $completed_lessons_ids_for_single_course;
        } else {
            foreach ($lessons_for_that_course->result_array() as $row) {
                if (in_array($row['id'], $completed_lessons_ids)) {
                    $lesson_completed++;
                }
            }

            if ($lesson_completed > 0 && $total_number_of_lessons > 0) {
                // calculate the percantage of progress
                $course_progress = ($lesson_completed / $total_number_of_lessons) * 100;
                return $course_progress;
            } else {
                return 0;
            }
        }
    }
}
if(!function_exists('check_course_existed')){
    function check_course_existed($course_id){
        $CI = & get_instance();
        $CI->db->select('E.*');
        $CI->db->from('enrol as E');
        $CI->db->where('E.course_id',$course_id);
        $CI->db->where('E.user_id',logged_in_student_id());
        return $CI->db->get()->row();
    }
}
if(!function_exists('get_enrolled_student_by_course')){
    function get_enrolled_student_by_course($course_id){
        $CI = & get_instance();
        $CI->db->select('count(E.id) as total_enrol');
        $CI->db->from('enrol as E');
        $CI->db->where('E.course_id',$course_id);
        return $CI->db->get()->row()->total_enrol;
    }
}

if(!function_exists('get_total_rating_of_course')){
    function get_total_rating_of_course($course_id){
        $CI = & get_instance();
        $CI->db->select('count(R.id) as total_rating');
        $CI->db->from('rating as R');
        $CI->db->where('R.ratable_id',$course_id);
        return $CI->db->get()->row()->total_rating;
    }
}

if(!function_exists('courseCountByAuthor')){
    function courseCountByAuthor($author_id){
        $CI = & get_instance();
        $CI->db->select('count(C.id) as total_count');
        $CI->db->from('course as C');
        $CI->db->where('C.user_id',$author_id);
        return $CI->db->get()->row()->total_count;
    }
}

if(!function_exists('get_course_by_id')){
    function get_course_by_id($course_id){
        $CI = & get_instance();
        $CI->db->select('C.*');
        $CI->db->from('course as C');
        $CI->db->where('C.id',$course_id);
        return $CI->db->get()->row();
    }
}

if(!function_exists('get_tax_info_by_id')){
    function get_tax_info_by_id($gst_id){
        $CI = & get_instance();
        $CI->db->select('TT.*');
        $CI->db->from('tax_type as TT');
        $CI->db->where('TT.id',$gst_id);
        return $CI->db->get()->row();
    }
}
if(!function_exists('get_settings_data')){
    function get_settings_data(){
        $CI = & get_instance();
        $CI->db->select('S.*');
        $CI->db->from('settings as S');
        //$CI->db->where('S.status',1);
        return $CI->db->get()->row();
    }
}
if(!function_exists('count_lesson_by_course_id')){
    function count_lesson_by_course_id($course_id){
        $CI = & get_instance();
        $CI->db->select('L.*');
        $CI->db->from('lesson as L');
        $CI->db->where('L.course_id',$course_id);
        return $CI->db->get()->row();
    }
}
if(!function_exists('count_teacher_subscribed_by_student')){
    function count_teacher_subscribed_by_student($teacher_id){
        $CI = & get_instance();
        $CI->db->select('count(S.id) as total_subscribe');
        $CI->db->from('subscribe as S');
        $CI->db->where('S.teacher_id',$teacher_id);
        return $CI->db->get()->row()->total_subscribe;
    }
}
if(!function_exists('get_rating_by_student')){
    function get_rating_by_student($course_id){
        $CI = & get_instance();
        $CI->db->select('R.*');
        $CI->db->from('rating as R');
        $CI->db->where('R.ratable_id',$course_id);
        $CI->db->where('R.user_id',logged_in_student_id());
        return $CI->db->get()->row();
    }
}
if(!function_exists('find_student_answered_given')){
    function find_student_answered_given($ques_id,$answer,$exam_id){
        $CI = & get_instance();
        $CI->db->select('EA.*');
        $CI->db->from('exam_answer as EA');
        $CI->db->where('EA.user_id',logged_in_student_id());
        $CI->db->where('EA.exam_id',$exam_id);
        $CI->db->where('EA.ques_id',$ques_id);
        $CI->db->where('EA.answer',$answer);
        return $CI->db->get()->row();
    }   
}
if(!function_exists('check_quiz_is_taken')){
    function check_quiz_is_taken($exam_id){
        $CI= & get_instance();
        $CI->db->select('ER.id');
        $CI->db->from('exam_result as ER');
        $CI->db->where('ER.exam_id',$exam_id);
        $CI->db->where('ER.user_id',logged_in_student_id());
        return $CI->db->get()->row();
    }   
}
if(!function_exists('check_course_is_purchased')){
    function check_course_is_purchased($course_id){
        $CI = & get_instance();
        $purchase_button    =   '';
        $cart_price         =   '';
        $currentDate        =   date('Y-m-d');
        $course_info        =   get_course_by_id($course_id);
        $checkCourse        =   check_course_existed($course_id);
        $gst_info           =   get_tax_info_by_id($course_info->gst_id);
        if($course_info->is_free_course==0){
            if($checkCourse){
                $purchase_button    =   '<button style="margin-right:10px;" class="btn btn-warning btn-xs">Already Enrolled</button><a href="'.base_url('lesson/'.$course_info->slug).'" target="_blank" class="btn btn-success btn-xs">Start Now</a>';  
            }else{
                $purchase_button    =   '<button class="btn btn-info btn-xs" onclick="get_enrolled_to_free_course('.$course_info->id.')">Enroll Now</button>';
            }
            
        }else{
            if($checkCourse){
                $purchase_button    =   '<button style="margin-right:10px;" class="btn btn-warning btn-xs">Already Purchased</button><a href="'.base_url('lesson/'.$course_info->slug).'" target="_blank" class="btn btn-success btn-xs">Start Now</a>';    
            }else{
                if($currentDate<=date('Y-m-d',strtotime($course_info->discount_date))){
                    if($course_info->tax_type=='included'){
                        $price          =   $course_info->price;
                        $discount_per   =   $course_info->discounted_price;
                        $new_price      =   ($price - ($price*$discount_per)/100);
                        $discount_amt   =   ($price*$discount_per)/100;
                        /************* calculate GST if gst is excluded on orignal amt**/
                        $gst_percentage         =   $gst_info->percentage;
                        $payable_gst_amt        =   ($new_price-$new_price * (100/(100+$gst_percentage))); 
                        /*********** GST Close*************/

                        $amount_without_gst     =   $new_price - $payable_gst_amt;
                        $check_cart         =   $CI->web_model->in_cart($course_info->id);
                        if($check_cart){
                            $purchase_button    =   '<button class="btn btn-info btn-xs" disabled>Already Added</button>';
                        }else{
                            $purchase_button    =   '<button id="btn_adcart_'.$course_info->id.'" class="btn-xs btn btn-info add_cart btn_adcart btn_adcart_'.$course_info->id.'" data-courseid="'.$course_info->id.'" data-coursename="'.$course_info->title.'" data-courseprice="'.number_format($new_price,2).'"  data-tax_id="'.$course_info->gst_id.'" data-discount_amt="'.number_format($discount_amt,2).'" data-gst_amt="'.number_format($payable_gst_amt,2).'" data-amount_without_gst="'.number_format($amount_without_gst,2).'">Add to Cart</button>';    
                        }
                    }else{
                        $price          =   $course_info->price;
                        /************* calculate GST if gst is excluded on orignal amt**/
                        $gst_percentage         =   $gst_info->percentage;
                        $discount_per           =   $course_info->discounted_price;
                        $payable_gst_amt        =   ($price * ($gst_percentage/100));
                        $price_to_be_charge     =   $price+$payable_gst_amt;

                        $amt_after_discount     =   $price_to_be_charge-($price_to_be_charge * ($gst_percentage/100));
                        
                        $amount_without_gst     =   $price;

                        $discount_amt           =   ($price*$discount_per)/100;


                        $check_cart         =   $CI->web_model->in_cart($course_info->id);
                        if($check_cart){
                            $purchase_button    =   '<button class="btn btn-info add_cart btn-xs" disabled>Already Added</button>';
                        }else{
                            $purchase_button    =   '<button class="btn-xs btn btn-info add_cart btn_adcart btn_adcart_'.$course_info->id.'" data-courseid="'.$course_info->id.'" data-coursename="'.$course_info->title.'" data-courseprice="'.number_format($amt_after_discount,2).'"  data-tax_id="'.$course_info->gst_id.'" data-discount_amt="'.number_format($discount_amt,2).'" data-gst_amt="'.number_format($payable_gst_amt,2).'" data-amount_without_gst="'.number_format($amount_without_gst,2).'">Add to Cart</button>'; 
                        }
                    }
                }else{
                    if($course_info->tax_type=='included'){
                        $price          =   $course_info->price;
                        $discount_amt   =   0;
                        /************* calculate GST if gst is excluded on orignal amt**/
                        $gst_percentage         =   $gst_info->percentage;
                        $payable_gst_amt        =   ($price-$price * (100/(100+$gst_percentage))); 
                        /*********** GST Close*************/

                        $amount_without_gst     =   $price - $payable_gst_amt;
                        $check_cart         =   $CI->web_model->in_cart($course_info->id);
                        if($check_cart){
                            $purchase_button    =   '<button class="btn btn-info add_cart btn-xs" disabled>Already Added</button>';
                        }else{
                            $purchase_button    =   '<button id="btn_adcart_'.$course_info->id.'" class="btn-xs btn btn-info add_cart btn_adcart btn_adcart_'.$course_info->id.'" data-courseid="'.$course_info->id.'" data-coursename="'.$course_info->title.'" data-courseprice="'.number_format($price,2).'"  data-tax_id="'.$course_info->gst_id.'" data-discount_amt="'.number_format($discount_amt,2).'" data-gst_amt="'.number_format($payable_gst_amt,2).'" data-amount_without_gst="'.number_format($amount_without_gst,2).'">Add to Cart</button>';    
                        }
                    }else{
                        $price          =   $course_info->price;
                        /************* calculate GST if gst is excluded on orignal amt**/
                        $gst_percentage         =   $gst_info->percentage;
                        $payable_gst_amt        =   ($price * ($gst_percentage/100));
                        $price_to_be_charge     =   $price+$payable_gst_amt;

                        $amt_after_discount     =   $price_to_be_charge-($price_to_be_charge * ($gst_percentage/100));
                        
                        $amount_without_gst     =   $price;

                        $discount_amt           =   0;


                        $check_cart         =   $CI->web_model->in_cart($course_info->id);
                        if($check_cart){
                            $purchase_button    =   '<button class="btn btn-info add_cart btn-xs" disabled>Already Added</button>';
                        }else{
                            $purchase_button    =   '<button id="btn_adcart_'.$course_info->id.'" class="btn btn-info add_cart btn_adcart btn-xs btn_adcart_'.$course_info->id.'" data-courseid="'.$course_info->id.'" data-coursename="'.$course_info->title.'" data-courseprice="'.number_format($price_to_be_charge,2).'"  data-tax_id="'.$course_info->gst_id.'" data-discount_amt="'.number_format($discount_amt,2).'" data-gst_amt="'.number_format($payable_gst_amt,2).'" data-amount_without_gst="'.number_format($amount_without_gst,2).'">Add to Cart</button>'; 
                        }
                    }
                }               
            }
        }
        return $purchase_button;
    }
}

if(!function_exists('check_course_price_with_discount')){
    function check_course_price_with_discount($course_id){
        $CI = & get_instance();
        $course_price    =   '';
        $currentDate        =   date('Y-m-d');
        $course_info        =   get_course_by_id($course_id);
        $checkCourse        =   check_course_existed($course_id);
        $gst_info           =   get_tax_info_by_id($course_info->gst_id);
        $setting            =   get_settings_data();
        //print_r($setting);die;
        if($course_info->is_free_course==0){
            $course_price   =   '<h3>Free</h3>';
        }else{
            if($currentDate <=date('Y-m-d',strtotime($course_info->discount_date))){
                if($course_info->tax_type=='included'){
                    $price          =   $course_info->price;
                    $discount_per   =   $course_info->discounted_price;
                    $new_price      =   ($price - ($price*$discount_per)/100);
                    $discount_amt   =   ($price*$discount_per)/100;
                    /************* calculate GST if gst is excluded on orignal amt**/
                    $gst_amt        =   ($new_price-$new_price * (100/(100+$discount_per)));



                    $course_price   =   '<h3>'.$setting->currency_symbol.'<small class="old_price">'.$price.'</small> '.round($new_price).'</h3>';
                    /*********** GST Close*************/
                
                }else{
                    $price          =   $course_info->price;
                    /************* calculate GST if gst is excluded on orignal amt**/
                    $gst_percentage =   $gst_info->percentage;
                    $gst_amt        =   ($price * ($gst_percentage/100));
                    $price_to_be_charge      =   $price+$gst_amt;

                    $amt_after_discount     =   $price_to_be_charge-($price_to_be_charge * ($gst_percentage/100));

                    $course_price   =   '<h3>'.$setting->currency_symbol.'<small class="old_price">'.$price_to_be_charge.'</small> '.round($amt_after_discount).'</h3>';
                }
                
            }else{
                if($course_info->tax_type=='included'){
                    $price_to_be_charge          =   $course_info->price;
                    $course_price   =   '<h3>'.$setting->currency_symbol.' '.number_format($price_to_be_charge,2).'</h3>';

                }else{
                    $price          =   $course_info->price;
                    /************* calculate GST if gst is excluded on orignal amt**/
                    $gst_percentage =   $gst_info->percentage;
                    $gst_amt        =   ($price * ($gst_percentage/100));
                    $price_to_be_charge      =   $price+$gst_amt;
                    /*********** GST Close*************/
                    $course_price   =   '<h3>'.$setting->currency_symbol.' '.number_format($price_to_be_charge,2).'</h3>';
                }
                
            }
            
        }
        return $course_price;
    }
}

if (!function_exists('lesson_progress')) {
    function lesson_progress($lesson_id = "", $user_id = "")
    {
        $CI    = &get_instance();
        $CI->load->database();
        if ($user_id == "") {
            $user_id = logged_in_student_id();
        }
        $user_details = $CI->student_model->get_all_user($user_id)->row_array();
        $watch_history_array = json_decode($user_details['watch_history'], true);
        
        if(!is_array($watch_history_array)) $watch_history_array = array();

        for ($i = 0; $i < count($watch_history_array); $i++) {
            $watch_history_for_each_lesson = $watch_history_array[$i];
            if ($watch_history_for_each_lesson['lesson_id'] == $lesson_id) {
                return $watch_history_for_each_lesson['progress'];
            }
        }
        return 0;
    }
}

if(!function_exists('count_course_total_rating')){
    function count_course_total_rating($course_id){
        $CI    = &get_instance();
        $total_rating =  $CI->web_model->get_ratings('course', $course_id, true)->row()->rating;

        $number_of_ratings = $CI->web_model->get_ratings('course', $course_id)->num_rows();
        //_d($number_of_ratings);
        if ($number_of_ratings > 0) {
            $average_ceil_rating = ceil($total_rating / $number_of_ratings);
            //echo $average_ceil_rating;die;
            return $average_ceil_rating;
        } else {
            return 0;
        }
    }
}
// Human readable time
if (!function_exists('readable_time_for_humans')) {
    function readable_time_for_humans($duration)
    {
        if ($duration) {
            $duration_array = explode(':', $duration);
            $hour   = $duration_array[0];
            $minute = $duration_array[1];
            $second = $duration_array[2];
            if ($hour > 0) {
                $duration = $hour . ' ' . get_phrase('hr') . ' ' . $minute . ' ' . get_phrase('min');
            } elseif ($minute > 0) {
                if ($second > 0) {
                    $duration = ($minute + 1) . ' ' . get_phrase('min');
                } else {
                    $duration = $minute . ' ' . get_phrase('min');
                }
            } elseif ($second > 0) {
                $duration = $second . ' ' . get_phrase('sec');
            } else {
                $duration = '00:00';
            }
        } else {
            $duration = '00:00';
        }
        return $duration;
    }
}
if(!function_exists('check_instructor_is_subscribed')){
    function check_instructor_is_subscribed($instructor_id){
        $CI = & get_instance();
        $CI->db->select('S.*');
        $CI->db->from('subscribe as S');
        $CI->db->where('S.teacher_id',$instructor_id);
        $CI->db->where('S.student_id',logged_in_student_id());
        return $CI->db->get()->row();
    }
}
function determineVideoUrlType($url) {


    $yt_rx = '/^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$/';
    $has_match_youtube = preg_match($yt_rx, $url, $yt_matches);


    $vm_rx = '/(https?:\/\/)?(www\.)?(player\.)?vimeo\.com\/([a-z]*\/)*([‌​0-9]{6,11})[?]?.*/';
    $has_match_vimeo = preg_match($vm_rx, $url, $vm_matches);


    //Then we want the video id which is:
    if($has_match_youtube) {
        $video_id = $yt_matches[5]; 
        $type = 'youtube';
    }
    elseif($has_match_vimeo) {
        $video_id = $vm_matches[5];
        $type = 'vimeo';
    }
    else {
        $video_id = 0;
        $type = 'none';
    }


    $data['video_id'] = $video_id;
    $data['video_type'] = $type;

    return $data;

}