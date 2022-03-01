<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Backup extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Administrator_Model', 'administrator', true);
        $this->data['roles'] = $this->administrator->get_list('roles', array('status' => 1), '','', '', 'id', 'ASC');
        $this->data['settings'] = $this->administrator->get_single('settings', array('status' => 1));
        $this->load->helper('download');
    }
    
    
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load user interface for backup database and take backup database                
    *                    
    * @param           : null integer value
    * @return          : null 
    * ********************************************************** */
    public function index() {
        check_permission(VIEW);    
        $dir = "./uploads/backup-database/";
        $result = array();
        $cdir = scandir($dir);
        foreach ($cdir as $key => $value) {
            if (!in_array($value, array(".", ".."))) {
                if (is_dir($dir . DIRECTORY_SEPARATOR . $value)) {
                    $result[$value] = dirToArray($dir . DIRECTORY_SEPARATOR . $value);
                } else {
                    $result[] = $value;
                }
            }
        }
        $this->data['dbfileList'] = $result;
        $this->layout->title(get_phrase('backup'). ' ' . get_phrase('database'). ' | ' . SMS);
        $this->layout->view('backup/index', $this->data);  
    }
        
    function create_backup(){
        //check_permission(ADD);
        
        $this->load->dbutil();
        $filename = "db-" . date("Y-m-d_H-i-s") . ".sql";
        $prefs = array(
            'ignore' => array(),
            'format' => 'txt',
            'filename' => 'mybackup.sql',
            'add_drop' => TRUE,
            'add_insert' => TRUE,
            'newline' => "\n"
        );
        $backup = $this->dbutil->backup($prefs);
        $this->load->helper('file');
        write_file('./uploads/backup-database/' . $filename, $backup);
        success(get_phrase('db_backup_success'));
        redirect(base_url().'administrator/backup');
        force_download($filename, $backup);
    }
    function dropbackup($file){
        unlink('./uploads/backup-database/' . $file);
        success(get_phrase('db_deleted'));
        redirect('administrator/backup');
    }
    function restore_backup() {
        if($_POST){
            $folder_name = 'backup-database';
            $file_name = $this->input->post('filename');
            $path = './uploads/';
            $filePath = $path . $folder_name . '/' . $file_name;
            $file_restore = $this->load->file($path . $folder_name . '/' . $file_name, true);
            $db = (array) get_instance()->db;
            $conn = mysqli_connect('localhost', $db['username'], $db['password'], $db['database']);

            $sql = '';
            $error = '';

            if (file_exists($filePath)) {
                $lines = file($filePath);

                foreach ($lines as $line) {

                    // Ignoring comments from the SQL script
                    if (substr($line, 0, 2) == '--' || $line == '') {
                        continue;
                    }

                    $sql .= $line;

                    if (substr(trim($line), - 1, 1) == ';') {
                        $result = mysqli_query($conn, $sql);
                        if (!$result) {
                            $error .= mysqli_error($conn) . "\n";
                        }
                        $sql = '';
                    }
                }
                $msg = get_phrase('restored_message');
            } // end if file exists
            success($msg);
            redirect('administrator/backup');
        }
    }

    function upload_db(){
        $dir = "./uploads/backup-database/";
        $result = array();
        $cdir = scandir($dir);
        foreach ($cdir as $key => $value) {
            if (!in_array($value, array(".", ".."))) {
                if (is_dir($dir . DIRECTORY_SEPARATOR . $value)) {
                    $result[$value] = dirToArray($dir . DIRECTORY_SEPARATOR . $value);
                } else {
                    $result[] = $value;
                }
            }
        }
        $data['dbfileList'] = $result;
        $data['title'] = 'Backup History';
        if ($this->input->server('REQUEST_METHOD') == "POST") {
            $this->form_validation->set_rules('file', get_phrase('file'), 'callback_handle_upload');
            if ($this->form_validation->run() == FALSE) {
                $this->layout->view('backup/index',$data);
            } else {
                if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                    $fileInfo = pathinfo($_FILES["file"]["name"]);
                    $file_name = "db-" . date("Y-m-d_H-i-s") . ".sql";
                    move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/temp_uploaded/" . $file_name);
                    $folder_name = 'temp_uploaded';
                    $path = './uploads/';
                    $file_restore = $this->load->file($path . $folder_name . '/' . $file_name, true);
                    $file_array = explode(';', $file_restore);
                    foreach ($file_array as $query) {
                        $trimQuery1 = trim($query);
                        if (!empty($trimQuery1)) {
                            $this->db->query("SET FOREIGN_KEY_CHECKS = 0");
                            $this->db->query($query);
                            $this->db->query("SET FOREIGN_KEY_CHECKS = 1");
                        }
                    }
                    success(get_phrase('success_message'));
                    $this->layout->view('backup/index',$data);
                }
            }
        }
    }

    function handle_upload() {
        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
            $allowedExts = array('sql');
            $temp = explode(".", $_FILES["file"]["name"]);
            $extension = end($temp);
            if ($_FILES["file"]["error"] > 0) {
                $error .= "Error opening the file<br />";
            }
            if ($_FILES["file"]["type"] != 'application/octet-stream') {

                $this->form_validation->set_message('handle_upload', $this->lang->line('file_type_not_allowed'));
                return false;
            }
            if (!in_array(strtolower($extension), $allowedExts)) {

                $this->form_validation->set_message('handle_upload', $this->lang->line('extension_not_allowed'));
                return false;
            }
            if ($_FILES["file"]["size"] > 10240000) {

                $this->form_validation->set_message('handle_upload', $this->lang->line('file_size_shoud_be_less_than_100kB'));
                return false;
            }
            return true;
        } else {
            $this->form_validation->set_message('handle_upload', $this->lang->line('the_file_field_is_required'));
            return false;
        }
    }
    function generate_key($length = 12) {

        $str = "";
        $characters = array_merge(range('A', 'Z'), range('a', 'z'), range('0', '9'));
        $max = count($characters) - 1;
        for ($i = 0; $i < $length; $i++) {
            $rand = mt_rand(0, $max);
            $str .= $characters[$rand];
        }
        return $str;
    }

    function addCronsecretkey($id) {


        $key = $this->generate_key(25);

        $data = array('cron_secret_key' => $key);

        $this->administrator->add_cronsecretkey($data, $id);
        success(get_phrase('cron_secret_key').' '.get_phrase('created'));
        redirect('administrator/backup');
    }
    
}
