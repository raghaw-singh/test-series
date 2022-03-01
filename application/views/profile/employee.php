<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?php echo get_phrase('my_profile'); ?></h3>
                <div class="box-tools pull-right">
                </div>
            </div>
            <div class="box-body">
                <ul class="nav nav-tabs"> 
                   <li class="<?php if(isset($info)){ echo 'active'; }?>"><a href="#tab_profile"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-eye"></i> <?php echo get_phrase('profile'); ?></a> </li>
                    <li class=""><a href="#tab_social_info"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-share"></i> <?php echo get_phrase('social'); ?> <?php echo get_phrase('information'); ?></a> </li>
                    <li  class="<?php if(isset($update)){ echo 'active'; }?>"><a href="#tab_update"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo get_phrase('update'); ?></a> </li>                          
                </ul>
                <div class="tab-content"> 
                    <div  class="tab-pane fade in <?php if(isset($info)){ echo 'active'; }?>" id="tab_profile">
                        <div class="col-md-12">
                            <div class="profile_img">
                                <?php if($profile->photo){ ?>
                                    <img src="<?php echo UPLOAD_PATH; ?>/employee-photo/<?php echo $profile->photo; ?>" alt="" width="100" />
                                <?php }else{ ?>
                                    <img class="" src="<?php echo IMG_URL; ?>default-user.png" width="100" alt="Avatar" title="Change the avatar">
                                <?php } ?>
                                <h3><?php echo $profile->name; ?></h3><br/>
                              </div>
                        </div>
                        
                        <table id="datatable-responsive" class="table table-striped" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <th width="18%"><?php echo get_phrase('name'); ?></th>
                                    <td  width="32%" colspan="3"><?php echo $profile->name; ?></td>
                                </tr>  
                                <tr>                                           
                                    <th><?php echo get_phrase('national_id'); ?></th>
                                    <td><?php echo $profile->national_id; ?></td>
                                    <th><?php echo get_phrase('user'); ?> <?php echo get_phrase('type'); ?></th>
                                    <td><?php echo $profile->role; ?></td>
                                </tr> 
                                <tr>
                                    <th><?php echo get_phrase('email'); ?></th>
                                    <td><?php echo $profile->email; ?></td>
                                    <th><?php echo get_phrase('phone'); ?></th>
                                    <td><?php echo $profile->phone; ?></td>
                                </tr>                                                                                
                                <tr>
                                    <th><?php echo get_phrase('present'); ?> <?php echo get_phrase('address'); ?></th>
                                    <td><?php echo $profile->present_address; ?></td>
                                    <th><?php echo get_phrase('permanent'); ?> <?php echo get_phrase('address'); ?></th>
                                    <td><?php echo $profile->permanent_address; ?></td>
                                </tr>                                                                                
                                <tr>
                                    <th><?php echo get_phrase('gender'); ?></th>
                                    <td><?php echo get_phrase($profile->gender); ?></td>
                                    <th><?php echo get_phrase('blood_group'); ?></th>
                                    <td><?php echo get_phrase($profile->blood_group); ?></td>
                                </tr>                                                                                
                                <tr>
                                    <th><?php echo get_phrase('religion'); ?></th>
                                    <td><?php echo $profile->religion; ?></td>
                                    <th><?php echo get_phrase('birth_date'); ?></th>
                                    <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($profile->dob)); ?></td>
                                </tr>                                                                                
                                <tr>
                                </tr>                                                                         
                                                                                                          
                                <tr>
                                    <th><?php echo get_phrase('other_info'); ?></th>
                                    <td><?php echo $profile->other_info; ?></td>
                                    <th><?php echo get_phrase('resume'); ?></th>
                                    <td>
                                         <?php if($profile->resume){ ?>
                                        <a target="_blank" href="<?php echo UPLOAD_PATH; ?>/employee-resume/<?php echo $profile->resume; ?>" class="btn btn-success btn-xs"><i class="fa fa-download"></i> <?php echo get_phrase('download'); ?></a> 
                                        <?php } ?>
                                    </td>
                                </tr>                                                                         
                                                                                                          
                                <tr> 
                                    <th><?php echo get_phrase('join_date'); ?></th>
                                    <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($profile->joining_date)); ?></td>
                                    <th><?php echo get_phrase('resign_date'); ?></th>
                                    <td><?php echo $profile->resign_date != ''  ? date($this->gsms_setting->sms_date_format, strtotime($profile->resign_date)) : ''; ?></td>
                                </tr>                                                                                
                                
                            </tbody> 
                        </table>
                    </div>  
                    
                     <div  class="tab-pane fade in" id="tab_social_info" style="margin-top:20px;"> 
                        <table class="table table-striped" cellspacing="0" width="100%">
                            <tbody>           
                                <tr>
                                    <th><?php echo get_phrase('facebook_url'); ?></th>
                                    <td><?php echo $profile->facebook_url; ?></td>       
                                    <th><?php echo get_phrase('linkedin_url'); ?></th>
                                    <td><?php echo $profile->linkedin_url; ?></td>
                                </tr>
                                <tr>
                                    <th><?php echo get_phrase('twitter_url'); ?></th>
                                    <td><?php echo $profile->twitter_url; ?></td>        
                                    <th><?php echo get_phrase('google_plus_url'); ?></th>
                                    <td><?php echo $profile->google_plus_url; ?></td>
                                </tr>
                                <tr>
                                    <th><?php echo get_phrase('instagram_url'); ?></th>
                                    <td><?php echo $profile->instagram_url; ?></td>        
                                    <th><?php echo get_phrase('pinterest_url'); ?></th>
                                    <td><?php echo $profile->pinterest_url; ?></td>
                                </tr>
                                <tr>
                                    <th><?php echo get_phrase('youtube_url'); ?></th>
                                    <td><?php echo $profile->youtube_url; ?></td>        
                                    <th><?php echo get_phrase('is_view_on_web'); ?></th>
                                    <td><?php echo $profile->is_view_on_web ? get_phrase('yes') : get_phrase('no'); ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                   

                   
                    <div class="tab-pane fade in" id="tab_update" style="margin-top:20px">
                        <?php echo form_open_multipart(site_url('profile/saveProfileInfo/'. $profile->id), array('name' => 'profile', 'id' => 'profile', 'class'=>''), ''); ?>
                            
                            <div class="row">                  
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5  class="column-title"><strong><?php echo get_phrase('basic'); ?> <?php echo get_phrase('information'); ?>:</strong></h5>
                                </div>
                            </div>
                           <div class="row">
                               <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="name"><?php echo get_phrase('name'); ?> <span class="required">*</span></label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="name"  id="name" value="<?php echo isset($profile->name) ?  $profile->name : ''; ?>" placeholder="<?php echo get_phrase('name'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('name'); ?></div> 
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="national_id"><?php echo get_phrase('national_id'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="national_id"  id="national_id" value="<?php echo isset($profile->national_id) ?  $profile->national_id : ''; ?>" placeholder="<?php echo get_phrase('national_id'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('national_id'); ?></div> 
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="phone"><?php echo get_phrase('phone'); ?> <span class="required">*</span></label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="phone"  id="phone" value="<?php echo isset($profile->phone) ?  $profile->phone : ''; ?>" placeholder="<?php echo get_phrase('phone'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('phone'); ?></div> 
                                    </div>
                                </div>                                    
                            
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="gender"><?php echo get_phrase('gender'); ?> <span class="required">*</span></label>
                                         <select  class="form-control col-md-7 col-xs-12"  name="gender"  id="gender" required="required">
                                            <option value="">--<?php echo get_phrase('select'); ?>--</option>
                                            <?php $genders = get_genders(); ?>
                                            <?php foreach($genders as $key=>$value){ ?>
                                                <option value="<?php echo $key; ?>" <?php if($profile->gender == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                            <?php } ?>
                                        </select>
                                    <div class="help-block"><?php echo form_error('gender'); ?></div> 
                                    </div>
                                </div>
                               
                               <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="blood_group"><?php echo get_phrase('blood_group'); ?> </label>
                                        <select  class="form-control col-md-7 col-xs-12" name="blood_group" id="blood_group">
                                            <option value="">--<?php echo get_phrase('select'); ?>--</option> 
                                            <?php $bloods = get_blood_group(); ?>
                                            <?php foreach($bloods as $key=>$value){ ?>
                                                <option value="<?php echo $key; ?>" <?php if($profile->blood_group == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                            <?php } ?>
                                        </select>
                                    <div class="help-block"><?php echo form_error('blood_group'); ?></div> 
                                    </div>
                                </div>
                                
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="religion"><?php echo get_phrase('religion'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="religion"  id="religion" value="<?php echo isset($profile->religion) ?  $profile->religion : ''; ?>" placeholder="<?php echo get_phrase('religion'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('religion'); ?></div>
                                    </div>
                                </div>
                               
                               <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="dob"><?php echo get_phrase('birth_date'); ?> <span class="required">*</span></label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="dob"  id="dob" value="<?php echo isset($profile->dob) ?  date('d-m-Y', strtotime($profile->dob)) : ''; ?>" placeholder="<?php echo get_phrase('birth_date'); ?>"  type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('dob'); ?></div>
                                    </div>
                                </div>
                                
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label for="present_address"><?php echo get_phrase('present'); ?> <?php echo get_phrase('address'); ?> </label>
                                        <textarea  class="form-control col-md-7 col-xs-12 textarea-4column"  name="present_address"  id="present_address" placeholder="<?php echo get_phrase('present'); ?> <?php echo get_phrase('address'); ?>"><?php echo isset($profile->present_address) ?  $profile->present_address : ''; ?></textarea>
                                        <div class="help-block"><?php echo form_error('present_address'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label for="permanent_address"><?php echo get_phrase('permanent'); ?> <?php echo get_phrase('address'); ?></label>
                                        <textarea  class="form-control col-md-7 col-xs-12 textarea-4column"  name="permanent_address"  id="permanent_address"  placeholder="<?php echo get_phrase('permanent'); ?> <?php echo get_phrase('address'); ?>"><?php echo isset($profile->permanent_address) ?  $profile->permanent_address : ''; ?></textarea>
                                    <div class="help-block"><?php echo form_error('permanent_address'); ?></div>
                                    </div>
                                </div>
                               
                           </div>
                           
                            <div class="row">                  
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5  class="column-title"><strong><?php echo get_phrase('academic'); ?> <?php echo get_phrase('information'); ?>:</strong></h5>
                                </div>
                            </div>
                           
                            <div class="row"> 
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="email"><?php echo get_phrase('email'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="email"  id="email" value="<?php echo isset($profile->email) ?  $profile->email :''; ?>" placeholder="<?php echo get_phrase('email'); ?>" type="email" readonly="readonly" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('email'); ?></div>
                                    </div>
                                </div>  
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="joining_date"><?php echo get_phrase('join_date'); ?></label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="joining_date"  id="joining_date" value="<?php echo isset($profile->joining_date) ?  date('d-m-Y', strtotime($profile->joining_date)) : $post['joining_date']; ?>" placeholder="<?php echo get_phrase('join_date'); ?>" readonly="readonly" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('joining_date'); ?></div>
                                    </div>
                                </div>                              
                            </div>                           
                           
                            <div class="row">                  
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5  class="column-title"><strong><?php echo get_phrase('other'); ?> <?php echo get_phrase('information'); ?>:</strong></h5>
                                </div>
                            </div>
                            <div class="row"> 
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="is_view_on_web"><?php echo get_phrase('is_view_on_web'); ?> </label>
                                        <select  class="form-control col-md-7 col-xs-12" name="is_view_on_web" id="is_view_on_web" disabled="disabled">
                                            <option value="">--<?php echo get_phrase('select'); ?>--</option>                                                                                    
                                            <option value="1" <?php if($profile->is_view_on_web == 1){ echo 'selected="selected"';} ?>><?php echo get_phrase('yes'); ?></option>                                           
                                            <option value="0" <?php if($profile->is_view_on_web == 0){ echo 'selected="selected"';} ?>><?php echo get_phrase('no'); ?></option>                                           
                                        </select>
                                        <div class="help-block"><?php echo form_error('is_view_on_web'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="facebook_url"><?php echo get_phrase('facebook_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="facebook_url"  id="facebook_url" value="<?php echo isset($profile->facebook_url) ?  $profile->facebook_url : ''; ?>" placeholder="<?php echo get_phrase('facebook_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('facebook_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="linkedin_url"><?php echo get_phrase('linkedin_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="linkedin_url"  id="linkedin_url" value="<?php echo isset($profile->linkedin_url) ?  $profile->linkedin_url : ''; ?>" placeholder="<?php echo get_phrase('linkedin_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('linkedin_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="twitter_url"><?php echo get_phrase('twitter_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="twitter_url"  id="twitter_url" value="<?php echo isset($profile->twitter_url) ?  $profile->twitter_url : ''; ?>" placeholder="<?php echo get_phrase('twitter_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('twitter_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="google_plus_url"><?php echo get_phrase('google_plus_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="google_plus_url"  id="google_plus_url" value="<?php echo isset($profile->google_plus_url) ?  $profile->google_plus_url : ''; ?>" placeholder="<?php echo get_phrase('google_plus_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('google_plus_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="instagram_url"><?php echo get_phrase('instagram_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="instagram_url"  id="instagram_url" value="<?php echo isset($profile->instagram_url) ?  $profile->instagram_url : ''; ?>" placeholder="<?php echo get_phrase('instagram_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('instagram_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="youtube_url"><?php echo get_phrase('youtube_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="youtube_url"  id="youtube_url" value="<?php echo isset($profile->youtube_url) ?  $profile->youtube_url : ''; ?>" placeholder="<?php echo get_phrase('youtube_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('youtube_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="pinterest_url"><?php echo get_phrase('pinterest_url'); ?> </label>
                                        <input  class="form-control col-md-7 col-xs-12"  name="pinterest_url"  id="pinterest_url" value="<?php echo isset($profile->pinterest_url) ?  $profile->pinterest_url : ''; ?>" placeholder="<?php echo get_phrase('pinterest_url'); ?>" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('pinterest_url'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label for="other_info"><?php echo get_phrase('other_info'); ?> </label>
                                        <textarea  class="form-control col-md-7 col-xs-12 textarea-4column"  name="other_info"  id="other_info" placeholder="<?php echo get_phrase('other_info'); ?>"><?php echo isset($profile->other_info) ?  $profile->other_info : ''; ?></textarea>
                                        <div class="help-block"><?php echo form_error('other_info'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <label for="photo"><?php echo get_phrase('employee'); ?> <?php echo get_phrase('photo'); ?> </label> 
                                        <input  class="form-control"  name="photo"  id="photo" type="file">
                                        <div class="text-info"><?php echo get_phrase('valid_file_format_img'); ?></div>
                                        <div class="help-block"><?php echo form_error('photo'); ?></div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <input type="hidden" name="prev_photo" id="prev_photo" value="<?php echo $profile->photo; ?>" />
                                        <?php if($profile->photo){ ?>
                                        <img src="<?php echo UPLOAD_PATH; ?>/employee-photo/<?php echo $profile->photo; ?>" alt="" width="70" /><br/><br/>
                                        <?php } ?>
                                    </div>
                                </div>                                 
                           </div>
                          
                       
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a href="<?php echo site_url('profile'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                    <input type="hidden" name="id" id="id" value="<?php echo $profile->id; ?>" />
                                    <input type="hidden" name="user_type" id="user_type" value="employee" />
                                    <button id="send" type="submit" class="btn btn-success" id="btnSubmit"><?php echo get_phrase('update'); ?></button>
                                </div>
                            </div>
                        <?php echo form_close(); ?>
                    </div>                         
                </div>
            </div>
        </div>
    </div>
</div>
<style type="text/css">
.profile_img {
    text-align: center;
    margin-bottom: 20px;
    min-height: 200px;
}
.profile_img>img {
    border-radius: 50%;
    margin-top: 30px;
}
.column-title {
    padding: 10px;
    background: #ecebeb;
}
input[type=file] {
    opacity: 1;
    border: 1px solid #d2d6de;
}
</style>
<script type="text/javascript">
    $('#profile').on('submit',function(e){
        var processing          =   '<?php echo get_phrase('processing'); ?>';
        $('#btnSubmit').text(processing);

    })
</script>