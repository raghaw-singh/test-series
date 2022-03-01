<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a ><i class="fa fa-edit"></i> Edit Teacher</a>
                </li>
            </ul>
            <div class="tab-content">
                <div >
                    <div class="x_content">
                        <form method="post" id="edit_form" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <input type="hidden" name="id" value="<?=$teacher_info->id; ?>">
                            <input type="hidden" name="user_id" value="<?=$teacher_info->user_id; ?>">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="name" type="text" value="<?= $teacher_info->name ; ?>" />
                                    <span class="text-danger"><?= form_error('name'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('designation');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="designation" class="form-control col-md-7 col-xs-12" type="text" value="<?= $teacher_info->designation ; ?>"  />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('date of birth');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" id="dob" type="text" name="date_of_birth" value="<?= $teacher_info->date_of_birth ; ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('gender');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="gender" class="form-control col-md-7 col-xs-12">
                                        <option value="male"<?php if($teacher_info->gender=='male') {echo 'selected' ;}?> >male</option>
                                        <option value="female" <?php if($teacher_info->gender=='female') {echo 'selected' ;}?>>female</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>    
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('religion');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="religion" class="form-control col-md-7 col-xs-12" type="text" value="<?= $teacher_info->religion ; ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('email');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="email" class="form-control col-md-7 col-xs-12" type="text" value="<?= $teacher_info->email ; ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('phone');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="phone" class="form-control col-md-7 col-xs-12" type="text" value="<?= $teacher_data->phone ; ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('address');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="address" class="form-control col-md-7 col-xs-12" type="text" value="<?= $teacher_info->address ; ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('joining date');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="date_of_joining" class="form-control col-md-7 col-xs-12" type="text"  value="<?= $teacher_info->joining_date ; ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('photo');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="image" type="file" class="form-control"style="opacity: 10; border: 1px groove; outline: 1px" />
                                </div>
                            </div>
                            <div class="row item form-group" style=" margin-left: 260px;">
                                <div class="col-md-3 col-sm-3 col-xs-6">
                                    <?php if(!empty($teacher_data->photo)){ ?>
                                    <img class="img-responsive radioborder" src="<?= base_url('uploads/teacher_image/'.$teacher_data->photo);?>" /><?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a href="<?= base_url('teacher');?>" class="btn btn-primary">Cancel</a>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // $('#dob').datepicker();

    var base_url    =   '<?= base_url();?>';
    $('#edit_form').on('submit',function(){
        $this = $(this);
        $.ajax({
            url: base_url+"teacher/save_edit",
            type:"post",
            //data:$('#setting-form').serialize(),
            data:  new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            success: function(response){        
                var getRes = $.parseJSON(response);
                console.log(getRes);
                if(getRes.status=='true'){  
                    toastr.success(getRes.message);
                    window.setTimeout(function(){
                        window.location.reload();
                    },1000);
                }else if(getRes.status=='false'){
                    toastr.error(getRes.message);
                }else if(getRes.status=='error'){
                    var message = "";
                    $.each(getRes.message, function (index, value) {
                        if(value !=''){
                            toastr.warning(value);
                        }
                    });
                }
            }
        });
    })
</script>
