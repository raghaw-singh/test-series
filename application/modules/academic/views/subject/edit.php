<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a ><i class="fa fa-plus-square-o"></i> <?= get_phrase('edit_subject') ?></a>
                </li>
            </ul>
            <div class="tab-content">
                <div>
                    <div class="x_content">
                        <form method="post" id="form" autocomplete="off" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <input type="hidden" name="id" value="<?= $subject_info->id ?>">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('class');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="class" class="form-control col-md-7 col-xs-12">
                                        <option value="">select</option>
                                        <?php foreach ($class_info as $obj) { ?>
                                        <option value="<?= $obj->class ?>"> <?= $obj->class?></option>
                                        <?php } ?>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('teacher_name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="teacher_name" class="form-control col-md-7 col-xs-12">
                                        <option value="">select</option>
                                        <?php foreach ($teachers_info as $obj) { ?>
                                        <option value="<?= $obj->name ?>"> <?= $obj->name ?></option>
                                        <?php } ?>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('type');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="type" class="form-control col-md-7 col-xs-12">
                                        <option value="">select</option>
                                        <option value="optional">Optional</option>
                                        <option value="mandatory">Mandatory</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('pass_mark');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="pass_mark" type="text" value="<?= $subject_info->pass_mark ?>" />
                                    <span class="text-danger"><?= form_error('pass_mark'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('final_mark');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="final_mark" type="text" value="<?= $subject_info->final_mark ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('subject_name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="subject_name" type="text" value="<?= $subject_info->subject_name ?>" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('subject_code');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="subject_code" type="text" value="<?= $subject_info->subject_code ?>"/>
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
            url: base_url+"academic/subject/save_edit",
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