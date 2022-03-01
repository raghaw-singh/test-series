<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Web_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    function validateUserOTP(){
        $this->db->select('U.id,U.otp,U.otp_expire_at');
        $this->db->from('users as U');
        $this->db->where('U.otp',$this->input->post('otp'));
        $this->db->where('U.phone',$this->session->userdata('otp_verify_mobile'));
        return $this->db->get()->row();
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
