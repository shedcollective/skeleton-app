INSERT INTO `user` (`id`, `id_md5`, `auth_method_id`, `group_id`, `ip_address`, `last_ip`, `password`, `password_md5`, `salt`, `email`, `created`, `last_update`, `temp_pw`)
VALUES
	({{VALUE_USER_ID}}, '{{VALUE_USER_ID_MD5}}', {{VALUE_USER_AUTH_METHOD}}, {{VALUE_USER_GROUP_ID}}, '127.0.0.1', '127.0.0.1', '{{VALUE_USER_PASSWORD}}', '{{VALUE_USER_PASSWORD_MD5}}', '{{VALUE_USER_SALT}}', '{{VALUE_USER_EMAIL}}', NOW(), NOW(), 1);
INSERT INTO `user_meta` (`user_id`,`first_name`, `last_name`)
VALUES
	({{VALUE_USER_ID}}, '{{VALUE_USER_FIRST_NAME}}', '{{VALUE_USER_LAST_NAME}}');
