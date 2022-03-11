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
function getExamQuestion($exam_id){
    $CI =& get_instance();
    $CI->db->select('OE.*,AQ.question_id,QB.class_id,QB.subject_id,QB.question,QB.upload,QB.mark,QB.question_type,QB.total_option');
    $CI->db->from('online_exam as OE');
    $CI->db->where('OE.id',$exam_id);
    $CI->db->join('assign_question as AQ','AQ.exam_id=OE.id','left');
    $CI->db->join('question_bank as QB','QB.id=AQ.question_id','left');
    $query = $CI->db->get();
    $result =  $query->result();
    return $result;
}
function getSubjectByExamBYadmin($exam_id){
    $CI =& get_instance();
    $CI->db->distinct();
    $CI->db->select('subject_id');
    $CI->db->from('create_exam');
    $CI->db->where('exam_id',$exam_id);
    $query = $CI->db->get();
    $result =  $query->result();
    return $result;
}
function getSubject($subject_id){
    $CI =& get_instance();
    $CI->db->where('id',$subject_id);
    $query = $CI->db->get('subject');
    $result =  $query->result();
    return $result;
}
if (!function_exists('numberofQuestions')){
    function numberofQuestions($exam_id){        
        $CI =& get_instance();      
        $CI->db->where('exam_id',$exam_id);
        $query = $CI->db->get('assign_question');
        if($query->num_rows() > 0){
            return $query->num_rows();
        }else{
            return 0;
        }
    }
}
function examTotalMarks($exam_id){
    $CI   =   & get_instance();
    $CI->db->select_sum('QB.mark');
    $CI->db->from('online_exam as OE');
    $CI->db->where('OE.id',$exam_id);
    $CI->db->join('assign_question as AQ','AQ.exam_id=OE.id','left');
    $CI->db->join('question_bank as QB','QB.id=AQ.question_id','left');
    $result     =   $CI->db->get()->row();
    return $result->mark;

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


if(!function_exists('check_exam_question')){
    function check_exam_question($question_id,$exam_id){
        $ci = & get_instance();
        $ci->db->select('*');
        $ci->db->from('assign_question');
        $ci->db->where('question_id',$question_id);
        $ci->db->where('exam_id',$exam_id);
        return $ci->db->get()->row();
    }
}

if(!function_exists('get_question_options')){
    function get_question_options($question_id){
        $ci = & get_instance();
        $ci->db->select('*');
        $ci->db->from('answers');
        $ci->db->where('question_id',$question_id);
        return $ci->db->get()->result();
    }
}
if(!function_exists('getExamQuestion')){
    function getExamQuestion($id){
        $ci = & get_instance();
        $ci->db->select('OE.*,AQ.question_id,QB.question,QB.upload,QB.question_type,QB.mark');
        $ci->db->from('online_exam as OE');
        $ci->db->join('assign_question as AQ','AQ.exam_id=OE.id','left');
        $ci->db->join('question_bank as QB','QB.id=AQ.question_id','left');
        $ci->db->where('OE.id',$id);
        return $ci->db->get()->result();
    }
}
