<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('reset_user_password');?></h3>
                <div class="box-tools pull-right">
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php echo form_open(site_url('administrator/email'), array('name' => 'add', 'id' => 'add','class'=>'form-horizontal'), ''); ?>
                    <div class="item form-group"> 
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo get_phrase('user'); ?> <?php echo get_phrase('type'); ?> <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select  class="form-control col-md-12 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '');">
                                <option value="">--<?php echo get_phrase('select'); ?>--</option> 
                                <?php foreach($roles as $obj ){ ?>
                                <option value="<?php echo $obj->id; ?>"><?php echo $obj->name; ?></option>
                                <?php } ?>                                            
                            </select>
                            <div class="help-block"><?php echo form_error('role_id'); ?></div>
                        </div>
                    </div>
                    <div class="item form-group">  
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_id"><?php echo get_phrase('user'); ?> <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select  class="form-control col-md-12 col-xs-12"  name="user_id"  id="user_id" required="required" >
                                <option value="">--<?php echo get_phrase('select'); ?>--</option>                                                                                         
                            </select>
                            <div class="help-block"><?php echo form_error('user_id'); ?></div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email"><?php echo get_phrase('email'); ?> <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  class="form-control col-md-7 col-xs-12"  name="email"  id="email" value="" placeholder="<?php echo get_phrase('email'); ?>" required="required" type="email">
                            <div class="help-block"><?php echo form_error('email'); ?></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <a href="<?php echo site_url('administrator/user'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                            <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('update'); ?></button>
                        </div>
                    </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
    function get_user_by_role(role_id, user_id){       
        get_user(role_id, user_id);      
    }
   
    function get_user(role_id, user_id){
       
        if(role_id == ''){
            role_id = $('#role_id').val();
        }
       
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_user_by_role'); ?>",
            data   : { role_id : role_id, user_id:user_id, message:true},               
            async  : false,
            success: function(response){                                                   
                if(response)
                {
                   $('#user_id').html(response); 
                }
            }
        }); 
    }
   
    $("#add").validate({
        rules: {
        password: {
            required: true,
            minlength: 6
        },
        conf_password: {
            required: true,
            minlength: 6,
            equalTo: "#password"
        }
        }  
    }); 

</script> 
