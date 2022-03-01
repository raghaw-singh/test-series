<div class="row">
    <div class="col-md-7">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?php echo get_phrase('general'); ?> <?php echo get_phrase('setting'); ?></h3>
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        <!-- Button to trigger modal -->
                        <a href="#schsetting" role="button" class="btn btn-primary btn-sm checkbox-toggle pull-right edit_setting" data-toggle="tooltip" title="Edit Setting" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing" >
                            <i class="fa fa-pencil"></i> <?= get_phrase('edit');?>
                        </a>
                    </div>
                </div>
            </div>
            <div class="box-body">
                <div class="mailbox-controls"></div>
                <div class="table-responsive mailbox-messages">
                    <table class="table table-bordered table-hover table-striped">
                        <tbody>
                            <tr>
                                <td><strong><?= get_phrase('system_name');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->system_name : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('address');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->address : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('phone');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->phone : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('email');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->email : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('language');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->language : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('footer');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->footer : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('timezone');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->default_time_zone : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('date_format');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->sms_date_format : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('currency');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->currency : ''; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('currency_symbol');?></strong></td>
                                <td class="mailbox-name"><?php echo isset($setting) ? $setting->currency_symbol : ''; ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <hr style="width: 98.9%; margin: 32px auto 20px;" />
                    <div class="col-md-12 col-sm-12">
                        <label for="input-type"><?= get_phrase('current_theme');?></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <img class="<?php if(!empty($setting)){?><?php if($setting->theme_name=='default') echo 'radioactive';?> <?php } ?> img-responsive radioborder" src="<?= VENDOR_URL;?>images/default.jpg" />
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <img class="img-responsive radioborder <?php if(!empty($setting)){?><?php if($setting->theme_name=='red') echo 'radioactive';?> <?php } ?>" src="<?= VENDOR_URL;?>images/red.jpg" />
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <img class="img-responsive radioborder <?php if(!empty($setting)){?><?php if($setting->theme_name=='blue') echo 'radioactive';?> <?php } ?>" src="<?= VENDOR_URL;?>images/blue.jpg" />
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <img class="img-responsive radioborder <?php if(!empty($setting)){?><?php if($setting->theme_name=='gray') echo 'radioactive';?> <?php } ?>" src="<?= VENDOR_URL;?>images/gray.jpg" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--./col-md-9-->
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body">
                <?php if(!empty($setting->logo)){?>
                <img src="<?= base_url('uploads/logo/'.$setting->logo);?>" class="" alt="" style="height: 15px; margin-top: 5px;" />
                <?php }else{?>
                <img src="<?= base_url('uploads/logo/logo-dark.png');?>" class="" alt="" style="height: 15px; margin-top: 5px;" />
                <?php } ?>
                <a href="#schsetting" role="button" class="btn btn-primary btn-sm upload_logo pull-right"   data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing"><i class="fa fa-picture-o"></i> <?php echo get_phrase('edit').' '.get_phrase('logo'); ?></a>
            </div>
        </div>
    </div>
    <!--./col-md-3-->
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body">
                <?php if(!empty($setting->favicon_icon)){?>
                <img src="<?= base_url('uploads/logo/'.$setting->favicon_icon);?>" class="" alt=""/>
                <?php }else{?>
                <img src="<?= base_url('uploads/logo/logo-dark.png');?>" class="" alt=""/>
                <?php } ?>
                <a href="#schsetting" role="button" class="btn btn-primary btn-sm pull-right upload_favicon_icon" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing">
                    <i class="fa fa-picture-o"></i> <?= get_phrase('edit').' '.get_phrase('favicon').' '. get_phrase('logo');?>
                </a>
            </div>
        </div>
    </div>
</div>
<div id="schsetting" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><?= get_phrase('edit').' '.get_phrase('general'); ?> <?php echo get_phrase('setting'); ?></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form role="form" id="schsetting_form" action="" onsubmit="return false">
                        <input type="hidden" name="sch_id" id="sch_id" value="" />
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('system_name');?></label><small class="req"> *</small>
                            <input class="form-control" id="system_name" name="system_name" placeholder="" type="text"  />
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('footer');?></label><small class="req"> *</small>
                            <input class="form-control" id="footer" name="footer" placeholder="" type="text"  />
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label for="exampleInputEmail1"><?= get_phrase('address');?></label><small class="req"> *</small>
                            <textarea class="form-control" style="resize: none;" rows="2" id="address" name="address" placeholder=""></textarea>
                            
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('phone');?></label><small class="req"> *</small>
                            <input class="form-control" id="phone" name="phone" placeholder="" type="text" />
                            
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('email');?></label>
                            <small class="req"> *</small>
                            <input class="form-control" id="email" name="email" placeholder="" type="text" />
                            
                        </div>
                        <div class="clearfix"></div>
                        <div class="clearfix"></div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('language');?></label><small class="req"> *</small>
                            <select id="language_id" name="language" class="form-control">
                                <option value="">Select</option>
                                <?php foreach($fields as $field){ ?> <?php  if($field == 'id' || $field == 'label'){ continue; } ?>
                                <option value="<?php echo $field; ?>" <?php if(isset($setting) && $setting->language == $field){ echo 'selected="selected"';} ?>><?php echo ucfirst($field); ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="IsSmallBusiness"><?= get_phrase('enable_rtl');?></label>
                            <div class="clearfix"></div>
                            <label class="radio-inline"> <input type="radio" name="enable_rtl" value="0" />Disabled </label>
                            <label class="radio-inline"> <input type="radio" name="enable_rtl" value="1" />Enabled </label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('timezone');?></label><small class="req"> *</small>
                            <select id="default_time_zone" name="default_time_zone" class="form-control">
                                <option value="">Select</option>
                                <?php $timezones = get_timezones(); ?>
                                <?php foreach($timezones as $key=>$value){ ?>
                                    <option value="<?php echo $key; ?>" <?php if(isset($setting) && $setting->default_time_zone == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?> </option>
                                <?php } ?>
                            </select>
                            
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('academic_year')?></label><small class="req"> *</small>
                            <select id="academic_year" name="academic_year" class="form-control">
                                <option value="">Select</option>
                                <?php foreach($years as $obj){ ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($setting) && $setting->academic_year_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->session_year; ?></option>
                                <?php } ?>
                            </select>
                            
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('date_format');?></label><small class="req"> *</small>
                            <select id="sms_date_format" name="sms_date_format" class="form-control">
                                <option value="">Select</option>
                                <?php $dates = get_date_format(); ?>
                                <?php foreach($dates as $key=>$value){ ?>
                                <option value="<?php echo $key; ?>" <?php if(isset($setting) && $setting->sms_date_format == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?> </option>
                                <?php } ?>
                            </select>
                            
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('currency');?></label><small class="req"> *</small>
                            <input  class="form-control"  name="currency"  id="currency"  placeholder="<?php echo get_phrase('currency'); ?> " required="required" type="text" autocomplete="off">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="invoice_id_prefix"><?= get_phrase('invoice_prefix');?></label><small class="req"> *</small>
                            <input  class="form-control"  name="invoice_id_prefix"  id="invoice_id_prefix"  placeholder="<?php echo get_phrase('invoice_prefix'); ?> " required="required" type="text" autocomplete="off">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="invoice_start_from"><?= get_phrase('invoice_start_from');?></label><small class="req"> *</small>
                            <input  class="form-control"  name="invoice_id_start_from"  id="invoice_id_start_from"  placeholder="<?php echo get_phrase('invoice_start_from'); ?> " required="required" type="text" autocomplete="off">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="gstin_no"><?= get_phrase('gstin_no');?></label><small class="req"> *</small>
                            <input  class="form-control"  name="gstin_no"  id="gstin_no"  placeholder="<?php echo get_phrase('gstin_no'); ?> " required="required" type="text" autocomplete="off">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label for="exampleInputEmail1"><?= get_phrase('currency_symbol')?></label><small class="req"> *</small>
                            <input  class="form-control"  name="currency_symbol"  id="currency_symbol"  placeholder="<?php echo get_phrase('currency_symbol'); ?> " required="required" type="text" autocomplete="off">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('google_analytics');?></label>
                            <input type="text" class="form-control" name="google_analytics" id="google_analytics" placeholder="<?= get_phrase('google_analytics')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('facebook_url');?></label>
                            <input type="text" class="form-control" name="facebook_url" id="facebook_url" placeholder="<?= get_phrase('facebook_url')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('twitter_url');?></label>
                            <input type="text" class="form-control" name="twitter_url" id="twitter_url" placeholder="<?= get_phrase('twitter_url')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('linkedin_url');?></label>
                            <input type="text" class="form-control" name="linkedin_url" id="linkedin_url" placeholder="<?= get_phrase('linkedin_url')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('google_plus_url');?></label>
                            <input type="text" class="form-control" name="google_plus_url" id="google_plus_url" placeholder="<?= get_phrase('google_plus_url')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('youtube_url');?></label>
                            <input type="text" class="form-control" name="youtube_url" id="youtube_url" placeholder="<?= get_phrase('youtube_url')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('instagram_url');?></label>
                            <input type="text" class="form-control" name="instagram_url" id="instagram_url" placeholder="<?= get_phrase('instagram_url')?>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                            <label><?= get_phrase('pinterest_url');?></label>
                            <input type="text" class="form-control" name="pinterest_url" id="pinterest_url" placeholder="<?= get_phrase('pinterest_url')?>">
                        </div>
                        <div class="clearfix"></div>
                        <hr />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label for="input-type">Current Theme</label>
                                <div id="input-type">
                                    <div class="row">
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">
                                                <input name="theme_name" value="default" type="radio" />
                                                <img src="<?= VENDOR_URL;?>images/default.jpg" />
                                            </label>
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">
                                                <input name="theme_name" value="red" type="radio" />
                                                <img src="<?= VENDOR_URL;?>images/red.jpg" />
                                            </label>
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">
                                                <input name="theme_name" value="darkblue" type="radio" />
                                                <img src="<?= VENDOR_URL;?>images/blue.jpg" />
                                            </label>
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                            <label class="radio-img">
                                                <input name="theme_name" value="gray" type="radio" />
                                                <img src="<?= VENDOR_URL;?>images/gray.jpg" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <button type="button" class="btn btn-primary submit_schsetting pull-right" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> Processing">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="modal-uploadfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><?php echo get_phrase('edit_logo'); ?> <span id="imagesize">(182px X 18px)</span></h4>
            </div>
            <div class="modal-body">
                <!-- ==== -->
                <form class="box_upload boxupload" id="ajaxlogo" method="post" enctype="multipart/form-data">

                    <div class="box__input">
                        <i class="fa fa-download box__icon"></i>

                        <input class="box__file" type="file" name="file" id="file"/>
                        <input value="<?php echo isset($setting) ? $setting->id : ''; ?>" type="hidden" name="id" id="id"/>
                        <label for="file">
                            <strong>Choose a file</strong>
                            <span class="box__dragndrop"> or drag it here</span>.
                        </label>
                        <button class="box__button" type="submit">Upload</button>
                    </div>
                    <div class="box__uploading">Uploading&hellip;</div>

                </form>
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="modal-favicon_icon" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><?php echo get_phrase('edit').' '.get_phrase('favicon_icon'); ?> <span id="imagesize">(182px X 18px)</span></h4>
            </div>
            <div class="modal-body">
                <!-- ==== -->
                <form class="box_upload boxupload" id="ajaxlogo" method="post" action="<?php echo base_url('setting/setting/ajax_editlogo') ?>" enctype="multipart/form-data">

                    <div class="box__input">
                        <i class="fa fa-download box__icon"></i>

                        <input class="box__file" type="file" name="file" id="file"/>
                        <input value="<?php echo isset($setting) ? $setting->id : ''; ?>" type="hidden" name="id" id="id"/>
                        <label for="file">
                            <strong>Choose a file</strong>
                            <span class="box__dragndrop"> or drag it here</span>.
                        </label>
                        <button class="box__button" type="submit">Upload</button>
                    </div>
                    <div class="box__uploading">Uploading&hellip;</div>

                </form>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $('.edit_setting').on('click', function (e) {
        e.preventDefault();
        var $this = $(this);
        $this.button('loading');
        $.ajax({
            url: baseurl + 'setting/setting/getSchsetting',
            type: 'POST',
            data: {},
            dataType: "json",
            success: function (result) {
                console.log(result.system_name);
                $('input[name="sch_id"]').val(result.id);
                $('#system_name').val(result.system_name);
                $('input[name="footer"]').val(result.footer);
                $('input[name="phone"]').val(result.phone);
                $('input[name="email"]').val(result.email);
                $('input[name="currency"]').val(result.currency);
                $('input[name="currency_symbol"]').val(result.currency_symbol);
                $('input[name="invoice_id_prefix"]').val(result.invoice_id_prefix);
                $('input[name="invoice_id_start_from"]').val(result.invoice_id_start_from);
                $('input[name="gstin_no"]').val(result.gstin_no);
                $('textarea[name="address"]').text(result.address);
                $('input[name="google_analytics"]').val(result.google_analytics);
                $('input[name="facebook_url"]').val(result.facebook_url);
                $('input[name="twitter_url"]').val(result.twitter_url);
                $('input[name="linkedin_url"]').val(result.linkedin_url);
                $('input[name="google_plus_url"]').val(result.google_plus_url);
                $('input[name="youtube_url"]').val(result.youtube_url);
                $('input[name="instagram_url"]').val(result.instagram_url);
                $('input[name="pinterest_url"]').val(result.pinterest_url);
                $("input[name=enable_rtl][value=" + result.enable_rtl + "]").attr('checked', 'checked');
                $("input[name=theme_name][value='" + result.theme_name + "']").attr('checked', 'checked');
                $('select[name="academic_year"] option[value="' + result.academic_year_id + '"]').attr("selected", "selected");
                $('select[name="default_time_zone"] option[value="' + result.default_time_zone + '"]').attr("selected", "selected");
                $('select[name="sms_date_format"] option[value="' + result.sms_date_format + '"]').attr("selected", "selected");
                $('select[name="language"] option[value="' + result.language + '"]').attr("selected", "selected");

                $('#schsetting').modal({
                    show: true,
                    backdrop: 'static',
                    keyboard: false
                });
            },
            error: function () {
                console.log("error on form");
            }

        }).done(function () {
            $this.button('reset');
        });
    });
    $(document).on('click', '.submit_schsetting', function (e) {
        var $this = $(this);
        $this.button('loading');
        $.ajax({
            url: baseurl+'setting/setting/ajax_schedit',
            type: 'post',
            data: $('#schsetting_form').serialize(),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if(data.status=='true'){
                    toastr.success(data.message);
                    window.location.reload(true);
                }else if(data.status=='false'){
                    toastr.error(data.message);
                }else{
                    var message = "";
                    $.each(data.message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                }

                $this.button('reset');
            }
        });
    });
    $('.upload_logo').on('click', function (e) {
        e.preventDefault();
        $("#myModalLabel").html('<?php echo get_phrase('edit_logo') ?> (182px X 18px)');
        $("#imagesize").html(' (182px X 18px)');
        var $this = $(this);
        $("#ajaxlogo").attr('action', '<?php echo base_url('setting/setting/ajax_editlogo') ?>');
        $this.button('loading');
        $('#modal-uploadfile').modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
    });
    $('.upload_favicon_icon').on('click', function (e) {
        e.preventDefault();
        $("#myModalLabel").html('<?php echo get_phrase('edit').' '.get_phrase('favicon').' '.get_phrase('logo') ?> (41px X 25px)');
        $("#imagesize").html(' (41px X 25px)');
        var $this = $(this);
        $("#ajaxlogo").attr('action', '<?= base_url('setting/setting/ajax_applogo');?>');
        $('#modal-uploadfile').modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
    });
    $('#modal-uploadfile').on('shown.bs.modal', function () {
        $('.upload_logo').button('reset');
    });
    $('#modal-favicon_icon').on('shown.bs.modal', function () {
        $('.upload_favicon_icon').button('reset');
    });
</script>

<link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/dropify.min.css">
<script src="<?= VENDOR_URL;?>dist/js/dropify.min.js"></script>
<script type="text/javascript">
// feature detection for drag&drop upload
var isAdvancedUpload = (function () {
    var div = document.createElement("div");
    return ("draggable" in div || ("ondragstart" in div && "ondrop" in div)) && "FormData" in window && "FileReader" in window;
})();
var forms = $("#ajaxlogo");
Array.prototype.forEach.call(forms, function (form) {
    var input = form.querySelector('input[type="file"]'),
        label = form.querySelector("label"),
        errorMsg = form.querySelector(".box__error span"),
        restart = form.querySelectorAll(".box__restart"),
        droppedFiles = false,
        showFiles = function (files) {
            // label.textContent = files.length > 1 ? ( input.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', files.length ) : files[ 0 ].name;
        },
        showErrors = function (files) {
            toastr.error(files);
        },
        showSuccess = function (msg) {
            toastr.success(msg);
            setTimeout(function () {
                window.location.reload(1);
            }, 2000);
        },
        triggerFormSubmit = function () {
            var event = document.createEvent("HTMLEvents");
            event.initEvent("submit", true, false);
            form.dispatchEvent(event);
        };

    // letting the server side to know we are going to make an Ajax request
    var ajaxFlag = document.createElement("input");
    ajaxFlag.setAttribute("type", "hidden");
    ajaxFlag.setAttribute("name", "ajax");
    ajaxFlag.setAttribute("value", 1);
    form.appendChild(ajaxFlag);

    // automatically submit the form on file select
    input.addEventListener("change", function (e) {
        showFiles(e.target.files);

        triggerFormSubmit();
    });

    // drag&drop files if the feature is available
    if (isAdvancedUpload) {
        form.classList.add("has-advanced-upload"); // letting the CSS part to know drag&drop is supported by the browser

        ["drag", "dragstart", "dragend", "dragover", "dragenter", "dragleave", "drop"].forEach(function (event) {
            form.addEventListener(event, function (e) {
                // preventing the unwanted behaviours
                e.preventDefault();
                e.stopPropagation();
            });
        });
        ["dragover", "dragenter"].forEach(function (event) {
            form.addEventListener(event, function () {
                form.classList.add("is-dragover");
            });
        });
        ["dragleave", "dragend", "drop"].forEach(function (event) {
            form.addEventListener(event, function () {
                form.classList.remove("is-dragover");
            });
        });
        form.addEventListener("drop", function (e) {
            droppedFiles = e.dataTransfer.files; // the files that were dropped
            showFiles(droppedFiles);

            triggerFormSubmit();
        });
    }

    // if the form was submitted
    form.addEventListener("submit", function (e) {
        // preventing the duplicate submissions if the current one is in progress
        if (form.classList.contains("is-uploading")) return false;

        form.classList.add("is-uploading");
        form.classList.remove("is-error");

        if (isAdvancedUpload) {
            // ajax file upload for modern browsers
            e.preventDefault();

            // gathering the form data
            var ajaxData = new FormData(form);
            if (droppedFiles) {
                Array.prototype.forEach.call(droppedFiles, function (file) {
                    ajaxData.append(input.getAttribute("name"), file);
                });
            }

            // ajax request
            var ajax = new XMLHttpRequest();
            ajax.open(form.getAttribute("method"), form.getAttribute("action"), true);

            ajax.onload = function () {
                form.classList.remove("is-uploading");
                if (ajax.status >= 200 && ajax.status < 400) {
                    var data = JSON.parse(ajax.responseText);
                    if (data.success) {
                        var sucmsg = "Record updated Successfully";
                        showSuccess(sucmsg);
                    }
                    // form.classList.add( data.success == true ? 'is-success' : 'is-error' );
                    if (!data.success) {
                        var message = "";
                        $.each(data.error, function (index, value) {
                            message += value;
                        });
                        showErrors(message);
                    }
                } else alert("Error. Please, contact the webmaster!");
            };

            ajax.onerror = function () {
                form.classList.remove("is-uploading");
                alert("Error. Please, try again!");
            };

            ajax.send(ajaxData);
        } // fallback Ajax solution upload for older browsers
        else {
            var iframeName = "uploadiframe" + new Date().getTime(),
                iframe = document.createElement("iframe");

            $iframe = $('<iframe name="' + iframeName + '" style="display: none;"></iframe>');

            iframe.setAttribute("name", iframeName);
            iframe.style.display = "none";

            document.body.appendChild(iframe);
            form.setAttribute("target", iframeName);

            iframe.addEventListener("load", function () {
                var data = JSON.parse(iframe.contentDocument.body.innerHTML);
                form.classList.remove("is-uploading");
                //  form.classList.add( data.success == true ? 'is-success' : 'is-error' )
                form.removeAttribute("target");
                if (!data.success) errorMsg.textContent = data.error;
                iframe.parentNode.removeChild(iframe);
            });
        }
    });

    // restart the form if has a state of error/success
    Array.prototype.forEach.call(restart, function (entry) {
        entry.addEventListener("click", function (e) {
            e.preventDefault();
            //  form.classList.remove( 'is-error', 'is-success' );
            input.click();
        });
    });

    // Firefox focus bug fix for file input
    input.addEventListener("focus", function () {
        input.classList.add("has-focus");
    });
    input.addEventListener("blur", function () {
        input.classList.remove("has-focus");
    });
});

</script>
