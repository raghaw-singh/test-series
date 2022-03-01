<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?php echo get_phrase('change_password'); ?></h3>
                <div class="box-tools pull-right">
                </div>
            </div>
            <div class="box-body">
                <?php echo form_open(site_url('profile/password'), array('name' => 'add', 'id' => 'change_password', 'class'=>'form-horizontal form-label-left','onsubmit'=>'return false'), ''); ?>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password"><?php echo get_phrase('current_password'); ?> <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  class="form-control col-md-7 col-xs-12"  name="current_password"  id="current_password" value="" placeholder="<?php echo get_phrase('current_password'); ?>" type="password">
                            <div class="help-block"><?php echo form_error('current_password'); ?></div>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password"><?php echo get_phrase('password'); ?> <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  class="form-control col-md-7 col-xs-12"  name="password"  id="password" value="" placeholder="<?php echo get_phrase('password'); ?>" type="password">
                            <div class="help-block"><?php echo form_error('password'); ?></div>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="conf_password"><?php echo get_phrase('confirm'); ?> <?php echo get_phrase('password'); ?> <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input  class="form-control col-md-7 col-xs-12"  name="conf_password"  id="conf_password" value="" placeholder="<?php echo get_phrase('confirm'); ?> <?php echo get_phrase('password'); ?>" type="password">
                            <div class="help-block"><?php echo form_error('conf_password'); ?></div>
                        </div>
                    </div>

                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <a href="<?php echo site_url('profile'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                            <button id="send" type="submit" class="btn btn-success btnChangePassword"><?php echo get_phrase('submit'); ?></button>
                        </div>
                    </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('.btnChangePassword').on('click',function(e){
        var $this = $(this);
        var loader  =   '<div class="spinner-border text-secondary" role="status"><span class="sr-only">Loading...</span></div> Please Wait...';
        $('.btnChangePassword').html(loader);
        $.ajax({
            url: baseurl+'profile/changepassword',
            type: 'post',
            data: $('#change_password').serialize(),
            dataType: "json",
            success: function (data) {

                if(data.status=='true'){
                    toastr.success(data.message);
                    $('.btnChangePassword').text('Submit');
                    $('#change_password')[0].reset();
                }else if(data.status=='false'){
                    toastr.error(data.message);
                    $('.btnChangePassword').text('Submit');
                }else{
                    var message = "";
                    $.each(data.message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                    $('.btnChangePassword').text('Submit');
                }
            }
        });
    })
</script>