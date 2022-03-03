<?php 
$segment1  =    $this->uri->segment(1);
$segment_2 =    $this->uri->segment(2);
?>
<aside class="main-sidebar" id="alert2">
    <section class="sidebar" id="sibe-box">
        <ul class="sidebar-menu verttop">
            <li class="treeview <?php echo active_link('dashboard'); ?>">
                <a href="<?= base_url('dashboard');?>"> <i class="fas fa-home"></i> <span><?= get_phrase('dashboard');?></span> </a>
            </li>
            <?php if(has_permission(VIEW,'setting','setting') || has_permission(VIEW,'setting','sms')||has_permission(VIEW,'setting','payments')|| has_permission(VIEW,'setting','emails')||has_permission(VIEW,'setting','tax')){?>
            <li class="treeview <?php if($segment1=='setting') echo 'active';?>">
                <a href="#"> <i class="fa fa-cogs ftlayer"></i> <span><?= get_phrase('setting');?></span> <i class="fa fa-angle-left pull-right"></i> </a>
                <ul class="treeview-menu">
                    <?php if(has_permission(VIEW,'setting','setting')){?>
                    <li class="<?php echo active_link('setting'); ?>">
                        <a href="<?= base_url('setting/setting');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('general').' '.get_phrase('setting');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'setting','sms')){?>
                    <li class="<?php echo active_link('sms'); ?>">
                        <a href="<?= base_url('setting/sms');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('sms').' '.get_phrase('setting');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'setting','payment')){?>
                    <li class="<?php echo active_link('payment'); ?>">
                        <a href="<?= base_url('setting/payment');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('payment').' '.get_phrase('setting');?></a>
                    </li>
                    <?php  }?>
                    <?php if(has_permission(VIEW,'setting','emails')){?>
                    <li class="<?php echo active_link('emails'); ?>">
                        <a href="<?= base_url('setting/emails');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('e-mail').' '.get_phrase('setting');?></a>
                    </li>
                    <?php } ?>
                </ul>
            </li>
            <?php } ?>
            <?php if(has_permission(VIEW,'administrator','role')||has_permission(VIEW,'administrator','permission') || has_permission(VIEW,'administrator','user')||has_permission(VIEW,'administrator','password') || has_permission(VIEW,'administrator','usercredential')||has_permission(VIEW,'administrator','email')||has_permission(VIEW,'administrator','backup')){?>
            <li class="treeview <?php if($segment_2=='year'||$segment_2=='role'||$segment_2=='permission'||$segment_2=='password'||$segment_2=='usercredential'||$segment_2=='email'||$segment_2=='activitylog'||$segment_2=='backup') echo 'active';?> ">
                <a href="#"> <i class="fa fa-user ftlayer"></i> <span><?= get_phrase('administrator');?></span> <i class="fa fa-angle-left pull-right"></i> </a>
                <ul class="treeview-menu">
                    <?php if(has_permission(VIEW,'administrator','role')){?>
                    <li class="<?php echo active_link('role'); ?>">
                        <a href="<?= base_url('administrator/role');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('user').' '.get_phrase('role');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'administrator','permission')){?>
                    <li class="<?php echo active_link('permission'); ?>">
                        <a href="<?= base_url('administrator/permission');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('role').' '.get_phrase('permission');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'administrator','user')){?>
                    <li class="<?php echo active_link('user'); ?>">
                        <a href="<?= base_url('administrator/user');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('manager').' '.get_phrase('user');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'administrator','password')){?>
                    <li class="<?php echo active_link('password'); ?>">
                        <a href="<?= base_url('administrator/password');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('reset').' '.get_phrase('user').' '.get_phrase('password');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'administrator','usercredential')){?>
                    <li class="<?php echo active_link('usercredential'); ?>">
                        <a href="<?= base_url('administrator/usercredential');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('user').' '.get_phrase('credential');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'administrator','email')){?>
                    <li class="<?php echo active_link('email'); ?>">
                        <a href="<?= base_url('administrator/email');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('reset').' '.get_phrase('user').' '.get_phrase('email');?></a>
                    </li>
                    <?php } ?>
                    <?php if(has_permission(VIEW,'administrator','backup')){?>
                    <li class="<?php echo active_link('backup'); ?>">
                        <a href="<?= base_url('administrator/backup');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('database').' '.get_phrase('backup');?></a>
                    </li>
                    <?php } ?>
                </ul>
            </li>
            <?php } ?>
            <?php if(has_permission(VIEW,'hrm','student')||has_permission(VIEW,'hrm','admin')||has_permission(VIEW,'hrm','users')){?>
            <li class="treeview <?php if($segment1=='hrm') echo 'active';?>">
                <a href="#"> <i class="fa fa-users ftlayer"></i> <span><?= get_phrase('human_resource');?></span> <i class="fa fa-angle-left pull-right"></i> </a>
                <ul class="treeview-menu">
                    <?php if(has_permission(VIEW,'hrm','users')){?>
                    <li class="<?php echo active_link('users'); ?>">
                        <a href="<?= base_url('hrm/users');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('manage').' '.get_phrase('users');?></a>
                    </li>
                    <?php } ?>
                </ul>
            </li>
            <?php } ?>
            <li class="treeview <?php echo active_link('teacher'); ?>">
                <a href="<?= base_url('teacher/teacher');?>"> <i class="fa fa-user"></i> <span><?= get_phrase('teacher');?></span> </a>
            </li>
            <li class="treeview <?php echo active_link('student'); ?>">
                <a href="<?= base_url('student/student');?>"> <i class="fa fa-graduation-cap"></i> <span><?= get_phrase('student');?></span> </a>
            </li>
            <li class="treeview <?php if($segment1=='online_exam') echo 'active';?>">
                <a href="#"> <i class="fa fa-university ftlayer"></i> <span><?= get_phrase('online_exam');?></span> <i class="fa fa-angle-left pull-right"></i> </a>
                <ul class="treeview-menu">
                    <li class="<?php echo active_link('online_exam'); ?>">
                        <a href="<?= base_url('online_exam/online_exam');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('online').' '.get_phrase('exam');?></a>
                    </li>
                    <?php if(has_permission(VIEW,'hrm','admin')||has_permission(VIEW,'hrm','users')){?>
                    <li class="<?php echo active_link('question_bank'); ?>">
                        <a href="<?= base_url('online_exam/question_bank');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('question').' '.get_phrase('bank');?></a>
                    </li>
                    <?php } ?>
                    <li class="<?php echo active_link('question_group'); ?>">
                        <a href="<?= base_url('online_exam/question_group');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('question').' '.get_phrase('group');?></a>
                    </li>
                </ul>
            </li>
            <li class="treeview <?php if($segment1=='academic') echo 'active';?>">
                <a href="#"> <i class="fa fa-users ftlayer"></i> <span><?= get_phrase('academic');?></span> <i class="fa fa-angle-left pull-right"></i> </a>
                <ul class="treeview-menu">
                    <li class="<?php echo active_link('users'); ?>">
                        <a href="<?= base_url('academic/student_class');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('class');?></a>
                    </li>
                     <li class="<?php echo active_link('users'); ?>">
                        <a href="<?= base_url('academic/section');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('section');?></a>
                    </li>
                     <li class="<?php echo active_link('users'); ?>">
                        <a href="<?= base_url('academic/subject');?>"><i class="fas fa-angle-right"></i> <?= get_phrase('subject');?></a>
                    </li>
                </ul>
            </li>
            <?php if(has_permission(VIEW,'language','language')){?>
            <li class="treeview <?php echo active_link('language'); ?>">
                <a href="<?= base_url('language');?>"> <i class="fa fa-language"></i> <span><?= get_phrase('language');?></span> </a>
            </li>
            <?php } ?>

            <?php if(has_permission(VIEW,'orders','orders')){?>
            <li class="treeview <?php echo active_link('orders'); ?>">
                <a href="<?= base_url('orders');?>"> <i class="fab fa-first-order-alt"></i> <span><?= get_phrase('orders');?></span> </a>
            </li>
            <?php } ?>
        </ul>
    </section>
</aside>