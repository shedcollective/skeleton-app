INSERT INTO `user` (`id`, `id_md5`, `auth_method_id`, `group_id`, `ip_address`, `last_ip`, `password`, `password_md5`, `salt`, `email`, `created`, `last_update`)
VALUES
	(1, 'c4ca4238a0b923820dcc509a6f75849b', {{VALUE_USER_AUTH_METHOD}}, {{VALUE_USER_GROUP_ID}}, '127.0.0.1', '127.0.0.1', '{{VALUE_USER_PASSWORD}}', '{{VALUE_USER_PASSWORD_MD5}}', '{{VALUE_USER_SALT}}', '{{VALUE_USER_EMAIL}}', NOW(), NOW());
INSERT INTO `user_meta` (`user_id`,`first_name`, `last_name`)
VALUES
	(1, '{{VALUE_USER_FIRST_NAME}}', '{{VALUE_USER_LAST_NAME}}');
