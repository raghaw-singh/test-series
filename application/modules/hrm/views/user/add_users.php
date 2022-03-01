<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage').' '.get_phrase('users');?></h3>
                <div class="box-tools pull-right">
                    <?php if(has_permission(ADD,'hrm','users')){?>
                    <a href="<?= base_url('hrm/users/index')?>" class="btn btn-primary btn-sm btn-info"><i class="fa fa-list-ol"></i> <?= get_phrase('users').' '.get_phrase('list');?></a>
                    <?php } ?>
                </div>
            </div>  
            <div class="box-body">
                <form autocomplete="off" method="post" enctype="multipart/form-data" action="<?= base_url('hrm/users/saveUsers');?>" id="add_user_form" onsubmit="return false">
                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="name"><?php echo get_phrase('name'); ?> <span class="required">*</span></label>
                                <input  class="form-control"  name="name"  id="name" value="<?php echo isset($post['name']) ?  $post['name'] : ''; ?>" placeholder="<?php echo get_phrase('name'); ?>"  type="text">
                                <div class="help-block"><?php echo form_error('name'); ?></div> 
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="national_id"><?php echo get_phrase('national_id'); ?> </label>
                                <input  class="form-control"  name="national_id"  id="national_id" value="<?php echo isset($post['national_id']) ?  $post['national_id'] : ''; ?>" placeholder="<?php echo get_phrase('national_id'); ?>" type="text">
                                <div class="help-block"><?php echo form_error('national_id'); ?></div> 
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="phone"><?php echo get_phrase('phone'); ?> <span class="required">*</span></label>
                                <input  class="form-control"  name="phone"  id="phone" value="<?php echo isset($post['phone']) ?  $post['phone'] : ''; ?>" placeholder="<?php echo get_phrase('phone'); ?>"  type="text">
                                <div class="help-block"><?php echo form_error('phone'); ?></div> 
                            </div>
                        </div>
                        
                    
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="gender"><?php echo get_phrase('gender'); ?> <span class="required">*</span></label>
                                <select  class="form-control"  name="gender"  id="gender" >
                                    <option value="">--<?php echo get_phrase('select'); ?>--</option>
                                    <?php $genders = get_genders(); ?>
                                    <?php foreach($genders as $key=>$value){ ?>
                                        <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                                    <?php } ?>
                                </select>
                                <div class="help-block"><?php echo form_error('gender'); ?></div> 
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="email"><?php echo get_phrase('email'); ?> <span class="required">*</span></label>
                                <input  class="form-control col-md-7 col-xs-12"  name="email"  id="email" value="<?php echo isset($post['email']) ?  $post['email'] : ''; ?>" placeholder="<?php echo get_phrase('email'); ?>" type="email" autocomplete="off">
                                <div class="help-block"><?php echo form_error('email'); ?></div>
                            </div>
                        </div>                                    
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="password"><?php echo get_phrase('password'); ?> <span class="required">*</span></label>
                                <input  class="form-control col-md-7 col-xs-12"  name="password"  id="password" value="" placeholder="<?php echo get_phrase('password'); ?>"  type="text">
                                <div class="help-block"><?php echo form_error('password'); ?></div>
                            </div>
                        </div>                                
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="role_id"><?php echo get_phrase('role'); ?> <span class="required">*</span></label>
                                <select  class="form-control col-md-7 col-xs-12 quick-field" name="role_id" id="role_id" >
                                    <option value="">--<?php echo get_phrase('select'); ?>--</option>
                                    <?php foreach($roles as $obj){ ?> ?>
                                        <option value="<?php echo $obj->id; ?>"><?php echo $obj->name; ?></option>
                                    <?php } ?>
                                </select>
                                <div class="help-block"><?php echo form_error('role_id'); ?></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label for="present_address"><?php echo get_phrase('present'); ?> <?php echo get_phrase('address'); ?> </label>
                                <textarea  class="form-control"  name="present_address"  id="present_address" placeholder="<?php echo get_phrase('present'); ?> <?php echo get_phrase('address'); ?>"><?php echo isset($post['present_address']) ?  $post['present_address'] : ''; ?></textarea>
                                <div class="help-block"><?php echo form_error('present_address'); ?></div>
                            </div>
                        </div>
                        
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label for="permanent_address"><?php echo get_phrase('permanent'); ?> <?php echo get_phrase('address'); ?></label>
                                <textarea  class="form-control"  name="permanent_address"  id="permanent_address"  placeholder="<?php echo get_phrase('permanent'); ?> <?php echo get_phrase('address'); ?>"><?php echo isset($post['permanent_address']) ?  $post['permanent_address'] : ''; ?></textarea>
                                <div class="help-block"><?php echo form_error('permanent_address'); ?></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="is_view_on_web"><?php echo get_phrase('is_view_on_web'); ?> </label>
                                <select  class="form-control col-md-7 col-xs-12" name="is_view_on_web" id="is_view_on_web">
                                    <option value="">--<?php echo get_phrase('select'); ?>--</option>                                                                                    
                                    <option value="1"><?php echo get_phrase('yes'); ?></option>                                           
                                    <option value="0"><?php echo get_phrase('no'); ?></option>                                           
                                </select>
                                <div class="help-block"><?php echo form_error('is_view_on_web'); ?></div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <label for="photo"><?php echo get_phrase('users'); ?> <?php echo get_phrase('photo'); ?> </label>
                                <input  class="form-control dropify"  name="photo"  id="photo" value="" placeholder="email" type="file">
                                <div class="text-info"><?php echo get_phrase('valid_file_format_img'); ?></div>
                                <div class="help-block"><?php echo form_error('photo'); ?></div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-6">
                                <a href="<?php echo site_url('hrm/users'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <input type="hidden" name="submit" value="submit">
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('save'); ?></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>dist/css/dropify.min.css">
<script type="text/javascript" src="<?= VENDOR_URL;?>dist/js/dropify.min.js"></script>
<script type="text/javascript">
    $('.dropify').dropify();
    var base_url    =   '<?= base_url();?>';
    $('#add_user_form').submit(function(e){
        e.preventDefault(); 
        $this = $(this);
        $.ajax({
            url: base_url+"hrm/users/saveUsers",
            type:"post",
            data:new FormData(this), //this is formData
            processData:false,
            contentType:false,
            cache:false,
            async:false,
            //data:$('#profile').serialize(),
            success: function(html){        
                var get_res = $.parseJSON(html);
                if(get_res.status=='true'){  
                    toastr.success(get_res.message);
                    $('#add_user_form')[0].reset();
                    $('.btn-success').text('save');
                }else if(get_res.status=='false'){
                    toastr.error(get_res.message);
                }else{
                     var message = "";
                    $.each(get_res  .message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                }
            }
        });
    });    
</script>