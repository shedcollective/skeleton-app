INSERT INTO `user` (`id`, `id_md5`, `auth_method_id`, `group_id`, `fb_token`, `fb_id`, `linkedin_id`, `linkedin_token`, `linkedin_secret`, `ip_address`, `last_ip`, `username`, `password`, `password_md5`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `remember_code`, `created_on`, `last_login`, `last_seen`, `active`, `temp_pw`, `failed_login_count`, `failed_login_expires`, `last_update`, `user_acl`)
VALUES
	(1, 'c4ca4238a0b923820dcc509a6f75849b', 1, 1, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '127.0.0.1', '', '{{VALUE_USER_PASSWORD}}', '{{VALUE_USER_PASSWORD_MD5}}', '{{VALUE_USER_SALT}}', '{{VALUE_USER_EMAIL}}', NULL, NULL, NULL, {{VALUE_USER_CREATED_ON}}, {{VALUE_USER_LAST_LOGIN}}, {{VALUE_USER_LAST_SEEN}}, NULL, NULL, 0, NULL, {{VALUE_USER_LAST_UPDATE}}, NULL);
INSERT INTO `user_meta` (`user_id`, `referral`, `referred_by`, `first_name`, `last_name`, `profile_img`)
VALUES
	(1, NULL, NULL, '{{VALUE_USER_FIRST_NAME}}', '{{VALUE_USER_LAST_NAME}}', NULL);
