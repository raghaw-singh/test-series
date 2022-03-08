<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('question').' '.get_phrase('bank');?></h3>
                <div class="pull-right">
                    <a href="<?= base_url('online_exam/question_bank/add');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('question_bank');?></a>
                </div>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sr_no') ?></th>
                            <th><?= get_phrase('question_group') ?></th>
                            <th><?= get_phrase('question') ?></th>
                            <th><?= get_phrase('question_type') ?></th>
                            <th><?= get_phrase('action') ?></th>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($questionData as  $obj) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $obj->question_group; ?></td>
                            <td><?= $obj->question; ?></td>
                            <td>
                                <?php 
                                if($obj->question_type==1){
                                    echo get_phrase('single_choice');
                                }else if($obj->question_type==2){
                                    echo get_phrase('multiple_choice');
                                }else{
                                    echo get_phrase('fill_in_the_blank');
                                }
                                ?>
                                    
                            </td>
                            <td>
                                <a href="<?= base_url('online_exam/question_bank/view/'.$obj->id) ;?>" data-toggle="tooltip" title="<?= get_phrase('view');?>" class="btn btn-success btn-xs"><i class="fa fa-eye"></i></a>

                                <a href="<?= base_url('online_exam/question_bank/edit/'.$obj->id) ;?>" data-toggle="tooltip" title="<?= get_phrase('edit');?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a>
                                <?php if(has_permission(VIEW,'hrm','users')){?>
                                <a href="<?= base_url('online_exam/question_bank/delete/'.$obj->id) ;?>" data-toggle="tooltip" title="<?= get_phrase('delete');?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
                                <?php }?>
                            </td>
                        </tr>
                    </tbody> <?php $count ++ ;  }   ?>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#datatable-responsive').DataTable();
</script>