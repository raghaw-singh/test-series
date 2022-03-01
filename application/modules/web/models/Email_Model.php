<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Email_Model extends CI_Model {
    public $academic_year_id = '';
    public $data = array();
    public $gsms_setting = array();
    function __construct() {
        parent::__construct();
        $academic_year = $this->db->get_where('academic_years', array('is_running'=>1))->row();
        $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();
        if($academic_year){
            $this->academic_year_id = $academic_year->id;
        }
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
            
            $email_setting = $this->web_model->get_single('email_settings', array('status' => 1));
            $setting = $this->web_model->get_single('settings', array('status' => 1));
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
            $startTime = date("Y-m-d H:i");
            $expire_at = date('Y-m-d H:i',strtotime($startTime. ' +1 days'));
            $this->db->update('users', array('reset_key' => $key,'expire_at'=>$expire_at), array('id' => $id));
            $logo_path      =   base_url('uploads/logo/'.$setting->logo);
            $message='
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
                                            <a href="'.site_url('web/auth/reset/' . $key).'" rel="noopener" style="text-decoration:none;display:inline-block;text-align:center;padding:0.75575rem 1.3rem;font-size:0.925rem;line-height:1.5;border-radius:0.35rem;color:#ffffff;background-color:#009EF7;border:0px;margin-right:0.75rem!important;font-weight:600!important;outline:none!important;vertical-align:middle" target="_blank">Reset Password</a>
                                        </div>
                                        <div style="padding-bottom: 30px">This password reset link will expire in 15 minutes. If you did not request a password reset, no further action is required.</div>
                                        <div style="border-bottom: 1px solid #eeeeee; margin: 15px 0"></div>
                                        <div style="padding-bottom: 50px; word-wrap: break-all;">
                                            <p style="margin-bottom: 10px;">Button not working? Try pasting this URL into your browser:</p>
                                            <a href="'.site_url('web/auth/reset/' . $key).'" rel="noopener" target="_blank" style="text-decoration:none;color: #009EF7">'.site_url('web/auth/reset/' . $key).'</a>
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
            
            $email_setting = $this->web_model->get_single('email_settings', array('status' => 1));
            $setting = $this->web_model->get_single('settings', array('status' => 1));
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
            $message='
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
                                            <strong>Hello! '.$full_name.'</strong>
                                        </div>
                                        <div style="padding-bottom: 20px">You have reset password at '.date("Y-m-d h:i:s a").'</div>
                                        <div style="padding-bottom: 40px"> Your security is very important to us!</div>
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
    

    function account_created_mail($email,$id,$full_name) {

        
        if($email){

            $from_email = FROM_EMAIL;
            $from_name  = FROM_NAME;  
            
            $email_setting = $this->db->get_where('email_settings', array('status' => 1))->row();
            $setting = $this->db->get_where('settings', array('status' => 1))->row();
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
            $subject = 'Account Opening From : '. $from_name;
            $this->email->subject($subject);

            $logo_path      =   base_url('uploads/logo/'.$setting->logo);
            $message='
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
                                            <strong>Hello '.$full_name.'</strong>
                                        </div>
                                        <div style="padding-bottom: 20px"></div>
                                        <div style="padding-bottom: 40px"></div>
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
                mail($email, $subject, $message, $headers);

            } 
            return TRUE;
                
        }else{
            return FALSE;
        }   
    }

    function send_verification_link($email='',$fullname='',$activation_code=''){
        if($email){

            $from_email = FROM_EMAIL;
            $from_name  = FROM_NAME;  
            
            $email_setting = $this->db->get_where('email_settings', array('status' => 1))->row();
            $setting = $this->db->get_where('settings', array('status' => 1))->row();
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
            $subject = 'Account Verification From : '. $from_name;
            $this->email->subject($subject);

            $logo_path      =   base_url('uploads/logo/'.$setting->logo);
            $message='
                
                <body style="background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;">
                    <div style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;"></div>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td bgcolor="#FFA73B" align="center">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                                    <tr>
                                        <td align="center" valign="top" style="padding: 40px 10px 40px 10px;"> </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#FFA73B" align="center" style="padding: 0px 10px 0px 10px;">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                                    <tr>
                                        <td bgcolor="#ffffff" align="center" valign="top" style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                                            <h1 style="font-size: 48px; font-weight: 400; margin: 2;"></h1> <img src="'.$logo_path.'" width="125" height="120" style="display: block; border: 0px;" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                                    <tr>
                                        <td bgcolor="#ffffff" align="left" style="padding: 20px 30px 40px 30px; color: #666666; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                                            <p style="margin: 0;">Hey,'.$fullname.'<br/> Complete your registration to get started on '.$from_name.'. Just verify your email address.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#ffffff" align="left">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td bgcolor="#ffffff" align="center" style="padding: 20px 30px 60px 30px;">
                                                        <table border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td align="center" style="border-radius: 3px;" bgcolor="#FFA73B"><a href="'.base_url('web/auth/activateYourAccount/'.$activation_code).'" target="_blank" style="font-size: 20px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 15px 25px; border-radius: 2px; border: 1px solid #FFA73B; display: inline-block;">Verify Your Email Address</a></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr> <!-- COPY -->
                                    <tr>
                                        <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 0px 30px; color: #666666; font-family:  Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                                            <p style="margin: 0;">If that does not work, copy and paste the following link in your browser:</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#ffffff" align="left" style="padding: 20px 30px 20px 30px; color: #666666; font-family:  Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                                            <p style="margin: 0;"><a href="'.base_url('web/auth/activateYourAccount/'.$activation_code).'" target="_blank" style="color: #FFA73B;">'.base_url('web/auth/activateYourAccount/'.$activation_code).'</a></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                                            <p style="margin: 0;">Thanks,<br>'.$from_name.'</p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </body>';

            $this->email->message($message);
            if(!empty($email_setting) && $email_setting->mail_protocol == 'smtp'){
                 $this->email->send(); 
            }else{

                $headers = "MIME-Version: 1.0\r\n";
                $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
                $headers .= "From:  $from_name < $from_email >\r\n";
                $headers .= "Reply-To:  $from_name < $from_email >\r\n"; 
                mail($email, $subject, $message, $headers);

            } 
            return TRUE;
                
        }else{
            return FALSE;
        } 
    }
}