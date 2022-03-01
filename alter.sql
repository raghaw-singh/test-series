ALTER TABLE `users` ADD `email_verify` VARCHAR(30) NOT NULL AFTER `photo`, ADD `phone_verify` VARCHAR(30) NOT NULL AFTER `email_verify`, ADD `activation_key` VARCHAR(128) NOT NULL AFTER `phone_verify`, ADD `expire_at` VARCHAR(128) NOT NULL AFTER `activation_key`;
ALTER TABLE `students` DROP `type_id`, DROP `admission_no`, DROP `admission_date`, DROP `is_guardian`, DROP `guardian_id`, DROP `relation_with`, DROP `registration_no`, DROP `group_id`, DROP `religion`, DROP `caste`, DROP `is_library_member`, DROP `is_hostel_member`, DROP `is_transport_member`, DROP `discount_id`, DROP `previous_school`, DROP `previous_class`, DROP `transfer_certificate`, DROP `health_condition`, DROP `second_language`, DROP `father_name`, DROP `father_phone`, DROP `father_education`, DROP `father_profession`, DROP `father_designation`, DROP `father_photo`, DROP `mother_name`, DROP `mother_phone`, DROP `mother_education`, DROP `mother_profession`, DROP `mother_designation`, DROP `mother_photo`;
ALTER TABLE `email_templates` ADD `types` VARCHAR(100) NOT NULL AFTER `title`;
ALTER TABLE `sms_templates` ADD `types` VARCHAR(100) NOT NULL AFTER `title`;
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (NULL, '9', 'Orders', 'orders', '1', '1', '1', '1', '1', '1', '1', '', '', '', ''), (NULL, '10', 'Statistics', 'statistics', '1', '1', '1', '1', '1', '1', '1', '', '', '', '');
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (NULL, '7', 'Report By User', 'user', '1', '0', '0', '1', '1', '1', '1', '', '', '', ''), (NULL, '7', 'Report By Course', 'course', '1', '0', '1', '1', '1', '1', '1', '', '', '1', '1');
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (NULL, '7', 'Report By Module', 'module', '1', '0', '1', '1', '1', '1', '1', '', '', '1', '1'), (NULL, '7', 'Report By Skill', 'skill', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (NULL, '7', 'Report By User Course', 'usercourse', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', ''), (NULL, '7', 'Report By Category', 'category', '1', '1', '1', '1', '1', '1', '1', '', '', '', '');
INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `is_status_vissible`, `is_export_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES (NULL, '7', 'Report By Meetup', 'meetup', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1'), (NULL, '7', 'Report By Checklist', 'checklist', '1', '0', '1', '1', '1', '1', '', '', '', '1', '1');
ALTER TABLE `course` ADD `assessment_type` VARCHAR(100) NOT NULL AFTER `is_free_course`, ADD `pass_pecentage` INT(11) NOT NULL AFTER `assessment_type`, ADD `discount_date` VARCHAR(128) NOT NULL AFTER `pass_pecentage`;
ALTER TABLE `users` ADD `otp` INT(11) NOT NULL AFTER `expire_at`, ADD `otp_expire_at` VARCHAR(128) NOT NULL AFTER `otp`;
ALTER TABLE `users` ADD `phone` VARCHAR(20) NOT NULL AFTER `email`;
ALTER TABLE `category` ADD `featured` INT(11) NOT NULL AFTER `thumbnail`;
ALTER TABLE `course` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `course_overview_url`;