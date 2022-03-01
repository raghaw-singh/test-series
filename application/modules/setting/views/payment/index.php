<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('payment').' '.get_phrase('setting');?></h3>
            </div>
            <ul class="nav nav-tabs">                     
                <li  class="<?php echo isset($paypal) ? 'active':''; ?>"><a href="#tab_paypal_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo get_phrase('paypal'); ?> <?php echo get_phrase('setting'); ?></a> </li>                          
                <li  class="<?php echo isset($payumoney) ? 'active':''; ?>"><a href="#tab_pumoney_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('setting'); ?></a> </li>                          
                <!-- <li  class="<?php echo isset($paytm) ? 'active':''; ?>"><a href="#tab_paytm_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo get_phrase('paytm'); ?> <?php echo get_phrase('setting'); ?></a> </li>  -->     
                <li  class="<?php echo isset($stripe) ? 'active':''; ?>"><a href="#tab_stripe_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo get_phrase('stripe'); ?> <?php echo get_phrase('setting'); ?></a> </li>            
            </ul>
            <div class="tab-content">
       
                <div class="tab-pane fade in <?php echo isset($paypal) ? 'active':''; ?>" id="tab_paypal_setting">
                    <div class="x_content"> 
                        <?php echo form_open_multipart(site_url('setting/payment/paypal'), array('name' => 'paypal', 'id' => 'paypal', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                        <input type="hidden" value="1" name="paypal" />                 
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paypal_email"><?php echo get_phrase('paypal'); ?> <?php echo get_phrase('email'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paypal_email" value="<?php echo isset($setting) ? $setting->paypal_email : ''; ?>"  placeholder="<?php echo get_phrase('paypal'); ?> <?php echo get_phrase('email'); ?>" required="required" type="email">
                                <div class="help-block"><?php echo form_error('paypal_email'); ?></div>
                            </div>
                        </div>                  
                
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paypal_demo"><?php echo get_phrase('is_demo'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="paypal_demo" required="required">
                                    <option value="1" <?php if(isset($setting) && $setting->paypal_demo == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                    <option value="0" <?php if(isset($setting) && $setting->paypal_demo == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('paypal_demo'); ?></div>
                            </div>
                        </div>
                        
                         <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paypal_extra_charge"><?php echo get_phrase('paypal'); ?> <?php echo get_phrase('extra_charge'); ?> (%)</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paypal_extra_charge" value="<?php echo isset($setting) ? $setting->paypal_extra_charge : ''; ?>"  placeholder="<?php echo get_phrase('paypal'); ?> <?php echo get_phrase('extra_charge'); ?>" type="number">
                                <div class="help-block"><?php echo form_error('paypal_extra_charge'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paypal_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="paypal_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->paypal_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->paypal_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('paypal_status'); ?></div>
                            </div>
                        </div>
                  
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://www.paypal.com" target="_blank"><img src="<?php echo IMG_URL; ?>paypal-setting.png" alt="" /></a> 
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
                </div> 
             
                <div class="tab-pane fade in <?php echo isset($payumoney) ? 'active':''; ?>" id="tab_pumoney_setting">
                    <div class="x_content"> 
                        <?php echo form_open_multipart(site_url('setting/payment/payumoney'), array('name' => 'payumoney', 'id' => 'payumoney', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                         <input type="hidden" value="1" name="payumoney" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="payumoney_key"><?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('key'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="payumoney_key" value="<?php echo isset($setting) ? $setting->payumoney_key : ''; ?>"  placeholder="<?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('key'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('payumoney_key'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="payumoney_salt"><?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('key_salt'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="payumoney_salt" value="<?php echo isset($setting) ? $setting->payumoney_salt : ''; ?>"  placeholder="<?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('key_salt'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('payumoney_salt'); ?></div>
                            </div>
                        </div>                  
                
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="payumoney_demo"><?php echo get_phrase('is_demo'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="payumoney_demo" required="required">
                                    <option value="1" <?php if(isset($setting) && $setting->payumoney_demo == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                    <option value="0" <?php if(isset($setting) && $setting->payumoney_demo == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('payumoney_demo'); ?></div>
                            </div>
                        </div>
                        
                         <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="payu_extra_charge"><?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('extra_charge'); ?> (%)</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="payu_extra_charge" value="<?php echo isset($setting) ? $setting->payu_extra_charge : ''; ?>"  placeholder="<?php echo get_phrase('payumoney'); ?> <?php echo get_phrase('extra_charge'); ?>" type="number">
                                <div class="help-block"><?php echo form_error('payu_extra_charge'); ?></div>
                            </div>
                        </div> 
                         
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="payumoney_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="payumoney_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->payumoney_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->payumoney_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('payumoney_status'); ?></div>
                            </div>
                        </div>
                  
                         <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://www.payumoney.com/" target="_blank"><img src="<?php echo IMG_URL; ?>paym-setting.png" alt="" /></a> 
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
                </div> 
             
                <div class="tab-pane fade in <?php echo isset($paytm) ? 'active':''; ?>" id="tab_paytm_setting">
                    <div class="x_content"> 
                        <?php echo form_open_multipart(site_url('setting/payment/paytm'), array('name' => 'paytm', 'id' => 'paytm', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                         <input type="hidden" value="1" name="paytm" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_merchant_key"><?php echo get_phrase('paytm'); ?> <?php echo get_phrase('merchant_key'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paytm_merchant_key" value="<?php echo isset($setting) ? $setting->paytm_merchant_key : ''; ?>"  placeholder="<?php echo get_phrase('paytm'); ?> <?php echo get_phrase('merchant_key'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('paytm_merchant_key'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_merchant_mid"><?php echo get_phrase('paytm'); ?> <?php echo get_phrase('merchant_mid'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paytm_merchant_mid" value="<?php echo isset($setting) ? $setting->paytm_merchant_mid : ''; ?>"  placeholder="<?php echo get_phrase('paytm'); ?> <?php echo get_phrase('merchant_mid'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('paytm_merchant_mid'); ?></div>
                            </div>
                        </div> 
                         
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_merchant_website"><?php echo get_phrase('paytm'); ?> <?php echo get_phrase('website'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paytm_merchant_website" value="<?php echo isset($setting) ? $setting->paytm_merchant_website : ''; ?>"  placeholder="<?php echo get_phrase('paytm'); ?> <?php echo get_phrase('website'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('paytm_merchant_website'); ?></div>
                            </div>
                        </div>     
                         
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_industry_type"><?php echo get_phrase('paytm'); ?> <?php echo get_phrase('industry_type'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paytm_industry_type" value="<?php echo isset($setting) ? $setting->paytm_industry_type : ''; ?>"  placeholder="<?php echo get_phrase('paytm'); ?> <?php echo get_phrase('industry_type'); ?>" required="required" type="text" autocomplete="off">
                                <div class="help-block"><?php echo form_error('paytm_industry_type'); ?></div>
                            </div>
                        </div>    
                
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_demo"><?php echo get_phrase('is_demo'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="paytm_demo" required="required">
                                    <option value="1" <?php if(isset($setting) && $setting->paytm_demo == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                    <option value="0" <?php if(isset($setting) && $setting->paytm_demo == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('paytm_demo'); ?></div>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_extra_charge"><?php echo get_phrase('paytm'); ?> <?php echo get_phrase('extra_charge'); ?> (%)</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="paytm_extra_charge" value="<?php echo isset($setting) ? $setting->paytm_extra_charge : ''; ?>"  placeholder="<?php echo get_phrase('paytm'); ?> <?php echo get_phrase('extra_charge'); ?>" type="number">
                                <div class="help-block"><?php echo form_error('paytm_extra_charge'); ?></div>
                            </div>
                        </div>   
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="paytm_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="paytm_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->paytm_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->paytm_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('paytm_status'); ?></div>
                            </div>
                        </div>
                  
                         <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://paytm.com/" target="_blank"><img src="<?php echo IMG_URL; ?>paytm-setting.png" alt="" /></a> 
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
                </div> 
                <div class="tab-pane fade in <?php echo isset($stripe) ? 'active':''; ?>" id="tab_stripe_setting">
                    <div class="x_content"> 
                        <?php echo form_open_multipart(site_url('setting/payment/stripe'), array('name' => 'stripe', 'id' => 'stripe', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                         <input type="hidden" value="1" name="stripe" />
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stripe_api_key"><?php echo get_phrase('stripe_api_key'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="stripe_api_key" value="<?php echo isset($setting) ? $setting->stripe_api_key : ''; ?>"  placeholder="<?php echo get_phrase('stripe_api_key'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('stripe_api_key'); ?></div>
                            </div>
                        </div>
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stripe_publishable_key"><?php echo get_phrase('stripe_publishable_key'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="stripe_publishable_key" value="<?php echo isset($setting) ? $setting->stripe_publishable_key : ''; ?>"  placeholder="<?php echo get_phrase('stripe_publishable_key'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('stripe_publishable_key'); ?></div>
                            </div>
                        </div> 
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stripe_currency"><?php echo get_phrase('stripe_currency'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="stripe_currency" value="<?php echo isset($setting) ? $setting->stripe_currency : ''; ?>"  placeholder="<?php echo get_phrase('stripe_currency'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('stripe_currency'); ?></div>
                            </div>
                        </div> 
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stripe_demo"><?php echo get_phrase('is_demo'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="stripe_demo" required="required">
                                    <option value="1" <?php if(isset($setting) && $setting->stripe_demo == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                    <option value="0" <?php if(isset($setting) && $setting->stripe_demo == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('stripe_demo'); ?></div>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stripe_extra_charge"><?php echo get_phrase('paytm'); ?> <?php echo get_phrase('extra_charge'); ?> (%)</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="stripe_extra_charge" value="<?php echo isset($setting) ? $setting->stripe_extra_charge : ''; ?>"  placeholder="<?php echo get_phrase('stripe'); ?> <?php echo get_phrase('extra_charge'); ?>" type="number">
                                <div class="help-block"><?php echo form_error('stripe_extra_charge'); ?></div>
                            </div>
                        </div>   
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stripe_status"><?php echo get_phrase('is_active'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-7 col-xs-12"  name="stripe_status" required="required">
                                    <option value="0" <?php if(isset($setting) && $setting->stripe_status == '0'){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>
                                    <option value="1" <?php if(isset($setting) && $setting->stripe_status == '1'){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>
                                </select>
                                <div class="help-block"><?php echo form_error('stripe_status'); ?></div>
                            </div>
                        </div>
                  
                         <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <a href="https://stripe.com/en-in" target="_blank"><img src="<?php echo IMG_URL; ?>stripe-setting.png" alt="" /></a> 
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
                </div> 
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#paypal").validate();  
    $("#paytm").validate();  
    $("#payumoney").validate(); 
</script>