<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('add').' '.get_phrase('question');?></h3>
            </div>
            <div class="box-body">
            	<form method="post" class="form-horizontal" onsubmit="return false" id="add_question_form" autocomplete="off">
                	<input type="hidden" name="id" value="<?= $question_bank_info->id; ?>">
            		<div class="item form-group">
                  		<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"> <?= get_phrase('question_group');?><span class="required">*</span></label>
                  		<div class="col-md-6 col-sm-6 col-xs-12">
                      		<select name="question_group" class="form-control select2">
                          		<option value="">Select</option>
                          		<?php foreach($questionGroup as $group) { ?>
                          		<option value="<?= $group->title ;?>" <?php if($question_bank_info->question_group == $group->title) echo 'selected'; ?> ><?= $group->title ;?></option>
                          		<?php } ?>
                      		</select>
                  		</div>
                	</div>
                    <div class="row form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('difficult_level');?></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="difficult_level" class="form-control select2">
                                <option value="">Select</option>
                                <option value="easy" <?php if($question_bank_info->difficult_level == 'easy') echo 'selected'; ?>>easy</option>
                                <option value="medium" <?php if($question_bank_info->difficult_level == 'medium') echo 'selected'; ?>>medium</option>
                                <option value="hard" <?php if($question_bank_info->difficult_level == 'hard') echo 'selected'; ?>>hard</option>
                            </select>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                            <?= get_phrase('question');?>
                            <span class="required">*</span>
                        </label>
                        <div class="col-md-9">
                            <textarea class="form-control" id="question" name="main_question"><?= $question_bank_info->question; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
    				    <label for="photo" class="col-sm-3 control-label"> <?= get_phrase('upload');?> </label>
    					<div class="col-sm-4">
    					    <input class="form-control question_image" placeholder="Select Image" type="file" onchange="return uploadImage()">
    					    <input type="hidden" name="imagename" class="imagename">
    					    <div class="progress" id="progress_bar_upload" style="display: none;">
                                <div id="file-progress-bar" class="progress-bar"></div>
                            </div>
    				    </div>
    					<div class="col-sm-4" id="uploaded_image"> </div>
    				</div>
    				<div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                            <?= get_phrase('mark');?> <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="<?= $question_bank_info->mark; ?>" name="mark" type="text" />
                            <span class="text-danger"><?= form_error('name'); ?></span>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">
                            <?= get_phrase('type');?>
                            <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="type" name="type" class="form-control">
                                <option value="">Select</option>
                                <option value="1" <?php if($question_bank_info->question_type == '1') echo 'selected = "selected" '; ?> >Single Answer</option>
                                <option value="2" <?php if($question_bank_info->question_type == '2') echo 'selected = "selected" '; ?> >multi answer</option>
                                <option value="3" <?php if($question_bank_info->question_type == '3') echo 'selected = "selected" '; ?> >fill in the blanks</option>
                            </select>
                            <div class="help-block"></div>
                        </div>
                    </div>
                    <div class="row form-group has-error" id="totalOptionDiv">
  					    <label class="col-sm-3 control-label"> Total Option <span class="text-danger">*</span> </label>
  					    <div class="col-sm-6">
  					        <select name="totalOption" id="totalOption" class="form-control select2">
  					            <option value="0" selected="selected">Please Select</option>
  					            <option value="1" <?php if($question_bank_info->total_option == '1') echo 'selected'; ?> >1</option>
  					            <option value="2" <?php if($question_bank_info->total_option == '2') echo 'selected'; ?> >2</option>
  					            <option value="3" <?php if($question_bank_info->total_option == '3') echo 'selected'; ?> >3</option>
  					            <option value="4" <?php if($question_bank_info->total_option == '4') echo 'selected'; ?> >4</option>
  					        </select>
  					    </div>
  					</div>
                    <input type="hidden" id="total_no_of_options" value="<?= $question_bank_info->total_option;?>">
                    <div class="old_option_data">
                        <?php 
                        $questionOptions  = $this->db->get_where('answers',array('question_id'=>$question_bank_info->id))->result();
                        $totalOption      = $question_bank_info->total_option;
                        if($question_bank_info->question_type==1){
                          $question_type    = 'radio';
                        }else{
                          $question_type    = 'checkbox';
                        }
                        $i=1; foreach($questionOptions as $obj){
                        ?>
                        <div class="form-group coption">
                            <label for="option<?= $i;?>" class="col-sm-3 control-label">Option <?= $i;?></label>
                            <div class="col-sm-4" style="display: inline-table;">
                                <input type="text" class="form-control" id="option<?= $i;?>" name="option[]" value="<?= $obj->options;?>" placeholder="Option <?= $i;?>" />
                                <span class="input-group-addon">
                                    <input id="ans_<?= $i;?>" type="hidden" name="opt_answer[]" value="0" /><input class="answer" id="ans<?= $i;?>" type="<?= $question_type;?>" name="opt_answer[]" value="<?= $obj->answers;?>" data-toggle="tooltip" data-placement="top" title="Correct Answer" <?php if($obj->answers==$i)echo 'checked';?> />
                                </span>
                            </div>
                            <div class="col-sm-3" style="display: inline-table;"><input type="file" name="image1" class="uploadImage<?= $i;?>" id="image<?= $i;?>" onchange="upload_option_image(1)" /> <input type="hidden" name="image_ajax[]" id="image_ajax_image<?= $i;?>" /></div>
                        </div>
                        <?php $i++;} ?>
                    </div>
  					<div id="in"></div>
		            
  					<div class="form-group">
              			<div class="col-md-6 col-md-offset-3">
                  			<input type="hidden" name="submit" value="submit">
                  			<button type="submit" class="btn btn-success saveQuestion" onclick="saveQuestion()">Submit</button>
              			</div>
            		</div>
              	</form>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>select2/select2.min.css" />
<script type="text/javascript" src="<?= VENDOR_URL;?>select2/select2.full.min.js"></script>

<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>editor/css/jquery-te-1.4.0.css">
<script type="text/javascript" src="<?= VENDOR_URL;?>editor/js/jquery-te-1.4.0.min.js"></script>

<script type="text/javascript">
    $('.select2').select2();
    $('#question').jqte();

    $(document).ready(function () {
        var totalOptionID = "0";
        if (totalOptionID > 0) {
            $("#totalOptionDiv").show();
        }
    });

    $("#type").change(function () {
        $("#in").children().remove();
        var type = $(this).val();
        if (type == 0) {
            $("#totalOptionDiv").hide();
        } else {
            $("#totalOption").val(0);
            $("#totalOptionDiv").show();
        }
    });
    function saveQuestion() {
            //console.log(seller_id);
        var loader  =   '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div> Please Wait...';
        $('.saveQuestion').html(loader);
        var bus_stop_id      =   $('.bus_stop_id').val();
        $this = $(this);

        var opt_ans = [];
        var data = $('#add_question_form').serializeArray();
        $.ajax({
            url: "<?= base_url('online_exam/question_bank/update_question_bank');?>",
            type: "post",
            data: data,
            success: function (html) {
                var data = $.parseJSON(html);
                if (data.status == "true") {
                    $('.saveQuestion').text('<?= get_phrase('save');?>');
                    toastr.success(data.message);
                    $('#add_question_form')[0].reset();
                    location.reload();
                }else if(data.status=='false'){
                    $('.saveQuestion').text('<?= get_phrase('save');?>');
                    toastr.warning(data.message);
                }else if(data.status='error'){
                    $('.saveQuestion').text('<?= get_phrase('save');?>');
                    var message = "";
                    $.each(data.message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                }
            },
        });
    }
    $("#totalOption").change(function () {
        var valTotalOption = $(this).val();
        var type = $("#type").val();

        if (parseInt(valTotalOption) != 0) {
            var opt = [];
            var ans = [];
            var count = $(".coption").size();
            var total_no_of_options         =   $('#total_no_of_options').val();
            var totalOptionss               =   parseInt(total_no_of_options) +1;
            for (j = totalOptionss; j <= count; j++) {
                if (type == 3) {
                    opt[j] = $("#answer" + j).val();
                } else {
                    opt[j] = $("#option" + j).val();
                    if ($("#ans" + j).prop("checked")) {
                        ans[j] = 'checked="checked"';
                    }
                }
            }
            $("#in").children().remove();
            for (i = totalOptionss; i <= valTotalOption; i++) {
                if ($("#in").size()) $("#in").append(formHtmlData(i, type, opt[i], ans[i]));
                else $("#in").append(formHtmlData(i, type));
            }
        } else {
            $("#in").children().remove();
        }
    });

    function formHtmlData(id, type, value = "", checked = "") {
        var required = "required";
        if (type == 1) {
            type = "radio";
        } else if (type == 2) {
            type = "checkbox";
            required = "";
        } else if (type == 3) {
            var html ='<div class="form-group coption"><label for="answer' + id +'" class="col-sm-3 control-label">Answer ' + id + '</label><div class="col-sm-4"><input type="text" class="form-control" id="answer' + id + '" name="opt_answer[]" value="' + value +
                '" placeholder="Answer ' + id + '" ></div><div class="col-sm-1"></div><span class="col-sm-4 control-label text-red" id="anserror' + id +'"></span></div>';
            return html;
        }
        var html ='<div class="form-group coption "><label for="option' +id+'" class="col-sm-3 control-label">Option ' +id +'</label><div class="col-sm-4"  style="display:inline-table"><input type="text" class="form-control" id="option' +
            id + '" name="option[]" value="' +value +'" placeholder="Option ' +id +
            '" ><span class="input-group-addon"><input  id="ans_' +id +'" type="hidden" name="opt_answer[]" value="0"/><input class="answer" id="ans' +id +'" ' +checked +' type="' +type +'" name="opt_answer[]" value="' +id +'" data-toggle="tooltip" data-placement="top" title="Correct Answer" ' + required +' /></span></div><div class="col-sm-3" style="display:inline-table"><input type="file" name="image' + id +'" class="uploadImage'+id+'" id="image' +id +'" onchange="upload_option_image('+id+')" > <input type="hidden" name="image_ajax[]" id="image_ajax_image' +id +'"  ></div><span class="col-sm-3 control-label text-red" id="anserror' +id +'"></span></div>';
        return html;
    }
    $(document).on('click','.answer',function(){
        var ans_value           =   $(this).val();
        var check_answer        =   $('.answer');

        if (check_answer.is(':checked')) {
            $('#ans_'+ans_value+'').prop('disabled',true);
        }else{
            $('#ans_'+ans_value+'').prop('disabled',false);
        }
    })
    function upload_option_image(id){
       data = new FormData();
       data.append("photo-file", $('.uploadImage'+id+'')[0].files[0]);
       var ReaderObj = new FileReader(); // Create instance of the FileReader
       ReaderObj.readAsDataURL($('.uploadImage'+id+'')[0].files[0]);
       ReaderObj.onloadend = function () {
           // set uploaded image data as background of div
           imgcode = this.result;
       };
       $.ajax({
           	type: 'POST',
           	url: '<?= base_url('online_exam/question_bank/uploadMediaFile');?>',
           	data: data,
           	contentType: false,
           	cache: false,
           	processData:false,
           	enctype: "multipart/form-data",
           	mimeType: "multipart/form-data",
           	beforeSend: function(){
               $("#file-progress-bar").width('0%');
           	},
           	success: function(json){
               	var getRes  =   $.parseJSON(json);
               	if(getRes.status=='image'){
                   $('#image_ajax_image'+id+'').val(getRes.imagename);
               	}
               	if(getRes.status=='video'){
                   $('#image_ajax_image'+id+'').val(getRes.imagename);
               	}
           	}
       	});
    }
    function uploadImage(){
    	jQuery("#chk-error").html('');
       	$('#progress_bar_upload').show();
       	data = new FormData();
       	data.append("photo-file", $(".question_image")[0].files[0]);
       	var ReaderObj = new FileReader(); // Create instance of the FileReader
       	ReaderObj.readAsDataURL($(".question_image")[0].files[0]);
       	ReaderObj.onloadend = function () {
           // set uploaded image data as background of div
           imgcode = this.result;
       	};
       	$.ajax({
         	xhr: function() {
             	var xhr = new window.XMLHttpRequest();
             	xhr.upload.addEventListener("progress", function(element) {
                 	if (element.lengthComputable) {
                     	var percentComplete = ((element.loaded / element.total) * 100);
                     	$("#file-progress-bar").width(Math.round(percentComplete) + '%');
                     	$("#file-progress-bar").html(Math.round(percentComplete)+'%');
                 	}
             	}, false);
             	return xhr;
         	},
         	type: 'POST',
         	url: '<?= base_url('online_exam/question_bank/uploadOptionImage');?>',
         	data: data,
         	contentType: false,
         	cache: false,
        	processData:false,
         	//dataType:'json',
         	enctype: "multipart/form-data",
         	mimeType: "multipart/form-data",
         	beforeSend: function(){
             $("#file-progress-bar").width('0%');
         	},
         	success: function(json){
             	var getRes  =   $.parseJSON(json);
             	if(getRes.status=='image'){
                 	$('#uploaded_image').html(getRes.uploaded_file_path);
                 	//$('#preview_image').hide();
                	$('.imagename').val(getRes.imagename);
                 	$('#progress_bar_upload').hide();
             	}
             	if(getRes.status=='video'){
                 	$('#uploaded_image').html(getRes.uploaded_file_path);
                 	//$('#preview_image').hide();
                 	$('#progress_bar_upload').hide();
                 	$('.imagename').val(getRes.imagename);
             	}
         	}
     	});
    }
</script>
