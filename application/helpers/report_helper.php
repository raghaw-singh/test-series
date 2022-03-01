<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


if (!function_exists('get_course_progress')) {
    function get_course_progress($course_id = "",$student_id="",$return_type="")
    {
        $CI    = &get_instance();
        $user_details = $CI->common_model->get_all_user($student_id)->row_array();
        $completed_lessons_ids = array();

        $completed_lessons_ids_for_single_course = array();

        $lesson_completed = 0;

        $watch_history_array = json_decode($user_details['watch_history'], true);

        $lessons_for_that_course = $CI->common_model->get_lessons('course', $course_id);

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

if(!function_exists('get_all_lesson_by_course')){
    function get_all_lesson_by_course($course_id){
        $CI = & get_instance();
        $CI->db->select('count(L.id) as total_lesson');
        $CI->db->from('lesson as L');
        $CI->db->where('L.course_id',$course_id);
        return $CI->db->get()->row()->total_lesson;
    }
}