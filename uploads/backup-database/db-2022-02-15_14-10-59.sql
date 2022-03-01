#
# TABLE STRUCTURE FOR: bus_stop
#

DROP TABLE IF EXISTS `bus_stop`;

CREATE TABLE `bus_stop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL COMMENT 'active=1, inactive=0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: bus_type
#

DROP TABLE IF EXISTS `bus_type`;

CREATE TABLE `bus_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `status` int(11) NOT NULL COMMENT 'active=1,inactive=0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# TABLE STRUCTURE FOR: email_settings
#

DROP TABLE IF EXISTS `email_settings`;

CREATE TABLE `email_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_protocol` varchar(50) NOT NULL,
  `smtp_host` varchar(100) NOT NULL,
  `smtp_port` varchar(20) NOT NULL,
  `smtp_timeout` tinyint(1) NOT NULL,
  `smtp_user` varchar(100) NOT NULL,
  `smtp_pass` varchar(100) NOT NULL,
  `smtp_crypto` varchar(50) NOT NULL,
  `mail_type` varchar(50) NOT NULL,
  `char_set` varchar(50) NOT NULL,
  `priority` tinyint(1) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_address` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `email_settings` (`id`, `mail_protocol`, `smtp_host`, `smtp_port`, `smtp_timeout`, `smtp_user`, `smtp_pass`, `smtp_crypto`, `mail_type`, `char_set`, `priority`, `from_name`, `from_address`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'smtp', 'ssl://mail.rewainfotech.com', '465', 0, 'raghaw@rewainfotech.com', 'raghaw!@#$', '', 'html', 'utf-8', 1, 'Learning Management System', 'info@calevalab.fi', 1, '2019-09-30 08:52:36', '2021-11-04 01:53:50', 1, 1);


#
# TABLE STRUCTURE FOR: emails
#

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `sender_role_id` int(11) NOT NULL,
  `receivers` text CHARACTER SET utf8 DEFAULT NULL,
  `academic_year_id` int(11) NOT NULL,
  `email_type` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '1. New Course',
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `attachment` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: employees
#

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `national_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `designation_id` int(11) NOT NULL,
  `salary_grade_id` int(11) DEFAULT NULL,
  `salary_type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `present_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `blood_group` varchar(10) CHARACTER SET utf8 NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dob` date NOT NULL,
  `joining_date` date NOT NULL,
  `resign_date` date DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `resume` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `twitter_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_plus_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `instagram_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pinterest_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `youtube_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `other_info` text DEFAULT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `employees` (`id`, `user_id`, `national_id`, `designation_id`, `salary_grade_id`, `salary_type`, `name`, `phone`, `present_address`, `permanent_address`, `gender`, `blood_group`, `religion`, `dob`, `joining_date`, `resign_date`, `photo`, `resume`, `facebook_url`, `linkedin_url`, `twitter_url`, `google_plus_url`, `instagram_url`, `pinterest_url`, `youtube_url`, `other_info`, `is_view_on_web`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 1, '11111111111', 10, 1, 'monthly', 'Chandramani Arya', '1234856975', 'Indore', 'Indore', 'female', 'b_positive', 'islam', '1969-12-01', '1969-12-31', NULL, '', NULL, 'https://www.facebook.com/', 'https://www.linkedin.com/', 'https://twitter.com/', 'https://plus.google.com/', 'https://www.instagram.com/', 'https://www.pinterest.com/', 'https://www.youtube.com/', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, 1, '2019-11-10 08:41:59', '2019-11-10 08:41:59', 1, 1);


#
# TABLE STRUCTURE FOR: global_settings
#

DROP TABLE IF EXISTS `global_settings`;

CREATE TABLE `global_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `global_settings` (`id`, `key`, `value`) VALUES (1, 'fb_app_id', '239058438209259');
INSERT INTO `global_settings` (`id`, `key`, `value`) VALUES (2, 'fb_app_secret', '8989c8ccf94551d0342441d6fd2752fe');
INSERT INTO `global_settings` (`id`, `key`, `value`) VALUES (3, 'fb_social_login', '1');


#
# TABLE STRUCTURE FOR: gsms_sessions
#

DROP TABLE IF EXISTS `gsms_sessions`;

CREATE TABLE `gsms_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `gsms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('15i4hcl3jb9433dknchv3ghetprefk4p', '::1', 1634312056, '__ci_last_regenerate|i:1634312056;');
INSERT INTO `gsms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('s4qfcmrvqbocct94f3iktru81f3t0klj', '::1', 1634312368, '__ci_last_regenerate|i:1634312368;');
INSERT INTO `gsms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('177mugs5upc0hrnno3sc7d9uar6geofn', '::1', 1634312706, '__ci_last_regenerate|i:1634312706;');
INSERT INTO `gsms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('pplrr3bm2huspdhl7gcsteksu132mpnt', '::1', 1634313011, '__ci_last_regenerate|i:1634313011;current_language|s:7:\"english\";error|s:26:\"Invalid Email OR password.\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}');
INSERT INTO `gsms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('fprq3ueus3kv9nqqv0nmng65u5362v9o', '::1', 1634313097, '__ci_last_regenerate|i:1634313011;current_language|s:7:\"english\";error|s:26:\"Invalid Email OR password.\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}');


#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `english` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1607 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1, 'login', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (2, 'email_address', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (3, 'password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (4, 'sign_in', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (5, 'forgot_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (6, 'login_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (7, 'dashboard', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (8, 'profile', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (9, 'change_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (10, 'logout', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (11, 'courses', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (12, 'manage_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (13, 'course_category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (14, 'settings', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (15, 'sales', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (16, 'reports', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (17, 'payout', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (18, 'setting', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (19, 'general', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (20, 'sms', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (21, 'payment', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (22, 'e-mail', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (23, 'language', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (24, 'administrator', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (25, 'academic_year', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (26, 'role', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (27, 'permission', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (28, 'manager', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (29, 'user', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (30, 'reset', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (31, 'credential', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (32, 'email', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (33, 'activity_log', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (34, 'database', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (35, 'backup', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (36, 'human_resource', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (37, 'manage', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (38, 'users', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (39, 'clickatell', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (40, 'SMS_gateway', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (41, 'twilio', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (42, 'custom', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (43, 'MSG91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (44, 'sms_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (45, 'local_text', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (46, 'bulk', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (47, 'plivo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (48, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (49, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (50, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (51, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (52, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (53, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (54, 'beta_sms', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (55, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (56, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (57, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (58, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (59, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (60, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (61, 'edit', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (62, 'system_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (63, 'address', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (64, 'phone', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (65, 'footer', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (66, 'timezone', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (67, 'date_format', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (68, 'currency', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (69, 'currency_symbol', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (70, 'current_theme', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (71, 'logo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (72, 'favicon', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (73, 'front', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (74, 'enable_rtl', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (75, 'google_analytics', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (76, 'facebook_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (77, 'twitter_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (78, 'linkedin_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (79, 'google_plus_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (80, 'youtube_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (81, 'instagram_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (82, 'pinterest_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (83, 'edit_logo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (84, 'favicon_icon', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (85, 'default_time_zone', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (86, 'update_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (87, 'list', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (88, 'add', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (89, 'sl_no', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (90, 'action', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (91, 'update', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (92, 'label', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (93, 'active', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (94, 'name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (95, 'cancel', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (96, 'submit', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (97, 'update_failed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (98, 'manage_language', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (99, 'manage_academic_year', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (100, 'is_running', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (101, 'note', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (102, 'no', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (103, 'confirm_alert', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (104, 'delete', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (105, 'activate', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (106, 'yes', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (107, 'instruction', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (108, 'running_year_instructions', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (109, 'session_start', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (110, 'session_end', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (111, 'user_role', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (112, 'is_default', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (113, 'role_permission', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (114, 'module', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (115, 'function', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (116, 'view', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (117, 'manage_user', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (118, 'type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (119, 'select', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (120, 'class', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (121, 'find', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (122, 'information', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (123, 'student', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (124, 'activity', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (125, 'photo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (126, 'created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (127, 'status', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (128, 'basic', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (129, 'social', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (130, 'national_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (131, 'designation', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (132, 'present', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (133, 'permanent', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (134, 'gender', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (135, 'blood_group', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (136, 'religion', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (137, 'birth_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (138, 'join_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (139, 'salary_grade', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (140, 'salary_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (141, 'other_info', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (142, 'resume', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (143, 'is_view_on_web', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (144, 'female', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (145, 'b_positive', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (146, 'monthly', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (147, 'reset_user_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (148, 'confirm', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (149, 'manage_user_instruction', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (150, 'reset_user_email', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (151, 'check_all', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (152, 'uncheck_all', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (153, 'all', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (154, 'delete_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (155, 'download', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (156, 'upload_from_local_directory', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (157, 'upload', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (158, 'backup_history', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (159, 'create_backup', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (160, 'restore', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (161, 'success_message', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (162, 'restored_message', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (163, 'db_backup_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (164, 'db_deleted', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (165, 'image', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (166, 'file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (167, 'cron_secret_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (168, 'manage_category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (169, 'category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (170, 'category_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (171, 'category_image', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (172, 'save', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (173, 'category_code', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (174, 'category_thumbnail', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (175, 'category_created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (176, 'record_already_existed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (177, 'category_updated', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (178, 'record_deleted', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (179, 'inactive', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (180, 'status_changed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (181, 'course_sub_category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (182, 'manage_sub_category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (183, 'sub_category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (184, '---select---', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (185, 'sub_category_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (186, 'sub_category_created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (187, 'close', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (188, 'sub_category_updated', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (189, 'active_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (190, 'pending_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (191, 'free_courses', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (192, 'paid_courses', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (193, 'add_new_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (194, 'title', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (195, 'lesson_and_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (196, 'enrolled_student', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (197, 'price', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (198, 'course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (199, 'course_title', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (200, 'level', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (201, 'course_created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (202, 'save_to_draft', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (203, 'instructor', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (204, 'total_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (205, 'total_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (206, 'total_enrolment', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (207, 'session_and_lession', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (208, 'Mark as pending', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (209, 'edit_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (210, 'curriculum', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (211, 'requirements', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (212, 'outcomes', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (213, 'pricing', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (214, 'media', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (215, 'SEO', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (216, 'finish', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (217, 'short_description', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (218, 'description', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (219, '---select----', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (220, 'beginner', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (221, 'advanced', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (222, 'intermediate', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (223, 'language_made_in', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (224, 'check_if_this_course_is_top_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (225, 'provide_requirements', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (226, 'course_price', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (227, 'discounted_price', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (228, 'discount', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (229, 'course_overview_provider', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (230, 'youtube', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (231, 'vimeo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (232, 'HTML5', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (233, 'course_overview_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (234, 'course_thumbnail', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (235, 'select_image', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (236, 'change', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (237, 'remove', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (238, 'meta_keywords', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (239, 'meta_description', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (240, 'thank_you!', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (241, 'you_are_just_one_click_away', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (242, 'add_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (243, 'add_lession', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (244, 'add_quiz', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (245, 'sort_sections', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (246, 'provide_outcomes', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (247, 'write_a_keyword_and_then_press_enter_button', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (248, 'add_new_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (249, 'add_new_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (250, 'add_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (251, 'provide_a_section_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (252, 'section_title', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (253, 'course_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (254, 'something_went_wrong', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (255, 'add_new_quiz', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (256, 'section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (257, 'sort_lessons', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (258, 'sort_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (259, 'update_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (260, 'edit_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (261, 'delete_section', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (262, 'record_created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (263, 'record_updated', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (264, 'edit_quiz', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (265, 'list_of_sections', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (266, 'update_sorting', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (267, 'sections_have_been_sorted', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (268, 'select_lesson_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (269, 'video', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (270, 'video_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (271, 'video_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (272, 'document', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (273, 'image_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (274, 'iframe_embed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (275, 'next', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (276, 'please_select_a_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (277, 'lesson_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (278, 'for_web_application', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (279, 'this_video_will_be_shown_on_web_application', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (280, 'analyzing_the_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (281, 'invalid_url', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (282, 'your_video_source_has_to_be_either_youtube_or_vimeo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (283, 'duration', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (284, 'lesson_provider', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (285, 'for_mobile_application', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (286, 'only', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (287, 'type_video_is_acceptable_for_mobile_application', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (288, 'summary', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (289, 'lost_your_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (290, 'send', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (291, 'back_to_login', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (292, 'reset_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (293, 'current_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (294, 'conf_password', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (295, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (296, 'username', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (297, 'api_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (298, 'from_number', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (299, 'clickatell_mo_no', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (300, 'is_active', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (301, 'account_sid', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (302, 'auth_token', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (303, 'paypal', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (304, 'payumoney', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (305, 'paytm', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (306, 'is_demo', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (307, 'extra_charge', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (308, 'key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (309, 'key_salt', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (310, 'merchant_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (311, 'merchant_mid', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (312, 'website', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (313, 'industry_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (314, 'protocol', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (315, 'smtp', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (316, 'host', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (317, 'port', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (318, 'security', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (319, 'time_out', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (320, 'char_set', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (321, 'priority', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (322, 'from', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (323, 'heads_up', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (324, 'are_you_sure', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (325, 'mark_as_pending', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (326, 'mark_as_active', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (327, 'change_status', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (328, 'export', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (329, 'pending', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (330, 'my_profile', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (331, 'course_updated', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (332, 'quiz_title', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (333, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (334, 'auth_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (335, 'sender_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (336, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (337, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (338, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (339, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (340, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (341, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (342, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (343, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (344, 'msg91', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (345, 'template', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (346, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (347, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (348, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (349, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (350, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (351, 'quick_link', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (352, 'receiver_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (353, 'dynamic_tag', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (354, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (355, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (356, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (357, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (358, 'manage_email_template', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (359, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (360, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (361, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (362, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (363, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (364, 'insert_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (365, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (366, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (367, 'manage_SMS_template', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (368, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (369, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (370, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (371, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (372, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (373, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (374, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (375, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (376, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (377, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (378, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (379, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (380, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (381, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (382, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (383, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (384, 'admin', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (385, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (386, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (387, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (388, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (389, 'students', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (390, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (391, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (392, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (393, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (394, 'add_student', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (395, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (396, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (397, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (398, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (399, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (400, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (401, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (402, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (403, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (404, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (405, 'first_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (406, 'last_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (407, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (408, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (409, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (410, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (411, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (412, 'register', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (413, 'contact_number', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (414, 'account_created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (415, 'resend', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (416, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (417, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (418, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (419, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (420, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (421, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (422, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (423, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (424, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (425, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (426, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (427, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (428, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (429, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (430, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (431, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (432, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (433, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (434, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (435, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (436, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (437, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (438, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (439, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (440, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (441, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (442, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (443, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (444, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (445, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (446, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (447, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (448, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (449, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (450, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (451, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (452, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (453, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (454, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (455, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (456, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (457, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (458, 'pay_stack', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (459, 'secret_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (460, 'public_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (461, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (462, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (463, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (464, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (465, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (466, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (467, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (468, 'orders', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (469, 'statistics', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (470, 'report_by_user', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (471, 'report_by_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (472, 'report_by_module', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (473, 'report_by_skill', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (474, 'report_by_user_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (475, 'report_by_category', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (476, 'report_by_meetup', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (477, 'report_by_checklist', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (478, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (479, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (480, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (481, 'assessment', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (482, 'course_result', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (483, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (484, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (485, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (486, 'passing_condition_value', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (487, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (488, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (489, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (490, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (491, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (492, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (493, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (494, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (495, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (496, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (497, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (498, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (499, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (500, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (501, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (502, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (503, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (504, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (505, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (506, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (507, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (508, 'link_expire', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (509, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (510, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (511, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (512, 'lession_added_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (513, 'update_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (514, 'lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (515, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (516, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (517, 'quiz_has_been_deleted_successfully', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (518, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (519, 'emailaddress', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (520, 'successfully_enrolled', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (521, 'student_has_already_been_enrolled_to_this_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (522, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (523, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (524, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (525, 'pass_pecentage', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (526, 'wishlist_deleted_successfuly', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (527, 'completed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (528, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (529, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (530, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (531, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (532, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (533, 'discount_applicable_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (534, 'tax_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (535, 'included', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (536, 'excluded', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (537, 'TAX_rate', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (538, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (539, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (540, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (541, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (542, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (543, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (544, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (545, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (546, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (547, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (548, 'tax', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (549, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (550, 'coupon', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (551, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (552, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (553, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (554, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (555, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (556, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (557, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (558, 'manage_tax', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (559, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (560, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (561, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (562, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (563, 'percentage', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (564, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (565, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (566, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (567, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (568, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (569, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (570, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (571, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (572, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (573, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (574, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (575, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (576, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (577, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (578, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (579, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (580, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (581, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (582, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (583, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (584, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (585, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (586, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (587, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (588, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (589, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (590, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (591, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (592, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (593, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (594, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (595, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (596, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (597, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (598, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (599, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (600, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (601, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (602, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (603, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (604, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (605, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (606, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (607, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (608, 'manage_coupon', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (609, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (610, 'coupon_code', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (611, 'coupon_discount', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (612, 'valid_on', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (613, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (614, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (615, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (616, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (617, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (618, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (619, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (620, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (621, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (622, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (623, 'discount_percent', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (624, 'expiry_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (625, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (626, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (627, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (628, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (629, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (630, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (631, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (632, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (633, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (634, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (635, 'manage_order', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (636, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (637, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (638, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (639, 'payment_status', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (640, 'success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (641, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (642, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (643, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (644, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (645, 'from_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (646, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (647, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (648, 'to_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (649, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (650, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (651, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (652, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (653, 'failed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (654, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (655, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (656, '#', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (657, 'student_name', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (658, 'order_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (659, 'transaction_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (660, 'amount', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (661, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (662, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (663, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (664, 'method', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (665, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (666, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (667, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (668, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (669, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (670, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (671, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (672, 'date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (673, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (674, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (675, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (676, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (677, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (678, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (679, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (680, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (681, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (682, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (683, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (684, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (685, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (686, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (687, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (688, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (689, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (690, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (691, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (692, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (693, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (694, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (695, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (696, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (697, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (698, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (699, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (700, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (701, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (702, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (703, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (704, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (705, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (706, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (707, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (708, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (709, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (710, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (711, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (712, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (713, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (714, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (715, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (716, 'this_course_already_in_your_cart', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (717, 'min', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (718, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (719, 'enrollment', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (720, 'history', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (721, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (722, 'enroll_student', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (723, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (724, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (725, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (726, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (727, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (728, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (729, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (730, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (731, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (732, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (733, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (734, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (735, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (736, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (737, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (738, 'enroll_now', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (739, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (740, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (741, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (742, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (743, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (744, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (745, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (746, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (747, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (748, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (749, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (750, 'enroll_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (751, 'manage_enrollment_history', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (752, 'manager_enrollment_history', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (753, 'enrolled_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (754, 'enrolled_date', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (755, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (756, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (757, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (758, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (759, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (760, 'quiz_has_been_added_successfully', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (761, 'quiz', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (762, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (763, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (764, 'record_deleted_successfully', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (765, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (766, 'upload_system_video_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (767, 'for_web_and_mobile_application', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (768, 'select_system_video_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (769, 'has_to_be_bigger_than', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (770, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (771, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (772, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (773, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (774, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (775, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (776, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (777, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (778, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (779, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (780, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (781, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (782, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (783, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (784, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (785, 'quiz_has_been_updated_successfully', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (786, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (787, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (788, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (789, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (790, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (791, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (792, 'manage_question', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (793, 'question', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (794, 'right_ans', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (795, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (796, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (797, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (798, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (799, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (800, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (801, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (802, 'add_question', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (803, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (804, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (805, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (806, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (807, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (808, 'question_title', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (809, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (810, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (811, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (812, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (813, 'no_of_options', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (814, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (815, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (816, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (817, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (818, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (819, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (820, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (821, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (822, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (823, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (824, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (825, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (826, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (827, 'option', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (828, 'option_', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (829, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (830, 'options', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (831, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (832, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (833, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (834, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (835, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (836, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (837, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (838, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (839, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (840, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (841, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (842, 'explain_answer', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (843, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (844, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (845, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (846, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (847, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (848, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (849, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (850, 'correct_answers', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (851, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (852, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (853, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (854, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (855, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (856, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (857, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (858, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (859, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (860, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (861, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (862, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (863, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (864, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (865, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (866, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (867, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (868, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (869, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (870, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (871, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (872, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (873, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (874, 'this_course_is_not_free_at_all', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (875, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (876, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (877, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (878, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (879, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (880, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (881, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (882, 'question_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (883, 'text', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (884, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (885, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (886, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (887, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (888, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (889, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (890, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (891, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (892, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (893, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (894, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (895, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (896, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (897, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (898, 'video_link', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (899, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (900, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (901, 'question_image', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (902, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (903, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (904, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (905, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (906, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (907, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (908, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (909, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (910, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (911, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (912, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (913, 'question_added_successfully', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (914, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (915, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (916, 'employee', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (917, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (918, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (919, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (920, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (921, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (922, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (923, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (924, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (925, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (926, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (927, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (928, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (929, 'auth_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (930, 'hash_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (931, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (932, 'SMS_country', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (933, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (934, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (935, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (936, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (937, 'stripe', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (938, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (939, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (940, 'stripe_api_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (941, 'stripe_publishable_key', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (942, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (943, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (944, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (945, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (946, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (947, 'stripe_currency', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (948, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (949, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (950, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (951, 'number_of_questions', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (952, 'get_started', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (953, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (954, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (955, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (956, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (957, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (958, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (959, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (960, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (961, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (962, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (963, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (964, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (965, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (966, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (967, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (968, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (969, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (970, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (971, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (972, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (973, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (974, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (975, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (976, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (977, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (978, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (979, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (980, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (981, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (982, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (983, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (984, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (985, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (986, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (987, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (988, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (989, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (990, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (991, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (992, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (993, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (994, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (995, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (996, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (997, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (998, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (999, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1000, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1001, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1002, 'iframe', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1003, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1004, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1005, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1006, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1007, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1008, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1009, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1010, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1011, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1012, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1013, 'thumbnail', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1014, 'the_image_size_should_be', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1015, 'document_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1016, 'select_type_of_document', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1017, 'text_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1018, 'pdf_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1019, 'document_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1020, 'attachment', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1021, 'iframe_source', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1022, 'provide_the_source_only', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1023, 'invalid_attachment', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1024, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1025, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1026, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1027, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1028, 'do_you_want_to_keep_it_free_as_a_preview_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1029, 'mark_as_free_lesson', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1030, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1031, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1032, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1033, 'please_select_valid_video_file', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1034, 'lession_updated_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1035, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1036, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1037, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1038, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1039, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1040, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1041, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1042, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1043, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1044, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1045, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1046, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1047, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1048, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1049, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1050, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1051, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1052, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1053, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1054, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1055, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1056, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1057, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1058, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1059, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1060, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1061, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1062, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1063, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1064, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1065, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1066, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1067, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1068, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1069, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1070, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1071, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1072, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1073, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1074, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1075, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1076, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1077, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1078, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1079, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1080, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1081, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1082, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1083, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1084, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1085, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1086, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1087, 'list_of_lessons', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1088, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1089, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1090, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1091, 'lesson_have_been_sorted', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1092, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1093, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1094, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1095, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1096, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1097, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1098, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1099, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1100, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1101, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1102, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1103, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1104, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1105, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1106, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1107, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1108, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1109, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1110, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1111, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1112, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1113, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1114, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1115, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1116, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1117, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1118, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1119, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1120, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1121, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1122, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1123, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1124, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1125, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1126, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1127, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1128, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1129, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1130, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1131, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1132, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1133, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1134, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1135, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1136, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1137, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1138, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1139, 'male', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1140, 'valid_file_format_img', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1141, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1142, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1143, 'role_id', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1144, 'user_updated', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1145, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1146, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1147, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1148, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1149, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1150, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1151, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1152, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1153, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1154, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1155, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1156, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1157, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1158, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1159, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1160, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1161, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1162, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1163, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1164, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1165, 'permission_denied', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1166, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1167, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1168, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1169, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1170, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1171, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1172, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1173, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1174, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1175, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1176, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1177, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1178, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1179, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1180, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1181, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1182, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1183, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1184, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1185, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1186, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1187, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1188, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1189, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1190, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1191, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1192, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1193, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1194, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1195, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1196, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1197, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1198, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1199, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1200, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1201, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1202, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1203, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1204, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1205, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1206, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1207, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1208, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1209, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1210, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1211, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1212, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1213, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1214, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1215, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1216, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1217, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1218, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1219, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1220, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1221, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1222, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1223, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1224, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1225, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1226, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1227, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1228, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1229, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1230, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1231, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1232, 'video_url_is_not_supported', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1233, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1234, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1235, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1236, 'gst_tax', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1237, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1238, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1239, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1240, 'discount_in_percent', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1241, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1242, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1243, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1244, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1245, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1246, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1247, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1248, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1249, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1250, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1251, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1252, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1253, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1254, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1255, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1256, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1257, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1258, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1259, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1260, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1261, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1262, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1263, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1264, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1265, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1266, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1267, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1268, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1269, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1270, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1271, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1272, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1273, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1274, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1275, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1276, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1277, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1278, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1279, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1280, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1281, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1282, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1283, 'delete_course', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1284, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1285, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1286, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1287, 'course_deleted', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1288, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1289, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1290, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1291, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1292, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1293, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1294, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1295, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1296, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1297, 'user_created', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1298, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1299, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1300, 'delete_failed', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1301, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1302, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1303, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1304, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1305, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1306, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1307, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1308, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1309, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1310, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1311, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1312, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1313, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1314, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1315, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1316, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1317, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1318, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1319, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1320, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1321, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1322, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1323, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1324, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1325, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1326, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1327, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1328, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1329, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1330, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1331, 'password_update_success', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1332, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1333, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1334, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1335, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1336, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1337, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1338, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1339, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1340, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1341, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1342, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1343, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1344, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1345, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1346, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1347, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1348, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1349, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1350, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1351, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1352, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1353, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1354, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1355, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1356, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1357, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1358, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1359, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1360, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1361, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1362, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1363, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1364, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1365, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1366, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1367, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1368, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1369, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1370, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1371, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1372, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1373, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1374, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1375, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1376, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1377, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1378, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1379, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1380, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1381, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1382, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1383, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1384, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1385, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1386, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1387, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1388, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1389, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1390, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1391, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1392, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1393, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1394, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1395, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1396, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1397, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1398, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1399, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1400, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1401, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1402, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1403, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1404, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1405, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1406, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1407, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1408, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1409, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1410, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1411, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1412, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1413, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1414, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1415, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1416, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1417, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1418, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1419, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1420, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1421, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1422, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1423, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1424, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1425, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1426, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1427, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1428, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1429, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1430, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1431, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1432, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1433, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1434, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1435, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1436, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1437, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1438, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1439, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1440, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1441, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1442, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1443, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1444, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1445, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1446, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1447, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1448, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1449, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1450, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1451, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1452, 'invoice_prefix', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1453, 'invoice_start_from', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1454, 'gstin_no', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1455, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1456, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1457, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1458, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1459, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1460, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1461, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1462, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1463, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1464, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1465, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1466, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1467, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1468, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1469, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1470, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1471, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1472, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1473, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1474, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1475, 'edit_question', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1476, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1477, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1478, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1479, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1480, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1481, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1482, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1483, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1484, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1485, 'question_updated_successfully', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1486, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1487, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1488, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1489, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1490, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1491, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1492, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1493, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1494, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1495, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1496, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1497, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1498, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1499, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1500, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1501, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1502, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1503, 'random_question', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1504, 'declare_result', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1505, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1506, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1507, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1508, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1509, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1510, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1511, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1512, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1513, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1514, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1515, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1516, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1517, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1518, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1519, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1520, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1521, 'report_type', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1522, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1523, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1524, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1525, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1526, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1527, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1528, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1529, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1530, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1531, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1532, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1533, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1534, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1535, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1536, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1537, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1538, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1539, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1540, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1541, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1542, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1543, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1544, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1545, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1546, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1547, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1548, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1549, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1550, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1551, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1552, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1553, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1554, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1555, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1556, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1557, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1558, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1559, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1560, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1561, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1562, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1563, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1564, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1565, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1566, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1567, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1568, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1569, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1570, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1571, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1572, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1573, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1574, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1575, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1576, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1577, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1578, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1579, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1580, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1581, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1582, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1583, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1584, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1585, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1586, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1587, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1588, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1589, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1590, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1591, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1592, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1593, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1594, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1595, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1596, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1597, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1598, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1599, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1600, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1601, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1602, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1603, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1604, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1605, 'SMS', NULL);
INSERT INTO `languages` (`id`, `label`, `english`) VALUES (1606, 'SMS', NULL);


#
# TABLE STRUCTURE FOR: modules
#

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_slug` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'Setting', 'setting', 1, '2017-11-13 22:55:19', '2017-11-13 22:57:10', 1, 1);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 'Theme', 'theme', 1, '2017-12-12 13:34:52', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 'Language', 'language', 1, '2017-12-12 13:36:11', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 'Administrator', 'administrator', 1, '2017-12-12 13:36:35', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 'Human Resource', 'hrm', 1, '2017-12-12 13:38:30', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (7, 'Reports', 'reports', 1, '2017-12-12 13:42:24', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (8, 'Frontend', 'frontend', 1, '2017-12-12 13:43:01', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (9, 'Orders', 'orders', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1);


#
# TABLE STRUCTURE FOR: operations
#

DROP TABLE IF EXISTS `operations`;

CREATE TABLE `operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `operation_name` varchar(50) NOT NULL,
  `operation_slug` varchar(50) NOT NULL,
  `is_view_vissible` tinyint(1) DEFAULT 0,
  `is_add_vissible` tinyint(1) DEFAULT 0,
  `is_edit_vissible` tinyint(1) DEFAULT 0,
  `is_delete_vissible` tinyint(1) DEFAULT 0,
  `is_status_vissible` int(11) NOT NULL,
  `is_export_vissible` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 1, 'General Setting', 'setting', 1, 0, 0, 0, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 1, 'SMS Setting', 'sms', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 1, 'Payment Setting', 'payment', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 1, 'Email Setting', 'emails', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 2, 'Theme', 'theme', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (6, 3, 'Language', 'language', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (8, 4, 'User Role', 'role', 1, 1, 1, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (9, 4, 'Role Permission', 'permission', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (10, 4, 'Reset User Password', 'password', 1, 1, 1, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (11, 4, 'User Credential', 'usercredential', 1, 1, 0, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (12, 4, 'Reset User Email', 'email', 1, 1, 1, 0, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (14, 4, 'Database Backup', 'backup', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (15, 5, 'Manage Users', 'users', 1, 1, 1, 1, 0, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (26, 9, 'Orders', 'orders', 1, 1, 1, 1, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (36, 1, 'Tax Type', 'tax', 1, 1, 1, 1, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);


#
# TABLE STRUCTURE FOR: payment
#

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `payment` (`id`, `user_id`, `teacher_id`, `order_id`, `payment_type`, `course_id`, `amount`, `created_at`, `updated_at`, `transaction_id`, `session_id`, `coupon`) VALUES (1, 12, 0, 1, 'stripe', 2, '190', '2021-11-12 17:36:53', '2021-11-12 17:37:08', 'txn_3JuyXKDVd7FMxDoO0Bd98lO9', '2', '');
INSERT INTO `payment` (`id`, `user_id`, `teacher_id`, `order_id`, `payment_type`, `course_id`, `amount`, `created_at`, `updated_at`, `transaction_id`, `session_id`, `coupon`) VALUES (2, 12, 0, 2, 'stripe', 5, '247.8', '2021-11-15 18:55:05', NULL, NULL, '2', '');
INSERT INTO `payment` (`id`, `user_id`, `teacher_id`, `order_id`, `payment_type`, `course_id`, `amount`, `created_at`, `updated_at`, `transaction_id`, `session_id`, `coupon`) VALUES (3, 12, 0, 3, 'stripe', 5, '247.8', '2021-11-15 18:56:02', NULL, NULL, '2', '');
INSERT INTO `payment` (`id`, `user_id`, `teacher_id`, `order_id`, `payment_type`, `course_id`, `amount`, `created_at`, `updated_at`, `transaction_id`, `session_id`, `coupon`) VALUES (4, 12, 0, 4, 'stripe', 5, '247.8', '2021-11-15 18:56:51', '2021-11-15 18:57:05', 'txn_3Jw5DCDVd7FMxDoO0ukW6fYN', '2', '');
INSERT INTO `payment` (`id`, `user_id`, `teacher_id`, `order_id`, `payment_type`, `course_id`, `amount`, `created_at`, `updated_at`, `transaction_id`, `session_id`, `coupon`) VALUES (5, 20, 0, 5, 'paypal', 5, '247.8', '2021-11-16 16:24:36', NULL, NULL, '2', '');
INSERT INTO `payment` (`id`, `user_id`, `teacher_id`, `order_id`, `payment_type`, `course_id`, `amount`, `created_at`, `updated_at`, `transaction_id`, `session_id`, `coupon`) VALUES (6, 20, 0, 6, 'paypal', 5, '247.8', '2021-11-16 16:29:50', NULL, NULL, '2', '');


#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_api_username` varchar(100) DEFAULT NULL,
  `paypal_api_password` varchar(100) DEFAULT NULL,
  `paypal_api_signature` varchar(100) DEFAULT NULL,
  `paypal_email` varchar(50) DEFAULT NULL,
  `paypal_demo` tinyint(1) DEFAULT NULL,
  `paypal_extra_charge` double(10,2) NOT NULL,
  `paypal_status` tinyint(1) DEFAULT NULL,
  `stripe_api_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(255) NOT NULL,
  `stripe_demo` tinyint(1) DEFAULT NULL,
  `stripe_extra_charge` double(10,2) NOT NULL,
  `stripe_status` tinyint(1) DEFAULT NULL,
  `stripe_currency` varchar(10) NOT NULL,
  `payumoney_key` varchar(100) DEFAULT NULL,
  `payumoney_salt` varchar(100) DEFAULT NULL,
  `payumoney_demo` tinyint(1) DEFAULT NULL,
  `payu_extra_charge` double(10,2) NOT NULL,
  `payumoney_status` tinyint(1) DEFAULT NULL,
  `ccavenue_key` varchar(100) DEFAULT NULL,
  `ccavenue_salt` varchar(100) DEFAULT NULL,
  `ccavenue_demo` tinyint(1) NOT NULL DEFAULT 1,
  `ccavenue_extra_charge` double(10,2) NOT NULL,
  `ccavenue_status` tinyint(1) NOT NULL,
  `paytm_merchant_key` varchar(100) DEFAULT NULL,
  `paytm_merchant_mid` varchar(100) DEFAULT NULL,
  `paytm_merchant_website` varchar(255) DEFAULT NULL,
  `paytm_industry_type` varchar(100) DEFAULT NULL,
  `paytm_demo` tinyint(1) NOT NULL,
  `paytm_extra_charge` double(10,2) NOT NULL,
  `paytm_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `payment_settings` (`id`, `paypal_api_username`, `paypal_api_password`, `paypal_api_signature`, `paypal_email`, `paypal_demo`, `paypal_extra_charge`, `paypal_status`, `stripe_api_key`, `stripe_publishable_key`, `stripe_demo`, `stripe_extra_charge`, `stripe_status`, `stripe_currency`, `payumoney_key`, `payumoney_salt`, `payumoney_demo`, `payu_extra_charge`, `payumoney_status`, `ccavenue_key`, `ccavenue_salt`, `ccavenue_demo`, `ccavenue_extra_charge`, `ccavenue_status`, `paytm_merchant_key`, `paytm_merchant_mid`, `paytm_merchant_website`, `paytm_industry_type`, `paytm_demo`, `paytm_extra_charge`, `paytm_status`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, NULL, NULL, NULL, 'chandramani.arya1992@gmail.com', 1, '0.00', 1, 'sk_test_Q9QovtQJXPCYx0u0WKWvwEWe', 'pk_test_ewtWYV4JCbk4ZFBsuMwis3oG', 1, '0.00', 1, 'usd', 'fMq2jTeM', '42pAsso3Ou', 0, '2.30', 0, NULL, NULL, 0, '0.00', 0, '', '', '', '', 0, '0.00', 0, 1, '2019-09-29 23:39:56', '2021-11-16 16:16:58', 1, 1);


#
# TABLE STRUCTURE FOR: privileges
#

DROP TABLE IF EXISTS `privileges`;

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_status` int(11) NOT NULL,
  `is_export` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1540 DEFAULT CHARSET=latin1;

INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 1, 1, 0, 0, 1, 0, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 1, 2, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 1, 3, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 1, 4, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 1, 5, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (6, 1, 6, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (8, 1, 8, 1, 1, 1, 0, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (9, 1, 64, 0, 1, 0, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (10, 1, 65, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (11, 1, 63, 0, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (12, 1, 10, 1, 1, 1, 0, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (13, 1, 11, 1, 0, 1, 0, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (14, 1, 12, 1, 1, 1, 0, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (15, 1, 14, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (16, 1, 15, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (24, 1, 24, 1, 1, 1, 1, 0, 0, 1, '2021-11-12 15:32:01', '2021-11-12 15:32:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (25, 1, 25, 1, 1, 1, 1, 0, 0, 1, '2021-11-12 15:32:01', '2021-11-12 15:32:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (36, 1, 67, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (37, 1, 68, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (40, 1, 66, 1, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (41, 1, 40, 1, 1, 1, 1, 0, 0, 1, '2021-11-15 14:55:34', '2021-11-15 14:55:34', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (42, 1, 41, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (43, 1, 42, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (44, 1, 43, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (45, 1, 44, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (46, 1, 45, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (47, 1, 46, 1, 1, 1, 1, 0, 0, 1, '2017-12-23 22:10:34', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (48, 1, 47, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (49, 1, 48, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (50, 1, 50, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (51, 1, 51, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (52, 1, 52, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (53, 1, 53, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (54, 1, 54, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (55, 1, 55, 1, 1, 1, 1, 0, 0, 1, '2017-12-23 22:10:34', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (56, 1, 56, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (57, 1, 57, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (58, 1, 58, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (59, 1, 59, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (60, 1, 60, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (61, 1, 61, 1, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (62, 1, 62, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (63, 3, 1, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (64, 3, 2, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (65, 3, 3, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (66, 3, 4, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (67, 3, 5, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (68, 3, 6, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (70, 3, 8, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (71, 3, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (72, 3, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (73, 3, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (74, 3, 10, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (75, 3, 11, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (76, 3, 12, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (77, 3, 14, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (78, 3, 15, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (86, 3, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (87, 3, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (98, 3, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (99, 3, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (102, 3, 66, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (103, 3, 40, 1, 1, 1, 1, 1, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (104, 3, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (105, 3, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (106, 3, 43, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (107, 3, 44, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (108, 3, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (109, 3, 46, 1, 1, 0, 1, 0, 0, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (110, 3, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (111, 3, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (112, 3, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (113, 3, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (114, 3, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (115, 3, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (116, 3, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (117, 3, 55, 1, 1, 0, 1, 0, 0, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (118, 3, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (119, 3, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (120, 3, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (121, 3, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (122, 3, 60, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (123, 3, 61, 1, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (124, 3, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (125, 1, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (126, 5, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (127, 5, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (128, 5, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (129, 5, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (130, 5, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (131, 5, 6, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (133, 5, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (134, 5, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (135, 5, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (136, 5, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (137, 5, 10, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (138, 5, 11, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (139, 5, 12, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (140, 5, 14, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (141, 5, 15, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (149, 5, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (150, 5, 25, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (161, 5, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (162, 5, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (165, 5, 66, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (166, 5, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (167, 5, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (168, 5, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (169, 5, 43, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (170, 5, 44, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (171, 5, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (172, 5, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (173, 5, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (174, 5, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (175, 5, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (176, 5, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (177, 5, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (178, 5, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (179, 5, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (180, 5, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (181, 5, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (182, 5, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (183, 5, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (184, 5, 60, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (185, 5, 61, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (186, 5, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (187, 13, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (188, 13, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (189, 13, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (190, 13, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (191, 13, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (192, 13, 6, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (194, 13, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (195, 13, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (196, 13, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (197, 13, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (198, 13, 10, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (199, 13, 11, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (200, 13, 12, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (201, 13, 14, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (202, 13, 15, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (210, 13, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (211, 13, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (222, 13, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (223, 13, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (226, 13, 66, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (227, 13, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (228, 13, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (229, 13, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (230, 13, 43, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (231, 13, 44, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (232, 13, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (233, 13, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (234, 13, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (235, 13, 69, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (236, 13, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (237, 13, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (238, 13, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (239, 13, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (240, 13, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (241, 13, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (242, 13, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (243, 13, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (244, 13, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (245, 13, 60, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (246, 13, 61, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (247, 13, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (248, 3, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (249, 2, 1, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:06', '2019-10-09 14:59:06', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (250, 2, 2, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (251, 2, 3, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (252, 2, 4, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (253, 2, 5, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (254, 2, 6, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (256, 2, 8, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (257, 2, 64, 0, 1, 0, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (258, 2, 65, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (259, 2, 63, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (260, 2, 10, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (261, 2, 11, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (262, 2, 12, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (263, 2, 14, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (264, 2, 15, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (272, 2, 24, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (273, 2, 25, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (283, 2, 67, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (284, 2, 68, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (287, 2, 66, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (288, 2, 40, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (289, 2, 41, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (290, 2, 42, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (291, 2, 43, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (292, 2, 44, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (293, 2, 45, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (294, 2, 47, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (295, 2, 48, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (296, 2, 69, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (297, 2, 50, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (298, 2, 51, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (299, 2, 52, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (300, 2, 53, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (301, 2, 54, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (302, 2, 56, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (303, 2, 57, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (304, 2, 58, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (305, 2, 59, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (306, 2, 60, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (307, 2, 61, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (308, 2, 62, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (309, 4, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (310, 4, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (311, 4, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (312, 4, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (313, 4, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (314, 4, 6, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (316, 4, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (317, 4, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (318, 4, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (319, 4, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (320, 4, 10, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (321, 4, 11, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (322, 4, 12, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (323, 4, 14, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (324, 4, 15, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (332, 4, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (333, 4, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (343, 4, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (344, 4, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (347, 4, 66, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (348, 4, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (349, 4, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (350, 4, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (351, 4, 43, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (352, 4, 44, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (353, 4, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (354, 4, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (355, 4, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (356, 4, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (357, 4, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (358, 4, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (359, 4, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (360, 4, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (361, 4, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (362, 4, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (363, 4, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (364, 4, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (365, 4, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (366, 4, 60, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (367, 4, 61, 1, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (368, 4, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (369, 6, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (370, 6, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (371, 6, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (372, 6, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (373, 6, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (374, 6, 6, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (376, 6, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (377, 6, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (378, 6, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (379, 6, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (380, 6, 10, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (381, 6, 11, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (382, 6, 12, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (383, 6, 14, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (384, 6, 15, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (392, 6, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (393, 6, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (403, 6, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (404, 6, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (407, 6, 66, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (408, 6, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (409, 6, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (410, 6, 42, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (411, 6, 43, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (412, 6, 44, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (413, 6, 45, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (414, 6, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (415, 6, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (416, 6, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (417, 6, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (418, 6, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (419, 6, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (420, 6, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (421, 6, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (422, 6, 56, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (423, 6, 57, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (424, 6, 58, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (425, 6, 59, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (426, 6, 60, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (427, 6, 61, 1, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (428, 6, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (429, 7, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (430, 7, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (431, 7, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (432, 7, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (433, 7, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (434, 7, 6, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (436, 7, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (437, 7, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (438, 7, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (439, 7, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (440, 7, 10, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (441, 7, 11, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (442, 7, 12, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (443, 7, 14, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (444, 7, 15, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (452, 7, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (453, 7, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (463, 7, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (464, 7, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (467, 7, 66, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (468, 7, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (469, 7, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (470, 7, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (471, 7, 43, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (472, 7, 44, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (473, 7, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (474, 7, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (475, 7, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (476, 7, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (477, 7, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (478, 7, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (479, 7, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (480, 7, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (481, 7, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (482, 7, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (483, 7, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (484, 7, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (485, 7, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (486, 7, 60, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (487, 7, 61, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (488, 7, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (489, 8, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (490, 8, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (491, 8, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (492, 8, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (493, 8, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (494, 8, 6, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (496, 8, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (497, 8, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (498, 8, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (499, 8, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (500, 8, 10, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (501, 8, 11, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (502, 8, 12, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (503, 8, 14, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (504, 8, 15, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (512, 8, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (513, 8, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (523, 8, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (524, 8, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (527, 8, 66, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (528, 8, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (529, 8, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (530, 8, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (531, 8, 43, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (532, 8, 44, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (533, 8, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (534, 8, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (535, 8, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (536, 8, 69, 1, 1, 1, 1, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (537, 8, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (538, 8, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (539, 8, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (540, 8, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (541, 8, 54, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (542, 8, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (543, 8, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (544, 8, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (545, 8, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (546, 8, 60, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (547, 8, 61, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (548, 8, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (549, 9, 1, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (550, 9, 2, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (551, 9, 3, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (552, 9, 4, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (553, 9, 5, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (554, 9, 6, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (556, 9, 8, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (557, 9, 64, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (558, 9, 65, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (559, 9, 63, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (560, 9, 10, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (561, 9, 11, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (562, 9, 12, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (563, 9, 14, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (564, 9, 15, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (572, 9, 24, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (573, 9, 25, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (583, 9, 67, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (584, 9, 68, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (587, 9, 66, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (588, 9, 40, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (589, 9, 41, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (590, 9, 42, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (591, 9, 43, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (592, 9, 44, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (593, 9, 45, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (594, 9, 47, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (595, 9, 48, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (596, 9, 69, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (597, 9, 50, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (598, 9, 51, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (599, 9, 52, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (600, 9, 53, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (601, 9, 54, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (602, 9, 56, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (603, 9, 57, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (604, 9, 58, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (605, 9, 59, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (606, 9, 60, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (607, 9, 61, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (608, 9, 62, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (609, 1, 70, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (610, 1, 71, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (611, 1, 72, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (612, 1, 73, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (613, 1, 74, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (614, 1, 75, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (615, 1, 76, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (616, 1, 77, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (617, 1, 78, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (618, 4, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (619, 4, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (620, 4, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (621, 4, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (622, 4, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (623, 4, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (624, 4, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (625, 4, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (626, 4, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (627, 14, 1, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (628, 14, 2, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (629, 14, 3, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (630, 14, 4, 0, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (631, 14, 5, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (632, 14, 6, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (634, 14, 8, 0, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (635, 14, 64, 0, 1, 0, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (636, 14, 65, 0, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (637, 14, 63, 0, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (638, 14, 10, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (639, 14, 11, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (640, 14, 12, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (641, 14, 14, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (642, 14, 15, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (650, 14, 24, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (651, 14, 25, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1539, 1, 26, 1, 0, 1, 0, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (661, 14, 67, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (662, 14, 68, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (665, 14, 66, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (666, 14, 40, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (667, 14, 41, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (668, 14, 42, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (669, 14, 43, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (670, 14, 44, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (671, 14, 45, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (672, 14, 47, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (673, 14, 48, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (674, 14, 69, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (675, 14, 50, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (676, 14, 51, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (677, 14, 52, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (678, 14, 53, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (679, 14, 54, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (680, 14, 56, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (681, 14, 57, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (682, 14, 58, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (683, 14, 59, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (684, 14, 60, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (685, 14, 61, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (686, 14, 62, 0, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (687, 14, 70, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (688, 14, 71, 0, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (689, 14, 72, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (690, 14, 73, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (691, 14, 74, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (692, 14, 77, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (693, 14, 75, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (694, 14, 76, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (695, 14, 78, 0, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (696, 3, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (697, 3, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (698, 3, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (699, 3, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (700, 3, 74, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (701, 3, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (702, 3, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (703, 3, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (704, 3, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (705, 9, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (706, 9, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (707, 9, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (708, 9, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (709, 9, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (710, 9, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (711, 9, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (712, 9, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (713, 9, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (714, 8, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (715, 8, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (716, 8, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (717, 8, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (718, 8, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (719, 8, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (720, 8, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (721, 8, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (722, 8, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (723, 7, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (724, 7, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (725, 7, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (726, 7, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (727, 7, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (728, 7, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (729, 7, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (730, 7, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (731, 7, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (732, 6, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (733, 6, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (734, 6, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (735, 6, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (736, 6, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (737, 6, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (738, 6, 75, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (739, 6, 76, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (740, 6, 78, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (741, 2, 70, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (742, 2, 71, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (743, 2, 72, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (744, 2, 73, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (745, 2, 74, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (746, 2, 77, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (747, 2, 75, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (748, 2, 76, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (749, 2, 78, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (750, 13, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (751, 13, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (752, 13, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (753, 13, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (754, 13, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (755, 13, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (756, 13, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (757, 13, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (758, 13, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (759, 5, 70, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (760, 5, 71, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (761, 5, 72, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (762, 5, 73, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (763, 5, 74, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (764, 5, 77, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (765, 5, 75, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (766, 5, 76, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (767, 5, 78, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (768, 1, 79, 1, 1, 1, 1, 0, 0, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (769, 1, 80, 1, 1, 1, 1, 0, 0, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (770, 1, 81, 0, 0, 1, 0, 0, 0, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (771, 1, 82, 1, 1, 1, 0, 0, 0, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (772, 1, 83, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (773, 1, 84, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (774, 1, 85, 0, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (775, 1, 86, 1, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (776, 1, 87, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (777, 1, 88, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (778, 1, 89, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (779, 1, 90, 1, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (780, 1, 91, 1, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (781, 1, 92, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (782, 14, 83, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (783, 14, 84, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (784, 14, 85, 0, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (785, 14, 86, 1, 0, 0, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (786, 14, 87, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (787, 14, 88, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (788, 14, 81, 0, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (789, 14, 82, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (790, 14, 91, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (791, 14, 92, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (792, 14, 79, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (793, 14, 80, 1, 1, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (794, 14, 89, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (795, 14, 90, 1, 0, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (796, 1, 93, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (797, 1, 94, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (798, 2, 83, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (799, 2, 84, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (800, 2, 85, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (801, 2, 93, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (802, 2, 86, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (803, 2, 94, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (804, 2, 87, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (805, 2, 88, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (806, 2, 81, 0, 0, 1, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (807, 2, 82, 1, 1, 1, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (808, 2, 91, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (809, 2, 92, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (810, 2, 79, 1, 1, 1, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (811, 2, 80, 1, 1, 1, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (812, 2, 89, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (813, 2, 90, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (814, 1, 95, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (815, 2, 95, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (816, 3, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (817, 3, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (818, 3, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (819, 3, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (820, 3, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (821, 3, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (822, 3, 87, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (823, 3, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (824, 3, 81, 0, 0, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (825, 3, 82, 0, 0, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (826, 3, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (827, 3, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (828, 3, 95, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (829, 3, 79, 0, 0, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (830, 3, 80, 0, 0, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (831, 3, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (832, 3, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (833, 4, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (834, 4, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (835, 4, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (836, 4, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (837, 4, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (838, 4, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (839, 4, 87, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (840, 4, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (841, 4, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (842, 4, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (843, 4, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (844, 4, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (845, 4, 95, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (846, 4, 79, 0, 0, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (847, 4, 80, 0, 0, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (848, 4, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (849, 4, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (850, 5, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (851, 5, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (852, 5, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (853, 5, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (854, 5, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (855, 5, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (856, 5, 87, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (857, 5, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (858, 5, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (859, 5, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (860, 5, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (861, 5, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (862, 5, 95, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (863, 5, 79, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (864, 5, 80, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (865, 5, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (866, 5, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (867, 6, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (868, 6, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (869, 6, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (870, 6, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (871, 6, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (872, 6, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (873, 6, 87, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (874, 6, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (875, 6, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (876, 6, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (877, 6, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (878, 6, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (879, 6, 95, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (880, 6, 79, 1, 1, 1, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (881, 6, 80, 1, 1, 1, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (882, 6, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (883, 6, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (884, 7, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (885, 7, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (886, 7, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (887, 7, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (888, 7, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (889, 7, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (890, 7, 87, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (891, 7, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (892, 7, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (893, 7, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (894, 7, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (895, 7, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (896, 7, 95, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (897, 7, 79, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (898, 7, 80, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (899, 7, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (900, 7, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (901, 8, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (902, 8, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (903, 8, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (904, 8, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (905, 8, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (906, 8, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (907, 8, 87, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (908, 8, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (909, 8, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (910, 8, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (911, 8, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (912, 8, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (913, 8, 95, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (914, 8, 79, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (915, 8, 80, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (916, 8, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (917, 8, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (918, 9, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (919, 9, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (920, 9, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (921, 9, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (922, 9, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (923, 9, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (924, 9, 87, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (925, 9, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (926, 9, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (927, 9, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (928, 9, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (929, 9, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (930, 9, 95, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (931, 9, 79, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (932, 9, 80, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (933, 9, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (934, 9, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (935, 13, 83, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (936, 13, 84, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (937, 13, 85, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (938, 13, 93, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (939, 13, 86, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (940, 13, 94, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (941, 13, 87, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (942, 13, 88, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (943, 13, 81, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (944, 13, 82, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (945, 13, 91, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (946, 13, 92, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (947, 13, 95, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (948, 13, 79, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (949, 13, 80, 0, 0, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (950, 13, 89, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (951, 13, 90, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (952, 1, 96, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (953, 3, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (954, 3, 97, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (955, 1, 97, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (956, 1, 98, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (957, 2, 96, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (958, 2, 97, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (959, 2, 98, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1353, 6, 109, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1352, 6, 137, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1351, 6, 134, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1350, 6, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1349, 6, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1348, 6, 108, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1347, 6, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1346, 6, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1345, 6, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1344, 6, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1343, 5, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1342, 5, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1341, 5, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1340, 5, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1339, 5, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1338, 5, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1337, 5, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1336, 5, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1335, 5, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1334, 5, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1333, 5, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1332, 5, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1115, 1, 137, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1114, 2, 126, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1113, 2, 125, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1112, 2, 124, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1111, 2, 123, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1110, 2, 122, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1109, 2, 121, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1108, 2, 120, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1107, 2, 119, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1106, 2, 118, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1105, 2, 117, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1104, 2, 116, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1103, 2, 115, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1102, 2, 114, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1101, 2, 113, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1100, 2, 112, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1099, 2, 111, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1098, 2, 107, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1097, 2, 104, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1096, 2, 99, 1, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1095, 2, 133, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1094, 2, 132, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1093, 2, 131, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1092, 2, 130, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1091, 2, 129, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1090, 2, 109, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1089, 2, 134, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1088, 2, 110, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1087, 2, 102, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1086, 2, 108, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1085, 2, 136, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1084, 2, 135, 0, 0, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1083, 2, 101, 0, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1082, 2, 106, 1, 1, 1, 0, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1081, 1, 136, 0, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1080, 1, 126, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1079, 1, 125, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1078, 1, 124, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1077, 1, 123, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1076, 1, 122, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1075, 1, 121, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1074, 1, 120, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1073, 1, 119, 0, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1072, 1, 118, 0, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1071, 1, 117, 0, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1070, 1, 116, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1069, 1, 115, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1068, 1, 114, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1067, 1, 113, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1066, 1, 112, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1065, 1, 111, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1064, 1, 107, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1063, 1, 104, 1, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1062, 1, 99, 1, 0, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1061, 1, 133, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1060, 1, 132, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1059, 1, 131, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1058, 1, 130, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1057, 1, 129, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1056, 1, 109, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1055, 1, 134, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1054, 1, 110, 0, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1053, 1, 102, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1052, 1, 108, 1, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1051, 1, 135, 0, 0, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1050, 1, 101, 0, 1, 1, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1049, 1, 106, 1, 1, 1, 0, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1331, 5, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1330, 5, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1329, 5, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1328, 5, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1327, 5, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1326, 5, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1325, 5, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1324, 5, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1323, 5, 97, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1322, 5, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1321, 5, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1320, 5, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1319, 5, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1318, 5, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1317, 5, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1316, 5, 109, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1315, 5, 137, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1314, 5, 134, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1313, 5, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1312, 5, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1311, 5, 108, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1310, 5, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1309, 5, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1308, 5, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1307, 5, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1306, 4, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1305, 4, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1304, 4, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1303, 4, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1302, 4, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1301, 4, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1300, 4, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1299, 4, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1298, 4, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1297, 4, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1296, 4, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1295, 4, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1294, 4, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1293, 4, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1292, 4, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1291, 4, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1290, 4, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1289, 4, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1288, 4, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1287, 4, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1286, 4, 97, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1285, 4, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1284, 4, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1283, 4, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1282, 4, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1281, 4, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1280, 4, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1279, 4, 109, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1278, 4, 137, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1277, 4, 134, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1276, 4, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1275, 4, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1274, 4, 108, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1273, 4, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1272, 4, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1271, 4, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1270, 4, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1269, 3, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1268, 3, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1267, 3, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1266, 3, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1265, 3, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1264, 3, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1263, 3, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1262, 3, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1261, 3, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1260, 3, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1259, 3, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1258, 3, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1257, 3, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1256, 3, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1255, 3, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1254, 3, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1253, 3, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1252, 3, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1251, 3, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1250, 3, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1249, 3, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1248, 3, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1247, 3, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1246, 3, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1245, 3, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1244, 3, 109, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1243, 3, 137, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1242, 3, 134, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1241, 3, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1240, 3, 102, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1239, 3, 108, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1238, 3, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1237, 3, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1236, 3, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1235, 3, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1354, 6, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1355, 6, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1356, 6, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1357, 6, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1358, 6, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1359, 6, 96, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1360, 6, 97, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1361, 6, 98, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1362, 6, 99, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1363, 6, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1364, 6, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1365, 6, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1366, 6, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1367, 6, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1368, 6, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1369, 6, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1370, 6, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1371, 6, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1372, 6, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1373, 6, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1374, 6, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1375, 6, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1376, 6, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1377, 6, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1378, 6, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1379, 6, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1380, 6, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1381, 7, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1382, 7, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1383, 7, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1384, 7, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1385, 7, 108, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1386, 7, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1387, 7, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1388, 7, 134, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1389, 7, 137, 0, 0, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1390, 7, 109, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1391, 7, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1392, 7, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1393, 7, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1394, 7, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1395, 7, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1396, 7, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1397, 7, 97, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1398, 7, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1399, 7, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1400, 7, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1401, 7, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1402, 7, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1403, 7, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1404, 7, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1405, 7, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1406, 7, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1407, 7, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1408, 7, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1409, 7, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1410, 7, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1411, 7, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1412, 7, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1413, 7, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1414, 7, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1415, 7, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1416, 7, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1417, 7, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1418, 8, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1419, 8, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1420, 8, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1421, 8, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1422, 8, 108, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1423, 8, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1424, 8, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1425, 8, 134, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1426, 8, 137, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1427, 8, 109, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1428, 8, 129, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1429, 8, 130, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1430, 8, 131, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1431, 8, 132, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1432, 8, 133, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1433, 8, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1434, 8, 97, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1435, 8, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1436, 8, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1437, 8, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1438, 8, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1439, 8, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1440, 8, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1441, 8, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1442, 8, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1443, 8, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1444, 8, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1445, 8, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1446, 8, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1447, 8, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1448, 8, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1449, 8, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1450, 8, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1451, 8, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1452, 8, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1453, 8, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1454, 8, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1455, 9, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1456, 9, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1457, 9, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1458, 9, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1459, 9, 108, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1460, 9, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1461, 9, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1462, 9, 134, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1463, 9, 137, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1464, 9, 109, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1465, 9, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1466, 9, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1467, 9, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1468, 9, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1469, 9, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1470, 9, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1471, 9, 97, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1472, 9, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1473, 9, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1474, 9, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1475, 9, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1476, 9, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1477, 9, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1478, 9, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1479, 9, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1480, 9, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1481, 9, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1482, 9, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1483, 9, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1484, 9, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1485, 9, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1486, 9, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1487, 9, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1488, 9, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1489, 9, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1490, 9, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1491, 9, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1492, 13, 106, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1493, 13, 101, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1494, 13, 135, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1495, 13, 136, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1496, 13, 108, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1497, 13, 102, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1498, 13, 110, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1499, 13, 134, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1500, 13, 137, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1501, 13, 109, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1502, 13, 129, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1503, 13, 130, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1504, 13, 131, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1505, 13, 132, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1506, 13, 133, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1507, 13, 96, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1508, 13, 97, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1509, 13, 98, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1510, 13, 99, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1511, 13, 104, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1512, 13, 107, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1513, 13, 111, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1514, 13, 112, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1515, 13, 113, 1, 1, 1, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1516, 13, 114, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1517, 13, 115, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1518, 13, 116, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1519, 13, 117, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1520, 13, 118, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1521, 13, 119, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1522, 13, 120, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1523, 13, 121, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1524, 13, 122, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1525, 13, 123, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1526, 13, 124, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1527, 13, 125, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1528, 13, 126, 0, 0, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1529, 1, 9, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1532, 1, 36, 1, 1, 1, 1, 0, 0, 1, '2022-02-15 13:59:23', '2022-02-15 13:59:23', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1533, 3, 36, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1534, 3, 9, 0, 0, 0, 0, 0, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1537, 3, 39, 1, 1, 1, 1, 1, 0, 1, '2021-11-13 17:43:50', '2021-11-13 17:43:50', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `is_status`, `is_export`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1538, 1, 39, 1, 1, 1, 1, 0, 0, 1, '2021-11-15 14:55:34', '2021-11-15 14:55:34', 1, 1);


#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 1,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'super-admin', 'Super Admin', 'Super Admin User', 1, 1, 1, '2017-08-13 12:15:17', '2018-02-09 01:58:57', 0, 1);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 'admin', 'Admin', 'Admin User', 1, 0, 1, '2017-08-13 13:01:36', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 'bus-driver', 'Bus Driver', 'bus Driver', 1, 0, 1, '2017-08-13 13:02:05', '2022-02-15 13:20:48', 0, 1);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 'bus-conductor', 'Bus Conductor', 'Bus Conductor', 1, 0, 1, '2017-08-13 13:02:24', '2022-02-15 13:21:05', 0, 1);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 'agent', 'Agent', '', 1, 0, 1, '2022-02-15 08:52:49', '2022-02-15 08:52:49', 0, 0);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (6, 'customer', 'Customer', '', 1, 0, 1, '2022-02-15 08:52:49', '2022-02-15 08:52:49', 0, 0);


#
# TABLE STRUCTURE FOR: settings
#

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `system_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `registration_date` date DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `gstin_no` varchar(30) NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL,
  `invoice_id_prefix` varchar(30) NOT NULL,
  `invoice_id_start_from` int(11) NOT NULL,
  `currency_symbol` varchar(10) CHARACTER SET utf8 NOT NULL,
  `language` varchar(50) CHARACTER SET utf8 NOT NULL,
  `footer` text CHARACTER SET utf8 NOT NULL,
  `logo` varchar(120) CHARACTER SET utf8 NOT NULL,
  `front_logo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `favicon_icon` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `brand_logo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `academic_year_id` int(11) DEFAULT NULL,
  `running_year` varchar(50) CHARACTER SET utf8 NOT NULL,
  `school_fax` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `school_lat` varchar(100) DEFAULT NULL,
  `school_lng` varchar(100) DEFAULT NULL,
  `enable_rtl` tinyint(1) NOT NULL DEFAULT 0,
  `enable_frontend` tinyint(1) NOT NULL DEFAULT 1,
  `default_time_zone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sms_date_format` varchar(100) CHARACTER SET utf8 NOT NULL,
  `map_api_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_analytics` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `theme_name` varchar(100) CHARACTER SET utf8 DEFAULT 'radical-red',
  `youtube_api_key` varchar(255) NOT NULL,
  `vimeo_api_key` varchar(255) NOT NULL,
  `instructor_revenue` int(11) NOT NULL,
  `website_keywords` longtext NOT NULL,
  `website_description` longtext NOT NULL,
  `about_text` text CHARACTER SET utf8 DEFAULT NULL,
  `about_image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `twitter_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_plus_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `youtube_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `instagram_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pinterest_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `cron_secret_key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `settings` (`id`, `system_name`, `registration_date`, `address`, `phone`, `email`, `gstin_no`, `currency`, `invoice_id_prefix`, `invoice_id_start_from`, `currency_symbol`, `language`, `footer`, `logo`, `front_logo`, `favicon_icon`, `brand_logo`, `academic_year_id`, `running_year`, `school_fax`, `school_lat`, `school_lng`, `enable_rtl`, `enable_frontend`, `default_time_zone`, `sms_date_format`, `map_api_key`, `google_analytics`, `theme_name`, `youtube_api_key`, `vimeo_api_key`, `instructor_revenue`, `website_keywords`, `website_description`, `about_text`, `about_image`, `facebook_url`, `twitter_url`, `linkedin_url`, `google_plus_url`, `youtube_url`, `instagram_url`, `pinterest_url`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`, `cron_secret_key`) VALUES (1, 'Giunta Bus', '2018-12-06', 'Indore', '0123456789', 'academy@example.com', '23984728394823948234', 'INR', 'INV-', 1, 'Rs', 'english', 'academy', '1.png', '1.png', 'favicon_1.png', 'favicon_1.png', 2, 'July 2017 - June 2018', '346546', '', '', 0, 1, 'Asia/Kolkata', 'M j, Y', '', '', 'darkblue', 'AIzaSyDthDJK7F5kKCDIcZeSFxU4rx9s3DSaBAU', '39258384b69994dba483c10286825b5c', 0, '', '', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem..', '', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.youtube.com/', 'https://www.instagram.com/', 'https://www.pinterest.com/', 1, '2017-08-23 09:40:28', '2021-11-14 22:20:31', 1, 1, '7vU2QghyLVlDP8UZMwUiTDQbs');


#
# TABLE STRUCTURE FOR: sms_settings
#

DROP TABLE IF EXISTS `sms_settings`;

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clickatell_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_api_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_from_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `clickatell_status` tinyint(1) DEFAULT NULL,
  `twilio_account_sid` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `twilio_auth_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `twilio_from_number` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_mo_no` varchar(50) CHARACTER SET utf8 NOT NULL,
  `twilio_status` tinyint(1) DEFAULT NULL,
  `bulk_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bulk_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bulk_status` tinyint(1) DEFAULT NULL,
  `msg91_auth_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `msg91_sender_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `msg91_status` tinyint(1) DEFAULT NULL,
  `plivo_auth_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `plivo_auth_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `plivo_from_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plivo_status` tinyint(1) DEFAULT NULL,
  `textlocal_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `textlocal_hash_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `textlocal_sender_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `textlocal_status` tinyint(1) NOT NULL,
  `smscountry_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `smscountry_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `smscountry_sender_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `smscountry_status` tinyint(1) NOT NULL,
  `betasms_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `betasms_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `betasms_sender_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `betasms_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `sms_settings` (`id`, `clickatell_username`, `clickatell_password`, `clickatell_api_key`, `clickatell_from_number`, `clickatell_status`, `twilio_account_sid`, `twilio_auth_token`, `twilio_from_number`, `clickatell_mo_no`, `twilio_status`, `bulk_username`, `bulk_password`, `bulk_status`, `msg91_auth_key`, `msg91_sender_id`, `msg91_status`, `plivo_auth_id`, `plivo_auth_token`, `plivo_from_number`, `plivo_status`, `textlocal_username`, `textlocal_hash_key`, `textlocal_sender_id`, `textlocal_status`, `smscountry_username`, `smscountry_password`, `smscountry_sender_id`, `smscountry_status`, `betasms_username`, `betasms_password`, `betasms_sender_id`, `betasms_status`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, '', '', '', '', 0, '', '', '', '', 0, '', '', 0, '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, 1, '2017-08-24 13:22:49', '2019-11-16 22:06:09', 1, 1);


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp_password` varchar(255) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `reset_key` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= Active, 0 = InActive',
  `photo` longtext NOT NULL,
  `email_verify` varchar(30) NOT NULL,
  `phone_verify` varchar(30) NOT NULL,
  `activation_key` varchar(128) NOT NULL,
  `expire_at` varchar(128) NOT NULL,
  `otp` int(11) NOT NULL,
  `otp_expire_at` varchar(128) NOT NULL,
  `last_logged_in` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `password`, `temp_password`, `email`, `phone`, `reset_key`, `status`, `photo`, `email_verify`, `phone_verify`, `activation_key`, `expire_at`, `otp`, `otp_expire_at`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'Chandramani', 'Arya', 1, '$2y$10$RvHGqmX60JOOpOXOpJX35urCpMab0pPWYy28f5Difl.StL1CMIc6.', 'c3VwZXJhZG1pbg==', 'superadmin@gmail.com', '7828058920', NULL, 1, '', '', '', '', '', 0, '', '2022-02-15 08:43:17', '2013-11-15 20:33:03', '2021-10-29 17:55:30', 0, 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `password`, `temp_password`, `email`, `phone`, `reset_key`, `status`, `photo`, `email_verify`, `phone_verify`, `activation_key`, `expire_at`, `otp`, `otp_expire_at`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (11, 'Satyam', 'Singh', 4, '$2y$10$l9/j995gdwJ3iyFiwtMhWOqa7360HHevWdrezoG5XPiAahenItSOa', 'MTIzNDU2', 'satyamsingh@gmail.com', '1236547890', NULL, 1, 'photo-1636792581-LMS.jpg', 'pending', 'pending', 'O74UoLncD5hf', '2021-11-12 20:30', 832675, '2021-11-11 20:45', '0000-00-00 00:00:00', '2021-11-11 08:30:23', '2021-11-13 15:12:50', 0, 11);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `password`, `temp_password`, `email`, `phone`, `reset_key`, `status`, `photo`, `email_verify`, `phone_verify`, `activation_key`, `expire_at`, `otp`, `otp_expire_at`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (12, 'Sushil', 'Sahu', 4, '$2y$10$jVwZZt5HF3.yz5TqsN5opONTFlIHmQJYcFy8/DP8STNtJa2Z9UcfC', 'MTIzNDU2', 'sushilsahu@gmail.com', '', NULL, 1, '', 'pending', 'pending', '3ZCheUYm56qp', '2021-11-13 17:12', 563281, '2021-11-12 17:27', '0000-00-00 00:00:00', '2021-11-12 05:12:10', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `password`, `temp_password`, `email`, `phone`, `reset_key`, `status`, `photo`, `email_verify`, `phone_verify`, `activation_key`, `expire_at`, `otp`, `otp_expire_at`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (19, 'Raghaw', 'Singh', 3, '$2y$10$8x3/DdwP8jlz9phj6w7Rg.F6EdY8MfuKYz860V1zyxkuejx3KOQTK', 'MTIzNDU2', 'raghawsingh@gmail.com', '0987654312', NULL, 1, 'photo-1636787249-sms.png', 'verify', 'verify', '', '', 0, '', '2021-11-13 12:07:02', '2021-11-13 12:37:29', '2021-11-13 12:38:58', 1, 1);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `password`, `temp_password`, `email`, `phone`, `reset_key`, `status`, `photo`, `email_verify`, `phone_verify`, `activation_key`, `expire_at`, `otp`, `otp_expire_at`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (20, 'Rohit', 'Kumar', 4, '$2y$10$7UPIsVB/QJFVgWLbb7r91uHLHwT/OhwInj8nVPhSpzKrefk2QDKQO', 'MTIzNDU2', 'rohit@gmail.com', '', NULL, 1, '', 'pending', 'pending', 'YoU12wcLVBhb', '2021-11-17 16:18', 943570, '2021-11-16 16:33', '0000-00-00 00:00:00', '2021-11-16 04:18:16', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `role_id`, `password`, `temp_password`, `email`, `phone`, `reset_key`, `status`, `photo`, `email_verify`, `phone_verify`, `activation_key`, `expire_at`, `otp`, `otp_expire_at`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (21, 'Suryamani', 'Arya', 4, '$2y$10$JuzUBBKuZ./Drk4B1DSuXuszyoOd0OVcRtrtlA/CO0xGcCHY8M9q2', 'MTIzNDU2', 'aryasurya1993@gmail.com', '', NULL, 1, '', 'pending', 'pending', 'P8fMHNYOgRjZ', '2021-11-17 17:25', 376980, '2021-11-16 17:40', '0000-00-00 00:00:00', '2021-11-16 05:25:11', '0000-00-00 00:00:00', 0, 0);


