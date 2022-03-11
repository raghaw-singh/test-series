<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a ><i class="fa fa-plus-square-o"></i> <?= get_phrase('edit_student') ?></a>
                </li>
            </ul>
            <div class="tab-content">
                <div>
                    <div class="x_content">
                        <form method="post" id="edit_form" autocomplete="off" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <input type="hidden" name="user_id" value="<?= $student_info->user_id ?>">
                            <input type="hidden" name="id" value="<?= $student_info->id ?>">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('first_name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="first_name" type="text" value="<?= $student_info->first_name ?>" />
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last_name"><?= get_phrase('last_name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="last_name" type="text" value="<?= $student_info->last_name ?>" />
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('date_of_birth');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" id="dob" type="text" name="date_of_birth" value="<?= $student_info->date_of_birth ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('gender');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="gender" class="form-control col-md-7 col-xs-12">
                                        <option value="">select gender</option>
                                        <option value="male"  <?php if($student_info->gender == 'male') echo 'selected' ;?>><?= get_phrase('male');?></option>
                                        <option value="female"  <?php if($student_info->gender == 'female') echo 'selected' ;?>><?= get_phrase('female');?></option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>    
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('religion');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="religion" class="form-control col-md-7 col-xs-12" type="text" value="<?= $student_info->religion ?>"/>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('email');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="email" class="form-control col-md-7 col-xs-12" type="text" value="<?= $student_info->email ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('phone');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="phone" class="form-control col-md-7 col-xs-12" type="text" value="<?= $student_info->phone ?>"/>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('address');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="address" class="form-control col-md-7 col-xs-12" type="text" value="<?= $student_info->address ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('class');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="class" class="form-control col-md-7 col-xs-12" onchange="get_section_by_class(this.value,'','')">
                                        <option value=""><?= get_phrase('choose_class');?></option>
                                        <?php foreach($classList as $class){?>
                                        <option value="<?= $class->id;?>" <?php if($student_info->class==$class->id) echo 'selected';?>><?= $class->class;?></option>
                                        <?php } ?>
                                    </select>  
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('section');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="section" class="form-control col-md-7 col-xs-12" id="section_id">
                                        <option value=""><?= get_phrase('choose_section');?></option>
                                        
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('roll');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="roll" class="form-control col-md-7 col-xs-12" type="text" value="<?= $student_info->roll ?>"/>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('photo');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="image" type="file" class="form-control" style="opacity: 10; border: 1px groove; outline: 1px" />
                                </div>
                            </div>
                            <div class="row item form-group" style=" margin-left: 260px;">
                                <div class="col-md-3 col-sm-3 col-xs-6">
                                    <?php if(!empty($student_info->photo)){ ?>
                                    <img class="img-responsive radioborder" src="<?= base_url('uploads/student_image/'.$student_info->photo);?>" /><?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a href="<?= base_url('teacher');?>" class="btn btn-primary"><?= get_phrase('cancel');?></a>
                                    <button type="submit" class="btn btn-success"><?= get_phrase('save');?></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>datepicker/css/bootstrap-datetimepicker.css">
<script type="text/javascript" src="<?= VENDOR_URL;?>datepicker/js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript">
    $('#dob').datepicker();

    var base_url    =   '<?= base_url();?>';
    $('#edit_form').on('submit',function(){
        $this = $(this);
        $.ajax({
            url: base_url+"student/save_edit",
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
                    toastr.warning(getRes.message);
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
    <?php if(!empty($student_info->class)){?>
    get_section_by_class(<?= $student_info->class;?>,<?= $student_info->section;?>);
    <?php } ?>
    function get_section_by_class(class_id,section_id){
        get_section(class_id,section_id);
    }

    function get_section(class_id,section_id){
        $.ajax({       
            type   : "POST",
            url    : "<?php echo base_url('ajax/get_section_by_class'); ?>",
            data   : {class_id : class_id,section_id:section_id},  
            success: function(response){                                                   
                if(response)
                {
                    $('#section_id').html(response);
                }
            }
       });
    }
</script>