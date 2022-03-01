<header class="main-header" id="alert">
    <a href="<?= base_url('dashboard');?>" class="logo">
        <span class="logo-mini">
            <?php if(isset($this->gsms_setting->logo) && !empty($this->gsms_setting->logo)){ ?>
            <img src="<?php echo base_url(); ?>uploads/logo/<?php echo $this->gsms_setting->logo; ?>" />
            <?php } ?>
        </span>
        <span class="logo-lg">
            <?php if(isset($this->gsms_setting->logo) && !empty($this->gsms_setting->logo)){ ?>
            <img src="<?php echo base_url(); ?>uploads/logo/<?php echo $this->gsms_setting->logo; ?>" />
            <?php } ?>
        </span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
        <a href="#" onclick="collapseSidebar()" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <div class="col-lg-5 col-md-4 col-sm-3 col-xs-4">
            <span href="#" class="sidebar-session"><?php echo $this->gsms_setting->system_name; ?></span>
        </div>
        <div class="col-lg-7 col-md-8 col-sm-9 col-xs-8">
            <div class="pull-right">
                
                <div class="navbar-custom-menu">
                    <div class="langdiv">
                        
                    </div>
                    <ul class="nav navbar-nav headertopmenu">
                        
                        <?php
                            $photo = $this->session->userdata('photo');
                            $role_id = $this->session->userdata('role_id');
                            $path = '';
                            if($role_id == CUSTOMER){ $path = 'customer'; }
                            else{ $path = 'employee'; }
                        ?>      
                        <li class="dropdown user-menu">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <?php if($photo !=''){?>
                                <img src="<?= base_url();?>uploads/<?php echo $path; ?>-photo/<?php echo $photo; ?>" class="topuser-image">
                                <?php } else{?>
                                <img src="<?= base_url('uploads/no-image.png');?>" class="topuser-image">
                                <?php } ?>
                            </a>
                            <ul class="dropdown-menu dropdown-user menuboxshadow">
                                <li>
                                    <div class="sstopuser">
                                        <div class="ssuserleft">
                                            <a href="<?= base_url('profile');?>">
                                                <?php if($photo !=''){?>
                                                <img src="<?= base_url();?>uploads/<?php echo $path; ?>-photo/<?php echo $photo; ?>">
                                                <?php } else{?>
                                                <img src="<?= base_url('uploads/no-image.png');?>">
                                                <?php } ?>
                                            </a>
                                        </div>

                                        <div class="sstopuser-test">
                                            <h4 style="text-transform: capitalize;"><?php echo $this->session->userdata('name'); ?></h4>
                                            <span><?= $this->db->get_where('roles',array('id'=>$this->session->userdata('role_id')))->row()->name; ?></span>
                                        </div>
                                        <div class="divider"></div>
                                        <div class="sspass">
                                            <a href="<?php echo site_url('profile/index'); ?>" data-toggle="tooltip" title="" data-original-title="<?= get_phrase('profile');?>"><i class="fa fa-user"></i><?= get_phrase('profile');?></a>
                                            <a class="pl25" href="<?php echo site_url('profile/password'); ?>" data-toggle="tooltip" title="" data-original-title="<?= get_phrase('change_password');?>"><i class="fa fa-key"></i><?= get_phrase('password');?></a>
                                            <a class="pull-right" href="<?php echo site_url('auth/logout'); ?>"><i class="fa fa-sign-out fa-fw"></i><?= get_phrase('logout');?></a>
                                        </div>
                                    </div>
                                    <!--./sstopuser-->
                                </li>
                            </ul>
                        </li>
                        <?php if($this->gsms_setting->enable_frontend){ ?>
                        <li>
                            <a href="<?php echo site_url(); ?>"><i class="fa fa-globe"></i> Web</a>
                        </li>
                    <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>