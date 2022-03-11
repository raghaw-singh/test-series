<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-sm-8">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-puzzle-piece"></i> <?= get_phrase('question_bank');?></h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form method="POST">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="level" class="control-label"> <?= get_phrase('difficult_level');?></label>
                                                    <select name="level" class="form-control select2 level">
                                                        <option value=""><?= get_phrase('choose_level');?></option>
                                                        <?php foreach($questionBank as $obj) {?>
                                                        <option value="<?= $obj->difficult_level;?>"><?= $obj->difficult_level ?></option>
                                                        <?php }?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="group" class="control-label"> <?= get_phrase('class');?></label>
                                                    <select name="class" class="form-control select2 class_id" onchange="get_subject_by_class(this.value,'','')">
                                                        <option value=""><?= get_phrase('choose_class');?></option>
                                                        <?php foreach($class_list as $class) {?>
                                                        <option value="<?= $class->id ?>"><?= $class->class ?></option>
                                                        <?php }?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="group" class="control-label"> <?= get_phrase('subject');?></label>
                                                    <select name="subject_id" class="form-control select2 subject_id" id="subject_id">
                                                        <option value=""><?= get_phrase('choose_subject');?></option>
                                                        
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
                                                <th><?= get_phrase('sr_no');?></th>
                                                <th><?= get_phrase('question_level');?></th>
                                                <th><?= get_phrase('question');?></th>
                                                <th><?= get_phrase('class_name');?></th>
                                                <th><?= get_phrase('action');?></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div><br>
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
                                            <td class="mailbox-name"><?= ucwords($this->db->get_where('class',array('id'=>$exam_details->class))->row()->class) ;?></td>
                                        </tr>
                                        <tr>
                                            <td><strong><?= get_phrase('subject') ;?></strong></td>
                                            <td class="mailbox-name"><?= $this->db->get_where('subject',array('id'=>$exam_details->subject))->row()->subject_name ;?></td>
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
                    data.class_id = $('.class_id').val();
                    data.exam_id    = $('#exam_id').val();
                    data.subject_id     =   $('.subject_id').val();
                }
            },
            'columns': [
                { data: 'count'},
                { data: 'level' },
                { data: 'question' },
                { data: 'class_name' },
                { data: 'action' }
            ]
        });
        $('.level').change(function(){
            userDataTable.draw();
        });
        $('.class_id').change(function(){
            userDataTable.draw();
        });
        $('.subject_id').change(function(){
            userDataTable.draw();
        })
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

    function get_subject_by_class(class_id){
        get_subject(class_id);
    }

    function get_subject(class_id){
        $.ajax({       
            type   : "POST",
            url    : "<?php echo base_url('ajax/get_subject_by_class'); ?>",
            data   : {class_id : class_id},  
            success: function(response){                                                   
                if(response)
                {
                    $('#subject_id').html(response);
                }
            }
        });
    }
</script>
