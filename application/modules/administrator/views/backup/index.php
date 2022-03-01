<div class="row">
    <div class="col-md-8">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= get_phrase('backup_history');?></h3>
                <div class="box-tools pull-right">
                    <form id="form1" action="<?= base_url('administrator/backup/create_backup');?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8" role="form">
                        <button class="btn btn-primary btn-sm btn-info" type="submit" name="backup" value="backup"><i class="fa fa-plus-square-o"></i> <?= get_phrase('create_backup');?></button>
                    </form>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive mailbox-messages">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>Backup Files</th>
                                        <th class="text-right" colspan="4">
                                            Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($dbfileList as $obj){?>
                                    <tr>
                                        <td width="80%" class="mailbox-name"><a href="#"> <?= $obj?></a></td>
                                        <td class="mailbox-name">
                                            <a href="<?= base_url('uploads/backup-database/'.$obj);?>" target="_blank" class="btn btn-success btn-xs"><i class="fa fa-download"></i> Download</a>
                                        </td>
                                        <td class="mailbox-name">
                                            <form class="formrestore" action="<?= base_url('administrator/backup/restore_backup');?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8" role="form">
                                                <input type="hidden" name="filename" value="<?= $obj;?>" />
                                                <button class="btn btn-primary btn-xs btn-warning" type="submit" name="backup" value="restore"><i class="fa fa-plus-square-o"></i> <?= get_phrase('restore');?></button>
                                            </form>
                                        </td>
                                        <td class="mailbox-name">
                                            <form class="formdelete" method="post" role="form" name="employeeform" id="employeeform" accept-charset="utf-8" action="<?= base_url('administrator/backup/dropbackup/'.$obj);?>">
                                                <button class="btn btn-primary btn-xs btn-danger" type="submit" name="backup" value="restore"><i class="fa fa-trash"></i> <?= get_phrase('delete');?></button>
                                            </form>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 col-sm-4">
        <div class="box box-warning">
            <div class="box-header with-border">
                <h3 class="box-title"><?= get_phrase('upload_from_local_directory')?></h3>
            </div>
            <form role="form" action="<?= base_url('administrator/backup/upload_db');?>" method="post" enctype="multipart/form-data">
                <div class="box-body">
                    <input class="filestyle form-control" data-height="30" type="file" name="file" id="exampleInputFile" />
                    <span class="text-danger"><?= form_error('file');?></span>
                </div>
                <div class="box-footer">
                    <button class="btn btn-primary btn-sm pull-right" type="submit" name="backup" value="upload"><i class="fa fa-upload"></i> <?= get_phrase('upload');?></button>
                </div>
            </form>
        </div>
        <div class="box box-warning">
            <div class="box-header with-border">
                <h3 class="box-title">Cron Secret Key</h3>
                <div class="box-tools pull-right">
                    <a class="btn btn-primary btn-sm btn-info" data-toggle="tooltip" title="Cron Secret Key" href="<?= base_url('administrator/backup/addCronsecretkey/1');?>">Regenerate</a>
                </div>
            </div>
            <div class="box-body cronkeyheight">
                <div style="display: none;" id="cronkey">
                    <p class="hideeyep"><?= $settings->cron_secret_key;?></p>
                </div>
                <a class="hideeye" data-toggle="tooltip" title="Cron Secret Key" id="showbtn" onclick="showkey()" href="#"><i class="fa fa-eye"></i></a>
            </div>
        </div>
        <!--./box box-warning-->
    </div>
</div>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>dist/css/dropify.min.css">
<script src="<?= VENDOR_URL;?>dist/js/dropify.min.js"></script>
<script type="text/javascript">
    
    $('#form1').submit(function () {
        var c = confirm('Are you sure want to make current backup?');
        return c;
    });
    $('.formdelete').submit(function () {
        var c = confirm('Are you sure want to delete backup?');
        return c;
    });
    $('.formrestore').submit(function () {
        var c = confirm('Are you sure want to restore backup?');
        return c;
    });

    function showkey() {
        $("#cronkey").show();
        $("#showbtn").html("<i class='fa fa-eye-slash'></i>");
        $("#showbtn").attr("onclick", "hidekey()");
    }

    function hidekey() {
        $("#cronkey").hide();
        $("#showbtn").html("<i class='fa fa-eye'></i>");
        $("#showbtn").attr("onclick", "showkey()");
    }
    $('.filestyle').dropify();
</script>
