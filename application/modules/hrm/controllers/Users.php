<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('User_Model', 'user_model', true);        
    }

    
    
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Employeet List" user interface                 
    *                      
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);
        
        $this->data['employees'] = $this->user_model->get_employee_list();
        $this->data['roles'] = $this->user_model->get_list('roles', array('status' => 1,'id !='=>'1'), '', '', '', 'id', 'ASC');
        
        $this->data['list'] = TRUE;
        $this->layout->title(get_phrase('manage_user') . ' | ' . SMS);
        $this->layout->view('user/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Employee" user interface                 
    *                    and process to store "Empoyee" into database 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);
        $this->data['roles'] = $this->user_model->get_list('roles', array('status' => 1,'id !='=>'1'), '', '', '', 'id', 'ASC');
        $this->data['add'] = TRUE;
        $this->layout->title(get_phrase('add') . ' ' . get_phrase('employee') . ' | ' . SMS);
        $this->layout->view('user/add_users', $this->data);
    }

    
    
    /*****************Function edit**********************************
    * @type            : Function
    * @function name   : edit
    * @description     : Load Update "Employee" user interface                 
    *                    with populate "Employee" value 
    *                    and process to update "Employee" into database    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function edit($id = null) {

        check_permission(EDIT);
        $this->data['roles'] = $this->user_model->get_list('roles', array('status' => 1,'id!=',1), '', '', '', 'id', 'ASC');
        $this->data['user_info']        =   $this->user_model->get_single('users',array('id'=>$id));

        if($this->data['user_info']->role_id==4){
            $this->data['other_info']       =   $this->user_model->get_single('students',array('user_id'=>$this->data['user_info']->id));
        }else if($this->data['user_info']->role_id==3){
            $this->data['other_info']       =   $this->user_model->get_single('teachers',array('user_id'=>$this->data['user_info']->id));
        }else{
            $this->data['other_info']       =   $this->user_model->get_single('employees',array('user_id'=>$this->data['user_info']->id));
        }

        $this->data['edit'] = TRUE;
        $this->layout->title(get_phrase('edit') . ' ' . get_phrase('user') . ' | ' . SMS);
        $this->layout->view('user/edit_users', $this->data);
    }

     /*****************Function get_single_employee**********************************
     * @type            : Function
     * @function name   : get_single_employee
     * @description     : "Load single employee information" from database                  
     *                    to the user interface   
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function get_single_employee(){
        
       $employee_id = $this->input->post('employee_id');
       $this->data['user_info']            =   $this->user_model->get_single('users',array('id'=>$employee_id));
        if($this->data['user_info']->role_id==4){
            $this->data['other_info']       =   $this->user_model->get_single('students',array('user_id'=>$this->data['user_info']->id));
        }else if($this->data['user_info']->role_id==3){
            $this->data['other_info']       =   $this->user_model->get_single('teachers',array('user_id'=>$this->data['user_info']->id));
        }else{
            $this->data['other_info']       =   $this->user_model->get_single('employees',array('user_id'=>$this->data['user_info']->id));
        }
       echo $this->load->view('user/get-single-employee', $this->data);
    }
    
     
    /*****************Function email**********************************
    * @type            : Function
    * @function name   : email
    * @description     : Unique check for "Employee Email" data/value                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function email() {
        if ($this->input->post('id') == '') {
            $email = $this->user_model->duplicate_check($this->input->post('email'));
            if ($email) {
                $this->form_validation->set_message('email', get_phrase('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else if ($this->input->post('id') != '') {
            $email = $this->user_model->duplicate_check($this->input->post('email'), $this->input->post('id'));
            if ($email) {
                $this->form_validation->set_message('email', get_phrase('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else {
            return TRUE;
        }
    }
    
       
    function saveUsers(){
        if(isset($_POST['submit'])){
            $name                                   =   $this->input->post('name')   ;
            $password                               =   $this->input->post('password');
            $role_id                                =   $this->input->post('role_id');
            $this->form_validation->set_rules('name',get_phrase('name'),'trim|required|xss_clean');
            $this->form_validation->set_rules('phone',get_phrase('phone'),'trim|required|xss_clean|numeric|max_length[10]');
            $this->form_validation->set_rules('gender',get_phrase('gender'),'trim|required|xss_clean');
            $this->form_validation->set_rules('email',get_phrase('email'),'trim|required|xss_clean|valid_email|is_unique[users.email]');
            $this->form_validation->set_rules('password',get_phrase('password'),'trim|required|xss_clean|min_length[6]');
            $this->form_validation->set_rules('role_id',get_phrase('role_id'),'trim|required|xss_clean|numeric');
            if($this->form_validation->run()==false){
                $msg                    =   array(
                    'name'=>form_error('name'),
                    'phone'=>form_error('phone'),
                    'gender'=>form_error('gender'),
                    'email'=>form_error('email'),
                    'password'=>form_error('password'),
                    'role_id'=>form_error('role_id')
                );
                $arr                    =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $fullname               =   explode(' ',$name);
                $first_name             =   $fullname[0];
                $last_name              =   $fullname[1];
                $save['first_name']     =   $first_name;
                $save['last_name']      =   $last_name;
                $save['role_id']        =   $this->input->post('role_id');
                $save['email']          =   $this->input->post('email');
                $save['phone']          =   $this->input->post('phone');
                $save['password']       =   password_hash($password,PASSWORD_BCRYPT);
                $save['temp_password']  =   base64_encode($password);
                $save['watch_history']  =   '[]';
                $save['email_verify']   =   'verify';
                $save['phone_verify']   =   'verify';
                $save['created_by']     =   logged_in_user_id();
                $save['created_at']     =   date('Y-m-d H:i:s');
                $save['status']         =   1;
                if($role_id==2){
                    if(!empty($_FILES['photo']['name'])){
                        $save['photo']      =   $this->_upload_admin_photo();    
                    }
                    
                }elseif($role_id==3){
                    if(!empty($_FILES['photo']['name'])){
                        $save['photo']      =   $this->_upload_instructor_photo();
                    }
                }else{
                    if(!empty($_FILES['photo']['name'])){
                        $save['photo']      =   $this->_upload_student_photo();
                    }
                }
                $insert                 =   $this->db->insert('users',$save);
                if($insert){
                    $last_id            =   $this->db->insert_id();

                    if($role_id =='4'){
                        $std['name']        =    $name;
                        $std['user_id']     =    $last_id;
                        $std['phone']       =   $this->input->post('phone');
                        $std['present_address']=    $this->input->post('present_address');
                        $std['permanent_address']=  $this->input->post('permanent_address');
                        $std['status']      =   '1';
                        $std['gender']      =   $this->input->post('gender');
                        $std['national_id'] =   $this->input->post('national_id');
                        $this->db->insert('students',$std);
                    }elseif($role_id==3){
                        $emp['name']        =    $name;
                        $emp['user_id']     =    $last_id;
                        $emp['phone']       =   $this->input->post('phone');
                        $emp['present_address']=    $this->input->post('present_address');
                        $emp['permanent_address']=  $this->input->post('permanent_address');
                        $emp['status']      =   '1';
                        $emp['gender']      =   $this->input->post('gender');
                        $emp['national_id'] =   $this->input->post('national_id');
                        $emp['is_show_web']  =   $this->input->post('is_view_on_web');
                        $this->db->insert('teachers',$emp);
                    }else{
                        $emp['name']        =    $name;
                        $emp['user_id']     =    $last_id;
                        $emp['phone']       =   $this->input->post('phone');
                        $emp['present_address']=    $this->input->post('present_address');
                        $emp['permanent_address']=  $this->input->post('permanent_address');
                        $emp['status']      =   '1';
                        $emp['gender']      =   $this->input->post('gender');
                        $emp['national_id'] =   $this->input->post('national_id');
                        $emp['is_view_on_web']  =   $this->input->post('is_view_on_web');
                        $this->db->insert('employees',$emp);
                    }
                    $arr                    =   array('status'=>'true','message'=>get_phrase('user_created'));
                    echo json_encode($arr);
                }else{
                    $arr                    =   array('status'=>'false','message'=>get_phrase('something_went_wrong'));
                    echo json_encode($arr);
                }
            }
        }
    }
    function editUsers(){
        if(isset($_POST['submit'])){
            $name                                   =   $this->input->post('name')   ;
            $password                               =   $this->input->post('password');
            $role_id                                =   $this->input->post('role_id');
            $this->form_validation->set_rules('name',get_phrase('name'),'trim|required|xss_clean');
            $this->form_validation->set_rules('phone',get_phrase('phone'),'trim|required|xss_clean|numeric|max_length[10]');
            $this->form_validation->set_rules('gender',get_phrase('gender'),'trim|required|xss_clean');
            $this->form_validation->set_rules('email',get_phrase('email'),'trim|required|xss_clean|valid_email');
            $this->form_validation->set_rules('role_id',get_phrase('role_id'),'trim|required|xss_clean|numeric');
            if($this->form_validation->run()==false){
                $msg                    =   array(
                    'name'=>form_error('name'),
                    'phone'=>form_error('phone'),
                    'gender'=>form_error('gender'),
                    'email'=>form_error('email'),
                    'role_id'=>form_error('role_id')
                );
                $arr                    =   array('status'=>'error','message'=>$msg);
                echo json_encode($arr);
            }else{
                $fullname               =   explode(' ',$name);
                $first_name             =   $fullname[0];
                $last_name              =   $fullname[1];
                $save['first_name']     =   $first_name;
                $save['last_name']      =   $last_name;
                $save['role_id']        =   $this->input->post('role_id');
                $save['email']          =   $this->input->post('email');
                $save['modified_by']     =   logged_in_user_id();
                $save['modified_at']     =   date('Y-m-d H:i:s');
                $save['status']         =   1;
                if($role_id==2){
                    if(!empty($_FILES['photo']['name'])){
                        $save['photo']      =   $this->_upload_admin_photo();    
                    }
                    
                }elseif($role_id==3){
                    if(!empty($_FILES['photo']['name'])){
                        $save['photo']      =   $this->_upload_instructor_photo();
                    }
                }else{
                    if(!empty($_FILES['photo']['name'])){
                        $save['photo']      =   $this->_upload_student_photo();
                    }
                }
                $this->db->where('id',$this->input->post('id'));
                $update                 =   $this->db->update('users',$save);
                if($update){
                    if($role_id =='4'){
                        $std['name']        =    $name;
                        $std['phone']       =   $this->input->post('phone');
                        $std['present_address']=    $this->input->post('present_address');
                        $std['permanent_address']=  $this->input->post('permanent_address');
                        $std['status']      =   '1';
                        $std['gender']      =   $this->input->post('gender');
                        $std['national_id'] =   $this->input->post('national_id');
                        $this->db->where('id',$this->input->post('user_id'));
                        $this->db->update('students',$std);
                    }else{
                        $emp['name']        =    $name;
                        $emp['phone']       =   $this->input->post('phone');
                        $emp['present_address']=    $this->input->post('present_address');
                        $emp['permanent_address']=  $this->input->post('permanent_address');
                        $emp['status']      =   '1';
                        $emp['gender']      =   $this->input->post('gender');
                        $emp['national_id'] =   $this->input->post('national_id');
                        $emp['is_view_on_web']  =   $this->input->post('is_view_on_web');
                        $this->db->where('id',$this->input->post('user_id'));
                        $this->db->update('employees',$emp);
                    }
                    $arr                    =   array('status'=>'true','message'=>get_phrase('user_updated'));
                    echo json_encode($arr);
                }else{
                    $arr                    =   array('status'=>'false','message'=>get_phrase('something_went_wrong'));
                    echo json_encode($arr);
                }
            }
        }
    }
    /*****************Function _upload_admin_photo**********************************
    * @type            : Function
    * @function name   : _upload_admin_photo
    * @description     : Process to upload employee photo into server                  
    *                     and return photo name  
    * @param           : null
    * @return          : $return_photo string value 
    * ********************************************************** */ 
    private function _upload_admin_photo() {

        $prev_photo = $this->input->post('prev_photo');
        $photo = $_FILES['photo']['name'];
        $photo_type = $_FILES['photo']['type'];
        $return_photo = '';
        if ($photo != "") {
            if ($photo_type == 'image/jpeg' || $photo_type == 'image/pjpeg' ||
                    $photo_type == 'image/jpg' || $photo_type == 'image/png' ||
                    $photo_type == 'image/x-png' || $photo_type == 'image/gif') {

                $destination = 'uploads/employee-photo/';

                $file_type = explode(".", $photo);
                $extension = strtolower($file_type[count($file_type) - 1]);
                $photo_path = 'photo-' . time() . '-sms.' . $extension;

                move_uploaded_file($_FILES['photo']['tmp_name'], $destination . $photo_path);

                // need to unlink previous photo
                if ($prev_photo != "") {
                    if (file_exists($destination . $prev_photo)) {
                        @unlink($destination . $prev_photo);
                    }
                }

                $return_photo = $photo_path;
            }
        } else {
            $return_photo = $prev_photo;
        }

        return $return_photo;
    }

    /*****************Function _upload_student_photo**********************************
    * @type            : Function
    * @function name   : _upload_student_photo
    * @description     : Process to upload employee photo into server                  
    *                     and return photo name  
    * @param           : null
    * @return          : $return_photo string value 
    * ********************************************************** */ 
    private function _upload_student_photo() {

        $prev_photo = $this->input->post('prev_photo');
        $photo = $_FILES['photo']['name'];
        $photo_type = $_FILES['photo']['type'];
        $return_photo = '';
        if ($photo != "") {
            if ($photo_type == 'image/jpeg' || $photo_type == 'image/pjpeg' ||
                    $photo_type == 'image/jpg' || $photo_type == 'image/png' ||
                    $photo_type == 'image/x-png' || $photo_type == 'image/gif') {

                $destination = 'uploads/student-photo/';

                $file_type = explode(".", $photo);
                $extension = strtolower($file_type[count($file_type) - 1]);
                $photo_path = 'photo-' . time() . '-sms.' . $extension;

                move_uploaded_file($_FILES['photo']['tmp_name'], $destination . $photo_path);

                // need to unlink previous photo
                if ($prev_photo != "") {
                    if (file_exists($destination . $prev_photo)) {
                        @unlink($destination . $prev_photo);
                    }
                }

                $return_photo = $photo_path;
            }
        } else {
            $return_photo = $prev_photo;
        }

        return $return_photo;
    }

    /*****************Function _upload_instructor_photo**********************************
    * @type            : Function
    * @function name   : _upload_instructor_photo
    * @description     : Process to upload employee photo into server                  
    *                     and return photo name  
    * @param           : null
    * @return          : $return_photo string value 
    * ********************************************************** */ 
    private function _upload_instructor_photo() {

        $prev_photo = $this->input->post('prev_photo');
        $photo = $_FILES['photo']['name'];
        $photo_type = $_FILES['photo']['type'];
        $return_photo = '';
        if ($photo != "") {
            if ($photo_type == 'image/jpeg' || $photo_type == 'image/pjpeg' ||
                    $photo_type == 'image/jpg' || $photo_type == 'image/png' ||
                    $photo_type == 'image/x-png' || $photo_type == 'image/gif') {

                $destination = 'uploads/teacher-photo/';

                $file_type = explode(".", $photo);
                $extension = strtolower($file_type[count($file_type) - 1]);
                $photo_path = 'photo-' . time() . '-sms.' . $extension;

                move_uploaded_file($_FILES['photo']['tmp_name'], $destination . $photo_path);

                // need to unlink previous photo
                if ($prev_photo != "") {
                    if (file_exists($destination . $prev_photo)) {
                        @unlink($destination . $prev_photo);
                    }
                }

                $return_photo = $photo_path;
            }
        } else {
            $return_photo = $prev_photo;
        }

        return $return_photo;
    }

        
    
    /*****************Function delete**********************************
    * @type            : Function
    * @function name   : delete
    * @description     : delete "Employee" data from database                  
    *                     and unlink employee photo and Resume from server  
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function delete($id = null) {

        check_permission(DELETE);

        if(!is_numeric($id)){
             error(get_phrase('unexpected_error'));
             redirect('hrm/users');       
        }
        
        $employee = $this->user_model->get_single('employees', array('user_id' => $id));
        if (!empty($employee)) {
            $destination        =   'uploads/';
            // delete employee data
            $this->user_model->delete('employees', array('id' => $id));
            
            // delete employee login data
            $this->user_model->delete('users', array('id' => $employee->user_id));
            
            // delete employee salary_payments data
            if (file_exists($destination . '/employee-photo/' . $employee->photo)) {
                @unlink($destination . '/employee-photo/' . $employee->photo);
            }            
            
            create_log('Has been deleted a Employee : '.$employee->name);
            success(get_phrase('delete_success'));
            
        } else {
            error(get_phrase('delete_failed'));
        }
        redirect('hrm/users');
    }

}
