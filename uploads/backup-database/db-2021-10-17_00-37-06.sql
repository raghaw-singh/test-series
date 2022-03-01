#
# TABLE STRUCTURE FOR: academic_years
#

DROP TABLE IF EXISTS `academic_years`;

CREATE TABLE `academic_years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_year` varchar(50) CHARACTER SET utf8 NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_running` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `academic_years` (`id`, `session_year`, `start_year`, `end_year`, `note`, `is_running`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'January 2018 - December 2018', 2018, 2018, 'Lorem Ipsum is simply dummy text', 0, 1, '2018-02-08 05:41:10', '2019-11-10 07:51:50', 1, 1);
INSERT INTO `academic_years` (`id`, `session_year`, `start_year`, `end_year`, `note`, `is_running`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 'January 2019 - December 2019', 2019, 2019, 'Lorem Ipsum is simply dummy text', 1, 1, '2018-02-08 05:41:45', '2019-11-10 07:51:24', 1, 1);
INSERT INTO `academic_years` (`id`, `session_year`, `start_year`, `end_year`, `note`, `is_running`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 'January 2020 - December 2020', 2020, 2020, 'Lorem Ipsum has been', 0, 1, '2018-02-08 05:42:55', '2019-11-10 07:51:04', 1, 1);
INSERT INTO `academic_years` (`id`, `session_year`, `start_year`, `end_year`, `note`, `is_running`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 'January 2021 - December 2021', 2021, 2021, 'Lorem Ipsum is simply dummy text', 0, 1, '2018-07-14 11:24:36', '2019-11-10 07:50:47', 1, 1);


#
# TABLE STRUCTURE FOR: activity_logs
#

DROP TABLE IF EXISTS `activity_logs`;

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `activity` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO `activity_logs` (`id`, `user_id`, `role_id`, `name`, `phone`, `ip_address`, `user_agent`, `activity`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (14, 1, 1, 'Super Admin', '1234856975', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', 'Has been logged in', 1, '2021-10-16 20:08:36', '2021-10-16 20:08:36', 1, 1);


#
# TABLE STRUCTURE FOR: certificates
#

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `theme` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `top_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sub_title_left` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sub_title_middle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sub_title_right` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `main_text` text CHARACTER SET utf8 DEFAULT NULL,
  `footer_left` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `footer_middle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `footer_right` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `background` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

INSERT INTO `email_settings` (`id`, `mail_protocol`, `smtp_host`, `smtp_port`, `smtp_timeout`, `smtp_user`, `smtp_pass`, `smtp_crypto`, `mail_type`, `char_set`, `priority`, `from_name`, `from_address`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'sendmail', '', '', 0, '', '', '', 'html', 'utf-8', 1, 'Single School', 'info@gssms.com', 1, '2019-09-30 08:52:36', '2021-10-16 01:50:17', 1, 1);


#
# TABLE STRUCTURE FOR: email_templates
#

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `email_type` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '1. general, 2. Attendance, 3. Due Fee, 4. Result ',
  `absent_date` date NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `employees` (`id`, `user_id`, `national_id`, `designation_id`, `salary_grade_id`, `salary_type`, `name`, `phone`, `present_address`, `permanent_address`, `gender`, `blood_group`, `religion`, `dob`, `joining_date`, `resign_date`, `photo`, `resume`, `facebook_url`, `linkedin_url`, `twitter_url`, `google_plus_url`, `instagram_url`, `pinterest_url`, `youtube_url`, `other_info`, `is_view_on_web`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 1, '11111111111', 10, 1, 'monthly', 'Super Admin', '1234856975', 'London City', 'Washington City', 'female', 'b_positive', 'islam', '1969-12-01', '1969-12-31', NULL, '', NULL, 'https://www.facebook.com/', 'https://www.linkedin.com/', 'https://twitter.com/', 'https://plus.google.com/', 'https://www.instagram.com/', 'https://www.pinterest.com/', 'https://www.youtube.com/', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 0, 1, '2019-11-10 08:41:59', '2019-11-10 08:41:59', 1, 1);


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
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'Setting', 'setting', 1, '2017-11-13 22:55:19', '2017-11-13 22:57:10', 1, 1);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 'Theme', 'theme', 1, '2017-12-12 13:34:52', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 'Language', 'language', 1, '2017-12-12 13:36:11', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 'Administrator', 'administrator', 1, '2017-12-12 13:36:35', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 'Human Resource', 'hrm', 1, '2017-12-12 13:38:30', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (6, 'Teacher', 'teacher', 1, '2017-12-12 13:39:01', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (7, 'Academic Activity', 'academic', 1, '2017-12-12 13:42:24', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (8, 'Guardian', 'guardian', 1, '2017-12-12 13:43:01', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (9, 'Student', 'student', 1, '2017-12-12 13:43:28', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (10, 'Attendance', 'attendance', 1, '2017-12-12 13:45:03', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (11, 'Assignment', 'assignment', 1, '2017-12-12 13:45:45', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (12, 'Exam', 'exam', 1, '2017-12-12 13:46:13', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (14, 'Library', 'library', 1, '2017-12-12 13:46:33', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (15, 'Transport', 'transport', 1, '2017-12-12 13:46:52', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (16, 'Hostel', 'hostel', 1, '2017-12-12 13:47:15', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (17, 'Message, Email & SMS', 'message', 1, '2017-12-12 13:47:48', '2017-12-14 08:48:49', 1, 1);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (18, 'Announcement', 'announcement', 1, '2017-12-12 13:48:23', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (19, 'Event', 'event', 1, '2017-12-12 13:48:36', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (20, 'Front Office', 'frontoffice', 1, '2017-12-12 13:49:05', '2019-08-05 22:41:52', 1, 1);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (21, 'Accounting', 'accounting', 1, '2017-12-12 13:49:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (22, 'Report', 'report', 1, '2017-12-12 13:51:09', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (13, 'Exam Mark', 'exam', 1, '2017-12-14 00:00:00', '2017-12-14 09:07:46', 1, 1);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (23, 'Certificate', 'certificate', 1, '2018-03-17 16:27:14', '0000-00-00 00:00:00', 2, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (24, 'Media Gallery', 'gallery', 1, '2018-03-22 06:46:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (25, 'Frontend', 'frontend', 1, '2018-03-23 03:40:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (26, 'Payroll', 'payroll', 1, '2018-03-25 02:07:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (27, 'Complain', 'complain', 1, '2019-04-10 00:00:00', '2019-04-10 00:00:00', 1, 1);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (28, 'User Complain', 'usercomplain', 1, '2019-07-20 19:39:44', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (29, 'User Leave', 'userleave', 1, '2019-07-24 21:53:30', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (30, 'Leave Management', 'leave', 1, '2019-07-24 21:53:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (31, 'ID Card & Admit Card', 'card', 1, '2019-07-28 23:36:16', '0000-00-00 00:00:00', 1, 0);


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
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 1, 'General Setting', 'setting', 1, 1, 1, NULL, 1, '2017-12-12 16:06:25', '2019-09-01 14:22:34', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 1, 'Payment Setting', 'payment', 1, 1, 1, NULL, 1, '2017-12-12 16:06:55', '2019-09-01 14:23:16', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 1, 'SMS Setting', 'sms', 1, 1, 1, NULL, 1, '2017-12-12 16:07:07', '2019-09-01 14:23:01', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 2, 'Theme', 'theme', 1, 0, 1, 0, 1, '2017-12-12 16:08:39', '2018-01-03 07:02:51', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 3, 'Language', 'language', 1, 1, 1, 1, 1, '2017-12-12 16:09:22', '2019-09-01 14:24:07', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (6, 4, 'Academic Year', 'year', 1, 1, 1, 1, 1, '2017-12-12 16:10:34', '2018-01-03 07:03:18', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (7, 4, 'User Role', 'role', 1, 1, 1, 1, 1, '2017-12-12 16:10:55', '2019-09-01 15:07:08', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (8, 4, 'Role Permission', 'permission', 1, NULL, 1, NULL, 1, '2017-12-12 16:12:10', '2019-09-01 14:24:55', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (64, 4, 'Reset User Password', 'password', 0, 0, 1, 0, 1, '2017-12-13 20:14:23', '2018-01-03 07:05:11', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (10, 5, 'Designation', 'designation', 1, 1, 1, 1, 1, '2017-12-12 16:15:38', '2018-01-03 07:07:38', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (11, 5, 'Employee', 'employee', 1, 1, 1, 1, 1, '2017-12-12 16:15:55', '2018-01-03 07:19:54', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (12, 6, 'Teacher', 'teacher', 1, 1, 1, 1, 1, '2017-12-12 16:17:22', '2018-01-03 07:25:07', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (14, 7, 'Classes', 'classes', 1, 1, 1, 1, 1, '2017-12-12 16:19:01', '2018-01-03 07:25:17', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (15, 7, 'Section', 'section', 1, 1, 1, 1, 1, '2017-12-12 16:19:24', '2018-01-03 07:25:24', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (16, 7, 'Subject', 'subject', 1, 1, 1, 1, 1, '2017-12-12 16:19:48', '2018-01-03 07:25:33', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (17, 7, 'Syllabus', 'syllabus', 1, 1, 1, 1, 1, '2017-12-12 16:20:32', '2018-01-03 07:25:54', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (18, 7, 'Class Routine', 'routine', 1, 1, 1, 1, 1, '2017-12-12 16:20:56', '2018-01-03 07:26:13', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (19, 7, 'Promotion', 'promotion', 1, 1, 0, 0, 1, '2017-12-12 16:21:17', '2018-02-09 01:42:57', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (20, 8, 'Guardian', 'guardian', 1, 1, 1, 1, 1, '2017-12-12 16:23:32', '2018-01-03 07:29:06', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (21, 9, 'Student', 'student', 1, 1, 1, 1, 1, '2017-12-12 17:58:56', '2018-01-03 07:29:15', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (65, 4, 'Backup Database', 'backup', 1, NULL, NULL, NULL, 1, '2017-12-13 20:14:39', '2019-09-01 14:28:12', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (23, 10, 'Employee Attendance', 'employee', 1, 1, 1, 0, 1, '2017-12-12 18:00:10', '2018-01-03 07:30:19', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (24, 10, 'Teacher Attendance', 'teacher', 1, 1, 1, 0, 1, '2017-12-12 18:00:51', '2018-01-03 07:29:52', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (25, 10, 'Student Attendance', 'student', 1, 1, 1, 0, 1, '2017-12-12 18:01:17', '2018-01-03 07:30:01', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (26, 11, 'Assignment', 'assignment', 1, 1, 1, 1, 1, '2017-12-12 18:02:08', '2018-01-03 07:30:40', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (28, 12, 'Exam Term', 'exam', 1, 1, 1, 1, 1, '2017-12-12 18:03:30', '2018-02-09 01:49:25', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (29, 12, 'Exam Grade', 'grade', 1, 1, 1, 1, 1, '2017-12-12 18:03:56', '2018-01-03 07:31:56', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (30, 12, 'Exam Schedule', 'schedule', 1, 1, 1, 1, 1, '2017-12-12 18:04:58', '2018-01-03 07:32:14', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (31, 12, 'Exam Suggestion', 'suggestion', 1, 1, 1, 1, 1, '2017-12-12 18:05:18', '2018-01-03 07:32:30', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (32, 12, 'Exam Attendance', 'attendance', 1, 1, 1, 0, 1, '2017-12-12 18:05:43', '2018-01-03 07:32:58', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (33, 13, 'Exam Mark', 'mark', 1, 1, 1, 0, 1, '2017-12-12 18:06:04', '2018-01-03 07:33:16', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (34, 13, 'Mark Sheet', 'marksheet', 1, 1, 1, 0, 1, '2017-12-12 18:06:24', '2018-01-03 07:34:08', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (35, 13, 'Result', 'result', 1, 1, 1, NULL, 1, '2017-12-12 18:06:41', '2018-09-02 12:40:01', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (37, 14, 'Library Book', 'book', 1, 1, 1, 1, 1, '2017-12-12 18:09:17', '2018-01-03 07:36:02', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (38, 14, 'Library Member', 'member', 1, 1, 0, 1, 1, '2017-12-12 18:09:33', '2018-01-03 07:36:24', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (66, 14, 'Issue & Return', 'issue', 1, 1, 1, 0, 1, '2017-12-14 08:46:37', '2018-01-03 07:37:01', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (40, 15, 'Vehicle', 'vehicle', 1, 1, 1, 1, 1, '2017-12-12 18:10:49', '2018-01-03 07:37:11', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (41, 15, 'Transport Route', 'route', 1, 1, 1, 1, 1, '2017-12-12 18:11:17', '2018-01-03 07:41:27', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (42, 15, 'Transport Member', 'member', 1, 1, 0, 1, 1, '2017-12-12 18:11:39', '2018-01-03 07:41:46', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (43, 16, 'Hostel', 'hostel', 1, 1, 1, 1, 1, '2017-12-12 18:12:16', '2018-01-03 07:41:55', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (44, 16, 'Hostel Room', 'room', 1, 1, 1, 1, 1, '2017-12-12 18:12:37', '2018-01-03 07:42:02', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (45, 16, 'Hostel Member', 'member', 1, 1, 0, 1, 1, '2017-12-12 18:13:00', '2018-01-03 07:42:23', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (47, 17, 'Email', 'mail', 1, 1, 0, 1, 1, '2017-12-12 18:15:57', '2018-01-03 07:44:16', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (48, 17, 'Text SMS', 'text', 1, 1, 0, 1, 1, '2017-12-12 18:16:17', '2018-01-03 07:44:25', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (50, 18, 'Notice', 'notice', 1, 1, 1, 1, 1, '2017-12-12 18:20:38', '2018-01-03 07:47:39', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (51, 18, 'News', 'news', 1, 1, 1, 1, 1, '2017-12-12 18:20:54', '2018-01-03 07:47:46', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (52, 18, 'Holiday', 'holiday', 1, 1, 1, 1, 1, '2017-12-12 18:21:08', '2018-01-03 07:47:53', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (53, 19, 'Event', 'event', 1, 1, 1, 1, 1, '2017-12-12 18:21:35', '2018-01-03 07:48:00', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (54, 20, 'Visitor', 'visitor', 1, 1, 1, 1, 1, '2017-12-12 18:22:05', '2019-08-05 22:43:00', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (56, 21, 'Expenditure Head', 'exphead', 1, 1, 1, 1, 1, '2017-12-12 18:23:51', '2018-01-03 07:48:23', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (57, 21, 'Expenditure', 'expenditure', 1, 1, 1, 1, 1, '2017-12-12 18:24:14', '2018-01-03 07:48:32', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (58, 21, 'Income Head', 'incomehead', 1, 1, 1, 1, 1, '2017-12-12 18:24:42', '2018-01-03 07:48:39', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (59, 21, 'Income', 'income', 1, 1, 1, 1, 1, '2017-12-12 18:24:54', '2018-01-03 07:48:59', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (60, 21, 'Invoice', 'invoice', 1, 1, 1, 1, 1, '2017-12-12 18:25:16', '2018-01-03 07:49:12', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (61, 21, 'Payment', 'payment', 1, 1, 0, 0, 1, '2017-12-12 18:25:34', '2018-01-03 07:49:47', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (62, 22, 'Report', 'report', 1, 0, 0, 0, 1, '2017-12-12 18:26:16', '2018-01-03 07:50:00', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (63, 4, 'Manage User', 'user', 1, 0, 1, 0, 1, '2017-12-13 20:13:49', '2018-01-03 07:35:43', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (67, 13, 'Mark send by SMS', 'text', 1, 1, 0, 1, 1, '2017-12-14 09:09:58', '2018-01-03 07:34:45', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (68, 13, 'Mark send by Email', 'mail', 1, 1, 0, 1, 1, '2017-12-14 09:10:15', '2018-01-03 07:35:13', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (69, 17, 'message', 'message', 1, 1, 1, 1, 1, '2018-01-13 08:53:53', '2018-01-13 09:06:22', 2, 2);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (70, 23, 'CertificateType', 'type', 1, 1, 1, 1, 1, '2018-03-17 16:28:43', '0000-00-00 00:00:00', 2, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (71, 23, 'Certificate', 'certificate', 1, NULL, NULL, NULL, 1, '2018-03-18 09:06:40', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (72, 24, 'Gallery', 'gallery', 1, 1, 1, 1, 1, '2018-03-22 06:47:27', '2018-03-22 06:48:03', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (73, 24, 'Image', 'image', 1, 1, 1, 1, 1, '2018-03-22 06:47:51', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (74, 25, 'Frontend', 'frontend', 1, 1, 1, 1, 1, '2018-03-23 05:06:49', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (75, 26, 'Salary Grade', 'grade', 1, 1, 1, 1, 1, '2018-03-25 02:08:21', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (76, 26, 'Payment', 'payment', 1, 1, 1, 1, 1, '2018-03-25 02:09:05', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (77, 25, 'Home Slider', 'slider', 1, 1, 1, 1, 1, '2018-03-27 18:04:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (78, 26, 'History', 'history', 1, NULL, NULL, NULL, 1, '2018-04-01 00:39:23', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (83, 4, 'SMS Template', 'smstemplate', 1, 1, 1, 1, 1, '2018-08-24 18:36:20', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (84, 4, 'Email Template', 'emailtemplate', 1, 1, 1, 1, 1, '2018-08-24 18:36:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (85, 4, 'Activity Log', 'activitylog', 1, NULL, NULL, 1, 1, '2018-08-24 18:42:49', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (86, 9, 'Bulk Import', 'bulk', 1, 1, NULL, NULL, 1, '2018-08-28 21:13:45', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (87, 9, 'Student Activity', 'activity', 1, 1, 1, 1, 1, '2018-08-28 21:14:33', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (88, 10, 'Absent Email', 'absentemail', 1, 1, NULL, 1, 1, '2018-09-01 08:51:33', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (89, 10, 'Absent SMS', 'absentsms', 1, 1, NULL, 1, 1, '2018-09-01 08:51:50', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (90, 13, 'Exam Result', 'examresult', 1, 1, 1, NULL, 1, '2018-09-02 12:38:31', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (91, 13, 'Final Result', 'finalresult', 1, 1, 1, NULL, 1, '2018-09-02 12:41:39', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (92, 13, 'Merit List', 'meritlist', 1, NULL, NULL, NULL, 1, '2018-09-02 12:42:23', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (93, 13, 'Result Email', 'resultemail', 1, 1, NULL, 1, 1, '2018-09-02 12:43:23', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (94, 13, 'Result SMS', 'resultsms', 1, 1, NULL, 1, 1, '2018-09-02 12:43:44', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (95, 13, 'Result Card', 'resultcard', 1, NULL, NULL, NULL, 1, '2018-09-02 12:44:43', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (96, 21, 'Discount', 'discount', 1, 1, 1, 1, 1, '2018-09-10 12:33:45', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (97, 21, 'Fee Type', 'feetype', 1, 1, 1, 1, 1, '2018-09-10 12:37:06', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (98, 21, 'Due Fee Email', 'duefeeemail', 1, 1, NULL, 1, 1, '2018-09-10 12:37:40', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (99, 21, 'Due Fee SMS', 'duefeesms', 1, 1, NULL, 1, 1, '2018-09-10 12:38:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (101, 4, 'Guardian Feedback', 'feedback', 1, NULL, 1, 1, 1, '2018-09-14 17:55:09', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (102, 8, 'Feedback', 'feedback', 1, 1, 1, 1, 1, '2018-09-14 18:07:45', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (104, 25, 'About', 'about', 1, 1, 1, NULL, 1, '2018-10-10 18:16:05', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (106, 1, 'Email Setting', 'email', 1, 1, 1, NULL, 1, '2019-04-09 13:58:35', '2019-09-01 14:22:46', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (107, 27, 'Complain', 'complain', 1, 1, 1, 1, 1, '2019-04-10 16:22:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (108, 7, 'Material', 'material', 1, 1, 1, 1, 1, '2019-07-05 21:41:34', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (109, 14, 'e-book', 'ebook', 1, 1, 1, 1, 1, '2019-07-07 00:03:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (110, 9, 'Online Admission', 'admission', 1, NULL, 1, 1, 1, '2019-07-08 20:14:31', '2019-07-13 14:17:27', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (111, 27, 'Complain Type', 'type', 1, 1, 1, 1, 1, '2019-07-19 17:49:08', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (112, 28, 'User Complain', 'usercomplain', 1, 1, 1, 1, 1, '2019-07-20 19:40:21', '2019-09-01 15:06:04', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (113, 29, 'User Leave', 'userleave', 1, 1, 1, 1, 1, '2019-07-24 21:54:41', '2019-09-01 15:05:38', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (114, 30, 'Leave Management', 'leave', 1, 1, 1, 1, 1, '2019-07-24 21:55:23', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (115, 30, 'Leave Type', 'type', 1, 1, 1, 1, 1, '2019-07-24 21:55:51', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (116, 30, 'Leave Application', 'application', 1, 1, 1, 1, 1, '2019-07-25 16:59:43', '2019-07-25 18:21:20', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (117, 30, 'Waiting Leave', 'waiting', 1, NULL, 1, 1, 1, '2019-07-28 13:21:16', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (118, 30, 'Approve Leave', 'approve', 1, NULL, 1, 1, 1, '2019-07-28 13:21:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (119, 30, 'Decline Leave', 'decline', 1, NULL, 1, 1, 1, '2019-07-28 13:22:11', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (120, 31, 'ID & Admit card', 'card', 1, NULL, NULL, NULL, 1, '2019-07-28 23:44:54', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (121, 31, 'Teacher ID card', 'teacher', 1, NULL, NULL, NULL, 1, '2019-07-28 23:45:36', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (122, 31, 'Employee ID Card', 'employee', 1, NULL, NULL, NULL, 1, '2019-07-28 23:46:01', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (123, 31, 'Student ID card', 'student', 1, NULL, NULL, NULL, 1, '2019-07-28 23:46:40', '2019-08-03 15:23:48', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (124, 31, 'ID Card Setting', 'idsetting', 1, 1, 1, 1, 1, '2019-07-30 17:27:20', '2019-09-01 15:02:05', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (125, 31, 'Admit Card Setting', 'admitsetting', 1, 1, 1, 1, 1, '2019-08-03 15:25:20', '2019-09-01 15:01:35', 1, 1);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (126, 31, 'Admit card', 'admit', 1, NULL, NULL, NULL, 1, '2019-08-03 15:25:53', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (129, 20, 'Visitor Purpose', 'purpose', 1, 1, 1, 1, 1, '2019-08-05 22:43:33', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (130, 20, 'Call Logs', 'calllog', 1, 1, 1, 1, 1, '2019-08-05 22:44:06', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (131, 20, 'Postal Dispatch', 'dispatch', 1, 1, 1, 1, 1, '2019-08-05 22:44:49', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (132, 20, 'Postal Receive', 'receive', 1, 1, 1, 1, 1, '2019-08-05 22:45:19', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (133, 20, 'Front Office', 'frontoffice', 1, 1, 1, 1, 1, '2019-08-05 22:45:47', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (134, 9, 'Student Type', 'type', 1, 1, 1, 1, 1, '2019-08-17 23:11:18', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (135, 4, 'User Credential', 'usercredential', 1, NULL, NULL, NULL, 1, '2019-08-18 23:54:14', '2019-09-05 13:47:12', 1, 132);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (136, 4, 'Reset Email', 'email', 1, NULL, 1, NULL, 1, '2019-08-18 23:54:14', '2019-09-05 13:47:12', 1, 132);
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (137, 9, 'Group', 'group', 1, 1, 1, 1, 1, '2019-11-02 02:09:45', '2019-11-02 02:09:45', 1, 1);


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
  `stripe_secret` varchar(100) DEFAULT NULL,
  `stripe_demo` tinyint(1) DEFAULT NULL,
  `stripe_extra_charge` double(10,2) NOT NULL,
  `stripe_status` tinyint(1) DEFAULT NULL,
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
  `stack_secret_key` varchar(120) DEFAULT NULL,
  `stack_public_key` varchar(120) DEFAULT NULL,
  `stack_demo` tinyint(1) DEFAULT NULL,
  `stack_extra_charge` double(10,2) DEFAULT NULL,
  `stack_status` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `payment_settings` (`id`, `paypal_api_username`, `paypal_api_password`, `paypal_api_signature`, `paypal_email`, `paypal_demo`, `paypal_extra_charge`, `paypal_status`, `stripe_secret`, `stripe_demo`, `stripe_extra_charge`, `stripe_status`, `payumoney_key`, `payumoney_salt`, `payumoney_demo`, `payu_extra_charge`, `payumoney_status`, `ccavenue_key`, `ccavenue_salt`, `ccavenue_demo`, `ccavenue_extra_charge`, `ccavenue_status`, `paytm_merchant_key`, `paytm_merchant_mid`, `paytm_merchant_website`, `paytm_industry_type`, `paytm_demo`, `paytm_extra_charge`, `paytm_status`, `stack_secret_key`, `stack_public_key`, `stack_demo`, `stack_extra_charge`, `stack_status`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, NULL, NULL, NULL, '', 0, '0.00', 0, NULL, NULL, '0.00', NULL, '', '', 0, '0.00', 0, NULL, NULL, 0, '0.00', 0, '', '', '', '', 0, '0.00', 0, '', '', 0, '0.00', 0, 1, '2019-09-29 23:39:56', '2019-11-16 12:34:54', 1, 1);


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
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1529 DEFAULT CHARSET=latin1;

INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 1, 1, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 1, 2, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 1, 3, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 1, 4, 0, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (5, 1, 5, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (6, 1, 6, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (7, 1, 7, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (8, 1, 8, 0, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (9, 1, 64, 0, 1, 0, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (10, 1, 65, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (11, 1, 63, 0, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (12, 1, 10, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (13, 1, 11, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (14, 1, 12, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (15, 1, 14, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (16, 1, 15, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (17, 1, 16, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (18, 1, 17, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (19, 1, 18, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (20, 1, 19, 1, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (21, 1, 20, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (22, 1, 21, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (23, 1, 23, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (24, 1, 24, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (25, 1, 25, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (26, 1, 26, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (27, 1, 27, 1, 1, 1, 1, 1, '2018-01-13 09:07:29', '0000-00-00 00:00:00', 2, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (28, 1, 28, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (29, 1, 29, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (30, 1, 30, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (31, 1, 31, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (32, 1, 32, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (33, 1, 33, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (34, 1, 34, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (35, 1, 35, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (36, 1, 67, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (37, 1, 68, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (38, 1, 37, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (39, 1, 38, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (40, 1, 66, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (41, 1, 40, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (42, 1, 41, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (43, 1, 42, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (44, 1, 43, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (45, 1, 44, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (46, 1, 45, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (47, 1, 46, 1, 1, 1, 1, 1, '2017-12-23 22:10:34', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (48, 1, 47, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (49, 1, 48, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (50, 1, 50, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (51, 1, 51, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (52, 1, 52, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (53, 1, 53, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (54, 1, 54, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (55, 1, 55, 1, 1, 1, 1, 1, '2017-12-23 22:10:34', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (56, 1, 56, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (57, 1, 57, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (58, 1, 58, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (59, 1, 59, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (60, 1, 60, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (61, 1, 61, 1, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (62, 1, 62, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (63, 3, 1, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (64, 3, 2, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (65, 3, 3, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (66, 3, 4, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (67, 3, 5, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (68, 3, 6, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (69, 3, 7, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (70, 3, 8, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (71, 3, 64, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (72, 3, 65, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (73, 3, 63, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (74, 3, 10, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (75, 3, 11, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (76, 3, 12, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (77, 3, 14, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (78, 3, 15, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (79, 3, 16, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (80, 3, 17, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (81, 3, 18, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (82, 3, 19, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (83, 3, 20, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (84, 3, 21, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (85, 3, 23, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (86, 3, 24, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (87, 3, 25, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (88, 3, 26, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (89, 3, 27, 1, 1, 0, 1, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (90, 3, 28, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (91, 3, 29, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (92, 3, 30, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (93, 3, 31, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (94, 3, 32, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (95, 3, 33, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (96, 3, 34, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (97, 3, 35, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (98, 3, 67, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (99, 3, 68, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (100, 3, 37, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (101, 3, 38, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (102, 3, 66, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (103, 3, 40, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (104, 3, 41, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (105, 3, 42, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (106, 3, 43, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (107, 3, 44, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (108, 3, 45, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (109, 3, 46, 1, 1, 0, 1, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (110, 3, 47, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (111, 3, 48, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (112, 3, 50, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (113, 3, 51, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (114, 3, 52, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (115, 3, 53, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (116, 3, 54, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (117, 3, 55, 1, 1, 0, 1, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (118, 3, 56, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (119, 3, 57, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (120, 3, 58, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (121, 3, 59, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (122, 3, 60, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (123, 3, 61, 1, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (124, 3, 62, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (125, 1, 69, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (126, 5, 1, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (127, 5, 2, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (128, 5, 3, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (129, 5, 4, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (130, 5, 5, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (131, 5, 6, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (132, 5, 7, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (133, 5, 8, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (134, 5, 64, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (135, 5, 65, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (136, 5, 63, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (137, 5, 10, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (138, 5, 11, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (139, 5, 12, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (140, 5, 14, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (141, 5, 15, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (142, 5, 16, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (143, 5, 17, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (144, 5, 18, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (145, 5, 19, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (146, 5, 20, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (147, 5, 21, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (148, 5, 23, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (149, 5, 24, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (150, 5, 25, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (151, 5, 26, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (152, 5, 27, 1, 1, 1, 0, 1, '2018-01-13 09:46:35', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (153, 5, 28, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (154, 5, 29, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (155, 5, 30, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (156, 5, 31, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (157, 5, 32, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (158, 5, 33, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (159, 5, 34, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (160, 5, 35, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (161, 5, 67, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (162, 5, 68, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (163, 5, 37, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (164, 5, 38, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (165, 5, 66, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (166, 5, 40, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (167, 5, 41, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (168, 5, 42, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (169, 5, 43, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (170, 5, 44, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (171, 5, 45, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (172, 5, 47, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (173, 5, 48, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (174, 5, 69, 1, 1, 1, 1, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (175, 5, 50, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (176, 5, 51, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (177, 5, 52, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (178, 5, 53, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (179, 5, 54, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (180, 5, 56, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (181, 5, 57, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (182, 5, 58, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (183, 5, 59, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (184, 5, 60, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (185, 5, 61, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (186, 5, 62, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (187, 13, 1, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (188, 13, 2, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (189, 13, 3, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (190, 13, 4, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (191, 13, 5, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (192, 13, 6, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (193, 13, 7, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (194, 13, 8, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (195, 13, 64, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (196, 13, 65, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (197, 13, 63, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (198, 13, 10, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (199, 13, 11, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (200, 13, 12, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (201, 13, 14, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (202, 13, 15, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (203, 13, 16, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (204, 13, 17, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (205, 13, 18, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (206, 13, 19, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (207, 13, 20, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (208, 13, 21, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (209, 13, 23, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (210, 13, 24, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (211, 13, 25, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (212, 13, 26, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (213, 13, 27, 0, 0, 0, 0, 1, '2018-02-04 04:46:43', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (214, 13, 28, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (215, 13, 29, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (216, 13, 30, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (217, 13, 31, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (218, 13, 32, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (219, 13, 33, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (220, 13, 34, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (221, 13, 35, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (222, 13, 67, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (223, 13, 68, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (224, 13, 37, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (225, 13, 38, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (226, 13, 66, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (227, 13, 40, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (228, 13, 41, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (229, 13, 42, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (230, 13, 43, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (231, 13, 44, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (232, 13, 45, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (233, 13, 47, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (234, 13, 48, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (235, 13, 69, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (236, 13, 50, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (237, 13, 51, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (238, 13, 52, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (239, 13, 53, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (240, 13, 54, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (241, 13, 56, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (242, 13, 57, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (243, 13, 58, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (244, 13, 59, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (245, 13, 60, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (246, 13, 61, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (247, 13, 62, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (248, 3, 69, 1, 1, 1, 1, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (249, 2, 1, 1, 1, 1, 0, 1, '2019-10-09 14:59:06', '2019-10-09 14:59:06', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (250, 2, 2, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (251, 2, 3, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (252, 2, 4, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (253, 2, 5, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (254, 2, 6, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (255, 2, 7, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (256, 2, 8, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (257, 2, 64, 0, 1, 0, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (258, 2, 65, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (259, 2, 63, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (260, 2, 10, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (261, 2, 11, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (262, 2, 12, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (263, 2, 14, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (264, 2, 15, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (265, 2, 16, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (266, 2, 17, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (267, 2, 18, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (268, 2, 19, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (269, 2, 20, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (270, 2, 21, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (271, 2, 23, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (272, 2, 24, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (273, 2, 25, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (274, 2, 26, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (275, 2, 28, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (276, 2, 29, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (277, 2, 30, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (278, 2, 31, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (279, 2, 32, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (280, 2, 33, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (281, 2, 34, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (282, 2, 35, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (283, 2, 67, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (284, 2, 68, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (285, 2, 37, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (286, 2, 38, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (287, 2, 66, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (288, 2, 40, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (289, 2, 41, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (290, 2, 42, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (291, 2, 43, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (292, 2, 44, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (293, 2, 45, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (294, 2, 47, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (295, 2, 48, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (296, 2, 69, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (297, 2, 50, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (298, 2, 51, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (299, 2, 52, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (300, 2, 53, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (301, 2, 54, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (302, 2, 56, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (303, 2, 57, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (304, 2, 58, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (305, 2, 59, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (306, 2, 60, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (307, 2, 61, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (308, 2, 62, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (309, 4, 1, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (310, 4, 2, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (311, 4, 3, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (312, 4, 4, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (313, 4, 5, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (314, 4, 6, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (315, 4, 7, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (316, 4, 8, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (317, 4, 64, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (318, 4, 65, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (319, 4, 63, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (320, 4, 10, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (321, 4, 11, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (322, 4, 12, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (323, 4, 14, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (324, 4, 15, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (325, 4, 16, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (326, 4, 17, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (327, 4, 18, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (328, 4, 19, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (329, 4, 20, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (330, 4, 21, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (331, 4, 23, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (332, 4, 24, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (333, 4, 25, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (334, 4, 26, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (335, 4, 28, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (336, 4, 29, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (337, 4, 30, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (338, 4, 31, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (339, 4, 32, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (340, 4, 33, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (341, 4, 34, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (342, 4, 35, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (343, 4, 67, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (344, 4, 68, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (345, 4, 37, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (346, 4, 38, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (347, 4, 66, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (348, 4, 40, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (349, 4, 41, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (350, 4, 42, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (351, 4, 43, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (352, 4, 44, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (353, 4, 45, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (354, 4, 47, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (355, 4, 48, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (356, 4, 69, 1, 1, 1, 1, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (357, 4, 50, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (358, 4, 51, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (359, 4, 52, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (360, 4, 53, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (361, 4, 54, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (362, 4, 56, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (363, 4, 57, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (364, 4, 58, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (365, 4, 59, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (366, 4, 60, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (367, 4, 61, 1, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (368, 4, 62, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (369, 6, 1, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (370, 6, 2, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (371, 6, 3, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (372, 6, 4, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (373, 6, 5, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (374, 6, 6, 0, 0, 1, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (375, 6, 7, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (376, 6, 8, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (377, 6, 64, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (378, 6, 65, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (379, 6, 63, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (380, 6, 10, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (381, 6, 11, 0, 0, 1, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (382, 6, 12, 0, 0, 1, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (383, 6, 14, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (384, 6, 15, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (385, 6, 16, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (386, 6, 17, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (387, 6, 18, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (388, 6, 19, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (389, 6, 20, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (390, 6, 21, 0, 0, 1, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (391, 6, 23, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (392, 6, 24, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (393, 6, 25, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (394, 6, 26, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (395, 6, 28, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (396, 6, 29, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (397, 6, 30, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (398, 6, 31, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (399, 6, 32, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (400, 6, 33, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (401, 6, 34, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (402, 6, 35, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (403, 6, 67, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (404, 6, 68, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (405, 6, 37, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (406, 6, 38, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (407, 6, 66, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (408, 6, 40, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (409, 6, 41, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (410, 6, 42, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (411, 6, 43, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (412, 6, 44, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (413, 6, 45, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (414, 6, 47, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (415, 6, 48, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (416, 6, 69, 1, 1, 1, 1, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (417, 6, 50, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (418, 6, 51, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (419, 6, 52, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (420, 6, 53, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (421, 6, 54, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (422, 6, 56, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (423, 6, 57, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (424, 6, 58, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (425, 6, 59, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (426, 6, 60, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (427, 6, 61, 1, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (428, 6, 62, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (429, 7, 1, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (430, 7, 2, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (431, 7, 3, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (432, 7, 4, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (433, 7, 5, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (434, 7, 6, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (435, 7, 7, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (436, 7, 8, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (437, 7, 64, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (438, 7, 65, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (439, 7, 63, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (440, 7, 10, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (441, 7, 11, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (442, 7, 12, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (443, 7, 14, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (444, 7, 15, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (445, 7, 16, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (446, 7, 17, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (447, 7, 18, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (448, 7, 19, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (449, 7, 20, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (450, 7, 21, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (451, 7, 23, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (452, 7, 24, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (453, 7, 25, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (454, 7, 26, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (455, 7, 28, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (456, 7, 29, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (457, 7, 30, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (458, 7, 31, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (459, 7, 32, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (460, 7, 33, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (461, 7, 34, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (462, 7, 35, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (463, 7, 67, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (464, 7, 68, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (465, 7, 37, 1, 1, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (466, 7, 38, 1, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (467, 7, 66, 1, 1, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (468, 7, 40, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (469, 7, 41, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (470, 7, 42, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (471, 7, 43, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (472, 7, 44, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (473, 7, 45, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (474, 7, 47, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (475, 7, 48, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (476, 7, 69, 1, 1, 1, 1, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (477, 7, 50, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (478, 7, 51, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (479, 7, 52, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (480, 7, 53, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (481, 7, 54, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (482, 7, 56, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (483, 7, 57, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (484, 7, 58, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (485, 7, 59, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (486, 7, 60, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (487, 7, 61, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (488, 7, 62, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (489, 8, 1, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (490, 8, 2, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (491, 8, 3, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (492, 8, 4, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (493, 8, 5, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (494, 8, 6, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (495, 8, 7, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (496, 8, 8, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (497, 8, 64, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (498, 8, 65, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (499, 8, 63, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (500, 8, 10, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (501, 8, 11, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (502, 8, 12, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (503, 8, 14, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (504, 8, 15, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (505, 8, 16, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (506, 8, 17, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (507, 8, 18, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (508, 8, 19, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (509, 8, 20, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (510, 8, 21, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (511, 8, 23, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (512, 8, 24, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (513, 8, 25, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (514, 8, 26, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (515, 8, 28, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (516, 8, 29, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (517, 8, 30, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (518, 8, 31, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (519, 8, 32, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (520, 8, 33, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (521, 8, 34, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (522, 8, 35, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (523, 8, 67, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (524, 8, 68, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (525, 8, 37, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (526, 8, 38, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (527, 8, 66, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (528, 8, 40, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (529, 8, 41, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (530, 8, 42, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (531, 8, 43, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (532, 8, 44, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (533, 8, 45, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (534, 8, 47, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (535, 8, 48, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (536, 8, 69, 1, 1, 1, 1, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (537, 8, 50, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (538, 8, 51, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (539, 8, 52, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (540, 8, 53, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (541, 8, 54, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (542, 8, 56, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (543, 8, 57, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (544, 8, 58, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (545, 8, 59, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (546, 8, 60, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (547, 8, 61, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (548, 8, 62, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (549, 9, 1, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (550, 9, 2, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (551, 9, 3, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (552, 9, 4, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (553, 9, 5, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (554, 9, 6, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (555, 9, 7, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (556, 9, 8, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (557, 9, 64, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (558, 9, 65, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (559, 9, 63, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (560, 9, 10, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (561, 9, 11, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (562, 9, 12, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (563, 9, 14, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (564, 9, 15, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (565, 9, 16, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (566, 9, 17, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (567, 9, 18, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (568, 9, 19, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (569, 9, 20, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (570, 9, 21, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (571, 9, 23, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (572, 9, 24, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (573, 9, 25, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (574, 9, 26, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (575, 9, 28, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (576, 9, 29, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (577, 9, 30, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (578, 9, 31, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (579, 9, 32, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (580, 9, 33, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (581, 9, 34, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (582, 9, 35, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (583, 9, 67, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (584, 9, 68, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (585, 9, 37, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (586, 9, 38, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (587, 9, 66, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (588, 9, 40, 0, 0, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (589, 9, 41, 0, 0, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (590, 9, 42, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (591, 9, 43, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (592, 9, 44, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (593, 9, 45, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (594, 9, 47, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (595, 9, 48, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (596, 9, 69, 1, 1, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (597, 9, 50, 0, 0, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (598, 9, 51, 0, 0, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (599, 9, 52, 0, 0, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (600, 9, 53, 0, 0, 1, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (601, 9, 54, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (602, 9, 56, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (603, 9, 57, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (604, 9, 58, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (605, 9, 59, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (606, 9, 60, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (607, 9, 61, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (608, 9, 62, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (609, 1, 70, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (610, 1, 71, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (611, 1, 72, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (612, 1, 73, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (613, 1, 74, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (614, 1, 75, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (615, 1, 76, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (616, 1, 77, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (617, 1, 78, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (618, 4, 70, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (619, 4, 71, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (620, 4, 72, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (621, 4, 73, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (622, 4, 74, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (623, 4, 77, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (624, 4, 75, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (625, 4, 76, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (626, 4, 78, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (627, 14, 1, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (628, 14, 2, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (629, 14, 3, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (630, 14, 4, 0, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (631, 14, 5, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (632, 14, 6, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (633, 14, 7, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (634, 14, 8, 0, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (635, 14, 64, 0, 1, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (636, 14, 65, 0, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (637, 14, 63, 0, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (638, 14, 10, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (639, 14, 11, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (640, 14, 12, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (641, 14, 14, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (642, 14, 15, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (643, 14, 16, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (644, 14, 17, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (645, 14, 18, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (646, 14, 19, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (647, 14, 20, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (648, 14, 21, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (649, 14, 23, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (650, 14, 24, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (651, 14, 25, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (652, 14, 26, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (653, 14, 28, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (654, 14, 29, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (655, 14, 30, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (656, 14, 31, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (657, 14, 32, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (658, 14, 33, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (659, 14, 34, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (660, 14, 35, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (661, 14, 67, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (662, 14, 68, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (663, 14, 37, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (664, 14, 38, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (665, 14, 66, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (666, 14, 40, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (667, 14, 41, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (668, 14, 42, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (669, 14, 43, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (670, 14, 44, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (671, 14, 45, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (672, 14, 47, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (673, 14, 48, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (674, 14, 69, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (675, 14, 50, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (676, 14, 51, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (677, 14, 52, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (678, 14, 53, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (679, 14, 54, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (680, 14, 56, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (681, 14, 57, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (682, 14, 58, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (683, 14, 59, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (684, 14, 60, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (685, 14, 61, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (686, 14, 62, 0, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (687, 14, 70, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (688, 14, 71, 0, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (689, 14, 72, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (690, 14, 73, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (691, 14, 74, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (692, 14, 77, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (693, 14, 75, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (694, 14, 76, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (695, 14, 78, 0, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (696, 3, 70, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (697, 3, 71, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (698, 3, 72, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (699, 3, 73, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (700, 3, 74, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (701, 3, 77, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (702, 3, 75, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (703, 3, 76, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (704, 3, 78, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (705, 9, 70, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (706, 9, 71, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (707, 9, 72, 0, 0, 1, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (708, 9, 73, 0, 0, 1, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (709, 9, 74, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (710, 9, 77, 0, 0, 1, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (711, 9, 75, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (712, 9, 76, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (713, 9, 78, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (714, 8, 70, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (715, 8, 71, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (716, 8, 72, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (717, 8, 73, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (718, 8, 74, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (719, 8, 77, 0, 0, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (720, 8, 75, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (721, 8, 76, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (722, 8, 78, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (723, 7, 70, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (724, 7, 71, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (725, 7, 72, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (726, 7, 73, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (727, 7, 74, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (728, 7, 77, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (729, 7, 75, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (730, 7, 76, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (731, 7, 78, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (732, 6, 70, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (733, 6, 71, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (734, 6, 72, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (735, 6, 73, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (736, 6, 74, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (737, 6, 77, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (738, 6, 75, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (739, 6, 76, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (740, 6, 78, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (741, 2, 70, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (742, 2, 71, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (743, 2, 72, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (744, 2, 73, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (745, 2, 74, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (746, 2, 77, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (747, 2, 75, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (748, 2, 76, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (749, 2, 78, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (750, 13, 70, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (751, 13, 71, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (752, 13, 72, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (753, 13, 73, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (754, 13, 74, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (755, 13, 77, 0, 0, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (756, 13, 75, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (757, 13, 76, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (758, 13, 78, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (759, 5, 70, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (760, 5, 71, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (761, 5, 72, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (762, 5, 73, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (763, 5, 74, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (764, 5, 77, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (765, 5, 75, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (766, 5, 76, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (767, 5, 78, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (768, 1, 79, 1, 1, 1, 1, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (769, 1, 80, 1, 1, 1, 1, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (770, 1, 81, 0, 0, 1, 0, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (771, 1, 82, 1, 1, 1, 0, 1, '2019-09-30 12:22:01', '2019-09-30 12:22:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (772, 1, 83, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (773, 1, 84, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (774, 1, 85, 0, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (775, 1, 86, 1, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (776, 1, 87, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (777, 1, 88, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (778, 1, 89, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (779, 1, 90, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (780, 1, 91, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (781, 1, 92, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (782, 14, 83, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (783, 14, 84, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (784, 14, 85, 0, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (785, 14, 86, 1, 0, 0, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (786, 14, 87, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (787, 14, 88, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (788, 14, 81, 0, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (789, 14, 82, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (790, 14, 91, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (791, 14, 92, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (792, 14, 79, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (793, 14, 80, 1, 1, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (794, 14, 89, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (795, 14, 90, 1, 0, 1, 0, 1, '2018-07-14 11:37:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (796, 1, 93, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (797, 1, 94, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (798, 2, 83, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (799, 2, 84, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (800, 2, 85, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (801, 2, 93, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (802, 2, 86, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (803, 2, 94, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (804, 2, 87, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (805, 2, 88, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (806, 2, 81, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (807, 2, 82, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (808, 2, 91, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (809, 2, 92, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (810, 2, 79, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (811, 2, 80, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (812, 2, 89, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (813, 2, 90, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (814, 1, 95, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (815, 2, 95, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (816, 3, 83, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (817, 3, 84, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (818, 3, 85, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (819, 3, 93, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (820, 3, 86, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (821, 3, 94, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (822, 3, 87, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (823, 3, 88, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (824, 3, 81, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (825, 3, 82, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (826, 3, 91, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (827, 3, 92, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (828, 3, 95, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (829, 3, 79, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (830, 3, 80, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (831, 3, 89, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (832, 3, 90, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (833, 4, 83, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (834, 4, 84, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (835, 4, 85, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (836, 4, 93, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (837, 4, 86, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (838, 4, 94, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (839, 4, 87, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (840, 4, 88, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (841, 4, 81, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (842, 4, 82, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (843, 4, 91, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (844, 4, 92, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (845, 4, 95, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (846, 4, 79, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (847, 4, 80, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (848, 4, 89, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (849, 4, 90, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (850, 5, 83, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (851, 5, 84, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (852, 5, 85, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (853, 5, 93, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (854, 5, 86, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (855, 5, 94, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (856, 5, 87, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (857, 5, 88, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (858, 5, 81, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (859, 5, 82, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (860, 5, 91, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (861, 5, 92, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (862, 5, 95, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (863, 5, 79, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (864, 5, 80, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (865, 5, 89, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (866, 5, 90, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (867, 6, 83, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (868, 6, 84, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (869, 6, 85, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (870, 6, 93, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (871, 6, 86, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (872, 6, 94, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (873, 6, 87, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (874, 6, 88, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (875, 6, 81, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (876, 6, 82, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (877, 6, 91, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (878, 6, 92, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (879, 6, 95, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (880, 6, 79, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (881, 6, 80, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (882, 6, 89, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (883, 6, 90, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (884, 7, 83, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (885, 7, 84, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (886, 7, 85, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (887, 7, 93, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (888, 7, 86, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (889, 7, 94, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (890, 7, 87, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (891, 7, 88, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (892, 7, 81, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (893, 7, 82, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (894, 7, 91, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (895, 7, 92, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (896, 7, 95, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (897, 7, 79, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (898, 7, 80, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (899, 7, 89, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (900, 7, 90, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (901, 8, 83, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (902, 8, 84, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (903, 8, 85, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (904, 8, 93, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (905, 8, 86, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (906, 8, 94, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (907, 8, 87, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (908, 8, 88, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (909, 8, 81, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (910, 8, 82, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (911, 8, 91, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (912, 8, 92, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (913, 8, 95, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (914, 8, 79, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (915, 8, 80, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (916, 8, 89, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (917, 8, 90, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (918, 9, 83, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (919, 9, 84, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (920, 9, 85, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (921, 9, 93, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (922, 9, 86, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (923, 9, 94, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (924, 9, 87, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (925, 9, 88, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (926, 9, 81, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (927, 9, 82, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (928, 9, 91, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (929, 9, 92, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (930, 9, 95, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (931, 9, 79, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (932, 9, 80, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (933, 9, 89, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (934, 9, 90, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (935, 13, 83, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (936, 13, 84, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (937, 13, 85, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (938, 13, 93, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (939, 13, 86, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (940, 13, 94, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (941, 13, 87, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (942, 13, 88, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (943, 13, 81, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (944, 13, 82, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (945, 13, 91, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (946, 13, 92, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (947, 13, 95, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (948, 13, 79, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (949, 13, 80, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (950, 13, 89, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (951, 13, 90, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (952, 1, 96, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (953, 3, 96, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (954, 3, 97, 1, 1, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (955, 1, 97, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (956, 1, 98, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (957, 2, 96, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (958, 2, 97, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (959, 2, 98, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1353, 6, 109, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1352, 6, 137, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1351, 6, 134, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1350, 6, 110, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1349, 6, 102, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1348, 6, 108, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1347, 6, 136, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1346, 6, 135, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1345, 6, 101, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1344, 6, 106, 0, 0, 0, 0, 1, '2019-11-10 08:17:41', '2019-11-10 08:17:41', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1343, 5, 126, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1342, 5, 125, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1341, 5, 124, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1340, 5, 123, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1339, 5, 122, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1338, 5, 121, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1337, 5, 120, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1336, 5, 119, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1335, 5, 118, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1334, 5, 117, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1333, 5, 116, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1332, 5, 115, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1115, 1, 137, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1114, 2, 126, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1113, 2, 125, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1112, 2, 124, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1111, 2, 123, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1110, 2, 122, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1109, 2, 121, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1108, 2, 120, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1107, 2, 119, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1106, 2, 118, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1105, 2, 117, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1104, 2, 116, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1103, 2, 115, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1102, 2, 114, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1101, 2, 113, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1100, 2, 112, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1099, 2, 111, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1098, 2, 107, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1097, 2, 104, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1096, 2, 99, 1, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1095, 2, 133, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1094, 2, 132, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1093, 2, 131, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1092, 2, 130, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1091, 2, 129, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1090, 2, 109, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1089, 2, 134, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1088, 2, 110, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1087, 2, 102, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1086, 2, 108, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1085, 2, 136, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1084, 2, 135, 0, 0, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1083, 2, 101, 0, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1082, 2, 106, 1, 1, 1, 0, 1, '2019-10-09 14:59:07', '2019-10-09 14:59:07', 44, 44);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1081, 1, 136, 0, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1080, 1, 126, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1079, 1, 125, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1078, 1, 124, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1077, 1, 123, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1076, 1, 122, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1075, 1, 121, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1074, 1, 120, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1073, 1, 119, 0, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1072, 1, 118, 0, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1071, 1, 117, 0, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1070, 1, 116, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1069, 1, 115, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1068, 1, 114, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1067, 1, 113, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1066, 1, 112, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1065, 1, 111, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1064, 1, 107, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1063, 1, 104, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1062, 1, 99, 1, 0, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1061, 1, 133, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1060, 1, 132, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1059, 1, 131, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1058, 1, 130, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1057, 1, 129, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1056, 1, 109, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1055, 1, 134, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1054, 1, 110, 0, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1053, 1, 102, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1052, 1, 108, 1, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1051, 1, 135, 0, 0, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1050, 1, 101, 0, 1, 1, 1, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1049, 1, 106, 1, 1, 1, 0, 1, '2019-11-02 07:12:18', '2019-11-02 07:12:18', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1331, 5, 114, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1330, 5, 113, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1329, 5, 112, 1, 1, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1328, 5, 111, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1327, 5, 107, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1326, 5, 104, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1325, 5, 99, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1324, 5, 98, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1323, 5, 97, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1322, 5, 96, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1321, 5, 133, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1320, 5, 132, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1319, 5, 131, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1318, 5, 130, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1317, 5, 129, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1316, 5, 109, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1315, 5, 137, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1314, 5, 134, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1313, 5, 110, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1312, 5, 102, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1311, 5, 108, 0, 0, 1, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1310, 5, 136, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1309, 5, 135, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1308, 5, 101, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1307, 5, 106, 0, 0, 0, 0, 1, '2019-11-10 08:17:20', '2019-11-10 08:17:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1306, 4, 126, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1305, 4, 125, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1304, 4, 124, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1303, 4, 123, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1302, 4, 122, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1301, 4, 121, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1300, 4, 120, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1299, 4, 119, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1298, 4, 118, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1297, 4, 117, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1296, 4, 116, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1295, 4, 115, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1294, 4, 114, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1293, 4, 113, 1, 1, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1292, 4, 112, 1, 1, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1291, 4, 111, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1290, 4, 107, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1289, 4, 104, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1288, 4, 99, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1287, 4, 98, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1286, 4, 97, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1285, 4, 96, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1284, 4, 133, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1283, 4, 132, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1282, 4, 131, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1281, 4, 130, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1280, 4, 129, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1279, 4, 109, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1278, 4, 137, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1277, 4, 134, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1276, 4, 110, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1275, 4, 102, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1274, 4, 108, 0, 0, 1, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1273, 4, 136, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1272, 4, 135, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1271, 4, 101, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1270, 4, 106, 0, 0, 0, 0, 1, '2019-11-10 08:17:01', '2019-11-10 08:17:01', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1269, 3, 126, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1268, 3, 125, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1267, 3, 124, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1266, 3, 123, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1265, 3, 122, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1264, 3, 121, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1263, 3, 120, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1262, 3, 119, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1261, 3, 118, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1260, 3, 117, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1259, 3, 116, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1258, 3, 115, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1257, 3, 114, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1256, 3, 113, 1, 1, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1255, 3, 112, 1, 1, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1254, 3, 111, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1253, 3, 107, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1252, 3, 104, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1251, 3, 99, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1250, 3, 98, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1249, 3, 133, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1248, 3, 132, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1247, 3, 131, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1246, 3, 130, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1245, 3, 129, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1244, 3, 109, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1243, 3, 137, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1242, 3, 134, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1241, 3, 110, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1240, 3, 102, 1, 1, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1239, 3, 108, 0, 0, 1, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1238, 3, 136, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1237, 3, 135, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1236, 3, 101, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1235, 3, 106, 0, 0, 0, 0, 1, '2019-11-10 18:55:05', '2019-11-10 18:55:05', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1354, 6, 129, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1355, 6, 130, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1356, 6, 131, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1357, 6, 132, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1358, 6, 133, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1359, 6, 96, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1360, 6, 97, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1361, 6, 98, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1362, 6, 99, 0, 0, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1363, 6, 104, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1364, 6, 107, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1365, 6, 111, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1366, 6, 112, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1367, 6, 113, 1, 1, 1, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1368, 6, 114, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1369, 6, 115, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1370, 6, 116, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1371, 6, 117, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1372, 6, 118, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1373, 6, 119, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1374, 6, 120, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1375, 6, 121, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1376, 6, 122, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1377, 6, 123, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1378, 6, 124, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1379, 6, 125, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1380, 6, 126, 0, 0, 0, 0, 1, '2019-11-10 08:17:42', '2019-11-10 08:17:42', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1381, 7, 106, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1382, 7, 101, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1383, 7, 135, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1384, 7, 136, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1385, 7, 108, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1386, 7, 102, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1387, 7, 110, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1388, 7, 134, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1389, 7, 137, 0, 0, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1390, 7, 109, 1, 1, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1391, 7, 129, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1392, 7, 130, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1393, 7, 131, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1394, 7, 132, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1395, 7, 133, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1396, 7, 96, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1397, 7, 97, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1398, 7, 98, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1399, 7, 99, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1400, 7, 104, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1401, 7, 107, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1402, 7, 111, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1403, 7, 112, 1, 1, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1404, 7, 113, 1, 1, 1, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1405, 7, 114, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1406, 7, 115, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1407, 7, 116, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1408, 7, 117, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1409, 7, 118, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1410, 7, 119, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1411, 7, 120, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1412, 7, 121, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1413, 7, 122, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1414, 7, 123, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1415, 7, 124, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1416, 7, 125, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1417, 7, 126, 0, 0, 0, 0, 1, '2019-11-10 08:18:02', '2019-11-10 08:18:02', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1418, 8, 106, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1419, 8, 101, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1420, 8, 135, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1421, 8, 136, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1422, 8, 108, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1423, 8, 102, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1424, 8, 110, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1425, 8, 134, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1426, 8, 137, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1427, 8, 109, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1428, 8, 129, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1429, 8, 130, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1430, 8, 131, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1431, 8, 132, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1432, 8, 133, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1433, 8, 96, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1434, 8, 97, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1435, 8, 98, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1436, 8, 99, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1437, 8, 104, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1438, 8, 107, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1439, 8, 111, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1440, 8, 112, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1441, 8, 113, 1, 1, 1, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1442, 8, 114, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1443, 8, 115, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1444, 8, 116, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1445, 8, 117, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1446, 8, 118, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1447, 8, 119, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1448, 8, 120, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1449, 8, 121, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1450, 8, 122, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1451, 8, 123, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1452, 8, 124, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1453, 8, 125, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1454, 8, 126, 0, 0, 0, 0, 1, '2019-11-10 08:18:20', '2019-11-10 08:18:20', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1455, 9, 106, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1456, 9, 101, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1457, 9, 135, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1458, 9, 136, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1459, 9, 108, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1460, 9, 102, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1461, 9, 110, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1462, 9, 134, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1463, 9, 137, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1464, 9, 109, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1465, 9, 129, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1466, 9, 130, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1467, 9, 131, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1468, 9, 132, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1469, 9, 133, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1470, 9, 96, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1471, 9, 97, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1472, 9, 98, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1473, 9, 99, 0, 0, 0, 0, 1, '2019-11-10 08:19:11', '2019-11-10 08:19:11', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1474, 9, 104, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1475, 9, 107, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1476, 9, 111, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1477, 9, 112, 1, 1, 1, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1478, 9, 113, 1, 1, 1, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1479, 9, 114, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1480, 9, 115, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1481, 9, 116, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1482, 9, 117, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1483, 9, 118, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1484, 9, 119, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1485, 9, 120, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1486, 9, 121, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1487, 9, 122, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1488, 9, 123, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1489, 9, 124, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1490, 9, 125, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1491, 9, 126, 0, 0, 0, 0, 1, '2019-11-10 08:19:12', '2019-11-10 08:19:12', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1492, 13, 106, 0, 0, 0, 0, 1, '2019-11-10 08:19:38', '2019-11-10 08:19:38', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1493, 13, 101, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1494, 13, 135, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1495, 13, 136, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1496, 13, 108, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1497, 13, 102, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1498, 13, 110, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1499, 13, 134, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1500, 13, 137, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1501, 13, 109, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1502, 13, 129, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1503, 13, 130, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1504, 13, 131, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1505, 13, 132, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1506, 13, 133, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1507, 13, 96, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1508, 13, 97, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1509, 13, 98, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1510, 13, 99, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1511, 13, 104, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1512, 13, 107, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1513, 13, 111, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1514, 13, 112, 1, 1, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1515, 13, 113, 1, 1, 1, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1516, 13, 114, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1517, 13, 115, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1518, 13, 116, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1519, 13, 117, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1520, 13, 118, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1521, 13, 119, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1522, 13, 120, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1523, 13, 121, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1524, 13, 122, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1525, 13, 123, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1526, 13, 124, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1527, 13, 125, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1528, 13, 126, 0, 0, 0, 0, 1, '2019-11-10 08:19:39', '2019-11-10 08:19:39', 1, 1);


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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'super-admin', 'Super Admin', 'Super Admin User', 1, 1, 1, '2017-08-13 12:15:17', '2018-02-09 01:58:57', 0, 1);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (2, 'admin', 'Admin', 'Admin User', 1, 0, 1, '2017-08-13 13:01:36', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (3, 'instructor', 'Instructor', 'Instructor', 1, 0, 1, '2017-08-13 13:02:05', '2018-02-09 01:59:22', 0, 1);
INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `is_super_admin`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (4, 'student', 'Student', 'Student User', 1, 0, 1, '2017-08-13 13:02:24', '2018-02-09 01:59:34', 0, 1);


#
# TABLE STRUCTURE FOR: settings
#

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `registration_date` date DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL,
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
  `enable_online_admission` tinyint(1) NOT NULL DEFAULT 1,
  `final_result_type` tinyint(1) DEFAULT 0,
  `default_time_zone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sms_date_format` varchar(100) CHARACTER SET utf8 NOT NULL,
  `map_api_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_analytics` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `theme_name` varchar(100) CHARACTER SET utf8 DEFAULT 'radical-red',
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `settings` (`id`, `system_name`, `registration_date`, `address`, `phone`, `email`, `currency`, `currency_symbol`, `language`, `footer`, `logo`, `front_logo`, `favicon_icon`, `brand_logo`, `academic_year_id`, `running_year`, `school_fax`, `school_lat`, `school_lng`, `enable_rtl`, `enable_frontend`, `enable_online_admission`, `final_result_type`, `default_time_zone`, `sms_date_format`, `map_api_key`, `google_analytics`, `theme_name`, `about_text`, `about_image`, `facebook_url`, `twitter_url`, `linkedin_url`, `google_plus_url`, `youtube_url`, `instagram_url`, `pinterest_url`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, 'Academy Learning Management System', '2018-12-06', '10433 Wolverine Way  Bellevue, CA 98456', '0123456789', 'info@gsms.com', 'US', '$', 'english', 'asjdfh askjdfh askdjf', '1.png', '1.png', 'favicon_1.png', 'favicon.png', 2, 'July 2017 - June 2018', '346546', '', '', 0, 1, 1, 1, 'Asia/Dhaka', 'M j, Y', '', '', 'blue', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem..', '', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.youtube.com/', 'https://www.instagram.com/', 'https://www.pinterest.com/', 1, '2017-08-23 09:40:28', '2021-10-16 20:42:07', 1, 1);


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
# TABLE STRUCTURE FOR: sms_templates
#

DROP TABLE IF EXISTS `sms_templates`;

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: students
#

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `admission_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `admission_date` date NOT NULL,
  `is_guardian` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `guardian_id` int(11) NOT NULL,
  `relation_with` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `registration_no` varchar(50) CHARACTER SET utf8 NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `present_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `blood_group` varchar(50) CHARACTER SET utf8 NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `caste` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dob` date NOT NULL,
  `age` int(11) DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `other_info` text DEFAULT NULL,
  `is_library_member` tinyint(1) NOT NULL DEFAULT 0,
  `is_hostel_member` tinyint(1) NOT NULL DEFAULT 0,
  `is_transport_member` tinyint(1) NOT NULL DEFAULT 0,
  `discount_id` int(11) NOT NULL,
  `previous_school` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `previous_class` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `transfer_certificate` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `health_condition` text CHARACTER SET utf8 DEFAULT NULL,
  `national_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `second_language` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `father_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `father_education` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_profession` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_designation` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `mother_education` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_profession` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_designation` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: teachers
#

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `national_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `salary_grade_id` int(11) NOT NULL,
  `salary_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `responsibility` varchar(255) NOT NULL,
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
  `youtube_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pinterest_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT 0,
  `other_info` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finger_print` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp_password` varchar(255) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `reset_key` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= Active, 0 = InActive',
  `last_logged_in` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `finger_print`, `unique_id`, `role_id`, `password`, `temp_password`, `email`, `reset_key`, `status`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (1, '', '', 1, '17c4520f6cfd1ab53d8745e84681eb49', 'MTIzNDU2', 'superadmin@gmail.com', NULL, 1, '2021-10-16 20:08:36', '2013-11-15 20:33:03', '2019-11-15 12:05:39', 0, 0);


