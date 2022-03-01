<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-md-12 form-group">
            <label>Email Address</label>
            <input type="text" class="form-control" autocomplete="off" name="emailaddress" id="emailaddress" placeholder="Email Address" >
        </div>
        <div class="col-md-12 form-group">
            <label><?= get_phrase('password');?></label>
            <input type="password" class="form-control" autocomplete="off" name="password" id="password" placeholder="<?= get_phrase('password');?>">
        </div>
    </div>
</div>
<div class="modal-footer">
    <input type="hidden" name="submit" value="submit">
    <button type="submit" class="btn btn-info login-btn" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Processing..."><?= get_phrase('login');?></button>
</div>
<script type="text/javascript">
	var base_url            =   '<?= base_url();?>';
    $(document).ready(function(){
        $(document).on('click', '.login-btn', function (e) {
            var loader          =   '<div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div>   Processing...';
            var $this = $(this);
            $('.login-btn').html(loader);
            $.ajax({
                url: "<?= base_url('web/auth/userLogin');?>",
                type: 'post',
                data: $('#modal_login_form').serialize(),
                dataType: 'json',
                success: function (data) {
                    if (data.status =='error') {
                        var message = "";
                        $.each(data.message, function (index, value) {
                            if(value !=''){
                                toastr.warning(value);
                            }
                        });
                        $('.login-btn').text('Login');
                    }else if(data.status=='false'){
                    	$('.login-btn').text('Login');
                        toastr.warning(data.message);
                    } else {
                        $('.login-btn').text('Login');
                        toastr.success(data.message);
                        window.location.reload();
                    }
                }
            });
        });
    })
</script>