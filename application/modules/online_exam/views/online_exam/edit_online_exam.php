<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a ><i class="fa fa-plus-square-o"></i> <?= get_phrase('edit_online_exam') ?></a>
                </li>
            </ul>
            <div class="tab-content">
                <div>
                    <div class="x_content">
                        <form method="post" id="form" autocomplete="off" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <input type="hidden" name="id" value="<?= $exam_info->id ?>">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('exam_title');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="exam_title" type="text" value="<?= $exam_info->exam_title ?>" />
                                    <span class="text-danger"><?= form_error('name'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('description');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="description" value="<?= $exam_info->description ?>"/>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('class');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="class" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select Class</option>
                                        <?php foreach($classData as $obj){ ?>
                                        <option value="<?= $obj->class ?>"><?= $obj->class ?></option>
                                        <?php }?>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('section');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="section" class="form-control col-md-7 col-xs-12">
                                        <option value="">Select Section</option>
                                        <?php foreach($sectionData as $obj){ ?>
                                        <option value="<?= $obj->section ?>"><?= $obj->section ?></option>
                                        <?php }?>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('student_group');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="student_group" class="form-control col-md-7 col-xs-12">
                                    	<option>Select Group</option>
                                        <?php foreach($groupData as $obj){ ?>
                                        <option value="<?= $obj->title ?>"><?= $obj->title ?></option>
                                        <?php }?>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('subject');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="subject" class="form-control col-md-7 col-xs-12">
                                    	<option>Select Subject</option>
                                        <?php foreach($subjectData as $obj){ ?>
                                        <option value="<?= $obj->subject_name ?>"><?= $obj->subject_name ?></option>
                                        <?php }?>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('random_question');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="random_question" class="form-control col-md-7 col-xs-12">
                                    	<option>Select</option>
                                        <option value="yes" <?php if($exam_info->random_question == 'yes') echo 'selected' ?> >yes</option>
                                        <option value="no" <?php if($exam_info->random_question == 'no') echo 'selected' ?> >no</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('duration');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="duration" value="<?= $exam_info->duration ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('pass_value');?><span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="pass_value" value="<?= $exam_info->pass_value ?>" />
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
            url: base_url+"online_exam/online_exam/update_exam",
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