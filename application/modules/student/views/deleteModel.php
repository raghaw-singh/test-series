<form method="post" id="poup_quote_form">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title"></h5>
    </div>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <input type="hidden" class="student_id" value="<?= $id;?>">
                <p><?= get_phrase("are_you_sure_to_delete_this").'?';?></p>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><?= get_phrase('close');?></button>
        <button type="button" class="btn btn-primary student_delete_btn" onclick="studentDelete()"><?= get_phrase('delete');?></button>
    </div>
</form>

<script type="text/javascript">
    function studentDelete() {
        //console.log(seller_id);
        var loader  =   '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div> Please Wait...';
        $('.student_delete_btn').html(loader);
        var student_id      =   $('.student_id').val();
        $this = $(this);
        $.ajax({
            url: "<?= base_url('student/delete');?>",
            type: "post",
            data: {student_id:student_id},
            success: function (html) {
                var data = $.parseJSON(html);
                if (data.status == "true") {
                    $('.student_delete_btn').text('<?= get_phrase('delete');?>');
                    toastr.success(data.message);
                    $('.student_delete_modal').modal('hide');
                    setInterval(function () {
                        window.location.reload();
                    }, 1000);
                }else if(data.status=='false'){
                    $('.student_delete_btn').text('<?= get_phrase('delete');?>');
                    toastr.warning(data.message);
                }else if(data.status='error'){
                    $('.student_delete_btn').text('<?= get_phrase('delete');?>');
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
</script>