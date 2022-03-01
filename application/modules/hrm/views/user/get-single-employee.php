<ul  class="nav nav-tabs">
    <li class="active"><a href="#tab_basic_info"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-info-circle"></i> <?= get_phrase('basic'); ?> <?= get_phrase('information'); ?></a> </li>
</ul>
<br/>
    
<div class="tab-content">
    <div  class="tab-pane fade in active" id="tab_basic_info" > 
        <table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <th><?= get_phrase('name'); ?></th>
                    <td><?= $user_info->first_name.' '.$user_info->last_name; ?></td>        
                    <th><?= get_phrase('national_id'); ?></th>
                    <td><?= $other_info->national_id; ?></td>
                </tr>
                <tr>   
                    <th><?= get_phrase('phone'); ?></th>
                    <td><?= $user_info->phone; ?></td>
                    <th><?= get_phrase('email'); ?></th>
                    <td><?= $user_info->email; ?></td> 
                </tr>
                <tr>
                    <th><?= get_phrase('present'); ?> <?= get_phrase('address'); ?></th>
                    <td><?= $other_info->present_address; ?></td>        
                    <th><?= get_phrase('permanent'); ?> <?= get_phrase('address'); ?></th>
                    <td><?= $other_info->permanent_address; ?></td>
                </tr>
                <tr>
                    <th><?= get_phrase('gender'); ?></th>
                    <td><?= $other_info->gender; ?></td> 
                      
                </tr>
                <tr>
                    <th><?= get_phrase('photo'); ?></th>
                    <td>
                        <?php if($user_info->photo !=''){ ?>
                            <?php if($user_info->role_id==3){?>
                            <img src="<?= base_url('uploads/teacher-photo/'.$user_info->photo)?>" width="120">
                            <?php } elseif($user_info->role_id==4){?>
                            <img src="<?= base_url('uploads/student-photo/'.$user_info->photo)?>" width="120">
                            <?php }else {?>
                            <img src="<?= base_url('uploads/employee-photo/'.$user_info->photo)?>" width="120">
                            <?php } ?>
                        <?php } ?>        
                    </td>
                </tr> 
            </tbody>
        </table>
    </div>
</div>
