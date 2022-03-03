<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('add').' '.get_phrase('question_group');?></h3>
                <div class="pull-right">
                    <?php if(has_permission(VIEW,'online_exam','question_group')){?>
                    <a href="<?= base_url('online_exam/question_group/index');?>" class="btn btn-info"><?= get_phrase('question').' '.get_phrase('list');?></a>
                    <?php } ?>
                </div>
            </div>
            <div class="box-body">
                <form method="post" class="form-horizontal" onsubmit="return false" id="form" autocomplete="off">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >
                            <?= get_phrase('title');?>
                            <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="title" type="text" />
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
<script type="text/javascript">

    var base_url    =   '<?= base_url();?>';
    $('#form').on('submit',function(){
        $this = $(this);
        $.ajax({
            url: base_url+"online_exam/question_group/save_add",
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