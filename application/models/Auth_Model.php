<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Auth_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }


    function validateLogin($email,$password){
        $this->db->from('users as U');
        $this->db->where('U.email', $email);

        $query = $this->db->get();
        if ($query->num_rows() == 0){
            return false;
        } else{
            //Compare the password attempt with the password we have stored.
            $result = $query->row();
            $validPassword = password_verify($password, $result->password);
            if($validPassword){
                return $result = $query->row();
            }
        }
    }
}
