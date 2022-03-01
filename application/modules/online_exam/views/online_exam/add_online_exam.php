<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a ><i class="fa fa-plus-square-o"></i> <?= get_phrase('add_online_exam') ?></a>
                </li>
            </ul>
            <div class="tab-content">
                <div>
                    <div class="x_content">
                        <form method="post" id="form" autocomplete="off" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('exam_title');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="exam_title" type="text" />
                                    <span class="text-danger"><?= form_error('name'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('description');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="description" />
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
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('section');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="section" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select Section</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('student_group');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="student_group" class="form-control col-md-7 col-xs-12">
                                    	<option>Select Group</option>
                                        <option value="science">science</option>
                                        <option value="arts">arts</option>
                                        <option value="commerce">commerce</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('subject');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="subject" class="form-control col-md-7 col-xs-12">
                                    	<option>Select Subject</option>
                                        <option value="computer">computer</option>
                                        <option value="english">english</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('random_question');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="random_question" class="form-control col-md-7 col-xs-12">
                                    	<option>Select</option>
                                        <option value="yes">yes</option>
                                        <option value="no">no</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('duration');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="duration" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('pass_value');?><span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="pass_value" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('published');?><span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="published" class="form-control col-md-7 col-xs-12">
                                    	<option value="">Select</option>
                                        <option value="yes">yes</option>
                                        <option value="no">no</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
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

    var base_url    =   '<?= base_url();?>';
    $('#form').on('submit',function(){
        $this = $(this);
        $.ajax({
            url: base_url+"online_exam/save_online_exam",
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