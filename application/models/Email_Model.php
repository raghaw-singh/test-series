<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Email_Model extends MY_Model {
    public $data = array();
    public $gsms_setting = array();
    function __construct() {
        parent::__construct();
        $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();
        
        if($gsms_setting){
            $this->gsms_setting     =   $gsms_setting;
        }
    }


    /*     * ***************Function _send_email**********************************
     * @type            : Function
     * @function name   : _send_email
     * @description     : this function used to send recover forgot password email 
     * @param           : $data array(); 
     * @return          : null 
     * ********************************************************** */

    function send_forgot_password_email($email,$id,$full_name) {

        
        if($email){

            $from_email = FROM_EMAIL;
            $from_name  = FROM_NAME;  
            
            $email_setting = $this->auth->get_single('email_settings', array('status' => 1));
            $setting = $this->auth->get_single('settings', array('status' => 1));
            if(!empty($setting)){
                date_default_timezone_set($this->gsms_setting->default_time_zone);
            }
            if(!empty($email_setting)){
                $from_email = $email_setting->from_address;
                $from_name  = $email_setting->from_name;  
            }elseif(!empty($setting)){
                $from_email = $setting->email;
                $from_name  = $setting->system_name;  
            }
            
            if(!empty($email_setting) && $email_setting->mail_protocol == 'smtp'){
                
                $config['protocol']     = 'smtp';
                $config['smtp_host']    = $email_setting->smtp_host;
                $config['smtp_port']    = $email_setting->smtp_port;
                $config['smtp_timeout'] = $email_setting->smtp_timeout ? $email_setting->smtp_timeout  : 5;
                $config['smtp_user']    = $email_setting->smtp_user;
                $config['smtp_pass']    = $email_setting->smtp_pass;
                //$config['smtp_crypto']  = $email_setting->smtp_crypto ? $email_setting->smtp_crypto  : 'tls';
                $config['mailtype'] = isset($email_setting) && $email_setting->mail_type ? $email_setting->mail_type  : 'html';
                $config['charset']  = isset($email_setting) && $email_setting->char_set ? $email_setting->char_set  : 'iso-8859-1';
                $config['priority']  = isset($email_setting) && $email_setting->priority ? $email_setting->priority  : '3';
                
            }elseif(!empty($email_setting) && $email_setting->mail_protocol != 'smtp'){
                
                $config['protocol'] = $email_setting->mail_protocol;
                $config['mailpath'] = '/usr/sbin/'.$email_setting->mail_protocol; 
                $config['mailtype'] = isset($email_setting) && $email_setting->mail_type ? $email_setting->mail_type  : 'html';
                $config['charset']  = isset($email_setting) && $email_setting->char_set ? $email_setting->char_set  : 'iso-8859-1';
                $config['priority']  = isset($email_setting) && $email_setting->priority ? $email_setting->priority  : '3';
                
            }else{ // default    
                $config['protocol'] = 'sendmail';
                $config['mailpath'] = '/usr/sbin/sendmail'; 
            }   
            
            $config['wordwrap'] = TRUE;            
            $config['newline']  = "\r\n"; 

            $this->load->library('email');
            $this->email->initialize($config);

            $this->email->from($from_email, $from_name);
            $this->email->to($email);
            $subject = 'Password reset Email from : '. $from_name;
            $this->email->subject($subject);
            $key = uniqid();
            $startTime = date("Y-m-d H:i:s");
            $expire_at = date('Y-m-d H:i:s', strtotime('+15 minutes', strtotime($startTime)));
            $this->auth->update('users', array('reset_key' => $key,'expire_at'=>$expire_at), array('id' => $id));
            $logo_path      =   base_url('uploads/logo/'.$setting->logo);
            $message='
                <style>html,body { padding: 0; margin:0; }</style>
                <div style="font-family:Arial,Helvetica,sans-serif; line-height: 1.5; font-weight: normal; font-size: 15px; color: #2F3044; min-height: 100%; margin:0; padding:0; width:100%; background-color:#edf2f7">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;margin:0 auto; padding:0; max-width:600px">
                        <tbody>
                            <tr>
                                <td align="center" valign="center" style="text-align:center; padding: 20px">
                                    <a href="<?= base_url();?>" rel="noopener" target="_blank">
                                        <img alt="Logo" src="'.$logo_path.'" style="height: 40px;" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="center">
                                    <div style="text-align:left; margin: 0 20px; padding: 40px; background-color:#ffffff; border-radius: 6px">
                                        <!--begin:Email content-->
                                        <div style="padding-bottom: 30px; font-size: 17px;">
                                            <strong>Hello! '.$full_name.'</strong>
                                        </div>
                                        <div style="padding-bottom: 30px">You have requested to reset your ' .$from_name . ' web Application login password. To reset you password plese click following url</div>
                                        <div style="padding-bottom: 40px; text-align:center;">
                                            <a href="'.site_url('auth/reset/' . $key).'" rel="noopener" style="text-decoration:none;display:inline-block;text-align:center;padding:0.75575rem 1.3rem;font-size:0.925rem;line-height:1.5;border-radius:0.35rem;color:#ffffff;background-color:#009EF7;border:0px;margin-right:0.75rem!important;font-weight:600!important;outline:none!important;vertical-align:middle" target="_blank">Reset Password</a>
                                        </div>
                                        <div style="padding-bottom: 30px">This password reset link will expire in 15 minutes. If you did not request a password reset, no further action is required.</div>
                                        <div style="border-bottom: 1px solid #eeeeee; margin: 15px 0"></div>
                                        <div style="padding-bottom: 50px; word-wrap: break-all;">
                                            <p style="margin-bottom: 10px;">Button not working? Try pasting this URL into your browser:</p>
                                            <a href="'.site_url('auth/reset/' . $key).'" rel="noopener" target="_blank" style="text-decoration:none;color: #009EF7">'.site_url('auth/reset/' . $key).'</a>
                                        </div>
                                        <!--end:Email content-->
                                        <div style="padding-bottom: 10px">Kind regards,
                                        <br>'.$from_name.'
                                        <tr>
                                            <td align="center" valign="center" style="font-size: 13px; text-align:center;padding: 20px; color: #6d6e7c;">
                                                <p>'.$setting->address.'</p>
                                                <p>
                                                <a href="'.base_url().'" rel="noopener" target="_blank">'.$setting->footer.'</a>.</p>
                                            </td>
                                        </tr></br></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>';

            $this->email->message($message);
            if(!empty($email_setting) && $email_setting->mail_protocol == 'smtp'){
                 $this->email->send(); 
            }else{

                $headers = "MIME-Version: 1.0\r\n";
                $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
                $headers .= "From:  $from_name < $from_email >\r\n";
                $headers .= "Reply-To:  $from_name < $from_email >\r\n"; 
                mail($data->email, $subject, $message, $headers);

            } 
            return TRUE;
                
        }else{
            return FALSE;
        }   
    } 

    function password_changed_mail($email,$id,$full_name) {

        
        if($email){

            $from_email = FROM_EMAIL;
            $from_name  = FROM_NAME;  
            
            $email_setting = $this->auth->get_single('email_settings', array('status' => 1));
            $setting = $this->auth->get_single('settings', array('status' => 1));
            if(!empty($setting)){
                date_default_timezone_set($this->gsms_setting->default_time_zone);
            }
            if(!empty($email_setting)){
                $from_email = $email_setting->from_address;
                $from_name  = $email_setting->from_name;  
            }elseif(!empty($setting)){
                $from_email = $setting->email;
                $from_name  = $setting->system_name;  
            }
            
            if(!empty($email_setting) && $email_setting->mail_protocol == 'smtp'){
                
                $config['protocol']     = 'smtp';
                $config['smtp_host']    = $email_setting->smtp_host;
                $config['smtp_port']    = $email_setting->smtp_port;
                $config['smtp_timeout'] = $email_setting->smtp_timeout ? $email_setting->smtp_timeout  : 5;
                $config['smtp_user']    = $email_setting->smtp_user;
                $config['smtp_pass']    = $email_setting->smtp_pass;
                //$config['smtp_crypto']  = $email_setting->smtp_crypto ? $email_setting->smtp_crypto  : 'tls';
                $config['mailtype'] = isset($email_setting) && $email_setting->mail_type ? $email_setting->mail_type  : 'html';
                $config['charset']  = isset($email_setting) && $email_setting->char_set ? $email_setting->char_set  : 'iso-8859-1';
                $config['priority']  = isset($email_setting) && $email_setting->priority ? $email_setting->priority  : '3';
                
            }elseif(!empty($email_setting) && $email_setting->mail_protocol != 'smtp'){
                
                $config['protocol'] = $email_setting->mail_protocol;
                $config['mailpath'] = '/usr/sbin/'.$email_setting->mail_protocol; 
                $config['mailtype'] = isset($email_setting) && $email_setting->mail_type ? $email_setting->mail_type  : 'html';
                $config['charset']  = isset($email_setting) && $email_setting->char_set ? $email_setting->char_set  : 'iso-8859-1';
                $config['priority']  = isset($email_setting) && $email_setting->priority ? $email_setting->priority  : '3';
                
            }else{ // default    
                $config['protocol'] = 'sendmail';
                $config['mailpath'] = '/usr/sbin/sendmail'; 
            }   
            
            $config['wordwrap'] = TRUE;            
            $config['newline']  = "\r\n"; 

            $this->load->library('email');
            $this->email->initialize($config);

            $this->email->from($from_email, $from_name);
            $this->email->to($email);
            $subject = 'Password Changed : '. $from_name;
            $this->email->subject($subject);

            $logo_path      =   base_url('uploads/logo/'.$setting->logo);
            $message='<style>html,body { padding: 0; margin:0; }</style>
                <div style="font-family:Arial,Helvetica,sans-serif; line-height: 1.5; font-weight: normal; font-size: 15px; color: #2F3044; min-height: 100%; margin:0; padding:0; width:100%; background-color:#edf2f7">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;margin:0 auto; padding:0; max-width:600px">
                        <tbody>
                            <tr>
                                <td align="center" valign="center" style="text-align:center; padding: 10px">
                                    <a href="<?= base_url();?>" rel="noopener" target="_blank">
                                        <img alt="Logo" src="'.$logo_path.'" style="height:40px" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="center">
                                    <div style="text-align:left; margin: 0 20px; padding: 40px; background-color:#ffffff; border-radius: 6px">
                                        <!--begin:Email content-->
                                        <div style="padding-bottom: 30px; font-size: 17px;">
                                            <strong>Hello!</strong>
                                        </div>
                                        <div style="padding-bottom: 20px">Your Keenthemes password was just changed.</div>
                                        <div style="padding-bottom: 40px">If you did not change your password, please contact our 
                                        <a href="#" rel="noopener" target="_blank" style="text-decoration:none;color: #009EF7; font-weight: bold">support team</a>. Your security is very important to us!</div>
                                        <!--end:Email content-->
                                        <div style="padding-bottom: 10px">Kind regards,
                                        <br>'.$from_name.'
                                        <tr>
                                            <td align="center" valign="center" style="font-size: 13px; text-align:center;padding: 20px; color: #6d6e7c;">
                                                <p>'.$setting->address.'</p>
                                                <p>Copyright © 
                                                <a href="'.base_url().'" rel="noopener" target="_blank">'.$setting->system_name.'</a>.</p>
                                            </td>
                                        </tr></br></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>';

            $this->email->message($message);
            if(!empty($email_setting) && $email_setting->mail_protocol == 'smtp'){
                 $this->email->send(); 
            }else{

                $headers = "MIME-Version: 1.0\r\n";
                $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
                $headers .= "From:  $from_name < $from_email >\r\n";
                $headers .= "Reply-To:  $from_name < $from_email >\r\n"; 
                mail($data->email, $subject, $message, $headers);

            } 
            return TRUE;
                
        }else{
            return FALSE;
        }   
    }
    
}