<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-sm-8">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-puzzle-piece"></i> Question Bank</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form method="POST">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="level" class="control-label"> Difficulty Level </label>
                                                    <select name="level" class="form-control select2 level">
                                                        <option value="">Please Select</option>
                                                        <?php foreach($questionBank as $obj) {?>
                                                        <option value="<?= $obj->difficult_level ?>"><?= $obj->difficult_level ?></option>
                                                        <?php }?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="group" class="control-label"> Question Group </label>
                                                    <select name="group" class="form-control select2 group">
                                                        <option value="">Please Select</option>
                                                        <?php foreach($questionBank as $obj) {?>
                                                        <option value="<?= $obj->question_group ?>"><?= $obj->question_group ?></option>
                                                        <?php }?>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-12">
                                    <table class="table table-bordered" id="questionList">
                                        <thead>
                                            <tr>
                                                <th>Sr.No</th>
                                                <th>level</th>
                                                <th>Questions</th>
                                                <th>Group</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div><br>
                    <!-- <div class="box">
                        <div class="box-header">
                            <h3 class="box-title"><i class="fa fa-puzzle-piece"></i> Associated Question</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12" >
                                    <div class="clearfix">
                                        <div class="question-body" >
                                            <label class="lb-content question-color"><h4>1. the national animal of Bangladesh ?</h4>
                                            </label>
                                            <label class="pull-right" style="margin-left: 396px;"> 1 Mark </label>
                                            <div>
                                                <img
                                                    style="width: 220px; height: 120px;"
                                                    src="https://demo.itest.inilabs.xyz/uploads/images/a9339396000da5e114f80d541026d53f918624a5da610f41725715cbbda3b834252594e5f7358deaf78505f156249ca61f065a7fb0a30fe7009822c5186c2e52.jpg"
                                                    alt=""
                                                />
                                            </div>
                                        </div><br>
                                        <div class="question-answer">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td style="border: none;">
                                                            <input type="radio" disabled />
                                                            <label >
                                                                <span class="fa-stack radio-button">
                                                                </span>
                                                                <span></span>
                                                                <img
                                                                    src="https://demo.itest.inilabs.xyz/uploads/images/a094202c3bc873a49abefd65ec3eef158c13941feca48d4e2c73ee6fe0083e69481ac806f989145102410664e0f7f54690d676d50164612d332c13058236f475.jpg"
                                                                    style="width: 100px; height: 80px; margin-left: 24px;"
                                                                />
                                                            </label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: none;">
                                                            <input type="radio" checked="" disabled="" />
                                                            <label for="option482">
                                                                <span class="fa-stack radio-button">
                                                                </span>
                                                                <span></span>
                                                                <img
                                                                    src="https://demo.itest.inilabs.xyz/uploads/images/80f6a37c822a0eb5cfef4c9cc01e0150a84deaf8130c0f794337ac202d79c2a8e3f6ef3e7c6b799c64ba453ad0bcb1124b2d531dfba7a41f9b1bcf82537c0e73.jpg"
                                                                    style="width: 100px; height: 80px;margin-left: 24px;"
                                                                />
                                                            </label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <span class="pull-right" style="margin-bottom: 20px;">
                                            <button onclick="javascript:void(0);removeQuestion(261)" class="btn btn-danger btn-xs mrg"><i class="fa fa-trash-o"></i> Remove Question <span class="questionNumber54">1</span></button>
                                        </span>
                                    </div>
                                    <div class="clearfix">
                                        <div class="question-body">
                                            <label class="lb-content question-color">
                                                <h4>2. Which among the following is the largest known number in the world?</h4>
                                            <label class="pull-right" style="margin-left: 396px;"> 1 Mark </label>
                                        </div>

                                        <div class="question-answer">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td style="border: none;">
                                                            <input type="radio" disabled="" />
                                                            <label >
                                                                <span class="fa-stack radio-button">
                                                                </span>
                                                                <span> Africa</span>
                                                            </label>
                                                        </td>
                                                    </tr>
                                                    <tr>    
                                                        <td style="border: none;">
                                                            <input type="radio" checked="" disabled="" />
                                                            <label>
                                                                <span class="fa-stack radio-button">
                                                                </span>
                                                                <span> Asia</span>
                                                            </label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <span class="pull-right" style="margin-bottom: 20px;">
                                            <button onclick="javascript:void(0);removeQuestion(276)" class="btn btn-danger btn-xs mrg"><i class="fa fa-trash-o"></i> Remove Question <span class="questionNumber6">2</span></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
                <div class="col-sm-4">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-puzzle-piece"></i> Online Exam</h3>
                        </div>
                        <div class="box-body">
                            <div class="mailbox-controls"></div>
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-bordered table-hover table-striped">
                                    <tbody>
                                        <tr>
                                            <td><strong><?= get_phrase('exam_title') ;?></strong></td>
                                            <td class="mailbox-name"><?= $exam_details->exam_title ;?></td>
                                        </tr>
                                        <tr>
                                            <td><strong><?= get_phrase('class') ;?></strong></td>
                                            <td class="mailbox-name"><?= $exam_details->class ;?></td>
                                        </tr>
                                        <tr>
                                            <td><strong><?= get_phrase('subject') ;?></strong></td>
                                            <td class="mailbox-name"><?= $exam_details->subject ;?></td>
                                        </tr>
                                        <tr>
                                            <td><strong><?= get_phrase('group') ;?></strong></td>
                                            <td class="mailbox-name"><?= $exam_details->student_group ;?></td>
                                        </tr>
                                        <tr>
                                            <td><strong><?= get_phrase('pass_mark') ;?></strong></td>
                                            <td class="mailbox-name"><?= $exam_details->pass_value ;?></td>
                                        </tr>
                                        <tr>
                                            <td><strong><?= get_phrase('published') ;?></strong></td>
                                            <td class="mailbox-name"><?= $exam_details->published ;?></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><br>
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-puzzle-piece"></i> Question Summary</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12" >
                                    <table id="datatable-responsive" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="col-sm-1">#</th>
                                                <th class="col-sm-8">Question</th>
                                                <th class="col-sm-2">Mark</th>
                                                <th class="col-sm-1">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $totalMarks     =   0 ;
                                            $count          =   1 ;
                                            foreach($assigned_ques as $obj) {?>
                                            <tr>
                                                <td><?= $count ;?></td>
                                                <td><?= $obj->question ;?></td>
                                                <td>
                                                    <?php  
                                                    $totalMarks += $obj->mark ;
                                                    echo $obj->mark ;
                                                    ?>
                                                    
                                                </td>
                                                <td>
                                                    <span class="pull-right">
                                                        <button onclick="removeQuestion(<?= $obj->id?>)" class="btn btn-danger btn-xs mrg"><i class="fa fa-trash-o"></i></button>
                                                    </span>
                                                </td>
                                            </tr>
                                            <?php $count ++ ;}  ?>
                                            <tr>
                                                <td colspan="2">Total Ques:- <?= sizeof($assigned_ques);?></td>
                                                <td colspan="2">Marks:- <?= $totalMarks;?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="exam_id" name="id" value="<?= $exam_details->id ;?>">
</section>

<script type="application/javascript">
   $(document).ready(function(){
        var userDataTable = $('#questionList').DataTable({
            'processing': true,
            'serverSide': true,
            'serverMethod': 'post',
            //'searching': false, // Remove default Search Control
            'ajax': {
                'url':'<?=base_url()?>online_exam/add_question/fetch_question_data',
                'data': function(data){
                   data.ques_level = $('.level').val();
                   data.ques_group = $('.group').val();
                   data.exam_id    = $('#exam_id').val();
                }
            },
            'columns': [
                { data: 'count'},
                { data: 'level' },
                { data: 'question' },
                { data: 'group' },
                { data: 'action' }
            ]
        });
        $('.level').change(function(){
            userDataTable.draw();
        });
        $('.group').change(function(){
            userDataTable.draw();
        });
    });
    function assign_ques(id){
        var exam_id   =    $('#exam_id').val();
        $.ajax({
            url: "<?= base_url('online_exam/add_question/assign_question');?>",
            type: "post",
            data: {exam_id:exam_id, question_id:id},
            success: function (html) {
                var data = $.parseJSON(html);
                if (data.status == "true") {
                    $('#btn_read_'+id+'').attr('disabled',true);
                    toastr.success(data.message);
                    window.setTimeout(function(){
                        window.location.reload();
                    },1000); 
                }else if(data.status=='false'){
                    toastr.warning(data.message);
                }
            },
        });
    }
    $('#datatable-responsive').DataTable();

    function removeQuestion(id){
        $.ajax({
            url: "<?= base_url('online_exam/add_question/delete_assign_ques');?>",
            type: "post",
            data: {ques_id:id},
            success: function (html) {
                var data = $.parseJSON(html);
                if (data.status == "true") {
                    toastr.success(data.message);
                    window.setTimeout(function(){
                        window.location.reload();
                    },1000);   
                }else if(data.status=='false'){
                    toastr.warning(data.message);
                }
            },
        });
    }
</script>
