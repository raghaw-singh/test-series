<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('sms').' '.get_phrase('setting');?></h3>
            </div>
            <ul class="nav nav-tabs">
                <li class="<?php echo isset($clickatell) ? 'active':''; ?>"><a href="#tab_1" data-toggle="tab" aria-expanded="false"><?= get_phrase('clickatell').' '.get_phrase('SMS_gateway');?></a></li>
                <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false"><?= get_phrase('twilio').' '.get_phrase('SMS_gateway');?></a></li>
                <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false"><?= get_phrase('bulk').' '.get_phrase('SMS_gateway');?></a></li>
                <li class=""><a href="#tab_4" data-toggle="tab" aria-expanded="false"><?= get_phrase('MSG91').' '.get_phrase('SMS_gateway');?></a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <?php echo form_open_multipart(site_url('setting/sms/clickatell'), array('name' => 'clickatell', 'id' => 'clickatell', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                        <input type="hidden" value="1" name="clickatell" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_username"><?php echo get_phrase('username'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="clickatell_username" value="<?php echo isset($setting) ? $setting->clickatell_username : ''; ?>"  placeholder="<?php echo get_phrase('username'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('clickatell_username'); ?></div>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_password"><?php echo get_phrase('password'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="clickatell_password" value="<?php echo isset($setting) ? $setting->clickatell_password : ''; ?>"  placeholder="<?php echo get_phrase('password'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('clickatell_password'); ?></div>
                            </div>
                        </div>                  
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_api_key"><?php echo get_phrase('api_key'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="clickatell_api_key" value="<?php echo isset($setting) ? $setting->clickatell_api_key : ''; ?>"  placeholder="<?php echo get_phrase('api_key'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('clickatell_api_key'); ?></div>
                            </div>
                        </div>       
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_from_number"><?php echo get_phrase('from_number'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="clickatell_from_number" value="<?php echo isset($setting) ? $setting->clickatell_from_number : ''; ?>"  placeholder="<?php echo get_phrase('from_number'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('clickatell_from_number'); ?></div>
                            </div>
                        </div>       
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_mo_no"><?php echo get_phrase('clickatell_mo_no'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="clickatell_mo_no" value="<?php echo isset($setting) ? $setting->clickatell_mo_no : ''; ?>"  placeholder="<?php echo get_phrase('clickatell_mo_no'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('clickatell_mo_no'); ?></div>
                            </div>
                        </div>       
                
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="clickatell_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->clickatell_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->clickatell_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('clickatell_status'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://www.clickatell.com/" target="_blank"><img src="<?php echo IMG_URL; ?>clickatell-sms.png" alt="" /></a> 
                            </div>
                        </div>
                  
                 
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ? get_phrase('update') : get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane <?php echo isset($twilio) ? 'active':''; ?>" id="tab_2">
                    <?php echo form_open_multipart(site_url('setting/sms/twilio'), array('name' => 'twilio', 'id' => 'twilio', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                        <input type="hidden" value="1" name="twilio" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_account_sid"><?php echo get_phrase('account_sid'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="twilio_account_sid" value="<?php echo isset($setting) ? $setting->twilio_account_sid : ''; ?>"  placeholder="twilio_account_sid" required="required" type="text">
                                <div class="help-block"><?php echo form_error('twilio_account_sid'); ?></div>
                            </div>
                        </div>                                               
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_auth_token"><?php echo get_phrase('auth_token'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="twilio_auth_token" value="<?php echo isset($setting) ? $setting->twilio_auth_token : ''; ?>"  placeholder="twilio_auth_token" required="required" type="text">
                                <div class="help-block"><?php echo form_error('twilio_auth_token'); ?></div>
                            </div>
                        </div>                                               
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_from_number"><?php echo get_phrase('from_number'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="twilio_from_number" value="<?php echo isset($setting) ? $setting->twilio_from_number : ''; ?>"  placeholder="twilio_from_number" required="required" type="text">
                                <div class="help-block"><?php echo form_error('twilio_from_number'); ?></div>
                            </div>
                        </div>                                               
               
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="twilio_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->twilio_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->twilio_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('twilio_status'); ?></div>
                            </div>
                        </div>
                  
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://www.twilio.com" target="_blank"><img src="<?php echo IMG_URL; ?>twilio-sms.png" alt="" /></a> 
                            </div>
                        </div>
                        
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  get_phrase('update') : get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane <?php echo isset($bulk) ? 'active':''; ?>" id="tab_3">
                    <?php echo form_open_multipart(site_url('setting/sms/bulk'), array('name' => 'bulk', 'id' => 'bulk', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                        <input type="hidden" value="1" name="bulk" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bulk_username"><?php echo get_phrase('username'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="bulk_username" value="<?php echo isset($setting) ? $setting->bulk_username : ''; ?>"  placeholder="<?php echo get_phrase('username'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('bulk_username'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bulk_password"><?php echo get_phrase('password'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="bulk_password" value="<?php echo isset($setting) ? $setting->bulk_password : ''; ?>"  placeholder="<?php echo get_phrase('password'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('bulk_password'); ?></div>
                            </div>
                        </div>                  
                
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bulk_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="bulk_status">
                                    <option value="0" <?php if(isset($setting) && $setting->bulk_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->bulk_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('bulk_status'); ?></div>
                            </div>
                        </div>
                         
                         <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://www.bulksms.com/" target="_blank"><img src="<?php echo IMG_URL; ?>bulk-sms.png" alt="" /></a> 
                            </div>
                        </div>
                         
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ? get_phrase('update') : get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>
                <!-- /.tab-pane -->
                <!-- /.tab-pane -->
                <div class="tab-pane <?php echo isset($msg91) ? 'active':''; ?>" id="tab_4">
                    <?php echo form_open_multipart(site_url('setting/sms/msg91'), array('name' => 'msg91', 'id' => 'msg91', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                        <input type="hidden" value="1" name="msg91" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="msg91_auth_key"><?php echo get_phrase('auth_key'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="msg91_auth_key" value="<?php echo isset($setting) ? $setting->msg91_auth_key : ''; ?>"  placeholder="<?php echo get_phrase('auth_key'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('msg91_auth_key'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="msg91_sender_id"><?php echo get_phrase('sender_id'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="msg91_sender_id" value="<?php echo isset($setting) ? $setting->msg91_sender_id : ''; ?>"  placeholder="<?php echo get_phrase('sender_id'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('msg91_sender_id'); ?></div>
                            </div>
                        </div>                  
     
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="msg91_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="msg91_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->msg91_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->msg91_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('msg91_status'); ?></div>
                            </div>
                        </div>
                  
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://msg91.com/" target="_blank"><img src="<?php echo IMG_URL; ?>msg91-sms.png" alt="" /></a> 
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  get_phrase('update'): get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>
                <!-- /.tab-pane -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#clickatell").validate();  
    $("#twilio").validate();  
    $("#bulk").validate();  
    $("#msg91").validate(); 
</script>