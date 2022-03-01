<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a ><i class="fa fa-plus-square-o"></i> Add student</a>
                </li>
            </ul>
            <div class="tab-content">
                <div>
                    <div class="x_content">
                        <form method="post" id="student_form" autocomplete="off" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="name" type="text" />
                                    <span class="text-danger"><?= form_error('name'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('guardian');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="guardian" class="form-control col-md-7 col-xs-12">
                                        <option value="">select guardian</option>
                                        <option value="John" >john</option>
                                        <option value="smith">smith</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('date of birth');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" id="dob" type="text" name="date_of_birth" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('gender');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="gender" class="form-control col-md-7 col-xs-12">
                                        <option value="">select gender</option>
                                        <option value="male">male</option>
                                        <option value="female">female</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>    
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('religion');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="religion" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('email');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="email" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('phone');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="phone" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('address');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="address" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('state');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="state" class="form-control col-md-7 col-xs-12 " type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('country');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="country" class="form-control col-md-7 col-xs-12">
                                        <option value="">select country</option>
                                        <option value="india">india</option>
                                        <option value="USA">USA</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('class');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="class" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select Class</option>
                                        <option value="One">One</option>
                                        <option value="Two">Two</option>
                                        <option value="three">Three</option>
                                        <option value="Four">Four</option>
                                        <option value="Five">Five</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('section');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="section" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select section</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('group');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="group" class="form-control col-md-7 col-xs-12">
                                        <option value="science">science</option>
                                        <option value="arts">arts</option>
                                        <option value="commerce">commerce</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('register no');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="register_no" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('roll');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="roll" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('extra curricular activities');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="curricular" class="form-control col-md-7 col-xs-12 " type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('remarks');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="remarks" class="form-control col-md-7 col-xs-12 " type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('photo');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="image" type="file" class="form-control" style="opacity: 10; border: 1px groove; outline: 1px" />
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('password');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="password" class="form-control col-md-7 col-xs-12" type="password" />
                                    <div class="help-block"></div>
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
    $('#student_form').on('submit',function(){
        $this = $(this);
        $.ajax({
            url: base_url+"student/add_student",
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