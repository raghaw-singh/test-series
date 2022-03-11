<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Add_Question_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function getExamById($id){
    	return $this->db->get_where('online_exam',array('id'=>$id))->row();
    }
    function getQuestionBank(){
    	return $this->db->get('question_bank')->result();
    }
    function get_question_group($id){
        return $this->db->get_where('question_bank', array('id'=>$id))->result();
    }
    function get_question_type($id){
        return $this->db->get_where('question_bank', array('id'=>$id))->result();
    }
    function getAssignQues($id){
        $this->db->select('AQ.*,QB.question,QB.mark');
        $this->db->from('assign_question as AQ');
        $this->db->join('question_bank as QB', 'AQ.question_id = QB.id', 'left');
        return $this->db->get()->result();
    }

    function fetch_question_data($postData = null){
        
        $response = array();
        
        ## Read value
        $draw            = $postData['draw'];
        $start           = $postData['start'];
        $rowperpage      = $postData['length']; // Rows display per page
        $columnIndex     = $postData['order'][0]['column']; // Column index
        $columnName      = $postData['columns'][$columnIndex]['data']; // Column name
        $columnSortOrder = $postData['order'][0]['dir']; // asc or desc
        $searchValue     = $postData['search']['value']; // Search value
        
        // Custom search filter 
        $level           = $postData['ques_level'];
        $class_id           = $postData['class_id'];
        $exam_id         = $postData['exam_id'];
        $subject_id         =   $postData['subject_id'];
        
        ## Total number of records without filtering
        $this->db->select('count(*) as allcount');
        $records         = $this->db->get('question_bank')->result();
        $totalRecords    = $records[0]->allcount;
        
        ## Total number of record with filtering
        $this->db->select('count(*) as allcount');
        if(!empty($level)){
            $this->db->where('difficult_level', $level);
        }
        if(!empty($class_id)){
            $this->db->where('class_id', $class_id);
        }
        if(!empty($subject_id)){
            $this->db->where('subject_id',$subject_id);
        }
        $records               = $this->db->get('question_bank')->result();
        $totalRecordwithFilter = $records[0]->allcount;
        
        ## Fetch records
        $this->db->select('*');
        if(!empty($level)){
            $this->db->where('difficult_level', $level);
        }
        if(!empty($class_id)){
            $this->db->where('class_id', $class_id);
        }
        if(!empty($subject_id)){
            $this->db->where('subject_id',$subject_id);
        }
        $this->db->order_by('id','desc');
        $this->db->limit($rowperpage, $start);
        $records = $this->db->get('question_bank')->result();
        
        $data = array();
        $count=1;
        foreach ($records as $record) {
                $check_exam_question        =   check_exam_question($record->id,$exam_id);
                if($check_exam_question){
                    $button_view  = "<a href='javascript:;' disabled class='btn btn-warning btn-xs add-tooltip' data-toggle='tooltip' title='assigned'><i class='fa fa-plus'></i></a>";  
                }else{
                    $button_view  = "<a href='javascript:;' id='btn_read_".$record->id."' onclick='assign_ques(".$record->id.")' class='btn btn-info btn-xs add-tooltip' data-toggle='tooltip' data-placement='top' title='assign'><i class='fa fa-plus'></i></a>";     
                }
            $class_name     =   $this->db->get_where('class',array('id'=>$record->class_id))->row()->class;
            $data[] = array(
                "count"=>$count,
                "level" => $record->difficult_level,
                "question" => $record->question,
                "class_name" => $class_name,
                "action" => $button_view,
            );
            $count++;
        }
        
        ## Response
        $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalRecordwithFilter,
            "aaData" => $data
        );
        
        return $response;
    }




}