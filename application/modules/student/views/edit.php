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
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="name" type="text" value="<?= $student_info->first_name ?>" />
                                    <span class="text-danger"><?= form_error('name'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('guardian');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="guardian" class="form-control col-md-7 col-xs-12">
                                        <option value="">select guardian</option>
                                        <option value="john" <?php if($student_info->guardian == 'john') echo 'selected' ;?> >john</option>
                                        <option value="smith" <?php if($student_info->guardian == 'smith') echo 'selected' ;?>>smith</option>
                                    </select>    
                                    <div class="help-block"></div>
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
                                        <option value="male"  <?php if($student_info->gender == 'male') echo 'selected' ;?>>male</option>
                                        <option value="female"  <?php if($student_info->gender == 'female') echo 'selected' ;?>>female</option>
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
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('state');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="state" class="form-control col-md-7 col-xs-12 " type="text" value="<?= $student_info->state ?>"/>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('country');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="country" class="form-control col-md-7 col-xs-12">
                                        <option value="">select country</option>
                                        <option value="india"  <?php if($student_info->country == 'india') echo 'selected' ;?>>india</option>
                                        <option value="USA"  <?php if($student_info->country == 'USA') echo 'selected' ;?>>USA</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('class');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="class" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select Class</option>
                                        <option value="One" <?php if($student_info->class == 'One') echo 'selected' ;?>>One</option>
                                        <option value="Two" <?php if($student_info->class == 'Two') echo 'selected' ;?>>Two</option>
                                        <option value="three" <?php if($student_info->class == 'Thgree') echo 'selected' ;?>>Three</option>
                                        <option value="Four" <?php if($student_info->class == 'Four') echo 'selected' ;?>>Four</option>
                                        <option value="Five" <?php if($student_info->class == 'Five') echo 'selected' ;?>>Five</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('section');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="section" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select section</option>
                                        <option value="A" <?php if($student_info->section == 'A') echo 'selected' ;?>>A</option>
                                        <option value="B" <?php if($student_info->section == 'B') echo 'selected' ;?>>B</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('group');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="group" class="form-control col-md-7 col-xs-12">
                                        <option value="science" <?php if($student_info->group == 'science') echo 'selected' ;?>>science</option>
                                        <option value="arts" <?php if($student_info->group == 'arts') echo 'selected' ;?>>arts</option>
                                        <option value="commerce" <?php if($student_info->group == 'commerce') echo 'selected' ;?>>commerce</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('register no');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="register_no" class="form-control col-md-7 col-xs-12" type="text" value="<?= $student_info->register_no ?>"/>
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
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('extra curricular activities');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="curricular" class="form-control col-md-7 col-xs-12 " type="text" value="<?= $student_info->curricular ?>"/>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('remarks');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="remarks" class="form-control col-md-7 col-xs-12 " type="text" value="<?= $student_info->remarks ?>"/>
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