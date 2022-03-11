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
                                    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('description');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <textarea class="form-control" name="description" rows="6"></textarea>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('class');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="class" class="form-control col-md-7 col-xs-12" onchange="get_section_by_class(this.value,'','')">
                                        <option value=""><?= get_phrase('choose_class');?></option>
                                        <?php foreach($classData as $obj){ ?>
                                        <option value="<?= $obj->id;?>"><?= $obj->class ?></option>
                                        <?php }?>
                                    </select>    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('section');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="section" class="form-control col-md-7 col-xs-12" id="section_id">
                                        <option value=""><?= get_phrase('choose_section');?></option>
                                        
                                    </select>    
                                    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('subject');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="subject" class="form-control col-md-7 col-xs-12">
                                    	<option>Select Subject</option>
                                        <?php foreach($subjectData as $sub){ ?>
                                        <option value="<?= $sub->id;?>"><?= $sub->subject_name ?></option>
                                        <?php }?>
                                    </select>    
                                    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('random_question');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="random_question" class="form-control col-md-7 col-xs-12">
                                    	<option>Select</option>
                                        <option value="yes"><?= get_phrase('yes');?></option>
                                        <option value="no"><?= get_phrase('no');?></option>
                                    </select>    
                                    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('duration');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="duration" />
                                    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('pass_value');?><span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" type="text" name="pass_value" />
                                    
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('published');?><span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="published" class="form-control col-md-7 col-xs-12">
                                    	<option value=""><?= get_phrase('choose');?></option>
                                        <option value="yes"><?= get_phrase('yes');?></option>
                                        <option value="no"><?= get_phrase('no');?></option>
                                    </select>    
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
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
    function get_section_by_class(class_id){
        get_section(class_id);
    }

    function get_section(class_id){
        $.ajax({       
            type   : "POST",
            url    : "<?php echo base_url('ajax/get_section_by_class'); ?>",
            data   : {class_id : class_id},  
            success: function(response){                                                   
                if(response)
                {
                    $('#section_id').html(response);
                }
            }
       });
    }
</script>