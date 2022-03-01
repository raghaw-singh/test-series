<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('online').' '.get_phrase('exam');?></h3>
                <div class="pull-right">
                    <a href="<?= base_url('online_exam/online_exam/add_online_exam');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('online_exam');?></a>
                </div>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sr_no') ?></th>
                            <th><?= get_phrase('exam_title') ?></th>
                            <th><?= get_phrase('published') ?></th>
                            <th><?= get_phrase('action') ?></th>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($exam_details as  $obj) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $obj->exam_title; ?></td>
                            <td><?= $obj->published; ?></td>
                            <td>
                                <a href="<?= base_url('online_exam/addQuestion/'.$obj->id) ;?>" class="btn btn-success btn-xs"><i class="fa fa-plus"></i> <?= get_phrase('add_question') ?></a>

                                <a href="<?= base_url('online_exam/online_exam/edit_online_exam/'.$obj->id) ;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Edit</a>

                                <a href="<?= base_url('online_exam/online_exam/delete/'.$obj->id) ;?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> delete</a>
                            </td>
                        </tr>
                    </tbody><?php $count ++ ;  }   ?>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#datatable-responsive').DataTable();
</script>