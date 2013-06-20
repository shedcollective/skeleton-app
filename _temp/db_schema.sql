# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.19)
# Database: test2
# Generation Time: 2013-02-13 15:36:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_help_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_help_video`;

CREATE TABLE `admin_help_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `vimeo_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blog_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_category`;

CREATE TABLE `blog_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(150) NOT NULL DEFAULT '',
  `label` varchar(150) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `blog_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blog_category_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blog_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_post`;

CREATE TABLE `blog_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `slug` varchar(150) NOT NULL DEFAULT '',
  `title` varchar(150) NOT NULL DEFAULT '',
  `excerpt` text NOT NULL,
  `body` longtext NOT NULL,
  `image` varchar(150) DEFAULT '',
  `gallery_type` enum('slider','fancy') NOT NULL DEFAULT 'fancy',
  `gallery_position` enum('top','bottom') NOT NULL DEFAULT 'top',
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_description` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) unsigned NOT NULL,
  `is_published` tinyint(1) unsigned NOT NULL,
  `is_deleted` tinyint(1) unsigned NOT NULL,
  `published` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `blog_post_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `blog_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `blog_post_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table blog_post_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_post_category`;

CREATE TABLE `blog_post_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `blog_post_category_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_post_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blog_post_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_post_image`;

CREATE TABLE `blog_post_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `media_type` enum('image','vimeo','youtube') NOT NULL DEFAULT 'image',
  `image_filename` varchar(50) DEFAULT NULL,
  `image_slider_link` varchar(300) DEFAULT NULL,
  `image_caption` varchar(500) DEFAULT NULL,
  `vimeo_id` varchar(50) DEFAULT NULL,
  `youtube_id` varchar(50) DEFAULT NULL,
  `order` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `blog_post_image_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blog_post_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_post_tag`;

CREATE TABLE `blog_post_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `blog_post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table blog_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_settings`;

CREATE TABLE `blog_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `blog_settings` WRITE;
/*!40000 ALTER TABLE `blog_settings` DISABLE KEYS */;

INSERT INTO `blog_settings` (`id`, `key`, `value`)
VALUES
  (2,'blog_url','s:5:\"blog/\";'),
  (3,'sidebar_enabled','b:1;'),
  (4,'categories_enabled','b:1;'),
  (5,'tags_enabled','b:0;'),
  (6,'sidebar_position','s:5:\"right\";');

/*!40000 ALTER TABLE `blog_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_tag`;

CREATE TABLE `blog_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(150) NOT NULL DEFAULT '',
  `label` varchar(150) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `blog_tag_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blog_tag_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




# Dump of table cdn_local_bucket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdn_local_bucket`;

CREATE TABLE `cdn_local_bucket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `allowed_types` varchar(300) DEFAULT NULL,
  `max_size` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cdn_local_bucket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cdn_local_bucket_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdn_local_bucket_tag`;

CREATE TABLE `cdn_local_bucket_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bucket_id` int(11) unsigned NOT NULL,
  `label` varchar(100) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bucket_id` (`bucket_id`),
  CONSTRAINT `cdn_local_bucket_tag_ibfk_1` FOREIGN KEY (`bucket_id`) REFERENCES `cdn_local_bucket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cdn_local_object
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdn_local_object`;

CREATE TABLE `cdn_local_object` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bucket_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `filename` varchar(50) NOT NULL DEFAULT '',
  `filename_display` varchar(100) NOT NULL DEFAULT '',
  `mime` varchar(50) DEFAULT NULL,
  `filesize` int(11) unsigned NOT NULL,
  `img_width` int(11) unsigned NOT NULL,
  `img_height` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `serves` int(11) unsigned NOT NULL,
  `thumbs` int(11) unsigned NOT NULL,
  `scales` int(11) unsigned NOT NULL,
  `is_deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bucket_id` (`bucket_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cdn_local_object_ibfk_1` FOREIGN KEY (`bucket_id`) REFERENCES `cdn_local_bucket` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cdn_local_object_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cdn_local_object_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cdn_local_object_tag`;

CREATE TABLE `cdn_local_object_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `object_id` (`object_id`),
  CONSTRAINT `cdn_local_object_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `cdn_local_bucket_tag` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cdn_local_object_tag_ibfk_3` FOREIGN KEY (`object_id`) REFERENCES `cdn_local_object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cms_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_block`;

CREATE TABLE `cms_block` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('plaintext','richtext','image','file','number','url') NOT NULL DEFAULT 'plaintext',
  `slug` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `located` varchar(500) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `slug` (`slug`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `cms_block_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cms_block_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cms_block_translation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_block_translation`;

CREATE TABLE `cms_block_translation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(11) unsigned NOT NULL,
  `lang_id` int(11) unsigned NOT NULL DEFAULT '202',
  `value` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  KEY `lang_id` (`lang_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `cms_block_translation_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_block_translation_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `language` (`id`),
  CONSTRAINT `cms_block_translation_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cms_block_translation_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cms_block_translation_revision
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_block_translation_revision`;

CREATE TABLE `cms_block_translation_revision` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_translation_id` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `block_translation_id` (`block_translation_id`),
  CONSTRAINT `cms_block_translation_revision_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cms_block_translation_revision_ibfk_3` FOREIGN KEY (`block_translation_id`) REFERENCES `cms_block_translation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cms_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_page`;

CREATE TABLE `cms_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL DEFAULT '',
  `layout` enum('hero-sidebar-left','hero-sidebar-right','hero-full-width','no-hero-sidebar-left','no-hero-sidebar-right','no-hero-full-width') NOT NULL DEFAULT 'hero-sidebar-left',
  `sidebar_width` tinyint(1) unsigned NOT NULL DEFAULT '4',
  `title` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(300) DEFAULT NULL,
  `seo_keywords` varchar(150) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `cms_page_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cms_page_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cms_page_widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_page_widget`;

CREATE TABLE `cms_page_widget` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `order` int(11) unsigned NOT NULL,
  `widget_class` varchar(100) NOT NULL DEFAULT '',
  `widget_area` enum('hero','body','sidebar') NOT NULL DEFAULT 'body',
  `widget_data` longtext NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `cms_page_widget_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_widget_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cms_page_widget_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table date_format_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `date_format_date`;

CREATE TABLE `date_format_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(40) NOT NULL DEFAULT '',
  `format` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `date_format_date` WRITE;
/*!40000 ALTER TABLE `date_format_date` DISABLE KEYS */;

INSERT INTO `date_format_date` (`id`, `label`, `format`)
VALUES
	(1, 'DD/MM/YYYY', 'd/m/Y'),
	(2, 'DD/MM/YY', 'd/m/y'),
	(3, 'MM/DD/YYYY', 'm/d/Y'),
	(4, 'MM/DD/YYYY', 'm/d/y'),
	(5, 'DD-MM-YYYY', 'd-m-Y'),
	(6, 'DD-MM-YY', 'd-m-y'),
	(7, 'MM-DD-YYYY', 'm-d-Y'),
	(8, 'MM-DD-YY', 'm-d-y');

/*!40000 ALTER TABLE `date_format_date` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table date_format_time
# ------------------------------------------------------------

DROP TABLE IF EXISTS `date_format_time`;

CREATE TABLE `date_format_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(40) NOT NULL DEFAULT '',
  `format` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `date_format_time` WRITE;
/*!40000 ALTER TABLE `date_format_time` DISABLE KEYS */;

INSERT INTO `date_format_time` (`id`, `label`, `format`)
VALUES
	(1, '24 Hour', 'H:i:s'),
	(2, '12 Hour', 'g:i:s A');

/*!40000 ALTER TABLE `date_format_time` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table email_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue`;

CREATE TABLE `email_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `time_queued` datetime NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `email_vars` longtext,
  `internal_ref` int(11) unsigned DEFAULT NULL,
  `queue_id` bigint(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id_2` (`type_id`,`internal_ref`),
  CONSTRAINT `email_queue_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `email_queue_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_queue_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_archive
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_archive`;

CREATE TABLE `email_queue_archive` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `time_queued` datetime NOT NULL,
  `time_sent` datetime NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `email_vars` longtext,
  `internal_ref` int(11) unsigned DEFAULT NULL,
  `read_count` tinyint(3) unsigned NOT NULL,
  `link_click_count` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id_2` (`type_id`,`internal_ref`),
  CONSTRAINT `email_queue_archive_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `email_queue_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_queue_archive_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_link`;

CREATE TABLE `email_queue_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(11) unsigned NOT NULL,
  `url` varchar(300) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `is_html` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`),
  CONSTRAINT `email_queue_link_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `email_queue_archive` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_track_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_track_link`;

CREATE TABLE `email_queue_track_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(11) unsigned NOT NULL,
  `link_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`),
  KEY `link_id` (`link_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `email_queue_track_link_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `email_queue_archive` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_queue_track_link_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `email_queue_link` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_queue_track_link_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_track_open
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_track_open`;

CREATE TABLE `email_queue_track_open` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `email_queue_track_open_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `email_queue_archive` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_queue_track_open_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_type`;

CREATE TABLE `email_queue_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `cron_run` enum('instant','prompt','hourly','daily','weekly-sun','weekly-mon','weekly-tue','weekly-wed','weekly-thur','weekly-fri','weekly-sat','fortnightly','monthly') NOT NULL DEFAULT 'instant',
  `type` enum('service_acct') NOT NULL DEFAULT 'service_acct',
  `description` text,
  `template_file` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `slug_2` (`slug`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `email_queue_type` WRITE;
/*!40000 ALTER TABLE `email_queue_type` DISABLE KEYS */;

INSERT INTO `email_queue_type` (`id`, `slug`, `name`, `cron_run`, `type`, `description`, `template_file`, `subject`)
VALUES
	(1, 'test_email', 'Test Email - instant', 'instant', 'service_acct', 'Test email template, normally used in admin to test if recipients can receive email sent by the system', 'utilities/test_email', 'Test Email'),
	(2, 'verify_email', 'Verify Email, generic - instant', 'instant', 'service_acct', 'Email sent with a verification code', 'auth/verify_email', 'Welcome'),
	(3, 'register_fb', 'Welcome Email, Facebook - instant', 'instant', 'service_acct', 'Welcome email sent when a user registers using Facebook', 'auth/welcome_email_fb', 'Welcome'),
	(4, 'register_tw', 'Welcome/Verify Email, Twitter - instant', 'instant', 'service_acct', 'Welcome email sent with a verification code for users who register using Twitter', 'auth/welcome_email_tw', 'Welcome'),
	(5, 'register_li', 'Welcome/Verify Email, LinkedIn - instant', 'instant', 'service_acct', 'Welcome email sent with a verification code for users who register using LinkedIn', 'auth/welcome_email_li', 'Welcome'),
	(6, 'forgotten_password', 'Forgotten Password - instant', 'instant', 'service_acct', 'Email which is sent when a user requests a password reset.', 'auth/forgotten_password', 'Reset your Password');

/*!40000 ALTER TABLE `email_queue_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) unsigned DEFAULT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `vars` text,
  `ref` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `type` (`type_id`),
  KEY `type_2` (`type_id`,`created_by`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `event_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table event_interested_party
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_interested_party`;

CREATE TABLE `event_interested_party` (
  `event_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `is_read` tinyint(1) unsigned NOT NULL,
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_interested_party_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_interested_party_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table event_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_type`;

CREATE TABLE `event_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;

INSERT INTO `event_type` (`id`, `slug`, `name`, `description`)
VALUES
	(1,'did_register','User Registered','Fired when a user registers'),
	(2,'did_log_in','User logged in','Fired when a user logs in'),
	(3,'did_log_out','User Logged out','Fired when a user logs out'),
	(4,'did_link_fb','User linked Facebook to their account','Fired when a user links their Facebook account'),
	(5,'did_unlink_fb','User unlinked Facebook from their account','Fired when a user unlinks Facebook  from their account'),
	(6,'did_link_tw','User linked Twitter to their account','Fired when a user links their Twitter account'),
	(7,'did_unlink_tw','User unlinked Twitter from their account','Fired when a user unlinks Twitter  from their account'),
	(8,'did_link_li','User linked LinkedIn to their account','Fired when a user links their LinkedIn account'),
	(9,'did_unlink_li','User unlinked LinkedIn from their account','Fired when a user unlinks LinkedIn  from their account');

/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `priority` tinyint(1) unsigned DEFAULT NULL,
  `supported` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;

INSERT INTO `language` (`id`, `slug`, `name`, `priority`, `supported`)
VALUES
  (1, 'areare', '\'Are\'are', NULL, 0),
  (2, 'auhelawa', '\'Auhelawa', NULL, 0),
  (3, 'atong', 'A\'Tong', NULL, 0),
  (4, 'aari', 'Aari', NULL, 0),
  (5, 'aariya', 'Aariya', NULL, 0),
  (6, 'aasax', 'Aasáx', NULL, 0),
  (7, 'abanyom', 'Abanyom', NULL, 0),
  (8, 'abaza', 'Abaza', NULL, 0),
  (9, 'abenaki', 'Abenaki', NULL, 0),
  (10, 'abkhaz_or_abkhazian', 'Abkhaz or Abkhazian', NULL, 0),
  (11, 'abujmaria', 'Abujmaria', NULL, 0),
  (12, 'acehnese', 'Acehnese', NULL, 0),
  (13, 'adamorobe_sign_language', 'Adamorobe Sign Language', NULL, 0),
  (14, 'adele', 'Adele', NULL, 0),
  (15, 'adyghe', 'Adyghe', NULL, 0),
  (16, 'afar', 'Afar', NULL, 0),
  (17, 'afrikaans', 'Afrikaans', NULL, 0),
  (18, 'afroseminole_creole', 'Afro-Seminole Creole', NULL, 0),
  (19, 'aimaq_or_barbari', 'Aimaq or Barbari', NULL, 0),
  (20, 'aini', 'Aini', NULL, 0),
  (21, 'ainu', 'Ainu', NULL, 0),
  (22, 'akan', 'Akan', NULL, 0),
  (23, 'akawaio', 'Akawaio', NULL, 0),
  (24, 'akkadian', 'Akkadian', NULL, 0),
  (25, 'aklanon', 'Aklanon', NULL, 0),
  (26, 'albanian', 'Albanian', NULL, 0),
  (27, 'aleut', 'Aleut', NULL, 0),
  (28, 'algonquin', 'Algonquin', NULL, 0),
  (29, 'alsatian', 'Alsatian', NULL, 0),
  (30, 'altay', 'Altay', NULL, 0),
  (31, 'alutor', 'Alutor', NULL, 0),
  (32, 'american_sign_language', 'American Sign Language', NULL, 0),
  (33, 'amharic', 'Amharic', NULL, 0),
  (34, 'amorite', 'Amorite', NULL, 0),
  (35, 'anda', 'Anda', NULL, 0),
  (36, 'amdang', 'Amdang', NULL, 0),
  (37, 'ammonite', 'Ammonite', NULL, 0),
  (38, 'angika', 'Angika', NULL, 0),
  (39, 'anyin', 'Anyin', NULL, 0),
  (40, 'ao', 'Ao', NULL, 0),
  (41, 'apucikwar', 'A-Pucikwar', NULL, 0),
  (42, 'arabic', 'Arabic', NULL, 0),
  (43, 'aragonese', 'Aragonese', NULL, 0),
  (44, 'aramaic', 'Aramaic', NULL, 0),
  (45, 'are', 'Are', NULL, 0),
  (46, 'argobba', 'Argobba', NULL, 0),
  (47, 'aromanian_or_macedoromanian', 'Aromanian or Macedo-Romanian', NULL, 0),
  (48, 'armenian', 'Armenian', NULL, 0),
  (49, 'arvanitic', 'Arvanitic', NULL, 0),
  (50, 'ashkun', 'Ashkun', NULL, 0),
  (51, 'assamese', 'Assamese', NULL, 0),
  (52, 'assyrian_neoaramaic', 'Assyrian Neo-Aramaic', NULL, 0),
  (53, 'ateso_or_teso', 'Ateso or Teso', NULL, 0),
  (54, 'asi', 'Asi', NULL, 0),
  (55, 'asturian', 'Asturian', NULL, 0),
  (56, 'auslan', 'Auslan', NULL, 0),
  (57, 'austrobavarian', 'Austro-Bavarian', NULL, 0),
  (58, 'avar', 'Avar', NULL, 0),
  (59, 'avestan', 'Avestan', NULL, 0),
  (60, 'awadhi', 'Awadhi', NULL, 0),
  (61, 'aymara', 'Aymara', NULL, 0),
  (62, 'azerbaijani', 'Azerbaijani', NULL, 0),
  (63, 'badaga', 'Badaga', NULL, 0),
  (64, 'badeshi', 'Badeshi', NULL, 0),
  (65, 'bahnar', 'Bahnar', NULL, 0),
  (66, 'balinese', 'Balinese', NULL, 0),
  (67, 'balochi', 'Balochi', NULL, 0),
  (68, 'balti', 'Balti', NULL, 0),
  (69, 'bambara_or_bamanankan', 'Bambara or Bamanankan', NULL, 0),
  (70, 'banjar', 'Banjar', NULL, 0),
  (71, 'banyumasan', 'Banyumasan', NULL, 0),
  (72, 'basaa', 'Basaa', NULL, 0),
  (73, 'bashkir', 'Bashkir', NULL, 0),
  (74, 'basque', 'Basque', NULL, 0),
  (75, 'batak_karo', 'Batak Karo', NULL, 0),
  (76, 'batak_toba', 'Batak Toba', NULL, 0),
  (77, 'bats', 'Bats', NULL, 0),
  (78, 'beja', 'Beja', NULL, 0),
  (79, 'belarusian', 'Belarusian', NULL, 0),
  (80, 'belhare', 'Belhare', NULL, 0),
  (81, 'berta', 'Berta', NULL, 0),
  (82, 'bemba', 'Bemba', NULL, 0),
  (83, 'bengali', 'Bengali', NULL, 0),
  (84, 'bezhta', 'Bezhta', NULL, 0),
  (85, 'beothuk', 'Beothuk', NULL, 0),
  (86, 'berber', 'Berber', NULL, 0),
  (87, 'betawi', 'Betawi', NULL, 0),
  (88, 'bete', 'Bete', NULL, 0),
  (89, 'bete', 'Bété', NULL, 0),
  (90, 'bhili', 'Bhili', NULL, 0),
  (91, 'bhojpuri', 'Bhojpuri', NULL, 0),
  (92, 'bijil_neoaramaic', 'Bijil Neo-Aramaic', NULL, 0),
  (93, 'bikol', 'Bikol', NULL, 0),
  (94, 'bikya_or_furu', 'Bikya or Furu', NULL, 0),
  (95, 'bissa', 'Bissa', NULL, 0),
  (96, 'blackfoot', 'Blackfoot', NULL, 0),
  (97, 'boholano', 'Boholano', NULL, 0),
  (98, 'bohtan_neoaramaic', 'Bohtan Neo-Aramaic', NULL, 0),
  (99, 'bolgar', 'Bolgar', NULL, 0),
  (100, 'bonan_or_paoan', 'Bonan or Paoan', NULL, 0),
  (101, 'bororo', 'Bororo', NULL, 0),
  (102, 'bosnian', 'Bosnian', NULL, 0),
  (103, 'brahui', 'Brahui', NULL, 0),
  (104, 'breton', 'Breton', NULL, 0),
  (105, 'british_sign_language', 'British Sign Language', NULL, 0),
  (106, 'bua', 'Bua', NULL, 0),
  (107, 'buginese', 'Buginese', NULL, 0),
  (108, 'bukusu', 'Bukusu', NULL, 0),
  (109, 'bulgarian', 'Bulgarian', NULL, 0),
  (110, 'bunjevac', 'Bunjevac', NULL, 0),
  (111, 'burmese', 'Burmese', NULL, 0),
  (112, 'burushaski', 'Burushaski', NULL, 0),
  (113, 'buryat', 'Buryat', NULL, 0),
  (114, 'caluyanon_or_caluyanun', 'Caluyanon or Caluyanun', NULL, 0),
  (115, 'camunic', 'Camunic', NULL, 0),
  (116, 'cantonese', 'Cantonese', NULL, 0),
  (117, 'carian', 'Carian', NULL, 0),
  (118, 'catawba', 'Catawba', NULL, 0),
  (119, 'catalan', 'Catalan', NULL, 0),
  (120, 'cayuga', 'Cayuga', NULL, 0),
  (121, 'cebuano', 'Cebuano', NULL, 0),
  (122, 'chabacano_or_chavacano', 'Chabacano or Chavacano', NULL, 0),
  (123, 'chaga_or_kichagga', 'Chaga or Kichagga', NULL, 0),
  (124, 'chagatai', 'Chagatai', NULL, 0),
  (125, 'chakma', 'Chakma', NULL, 0),
  (126, 'chaldean_neoaramaic', 'Chaldean Neo-Aramaic', NULL, 0),
  (127, 'chamorro', 'Chamorro', NULL, 0),
  (128, 'chaouia_or_tachawit', 'Chaouia or Tachawit', NULL, 0),
  (129, 'chechen', 'Chechen', NULL, 0),
  (130, 'chemakum', 'Chemakum', NULL, 0),
  (131, 'chenchu', 'Chenchu', NULL, 0),
  (132, 'chenoua', 'Chenoua', NULL, 0),
  (133, 'cherokee', 'Cherokee', NULL, 0),
  (134, 'cheyenne', 'Cheyenne', NULL, 0),
  (135, 'chhattisgarhi', 'Chhattisgarhi', NULL, 0),
  (136, 'chickasaw', 'Chickasaw', NULL, 0),
  (137, 'chintang_or_chhintang', 'Chintang or Chhintang', NULL, 0),
  (138, 'chilcotin', 'Chilcotin', NULL, 0),
  (139, 'chinese', 'Chinese', 6, 0),
  (140, 'chiricahua_or_mescalerochiricahua_apache', 'Chiricahua or Mescalero-Chiricahua Apache', NULL, 0),
  (141, 'chichewa_or_nyanja', 'Chichewa or Nyanja', NULL, 0),
  (142, 'chipewyan', 'Chipewyan', NULL, 0),
  (143, 'chittagonian', 'Chittagonian', NULL, 0),
  (144, 'choctaw', 'Choctaw', NULL, 0),
  (145, 'chorasmian_or_khwarezmian', 'Chorasmian or Khwarezmian', NULL, 0),
  (146, 'chukchi_or_chukot', 'Chukchi or Chukot', NULL, 0),
  (147, 'chulym', 'Chulym', NULL, 0),
  (148, 'church_slavonic', 'Church Slavonic', NULL, 0),
  (149, 'chuukese_or_trukese', 'Chuukese or Trukese', NULL, 0),
  (150, 'chuvash', 'Chuvash', NULL, 0),
  (151, 'cocoma_or_cocama', 'Cocoma or Cocama', NULL, 0),
  (152, 'cocopa', 'Cocopa', NULL, 0),
  (153, 'coeur_dalene', 'Coeur d’Alene', NULL, 0),
  (154, 'comanche', 'Comanche', NULL, 0),
  (155, 'comorian', 'Comorian', NULL, 0),
  (156, 'coptic', 'Coptic', NULL, 0),
  (157, 'cornish', 'Cornish', NULL, 0),
  (158, 'corsican', 'Corsican', NULL, 0),
  (159, 'cree', 'Cree', NULL, 0),
  (160, 'crimean_tatar_or_crimean_turkish', 'Crimean Tatar or Crimean Turkish', NULL, 0),
  (161, 'croatian', 'Croatian', NULL, 0),
  (162, 'cuman', 'Cuman', NULL, 0),
  (163, 'cumbric', 'Cumbric', NULL, 0),
  (164, 'curonian', 'Curonian', NULL, 0),
  (165, 'cuyonon', 'Cuyonon', NULL, 0),
  (166, 'czech', 'Czech', NULL, 0),
  (167, 'dacian', 'Dacian', NULL, 0),
  (168, 'dagbani', 'Dagbani', NULL, 0),
  (169, 'dahlik', 'Dahlik', NULL, 0),
  (170, 'dalecarlian', 'Dalecarlian', NULL, 0),
  (171, 'dalmatian', 'Dalmatian', NULL, 0),
  (172, 'dameli', 'Dameli', NULL, 0),
  (173, 'danish', 'Danish', NULL, 0),
  (174, 'dargin', 'Dargin', NULL, 0),
  (175, 'dari', 'Dari', NULL, 0),
  (176, 'daripersian', 'Dari-Persian', NULL, 0),
  (177, 'darkhat', 'Darkhat', NULL, 0),
  (178, 'daur_or_dagur', 'Daur or Dagur', NULL, 0),
  (179, 'denaina_or_tanaina', 'Dena\'ina or Tanaina', NULL, 0),
  (180, 'dhatki', 'Dhatki', NULL, 0),
  (181, 'dhivehi_or_maldivian', 'Dhivehi or Maldivian', NULL, 0),
  (182, 'dida', 'Dida', NULL, 0),
  (183, 'dioula_or_jula', 'Dioula or Jula', NULL, 0),
  (184, 'dogri', 'Dogri', NULL, 0),
  (185, 'dogrib_or_tli_cho', 'Dogrib or Tli Cho', NULL, 0),
  (186, 'dolgan', 'Dolgan', NULL, 0),
  (187, 'domaaki_or_dumaki', 'Domaaki or Dumaki', NULL, 0),
  (188, 'dongxiang_or_santa', 'Dongxiang or Santa', NULL, 0),
  (189, 'duala', 'Duala', NULL, 0),
  (190, 'dungan', 'Dungan', NULL, 0),
  (191, 'dutch', 'Dutch', NULL, 0),
  (192, 'dzhidi_or_judeopersian', 'Dzhidi or Judeo-Persian', NULL, 0),
  (193, 'dzongkha', 'Dzongkha', NULL, 0),
  (194, 'eastern_yugur', 'Eastern Yugur', NULL, 0),
  (195, 'eblaite', 'Eblaite', NULL, 0),
  (196, 'edomite', 'Edomite', NULL, 0),
  (197, 'egyptian', 'Egyptian', NULL, 0),
  (198, 'egyptian_arabic', 'Egyptian Arabic', NULL, 0),
  (199, 'ekoti', 'Ekoti', NULL, 0),
  (200, 'elamite', 'Elamite', NULL, 0),
  (201, 'enets_or_yenisey_samoyed', 'Enets or Yenisey Samoyed', NULL, 0),
  (202, 'english', 'English', 1, 1),
  (203, 'erzya', 'Erzya', NULL, 0),
  (204, 'esperanto', 'Esperanto', NULL, 0),
  (205, 'estonian', 'Estonian', NULL, 0),
  (206, 'etruscan', 'Etruscan', NULL, 0),
  (207, 'even', 'Even', NULL, 0),
  (208, 'evenk_or_evenki', 'Evenk or Evenki', NULL, 0),
  (209, 'ewe', 'Ewe', NULL, 0),
  (210, 'eyak', 'Eyak', NULL, 0),
  (211, 'faeroese', 'Faeroese', NULL, 0),
  (212, 'fang', 'Fang', NULL, 0),
  (213, 'fijian', 'Fijian', NULL, 0),
  (214, 'filipino', 'Filipino', NULL, 0),
  (215, 'finnish', 'Finnish', NULL, 0),
  (216, 'finnish_sign_language', 'Finnish Sign Language', NULL, 0),
  (217, 'flemish_language', 'Flemish language', NULL, 0),
  (218, 'fon', 'Fon', NULL, 0),
  (219, 'francoprovencal_or_arpitan', 'Franco-Provençal or Arpitan', NULL, 0),
  (220, 'french', 'French', 2, 0),
  (221, 'french_sign_language', 'French Sign Language', NULL, 0),
  (222, 'frisian_north', 'Frisian, North', NULL, 0),
  (223, 'frisian_saterland', 'Frisian, Saterland', NULL, 0),
  (224, 'frisian_west', 'Frisian, West', NULL, 0),
  (225, 'friulian', 'Friulian', NULL, 0),
  (226, 'fula_or_fulfulde_or_fulani', 'Fula or Fulfulde or Fulani', NULL, 0),
  (227, 'fur', 'Fur', NULL, 0),
  (228, 'ga', 'Ga', NULL, 0),
  (229, 'gadaba', 'Gadaba', NULL, 0),
  (230, 'gafat', 'Gafat', NULL, 0),
  (231, 'gagauz', 'Gagauz', NULL, 0),
  (232, 'galician', 'Galician', NULL, 0),
  (233, 'gan', 'Gan', NULL, 0),
  (234, 'gangte', 'Gangte', NULL, 0),
  (235, 'garhwali', 'Garhwali', NULL, 0),
  (236, 'gaulish', 'Gaulish', NULL, 0),
  (237, 'gayo', 'Gayo', NULL, 0),
  (238, 'geez', 'Ge\'ez', NULL, 0),
  (239, 'gen_or_g_or_mina', 'Gen or Gẽ or Mina', NULL, 0),
  (240, 'georgian', 'Georgian', NULL, 0),
  (241, 'german', 'German', 5, 0),
  (242, 'german_sign_language', 'German Sign Language', NULL, 0),
  (243, 'ghomara', 'Ghomara', NULL, 0),
  (244, 'gikuyu_or_kikuyu', 'Gikuyu or Kikuyu', NULL, 0),
  (245, 'gilbertese_or_kiribati', 'Gilbertese or Kiribati', NULL, 0),
  (246, 'gileki', 'Gileki', NULL, 0),
  (247, 'goaria', 'Goaria', NULL, 0),
  (248, 'gondi', 'Gondi', NULL, 0),
  (249, 'gothic', 'Gothic', NULL, 0),
  (250, 'gawarbati_or_gowari_or_narsati', 'Gawar-Bati or Gowari or Narsati', NULL, 0),
  (251, 'greek', 'Greek', NULL, 0),
  (252, 'guanche', 'Guanche', NULL, 0),
  (253, 'guarani', 'Guaraní', NULL, 0),
  (254, 'guineabissau_creole', 'Guinea-Bissau Creole', NULL, 0),
  (255, 'gujarati', 'Gujarati', NULL, 0),
  (256, 'gula_iro_or_kulaal', 'Gula Iro or Kulaal', NULL, 0),
  (257, 'gullah_or_sea_island_creole_english', 'Gullah or Sea Island Creole English', NULL, 0),
  (258, 'gusii', 'Gusii', NULL, 0),
  (259, 'gwichin', 'Gwichʼin', NULL, 0),
  (260, 'hadramautic', 'Hadramautic', NULL, 0),
  (261, 'hadza_or_hatsa', 'Hadza or Hatsa', NULL, 0),
  (262, 'haida_or_masset', 'Haida or Masset', NULL, 0),
  (263, 'haitian_creole', 'Haitian Creole', NULL, 0),
  (264, 'hakka', 'Hakka', NULL, 0),
  (265, 'han', 'Hän', NULL, 0),
  (266, 'harari', 'Harari', NULL, 0),
  (267, 'harauti', 'Harauti', NULL, 0),
  (268, 'harsusi', 'Harsusi', NULL, 0),
  (269, 'haryanavi', 'Haryanavi', NULL, 0),
  (270, 'harzani', 'Harzani', NULL, 0),
  (271, 'hattic', 'Hattic', NULL, 0),
  (272, 'hausa', 'Hausa', NULL, 0),
  (273, 'havasupai_or_upland_yuman', 'Havasupai or Upland Yuman', NULL, 0),
  (274, 'hawaiian', 'Hawaiian', NULL, 0),
  (275, 'hawaii_pidgin_sign_language', 'Hawaii Pidgin Sign Language', NULL, 0),
  (276, 'hazaragi', 'Hazaragi', NULL, 0),
  (277, 'hebrew', 'Hebrew', NULL, 0),
  (278, 'herero', 'Herero', NULL, 0),
  (279, 'hertevin', 'Hértevin', NULL, 0),
  (280, 'hiligaynon', 'Hiligaynon', NULL, 0),
  (281, 'hindi', 'Hindi', NULL, 0),
  (282, 'hinukh', 'Hinukh', NULL, 0),
  (283, 'hiri_motu', 'Hiri Motu', NULL, 0),
  (284, 'hittite', 'Hittite', NULL, 0),
  (285, 'hixkaryana', 'Hixkaryana', NULL, 0),
  (286, 'hmong', 'Hmong', NULL, 0),
  (287, 'ho', 'Ho', NULL, 0),
  (288, 'hobyot', 'Hobyót', NULL, 0),
  (289, 'hopi', 'Hopi', NULL, 0),
  (290, 'hulaula', 'Hulaulá', NULL, 0),
  (291, 'hungarian', 'Hungarian', NULL, 0),
  (292, 'hurrian', 'Hurrian', NULL, 0),
  (293, 'hutterite_german', 'Hutterite German', NULL, 0),
  (294, 'ibibio', 'Ibibio', NULL, 0),
  (295, 'iban', 'Iban', NULL, 0),
  (296, 'ibanag', 'Ibanag', NULL, 0),
  (297, 'icelandic', 'Icelandic', NULL, 0),
  (298, 'ife', 'Ifè', NULL, 0),
  (299, 'igbo_or_ibo_or_biafra', 'Igbo or Ibo or Biafra', NULL, 0),
  (300, 'ikalanga_or_kalanga', 'Ikalanga or Kalanga', NULL, 0),
  (301, 'ili_turki', 'Ili Turki', NULL, 0),
  (302, 'illinois', 'Illinois', NULL, 0),
  (303, 'ilokano_or_ilocano', 'Ilokano or Ilocano', NULL, 0),
  (304, 'inari_sami', 'Inari Sami', NULL, 0),
  (305, 'indonesian', 'Indonesian', NULL, 0),
  (306, 'ingrian_or_izhorian', 'Ingrian or Izhorian', NULL, 0),
  (307, 'ingush', 'Ingush', NULL, 0),
  (308, 'inuktitut', 'Inuktitut', NULL, 0),
  (309, 'inupiaq', 'Inupiaq', NULL, 0),
  (310, 'inuvialuktun', 'Inuvialuktun', NULL, 0),
  (311, 'iraqw', 'Iraqw', NULL, 0),
  (312, 'irish_or_irish_gaelic', 'Irish or Irish Gaelic', NULL, 0),
  (313, 'irish_sign_language', 'Irish Sign Language', NULL, 0),
  (314, 'irula', 'Irula', NULL, 0),
  (315, 'isan_or_northeastern_thai', 'Isan or Northeastern Thai', NULL, 0),
  (316, 'istroromanian', 'Istro-Romanian', NULL, 0),
  (317, 'italian', 'Italian', NULL, 0),
  (318, 'itelmen_or_kamchadal', 'Itelmen or Kamchadal', NULL, 0),
  (319, 'jacaltec_or_jakalteko', 'Jacaltec or Jakalteko', NULL, 0),
  (320, 'jalaa', 'Jalaa', NULL, 0),
  (321, 'japanese', 'Japanese', 8, 0),
  (322, 'jaqaru', 'Jaqaru', NULL, 0),
  (323, 'jarai', 'Jarai', NULL, 0),
  (324, 'javanese', 'Javanese', NULL, 0),
  (325, 'jibbali_or_shehri', 'Jibbali or Shehri', NULL, 0),
  (326, 'jewish_babylonian_aramaic', 'Jewish Babylonian Aramaic', NULL, 0),
  (327, 'jicarilla_apache', 'Jicarilla Apache', NULL, 0),
  (328, 'juang', 'Juang', NULL, 0),
  (329, 'judeoaramaic', 'Judeo-Aramaic', NULL, 0),
  (330, 'jurchen', 'Jurchen', NULL, 0),
  (331, 'kabardian', 'Kabardian', NULL, 0),
  (332, 'kabyle', 'Kabyle', NULL, 0),
  (333, 'kachin_or_jingpo', 'Kachin or Jingpo', NULL, 0),
  (334, 'kalaallisut_or_greenlandic', 'Kalaallisut or Greenlandic', NULL, 0),
  (335, 'kalami_or_gawri_or_dirwali', 'Kalami or Gawri or Dirwali', NULL, 0),
  (336, 'kalasha', 'Kalasha', NULL, 0),
  (337, 'kalmyk_or_oirat', 'Kalmyk or Oirat', NULL, 0),
  (338, 'kalto_or_nahali', 'Kalto or Nahali', NULL, 0),
  (339, 'kamas', 'Kamas', NULL, 0),
  (340, 'kankanai_or_kankanaey', 'Kankanai or Kankanaey', NULL, 0),
  (341, 'kannada', 'Kannada', NULL, 0),
  (342, 'kaonde_or_chikaonde', 'Kaonde or Chikaonde', NULL, 0),
  (343, 'kapampangan', 'Kapampangan', NULL, 0),
  (344, 'karachaybalkar', 'Karachay-Balkar', NULL, 0),
  (345, 'karagas', 'Karagas', NULL, 0),
  (346, 'karaim', 'Karaim', NULL, 0),
  (347, 'karakalpak', 'Karakalpak', NULL, 0),
  (348, 'karelian', 'Karelian', NULL, 0),
  (349, 'kashmiri', 'Kashmiri', NULL, 0),
  (350, 'kashubian', 'Kashubian', NULL, 0),
  (351, 'kawi', 'Kawi', NULL, 0),
  (352, 'kazakh', 'Kazakh', NULL, 0),
  (353, 'kemi_sami', 'Kemi Sami', NULL, 0),
  (354, 'kerek', 'Kerek', NULL, 0),
  (355, 'ket', 'Ket', NULL, 0),
  (356, 'khakas', 'Khakas', NULL, 0),
  (357, 'khalaj', 'Khalaj', NULL, 0),
  (358, 'kham_or_sheshi', 'Kham or Sheshi', NULL, 0),
  (359, 'khandeshi', 'Khandeshi', NULL, 0),
  (360, 'khanty_or_ostyak', 'Khanty or Ostyak', NULL, 0),
  (361, 'khasi', 'Khasi', NULL, 0),
  (362, 'khazar', 'Khazar', NULL, 0),
  (363, 'khmer', 'Khmer', NULL, 0),
  (364, 'khmu', 'Khmu', NULL, 0),
  (365, 'khowar', 'Khowar', NULL, 0),
  (366, 'kildin_sami', 'Kildin Sami', NULL, 0),
  (367, 'kimatuumbi', 'Kimatuumbi', NULL, 0),
  (368, 'kinaraya_or_hiraya', 'Kinaray-a or Hiraya', NULL, 0),
  (369, 'kinyarwanda', 'Kinyarwanda', NULL, 0),
  (370, 'kirombo', 'Kirombo', NULL, 0),
  (371, 'kirundi', 'Kirundi', NULL, 0),
  (372, 'kivunjo', 'Kivunjo', NULL, 0),
  (373, 'klallam_or_clallam', 'Klallam or Clallam', NULL, 0),
  (374, 'kodava_takk_or_kodagu_or_coorgi', 'Kodava Takk or Kodagu or Coorgi', NULL, 0),
  (375, 'kohistani_or_khili', 'Kohistani or Khili', NULL, 0),
  (376, 'kolami', 'Kolami', NULL, 0),
  (377, 'komi_or_komizyrian', 'Komi or Komi-Zyrian', NULL, 0),
  (378, 'konkani', 'Konkani', NULL, 0),
  (379, 'kongo_or_kikongo', 'Kongo or Kikongo', NULL, 0),
  (380, 'koraga', 'Koraga', NULL, 0),
  (381, 'korandje', 'Korandje', NULL, 0),
  (382, 'korean', 'Korean', NULL, 0),
  (383, 'korku', 'Korku', NULL, 0),
  (384, 'korowai', 'Korowai', NULL, 0),
  (385, 'korwa', 'Korwa', NULL, 0),
  (386, 'koryak', 'Koryak', NULL, 0),
  (387, 'kosraean', 'Kosraean', NULL, 0),
  (388, 'kota', 'Kota', NULL, 0),
  (389, 'koyra_chiini_or_western_songhay', 'Koyra Chiini or Western Songhay', NULL, 0),
  (390, 'koy_sanjaq_surat', 'Koy Sanjaq Surat', NULL, 0),
  (391, 'koya', 'Koya', NULL, 0),
  (392, 'krymchak_or_judeocrimean_tatar', 'Krymchak or Judeo-Crimean Tatar', NULL, 0),
  (393, 'kujarge', 'Kujarge', NULL, 0),
  (394, 'kui', 'Kui', NULL, 0),
  (395, 'kumauni', 'Kumauni', NULL, 0),
  (396, 'kumyk', 'Kumyk', NULL, 0),
  (397, 'kumzari', 'Kumzari', NULL, 0),
  (398, 'kung', 'ǃKung', NULL, 0),
  (399, 'kurdish', 'Kurdish', NULL, 0),
  (400, 'kurukh_or_kurux', 'Kurukh or Kurux', NULL, 0),
  (401, 'kusunda', 'Kusunda', NULL, 0),
  (402, 'kutenai_or_kootenay_or_ktunaxa', 'Kutenai or Kootenay or Ktunaxa', NULL, 0),
  (403, 'kwanyama_or_ovambo', 'Kwanyama or Ovambo', NULL, 0),
  (404, 'kxoe', 'Kxoe', NULL, 0),
  (405, 'kyrgyz_or_kirghiz', 'Kyrgyz or Kirghiz', NULL, 0),
  (406, 'laal', 'Laal', NULL, 0),
  (407, 'ladakhi', 'Ladakhi', NULL, 0),
  (408, 'ladin', 'Ladin', NULL, 0),
  (409, 'ladino_or_judeospanish', 'Ladino or Judeo-Spanish', NULL, 0),
  (410, 'lakota_or_lakhota_or_teton', 'Lakota or Lakhota or Teton', NULL, 0),
  (411, 'lambadi_or_lamani_or_banjari', 'Lambadi or Lamani or Banjari', NULL, 0),
  (412, 'lao_or_laotian', 'Lao or Laotian', NULL, 0),
  (413, 'latin', 'Latin', NULL, 0),
  (414, 'latvian', 'Latvian', NULL, 0),
  (415, 'laz_or_lazuri', 'Laz or Lazuri', NULL, 0),
  (416, 'lenape_or_unami_or_delaware', 'Lenape or Unami or Delaware', NULL, 0),
  (417, 'leonese', 'Leonese', NULL, 0),
  (418, 'lepontic', 'Lepontic', NULL, 0),
  (419, 'lezgi_or_agul', 'Lezgi or Agul', NULL, 0),
  (420, 'ligbi_or_ligby', 'Ligbi or Ligby', NULL, 0),
  (421, 'limburgish', 'Limburgish', NULL, 0),
  (422, 'lingala', 'Lingala', NULL, 0),
  (423, 'lipan_apache', 'Lipan Apache', NULL, 0),
  (424, 'lisan_aldawat', 'Lisan al-Dawat', NULL, 0),
  (425, 'lishana_deni', 'Lishana Deni', NULL, 0),
  (426, 'lishanid_noshan_or_lishana_didan', 'Lishanid Noshan or Lishana Didan', NULL, 0),
  (427, 'lithuanian', 'Lithuanian', NULL, 0),
  (428, 'livonian_or_liv', 'Livonian or Liv', NULL, 0),
  (429, 'lombard', 'Lombard', NULL, 0),
  (430, 'lotha', 'Lotha', NULL, 0),
  (431, 'low_german_or_low_saxon_or_plattdeutsch', 'Low German or Low Saxon or Plattdeutsch', NULL, 0),
  (432, 'lower_sorbian', 'Lower Sorbian', NULL, 0),
  (433, 'lozi_or_silozi', 'Lozi or Silozi', NULL, 0),
  (434, 'ludic_or_ludian', 'Ludic or Ludian', NULL, 0),
  (435, 'luganda', 'Luganda', NULL, 0),
  (436, 'lunda_or_chilunda', 'Lunda or Chilunda', NULL, 0),
  (437, 'luri', 'Luri', NULL, 0),
  (438, 'lushootseed', 'Lushootseed', NULL, 0),
  (439, 'lusoga_or_soga', 'Lusoga or Soga', NULL, 0),
  (440, 'luvale', 'Luvale', NULL, 0),
  (441, 'luwati', 'Luwati', NULL, 0),
  (442, 'luwian_or_luvian', 'Luwian or Luvian', NULL, 0),
  (443, 'luxembourgish', 'Luxembourgish', NULL, 0),
  (444, 'lycian', 'Lycian', NULL, 0),
  (445, 'lydian', 'Lydian', NULL, 0),
  (446, 'macedonian', 'Macedonian', NULL, 0),
  (447, 'macedonian', 'Macedonian', NULL, 0),
  (448, 'magadhi', 'Magadhi', NULL, 0),
  (449, 'maguindanao', 'Maguindanao', NULL, 0),
  (450, 'mahican', 'Mahican', NULL, 0),
  (451, 'maithili', 'Maithili', NULL, 0),
  (452, 'makasar', 'Makasar', NULL, 0),
  (453, 'makhuwa_or_makua', 'Makhuwa or Makua', NULL, 0),
  (454, 'makhuwameetto', 'Makhuwa-Meetto', NULL, 0),
  (455, 'malagasy', 'Malagasy', NULL, 0),
  (456, 'malay', 'Malay', NULL, 0),
  (457, 'malayalam', 'Malayalam', NULL, 0),
  (458, 'malaysian_sign_language', 'Malaysian Sign Language', NULL, 0),
  (459, 'maltese', 'Maltese', NULL, 0),
  (460, 'malto_or_sauria_paharia', 'Malto or Sauria Paharia', NULL, 0),
  (461, 'malvi_or_malavi_or_ujjaini', 'Malvi or Malavi or Ujjaini', NULL, 0),
  (462, 'mam', 'Mam', NULL, 0),
  (463, 'manchurian', 'Manchurian', NULL, 0),
  (464, 'mandaic', 'Mandaic', NULL, 0),
  (465, 'mandarin', 'Mandarin', 7, 0),
  (466, 'mandinka', 'Mandinka', NULL, 0),
  (467, 'mansi_or_vogul', 'Mansi or Vogul', NULL, 0),
  (468, 'manx', 'Manx', NULL, 0),
  (469, 'manyika', 'Manyika', NULL, 0),
  (470, 'maori', 'Maori', NULL, 0),
  (471, 'mapudungun_or_mapuche', 'Mapudungun or Mapuche', NULL, 0),
  (472, 'maranao', 'Maranao', NULL, 0),
  (473, 'marathi', 'Marathi', NULL, 0),
  (474, 'mari_or_cheremis', 'Mari or Cheremis', NULL, 0),
  (475, 'maria', 'Maria', NULL, 0),
  (476, 'marquesan', 'Marquesan', NULL, 0),
  (477, 'marshallese_or_ebon', 'Marshallese or Ebon', NULL, 0),
  (478, 'marthas_vineyard_sign_language', 'Martha\'s Vineyard Sign Language', NULL, 0),
  (479, 'masaba', 'Masaba', NULL, 0),
  (480, 'masbatenyo_or_minasbate', 'Masbatenyo or Minasbate', NULL, 0),
  (481, 'meitei_or_manipuri_or_meithei', 'Meitei or Manipuri or Meithei', NULL, 0),
  (482, 'mator', 'Mator', NULL, 0),
  (483, 'mauritian_creole_or_morisyen', 'Mauritian Creole or Morisyen', NULL, 0),
  (484, 'maya', 'Maya', NULL, 0),
  (485, 'mazandarani_or_tabari', 'Mazandarani or Tabari', NULL, 0),
  (486, 'meankieli_or_tornedalen_finnish', 'Meänkieli or Tornedalen Finnish', NULL, 0),
  (487, 'meglenoromanian', 'Megleno-Romanian', NULL, 0),
  (488, 'megrelian_or_mingrelian', 'Megrelian or Mingrelian', NULL, 0),
  (489, 'mehri_or_mahri', 'Mehri or Mahri', NULL, 0),
  (490, 'menominee', 'Menominee', NULL, 0),
  (491, 'mentawai', 'Mentawai', NULL, 0),
  (492, 'meroitic', 'Meroitic', NULL, 0),
  (493, 'merya', 'Merya', NULL, 0),
  (494, 'mescalero_apache', 'Mescalero Apache', NULL, 0),
  (495, 'mesmes', 'Mesmes', NULL, 0),
  (496, 'messapian', 'Messapian', NULL, 0),
  (497, 'meru_or_kimeru', 'Meru or Kimeru', NULL, 0),
  (498, 'miami', 'Miami', NULL, 0),
  (499, 'michif', 'Michif', NULL, 0),
  (500, 'middle_dutch', 'Middle Dutch', NULL, 0),
  (501, 'middle_english', 'Middle English', NULL, 0),
  (502, 'middle_french', 'Middle French', NULL, 0),
  (503, 'middle_high_german', 'Middle High German', NULL, 0),
  (504, 'middle_persian_or_pahlavi', 'Middle Persian or Pahlavi', NULL, 0),
  (505, 'mikasuki_or_miccosukee', 'Mikasuki or Miccosukee', NULL, 0),
  (506, 'mikmaq_or_micmac', 'Mi\'kmaq or Micmac', NULL, 0),
  (507, 'minaean', 'Minaean', NULL, 0),
  (508, 'minangkabau', 'Minangkabau', NULL, 0),
  (509, 'mirandese', 'Mirandese', NULL, 0),
  (510, 'mlahso_or_suryoyo', 'Mlahsô or Suryoyo', NULL, 0),
  (511, 'moabite', 'Moabite', NULL, 0),
  (512, 'mobilian_jargon', 'Mobilian Jargon', NULL, 0),
  (513, 'moghol', 'Moghol', NULL, 0),
  (514, 'mohawk', 'Mohawk', NULL, 0),
  (515, 'mohegan', 'Mohegan', NULL, 0),
  (516, 'moksha', 'Moksha', NULL, 0),
  (517, 'molengue', 'Molengue', NULL, 0),
  (518, 'mon', 'Mon', NULL, 0),
  (519, 'mongolian', 'Mongolian', NULL, 0),
  (520, 'mono', 'Mono', NULL, 0),
  (521, 'mono', 'Mono', NULL, 0),
  (522, 'mono', 'Mono', NULL, 0),
  (523, 'montagnais', 'Montagnais', NULL, 0),
  (524, 'montenegrin', 'Montenegrin', NULL, 0),
  (525, 'motu', 'Motu', NULL, 0),
  (526, 'mpre', 'Mpre', NULL, 0),
  (527, 'muher', 'Muher', NULL, 0),
  (528, 'mundari', 'Mundari', NULL, 0),
  (529, 'munji', 'Munji', NULL, 0),
  (530, 'muria', 'Muria', NULL, 0),
  (531, 'muromian', 'Muromian', NULL, 0),
  (532, 'nafaanra', 'Nafaanra', NULL, 0),
  (533, 'nagarchal', 'Nagarchal', NULL, 0),
  (534, 'nahuatl', 'Nahuatl', NULL, 0),
  (535, 'nama', 'Nama', NULL, 0),
  (536, 'nanai', 'Nanai', NULL, 0),
  (537, 'nauruan', 'Nauruan', NULL, 0),
  (538, 'navajo_or_navaho', 'Navajo or Navaho', NULL, 0),
  (539, 'ndau_or_southeast_shona', 'Ndau or Southeast Shona', NULL, 0),
  (540, 'ndebele', 'Ndebele', NULL, 0),
  (541, 'ndonga', 'Ndonga', NULL, 0),
  (542, 'neapolitan', 'Neapolitan', NULL, 0),
  (543, 'negidal', 'Negidal', NULL, 0),
  (544, 'nenets_or_yurak', 'Nenets or Yurak', NULL, 0),
  (545, 'nepal_bhasa_or_newari', 'Nepal Bhasa or Newari', NULL, 0),
  (546, 'nepali', 'Nepali', NULL, 0),
  (547, 'new_zealand_sign_language', 'New Zealand Sign Language', NULL, 0),
  (548, 'nihali_or_nahali', 'Nihali or Nahali', NULL, 0),
  (549, 'nganasan_or_tavgi', 'Nganasan or Tavgi', NULL, 0),
  (550, 'ngumba', 'Ngumba', NULL, 0),
  (551, 'nheengatu_or_geral_or_modern_tupi', 'Nheengatu or Geral or Modern Tupí', NULL, 0),
  (552, 'nias', 'Nias', NULL, 0),
  (553, 'nicaraguan_sign_language', 'Nicaraguan Sign Language', NULL, 0),
  (554, 'nicola', 'Nicola', NULL, 0),
  (555, 'niellim', 'Niellim', NULL, 0),
  (556, 'nigerian_pidgin', 'Nigerian Pidgin', NULL, 0),
  (557, 'nisenan', 'Nisenan', NULL, 0),
  (558, 'niuean_or_niue', 'Niuean or Niue', NULL, 0),
  (559, 'nivkh_or_gilyak', 'Nivkh or Gilyak', NULL, 0),
  (560, 'nogai', 'Nogai', NULL, 0),
  (561, 'norfuk_or_norfolk_or_pitcairnnorfolk', 'Norfuk or Norfolk or Pitcairn-Norfolk', NULL, 0),
  (562, 'norman_or_normanfrench', 'Norman or Norman-French', NULL, 0),
  (563, 'norn', 'Norn', NULL, 0),
  (564, 'northern_sami', 'Northern Sami', NULL, 0),
  (565, 'northern_sotho_or_sepedi', 'Northern Sotho or Sepedi', NULL, 0),
  (566, 'northern_straits_salish', 'Northern Straits Salish)', NULL, 0),
  (567, 'northern_yukaghir', 'Northern Yukaghir', NULL, 0),
  (568, 'norwegian', 'Norwegian', NULL, 0),
  (569, 'nuer', 'Nuer', NULL, 0),
  (570, 'nuxalk_or_bella_coola', 'Nuxálk or Bella Coola', NULL, 0),
  (571, 'nyabwa', 'Nyabwa', NULL, 0),
  (572, 'nyah_kur', 'Nyah Kur', NULL, 0),
  (573, 'nyangumarta', 'Nyangumarta', NULL, 0),
  (574, 'nyoro', 'Nyoro', NULL, 0),
  (575, 'nu', 'Nǀu', NULL, 0),
  (576, 'occitan_or_provencal', 'Occitan or Provençal', NULL, 0),
  (577, 'ojibwe_or_ojibwa_or_chippewa', 'Ojibwe or Ojibwa or Chippewa', NULL, 0),
  (578, 'old_church_slavonic', 'Old Church Slavonic', NULL, 0),
  (579, 'old_english_or_anglosaxon', 'Old English or Anglo-Saxon', NULL, 0),
  (580, 'old_french', 'Old French', NULL, 0),
  (581, 'old_french_sign_language', 'Old French Sign Language', NULL, 0),
  (582, 'old_high_german', 'Old High German', NULL, 0),
  (583, 'old_norse', 'Old Norse', NULL, 0),
  (584, 'old_nubian_language', 'Old Nubian language', NULL, 0),
  (585, 'old_persian', 'Old Persian', NULL, 0),
  (586, 'old_prussian', 'Old Prussian', NULL, 0),
  (587, 'old_saxon', 'Old Saxon', NULL, 0),
  (588, 'old_south_arabic', 'Old South Arabic', NULL, 0),
  (589, 'old_tupi_or_tupinamba', 'Old Tupi or Tupinamba', NULL, 0),
  (590, 'olonets_karelian_or_liv_or_livvi', 'Olonets Karelian or Liv or Livvi', NULL, 0),
  (591, 'omagua', 'Omagua', NULL, 0),
  (592, 'ongota', 'Ongota', NULL, 0),
  (593, 'oriya', 'Oriya', NULL, 0),
  (594, 'ormuri', 'Ormuri', NULL, 0),
  (595, 'oroch', 'Oroch', NULL, 0),
  (596, 'orok', 'Orok', NULL, 0),
  (597, 'oromo_or_afaan_oromoo', 'Oromo or Afaan Oromoo', NULL, 0),
  (598, 'oropom', 'Oropom', NULL, 0),
  (599, 'ossetic_or_ossetian', 'Ossetic or Ossetian', NULL, 0),
  (600, 'ottoman_turkish', 'Ottoman Turkish', NULL, 0),
  (601, 'paez_or_nasa_yuwe', 'Páez or Nasa Yuwe', NULL, 0),
  (602, 'palaic', 'Palaic', NULL, 0),
  (603, 'palauan', 'Palauan', NULL, 0),
  (604, 'pali', 'Pali', NULL, 0),
  (605, 'pangasinan', 'Pangasinan', NULL, 0),
  (606, 'papiamento_or_papiamentu', 'Papiamento or Papiamentu', NULL, 0),
  (607, 'parachi', 'Parachi', NULL, 0),
  (608, 'parya', 'Parya', NULL, 0),
  (609, 'pashto_or_pushto_or_pashtu', 'Pashto or Pushto or Pashtu', NULL, 0),
  (610, 'pecheneg', 'Pecheneg', NULL, 0),
  (611, 'pennsylvania_dutch_or_pennsylvania_german', 'Pennsylvania Dutch or Pennsylvania German', NULL, 0),
  (612, 'pentlatch_or_puntlatch', 'Pentlatch or Puntlatch', NULL, 0),
  (613, 'persian_or_farsi_as_it_is_referred_to_in_the_pers', 'Persian or farsi, as it is referred to in the Pers', NULL, 0),
  (614, 'phalura', 'Phalura', NULL, 0),
  (615, 'phoenician', 'Phoenician', NULL, 0),
  (616, 'phrygian', 'Phrygian', NULL, 0),
  (617, 'phuthi', 'Phuthi', NULL, 0),
  (618, 'picard', 'Picard', NULL, 0),
  (619, 'pictish', 'Pictish', NULL, 0),
  (620, 'piraha', 'Pirahã', NULL, 0),
  (621, 'pisidian', 'Pisidian', NULL, 0),
  (622, 'plautdietsch_or_mennonite_low_german', 'Plautdietsch or Mennonite Low German', NULL, 0),
  (623, 'polabian', 'Polabian', NULL, 0),
  (624, 'polish', 'Polish', 4, 0),
  (625, 'portuguese', 'Portuguese', NULL, 0),
  (626, 'pothohari_or_paharipotwari', 'Pothohari or Pahari-Potwari', NULL, 0),
  (627, 'potiguara', 'Potiguara', NULL, 0),
  (628, 'pradhan_or_pardhan', 'Pradhan or Pardhan', NULL, 0),
  (629, 'prakrit', 'Prakrit', NULL, 0),
  (630, 'protoindoeuropean', 'Proto-Indo-European', NULL, 0),
  (631, 'puelche', 'Puelche', NULL, 0),
  (632, 'puma', 'Puma', NULL, 0),
  (633, 'punjabi_or_panjabi_or_gurmukhi', 'Punjabi or Panjabi or Gurmukhi', NULL, 0),
  (634, 'qashqai_or_ghashghai', 'Qashqai or Ghashghai', NULL, 0),
  (635, 'qatabanian', 'Qatabanian', NULL, 0),
  (636, 'quebec_sign_language', 'Quebec Sign Language', NULL, 0),
  (637, 'quechua', 'Quechua', NULL, 0),
  (638, 'rajasthani', 'Rajasthani', NULL, 0),
  (639, 'ratagnon_or_datagnon_or_latagnun', 'Ratagnon or Datagnon or Latagnun', NULL, 0),
  (640, 'reunion_creole_or_bourbonnais', 'Réunion Creole or Bourbonnais', NULL, 0),
  (641, 'romanian', 'Romanian', NULL, 0),
  (642, 'romansh_or_rhaetoromance', 'Romansh or Rhaeto-Romance', NULL, 0),
  (643, 'romany', 'Romany', NULL, 0),
  (644, 'romblomanon', 'Romblomanon', NULL, 0),
  (645, 'rotokas', 'Rotokas', NULL, 0),
  (646, 'runyankole_language_or_nyankore', 'Runyankole language or Nyankore', NULL, 0),
  (647, 'russenorsk', 'Russenorsk', NULL, 0),
  (648, 'russian', 'Russian', NULL, 0),
  (649, 'russian_sign_language', 'Russian Sign Language', NULL, 0),
  (650, 'ruthenian_or_rusyn_or_carpathian', 'Ruthenian or Rusyn or Carpathian', NULL, 0),
  (651, 'sabaean', 'Sabaean', NULL, 0),
  (652, 'salar', 'Salar', NULL, 0),
  (653, 'samaritan_hebrew', 'Samaritan Hebrew', NULL, 0),
  (654, 'samoan', 'Samoan', NULL, 0),
  (655, 'sandawe', 'Sandawe', NULL, 0),
  (656, 'sango', 'Sango', NULL, 0),
  (657, 'sanskrit', 'Sanskrit', NULL, 0),
  (658, 'santali', 'Santali', NULL, 0),
  (659, 'sara', 'Sara', NULL, 0),
  (660, 'saramaccan', 'Saramaccan', NULL, 0),
  (661, 'sardinian', 'Sardinian', NULL, 0),
  (662, 'sarikoli', 'Sarikoli', NULL, 0),
  (663, 'saurashtra_or_sourashtra', 'Saurashtra or Sourashtra', NULL, 0),
  (664, 'savara', 'Savara', NULL, 0),
  (665, 'savi', 'Savi', NULL, 0),
  (666, 'sawai', 'Sawai', NULL, 0),
  (667, 'scots_or_ulster_scots_or_hibernoscots_or_ullans', 'Scots or Ulster Scots or Hiberno-Scots or Ullans', NULL, 0),
  (668, 'scots_gaelic_or_scottish_gaelic_or_gaidhlig_or_gae', 'Scots Gaelic or Scottish Gaelic or Gaidhlig or Gae', NULL, 0),
  (669, 'selangor_sign_language', 'Selangor Sign Language', NULL, 0),
  (670, 'selkup_or_ostyak_samoyed', 'Selkup or Ostyak Samoyed', NULL, 0),
  (671, 'selonian', 'Selonian', NULL, 0),
  (672, 'semnani', 'Semnani', NULL, 0),
  (673, 'senaya', 'Senaya', NULL, 0),
  (674, 'sened', 'Sened', NULL, 0),
  (675, 'senhaja_de_srair', 'Senhaja de Srair', NULL, 0),
  (676, 'serbian', 'Serbian', NULL, 0),
  (677, 'serbocroatian', 'Serbo-Croatian', NULL, 0),
  (678, 'sesotho', 'Sesotho', NULL, 0),
  (679, 'seto_or_setu', 'Seto or Setu', NULL, 0),
  (680, 'seychellois_creole', 'Seychellois Creole', NULL, 0),
  (681, 'shimaore', 'Shimaore', NULL, 0),
  (682, 'shina', 'Shina', NULL, 0),
  (683, 'shona', 'Shona', NULL, 0),
  (684, 'shor', 'Shor', NULL, 0),
  (685, 'shoshoni', 'Shoshoni', NULL, 0),
  (686, 'shughni', 'Shughni', NULL, 0),
  (687, 'shumashti', 'Shumashti', NULL, 0),
  (688, 'shuswap', 'Shuswap', NULL, 0),
  (689, 'sicilian', 'Sicilian', NULL, 0),
  (690, 'sidamo', 'Sidamo', NULL, 0),
  (691, 'sidetic', 'Sidetic', NULL, 0),
  (692, 'sika', 'Sika', NULL, 0),
  (693, 'silesian', 'Silesian', NULL, 0),
  (694, 'silte_or_selti_or_east_gurage', 'Silt\'e or Selti or East Gurage', NULL, 0),
  (695, 'sindhi', 'Sindhi', NULL, 0),
  (696, 'sinhalese', 'Sinhalese', NULL, 0),
  (697, 'sioux', 'Sioux', NULL, 0),
  (698, 'siraiki_or_seraiki_or_southern_punjabi', 'Siraiki or Seraiki or Southern Punjabi', NULL, 0),
  (699, 'sivandi', 'Sivandi', NULL, 0),
  (700, 'skolt_sami', 'Skolt Sami', NULL, 0),
  (701, 'slavey', 'Slavey', NULL, 0),
  (702, 'slovak', 'Slovak', NULL, 0),
  (703, 'slovene_or_slovenian', 'Slovene or Slovenian', NULL, 0),
  (704, 'soddo_or_kistane', 'Soddo or Kistane', NULL, 0),
  (705, 'somali', 'Somali', NULL, 0),
  (706, 'sonjo_or_temi', 'Sonjo or Temi', NULL, 0),
  (707, 'sonsorolese_or_sonsorol', 'Sonsorolese or Sonsorol', NULL, 0),
  (708, 'soqotri', 'Soqotri', NULL, 0),
  (709, 'sora', 'Sora', NULL, 0),
  (710, 'sorbian_lower', 'Sorbian, Lower', NULL, 0),
  (711, 'sorbian_upper', 'Sorbian, Upper', NULL, 0),
  (712, 'sourashtra', 'Sourashtra', NULL, 0),
  (713, 'southern_sami', 'Southern Sami', NULL, 0),
  (714, 'south_estonian', 'South Estonian', NULL, 0),
  (715, 'southern_yukaghir_or_tundra_yukaghir', 'Southern Yukaghir or Tundra Yukaghir', NULL, 0),
  (716, 'spanish', 'Spanish', 3, 0),
  (717, 'sranan_tongo', 'Sranan Tongo', NULL, 0),
  (718, 'statimcets_or_lillooet', 'St\'at\'imcets or Lillooet', NULL, 0),
  (719, 'sucite_or_sicite_senoufo', 'Sucite or Sìcìté Sénoufo', NULL, 0),
  (720, 'suba', 'Suba', NULL, 0),
  (721, 'sudovian_or_yotvingian', 'Sudovian or Yotvingian', NULL, 0),
  (722, 'sumerian', 'Sumerian', NULL, 0),
  (723, 'sundanese', 'Sundanese', NULL, 0),
  (724, 'supyire_or_supyire_senoufo', 'Supyire or Supyire Senoufo', NULL, 0),
  (725, 'surigaonon', 'Surigaonon', NULL, 0),
  (726, 'susu', 'Susu', NULL, 0),
  (727, 'svan', 'Svan', NULL, 0),
  (728, 'swahili', 'Swahili', NULL, 0),
  (729, 'swati_or_swazi_or_siswati_or_seswati', 'Swati or Swazi or Siswati or Seswati', NULL, 0),
  (730, 'swedish', 'Swedish', NULL, 0),
  (731, 'syriac', 'Syriac', NULL, 0),
  (732, 'tabasaran_or_tabassaran', 'Tabasaran or Tabassaran', NULL, 0),
  (733, 'tachelhit', 'Tachelhit', NULL, 0),
  (734, 'tagalog', 'Tagalog', NULL, 0),
  (735, 'tahitian', 'Tahitian', NULL, 0),
  (736, 'taiwanese_sign_language', 'Taiwanese Sign Language', NULL, 0),
  (737, 'tajik', 'Tajik', NULL, 0),
  (738, 'takestani', 'Takestani', NULL, 0),
  (739, 'talysh', 'Talysh', NULL, 0),
  (740, 'tamil', 'Tamil', NULL, 0),
  (741, 'tanacross', 'Tanacross', NULL, 0),
  (742, 'tangut_or_xixia', 'Tangut or Xixia', NULL, 0),
  (743, 'tarifit_or_rifi_or_riff_berber', 'Tarifit or Rifi or Riff Berber', NULL, 0),
  (744, 'tat_or_tati', 'Tat or Tati', NULL, 0),
  (745, 'tatar', 'Tatar', NULL, 0),
  (746, 'tausug', 'Tausug', NULL, 0),
  (747, 'tehuelche', 'Tehuelche', NULL, 0),
  (748, 'telugu', 'Telugu', NULL, 0),
  (749, 'tetum', 'Tetum', NULL, 0),
  (750, 'tepehua_language', 'Tepehua language', NULL, 0),
  (751, 'tepehuan_language', 'Tepehuán language', NULL, 0),
  (752, 'thai', 'Thai', NULL, 0),
  (753, 'tharu', 'Tharu', NULL, 0),
  (754, 'thracian', 'Thracian', NULL, 0),
  (755, 'tibetan', 'Tibetan', NULL, 0),
  (756, 'tigre_or_xasa', 'Tigre or Xasa', NULL, 0),
  (757, 'tigrinya', 'Tigrinya', NULL, 0),
  (758, 'tillamook', 'Tillamook', NULL, 0),
  (759, 'timbisha_or_panamint', 'Timbisha or Panamint', NULL, 0),
  (760, 'tiv', 'Tiv', NULL, 0),
  (761, 'tlingit', 'Tlingit', NULL, 0),
  (762, 'tobian', 'Tobian', NULL, 0),
  (763, 'tocharian_a_and_b', 'Tocharian A and B', NULL, 0),
  (764, 'toda', 'Toda', NULL, 0),
  (765, 'tok_pisin', 'Tok Pisin', NULL, 0),
  (766, 'tokelauan', 'Tokelauan', NULL, 0),
  (767, 'tonga', 'Tonga', NULL, 0),
  (768, 'tongan', 'Tongan', NULL, 0),
  (769, 'tongva', 'Tongva', NULL, 0),
  (770, 'torwali_or_turvali', 'Torwali or Turvali', NULL, 0),
  (771, 'tregami', 'Tregami', NULL, 0),
  (772, 'tsat', 'Tsat', NULL, 0),
  (773, 'tsez_or_dido', 'Tsez or Dido', NULL, 0),
  (774, 'tshiluba_or_lubakasai_or_lubalulua', 'Tshiluba or Luba-Kasai or Luba-Lulua', NULL, 0),
  (775, 'tsimshian', 'Tsimshian', NULL, 0),
  (776, 'tsonga', 'Tsonga', NULL, 0),
  (777, 'tswana_or_setswana', 'Tswana or Setswana', NULL, 0),
  (778, 'tu_or_monguor', 'Tu or Monguor', NULL, 0),
  (779, 'tuareg_languages_or_tamasheq', 'Tuareg languages or Tamasheq', NULL, 0),
  (780, 'tulu', 'Tulu', NULL, 0),
  (781, 'tumbuka', 'Tumbuka', NULL, 0),
  (782, 'tupiniquim', 'Tupiniquim', NULL, 0),
  (783, 'turkish', 'Turkish', NULL, 0),
  (784, 'turkmen', 'Turkmen', NULL, 0),
  (785, 'turoyo', 'Turoyo', NULL, 0),
  (786, 'tuvaluan', 'Tuvaluan', NULL, 0),
  (787, 'tuvan_tuvin_or_tyvan', 'Tuvan Tuvin or Tyvan', NULL, 0),
  (788, 'ubykh', 'Ubykh', NULL, 0),
  (789, 'udihe_or_ude_or_udege', 'Udihe or Ude or Udege', NULL, 0),
  (790, 'udmurt_or_votyak', 'Udmurt or Votyak', NULL, 0),
  (791, 'ugaritic', 'Ugaritic', NULL, 0),
  (792, 'ukrainian', 'Ukrainian', NULL, 0),
  (793, 'ulch_or_olcha', 'Ulch or Olcha', NULL, 0),
  (794, 'unserdeutsch_or_rabaul_creole_german', 'Unserdeutsch or Rabaul Creole German', NULL, 0),
  (795, 'upper_sorbian', 'Upper Sorbian', NULL, 0),
  (796, 'urdu', 'Urdu', NULL, 0),
  (797, 'uripiv', 'Uripiv', NULL, 0),
  (798, 'urum', 'Urum', NULL, 0),
  (799, 'ute', 'Ute', NULL, 0),
  (800, 'uyghur_or_uigur', 'Uyghur or Uigur', NULL, 0),
  (801, 'uzbek', 'Uzbek', NULL, 0),
  (802, 'vafsi', 'Vafsi', NULL, 0),
  (803, 'valencian', 'Valencian', NULL, 0),
  (804, 'valencian_sign_language', 'Valencian Sign Language', NULL, 0),
  (805, 'vasivari_or_prasuni', 'Vasi-vari or Prasuni', NULL, 0),
  (806, 'venda_or_tshivenda', 'Venda or Tshivenda', NULL, 0),
  (807, 'venetian', 'Venetian', NULL, 0),
  (808, 'veps', 'Veps', NULL, 0),
  (809, 'vietnamese', 'Vietnamese', NULL, 0),
  (810, 'voro', 'Võro', NULL, 0),
  (811, 'votic_or_votian', 'Votic or Votian', NULL, 0),
  (812, 'waddar', 'Waddar', NULL, 0),
  (813, 'waigali_or_kalashaala', 'Waigali or Kalasha-Ala', NULL, 0),
  (814, 'waima_or_roro', 'Waima or Roro', NULL, 0),
  (815, 'wakhi', 'Wakhi', NULL, 0),
  (816, 'walloon', 'Walloon', NULL, 0),
  (817, 'waraywaray_or_binisaya', 'Waray-Waray or Binisaya', NULL, 0),
  (818, 'washo', 'Washo', NULL, 0),
  (819, 'welsh', 'Welsh', NULL, 0),
  (820, 'western_neoaramaic', 'Western Neo-Aramaic', NULL, 0),
  (821, 'weyto', 'Weyto', NULL, 0),
  (822, 'wolane', 'Wolane', NULL, 0),
  (823, 'wolof', 'Wolof', NULL, 0),
  (824, 'wu', 'Wu', NULL, 0),
  (825, 'xam', 'ǀXam', NULL, 0),
  (826, 'xhosa', 'Xhosa', NULL, 0),
  (827, 'xiang', 'Xiang', NULL, 0),
  (828, 'xibe_or_sibo', 'Xibe or Sibo', NULL, 0),
  (829, 'xipaya', 'Xipaya', NULL, 0),
  (830, 'xoo', 'ǃXóõ', NULL, 0),
  (831, 'yaaku_language', 'Yaaku language', NULL, 0),
  (832, 'yaeyama_language', 'Yaeyama language', NULL, 0),
  (833, 'yakut', 'Yakut', NULL, 0),
  (834, 'yankunytjatjara_language', 'Yankunytjatjara language', NULL, 0),
  (835, 'yanomami', 'Yanomami', NULL, 0),
  (836, 'yanyuwa', 'Yanyuwa', NULL, 0),
  (837, 'yapese', 'Yapese', NULL, 0),
  (838, 'yaqui', 'Yaqui', NULL, 0),
  (839, 'yauma', 'Yauma', NULL, 0),
  (840, 'yavapai', 'Yavapai', NULL, 0),
  (841, 'yazdi', 'Yazdi', NULL, 0),
  (842, 'yemenite_hebrew', 'Yemenite Hebrew', NULL, 0),
  (843, 'yeni_language', 'Yeni language', NULL, 0),
  (844, 'yevanic_language', 'Yevanic language', NULL, 0),
  (845, 'yi_language', 'Yi language', NULL, 0),
  (846, 'yiddish', 'Yiddish', NULL, 0),
  (847, 'yogur', 'Yogur', NULL, 0),
  (848, 'yokutsan_languages', 'Yokutsan languages', NULL, 0),
  (849, 'yonaguni_language', 'Yonaguni language', NULL, 0),
  (850, 'yoruba_language', 'Yorùbá language', NULL, 0),
  (851, 'yucatec_maya_language', 'Yucatec Maya language', NULL, 0),
  (852, 'yucatec_maya_sign_language', 'Yucatec Maya Sign Language', NULL, 0),
  (853, 'yuchi_language', 'Yuchi language', NULL, 0),
  (854, 'yugur', 'Yugur', NULL, 0),
  (855, 'yukaghir_languages', 'Yukaghir languages', NULL, 0),
  (856, 'yupik_language', 'Yupik language', NULL, 0),
  (857, 'yurats_language', 'Yurats language', NULL, 0),
  (858, 'yurok_language', 'Yurok language', NULL, 0),
  (859, 'zaparo', 'Záparo', NULL, 0),
  (860, 'zapotec', 'Zapotec', NULL, 0),
  (861, 'zazaki', 'Zazaki', NULL, 0),
  (862, 'zhuang', 'Zhuang', NULL, 0),
  (863, 'zoque', 'Zoque', NULL, 0),
  (864, 'zulu', 'Zulu', NULL, 0),
  (865, 'zuni_or_zuni', 'Zuñi or Zuni', NULL, 0),
  (866, 'zway_or_zay', 'Zway or Zay', NULL, 0),
  (867, 'yoruba', 'Yoruba', NULL, 0),
  (877, 'bengali_sylheti_dialect', 'Bengali (Sylheti Dialect)', NULL, 0),
  (879, 'frans', 'Frans', NULL, 0),
  (881, 'duits', 'Duits', NULL, 0),
  (883, 'engels', 'Engels', NULL, 0),
  (885, 'nederlands', 'Nederlands', NULL, 0);


/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table log_cron
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_cron`;

CREATE TABLE `log_cron` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task` varchar(150) NOT NULL DEFAULT '',
  `duration` double NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table profanity_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profanity_list`;

CREATE TABLE `profanity_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profanity_list` WRITE;
/*!40000 ALTER TABLE `profanity_list` DISABLE KEYS */;

INSERT INTO `profanity_list` (`id`, `word`)
VALUES
	(1,'anus '),
	(2,'ash0le '),
	(3,'ash0les '),
	(4,'asholes '),
	(5,'ass '),
	(6,'Ass Monkey '),
	(7,'Assface '),
	(8,'assh0le '),
	(9,'assh0lez '),
	(10,'asshole '),
	(11,'assholes '),
	(12,'assholz '),
	(13,'asswipe '),
	(14,'azzhole '),
	(15,'bassterds '),
	(16,'bastard '),
	(17,'bastards '),
	(18,'bastardz '),
	(19,'basterds '),
	(20,'basterdz '),
	(21,'Biatch '),
	(22,'bitch '),
	(23,'bitches '),
	(24,'Blow Job '),
	(25,'boffing '),
	(26,'butthole '),
	(27,'buttwipe '),
	(28,'c0ck '),
	(29,'c0cks '),
	(30,'c0k '),
	(31,'Carpet Muncher '),
	(32,'cawk '),
	(33,'cawks '),
	(34,'Clit '),
	(35,'cnts '),
	(36,'cntz '),
	(37,'cock '),
	(38,'cockhead '),
	(39,'cock-head '),
	(40,'cocks '),
	(41,'CockSucker '),
	(42,'cock-sucker '),
	(43,'crap '),
	(44,'cum '),
	(45,'cunt '),
	(46,'cunts '),
	(47,'cuntz '),
	(48,'dick '),
	(49,'dild0 '),
	(50,'dild0s '),
	(51,'dildo '),
	(52,'dildos '),
	(53,'dilld0 '),
	(54,'dilld0s '),
	(55,'dominatricks '),
	(56,'dominatrics '),
	(57,'dominatrix '),
	(58,'dyke '),
	(59,'enema '),
	(60,'f u c k '),
	(61,'f u c k e r '),
	(62,'fag '),
	(63,'fag1t '),
	(64,'faget '),
	(65,'fagg1t '),
	(66,'faggit '),
	(67,'faggot '),
	(68,'fagit '),
	(69,'fags '),
	(70,'fagz '),
	(71,'faig '),
	(72,'faigs '),
	(73,'fart '),
	(74,'flipping the bird '),
	(75,'fuck '),
	(76,'fucker '),
	(77,'fuckin '),
	(78,'fucking '),
	(79,'fucks '),
	(80,'Fudge Packer '),
	(81,'fuk '),
	(82,'Fukah '),
	(83,'Fuken '),
	(84,'fuker '),
	(85,'Fukin '),
	(86,'Fukk '),
	(87,'Fukkah '),
	(88,'Fukken '),
	(89,'Fukker '),
	(90,'Fukkin '),
	(91,'g00k '),
	(92,'gay '),
	(93,'gayboy '),
	(94,'gaygirl '),
	(95,'gays '),
	(96,'gayz '),
	(97,'God-damned '),
	(98,'h00r '),
	(99,'h0ar '),
	(100,'h0re '),
	(101,'hells '),
	(102,'hoar '),
	(103,'hoor '),
	(104,'hoore '),
	(105,'jackoff '),
	(106,'jap '),
	(107,'japs '),
	(108,'jerk-off '),
	(109,'jisim '),
	(110,'jiss '),
	(111,'jizm '),
	(112,'jizz '),
	(113,'knob '),
	(114,'knobs '),
	(115,'knobz '),
	(116,'kunt '),
	(117,'kunts '),
	(118,'kuntz '),
	(119,'Lesbian '),
	(120,'Lezzian '),
	(121,'Lipshits '),
	(122,'Lipshitz '),
	(123,'masochist '),
	(124,'masokist '),
	(125,'massterbait '),
	(126,'masstrbait '),
	(127,'masstrbate '),
	(128,'masterbaiter '),
	(129,'masterbate '),
	(130,'masterbates '),
	(131,'Motha Fucker '),
	(132,'Motha Fuker '),
	(133,'Motha Fukkah '),
	(134,'Motha Fukker '),
	(135,'Mother Fucker '),
	(136,'Mother Fukah '),
	(137,'Mother Fuker '),
	(138,'Mother Fukkah '),
	(139,'Mother Fukker '),
	(140,'mother-fucker '),
	(141,'Mutha Fucker '),
	(142,'Mutha Fukah '),
	(143,'Mutha Fuker '),
	(144,'Mutha Fukkah '),
	(145,'Mutha Fukker '),
	(146,'n1gr '),
	(147,'nastt '),
	(148,'nigger; '),
	(149,'nigur; '),
	(150,'niiger; '),
	(151,'niigr; '),
	(152,'orafis '),
	(153,'orgasim; '),
	(154,'orgasm '),
	(155,'orgasum '),
	(156,'oriface '),
	(157,'orifice '),
	(158,'orifiss '),
	(159,'packi '),
	(160,'packie '),
	(161,'packy '),
	(162,'paki '),
	(163,'pakie '),
	(164,'paky '),
	(165,'pecker '),
	(166,'peeenus '),
	(167,'peeenusss '),
	(168,'peenus '),
	(169,'peinus '),
	(170,'pen1s '),
	(171,'penas '),
	(172,'penis '),
	(173,'penis-breath '),
	(174,'penus '),
	(175,'penuus '),
	(176,'Phuc '),
	(177,'Phuck '),
	(178,'Phuk '),
	(179,'Phuker '),
	(180,'Phukker '),
	(181,'polac '),
	(182,'polack '),
	(183,'polak '),
	(184,'Poonani '),
	(185,'pr1c '),
	(186,'pr1ck '),
	(187,'pr1k '),
	(188,'pusse '),
	(189,'pussee '),
	(190,'pussy '),
	(191,'puuke '),
	(192,'puuker '),
	(193,'queer '),
	(194,'queers '),
	(195,'queerz '),
	(196,'qweers '),
	(197,'qweerz '),
	(198,'qweir '),
	(199,'recktum '),
	(200,'rectum '),
	(201,'retard '),
	(202,'sadist '),
	(203,'scank '),
	(204,'schlong '),
	(205,'screwing '),
	(206,'semen '),
	(207,'sex '),
	(208,'sexy '),
	(209,'Sh!t '),
	(210,'sh1t '),
	(211,'sh1ter '),
	(212,'sh1ts '),
	(213,'sh1tter '),
	(214,'sh1tz '),
	(215,'shit '),
	(216,'shits '),
	(217,'shitter '),
	(218,'Shitty '),
	(219,'Shity '),
	(220,'shitz '),
	(221,'Shyt '),
	(222,'Shyte '),
	(223,'Shytty '),
	(224,'Shyty '),
	(225,'skanck '),
	(226,'skank '),
	(227,'skankee '),
	(228,'skankey '),
	(229,'skanks '),
	(230,'Skanky '),
	(231,'slut '),
	(232,'sluts '),
	(233,'Slutty '),
	(234,'slutz '),
	(235,'son-of-a-bitch '),
	(236,'tit '),
	(237,'turd '),
	(238,'va1jina '),
	(239,'vag1na '),
	(240,'vagiina '),
	(241,'vagina '),
	(242,'vaj1na '),
	(243,'vajina '),
	(244,'vullva '),
	(245,'vulva '),
	(246,'w0p '),
	(247,'wh00r '),
	(248,'wh0re '),
	(249,'whore '),
	(250,'xrated '),
	(251,'xxx'),
	(252,'b!+ch'),
	(253,'bitch'),
	(254,'blowjob'),
	(255,'clit'),
	(256,'arschloch'),
	(257,'fuck'),
	(258,'shit'),
	(259,'ass'),
	(260,'asshole'),
	(261,'b!tch'),
	(262,'b17ch'),
	(263,'b1tch'),
	(264,'bastard'),
	(265,'bi+ch'),
	(266,'boiolas'),
	(267,'buceta'),
	(268,'c0ck'),
	(269,'cawk'),
	(270,'chink'),
	(271,'cipa'),
	(272,'clits'),
	(273,'cock'),
	(274,'cum'),
	(275,'cunt'),
	(276,'dildo'),
	(277,'dirsa'),
	(278,'ejakulate'),
	(279,'fatass'),
	(280,'fcuk'),
	(281,'fuk'),
	(282,'fux0r'),
	(283,'hoer'),
	(284,'hore'),
	(285,'jism'),
	(286,'kawk'),
	(287,'l3itch'),
	(288,'l3i+ch'),
	(289,'lesbian'),
	(290,'masturbate'),
	(291,'masterbat*'),
	(292,'masterbat3'),
	(293,'motherfucker'),
	(294,'s.o.b.'),
	(295,'mofo'),
	(296,'nazi'),
	(297,'nigga'),
	(298,'nigger'),
	(299,'nutsack'),
	(300,'phuck'),
	(301,'pimpis'),
	(302,'pusse'),
	(303,'pussy'),
	(304,'scrotum'),
	(305,'sh!t'),
	(306,'shemale'),
	(307,'shi+'),
	(308,'sh!+'),
	(309,'slut'),
	(310,'smut'),
	(311,'teets'),
	(312,'tits'),
	(313,'boobs'),
	(314,'b00bs'),
	(315,'teez'),
	(316,'testical'),
	(317,'testicle'),
	(318,'titt'),
	(319,'w00se'),
	(320,'jackoff'),
	(321,'wank'),
	(322,'whoar'),
	(323,'whore'),
	(324,'*damn'),
	(325,'*dyke'),
	(326,'*fuck*'),
	(327,'*shit*'),
	(328,'@$$'),
	(329,'amcik'),
	(330,'andskota'),
	(331,'arse*'),
	(332,'assrammer'),
	(333,'ayir'),
	(334,'bi7ch'),
	(335,'bitch*'),
	(336,'bollock*'),
	(337,'breasts'),
	(338,'butt-pirate'),
	(339,'cabron'),
	(340,'cazzo'),
	(341,'chraa'),
	(342,'chuj'),
	(343,'Cock*'),
	(344,'cunt*'),
	(345,'d4mn'),
	(346,'daygo'),
	(347,'dego'),
	(348,'dick*'),
	(349,'dike*'),
	(350,'dupa'),
	(351,'dziwka'),
	(352,'ejackulate'),
	(353,'Ekrem*'),
	(354,'Ekto'),
	(355,'enculer'),
	(356,'faen'),
	(357,'fag*'),
	(358,'fanculo'),
	(359,'fanny'),
	(360,'feces'),
	(361,'feg'),
	(362,'Felcher'),
	(363,'ficken'),
	(364,'fitt*'),
	(365,'Flikker'),
	(366,'foreskin'),
	(367,'Fotze'),
	(368,'Fu(*'),
	(369,'fuk*'),
	(370,'futkretzn'),
	(371,'gay'),
	(372,'gook'),
	(373,'guiena'),
	(374,'h0r'),
	(375,'h4x0r'),
	(376,'hell'),
	(377,'helvete'),
	(378,'hoer*'),
	(379,'honkey'),
	(380,'Huevon'),
	(381,'hui'),
	(382,'injun'),
	(383,'jizz'),
	(384,'kanker*'),
	(385,'kike'),
	(386,'klootzak'),
	(387,'kraut'),
	(388,'knulle'),
	(389,'kuk'),
	(390,'kuksuger'),
	(391,'Kurac'),
	(392,'kurwa'),
	(393,'kusi*'),
	(394,'kyrpa*'),
	(395,'lesbo'),
	(396,'mamhoon'),
	(397,'masturbat*'),
	(398,'merd*'),
	(399,'mibun'),
	(400,'monkleigh'),
	(401,'mouliewop'),
	(402,'muie'),
	(403,'mulkku'),
	(404,'muschi'),
	(405,'nazis'),
	(406,'nepesaurio'),
	(407,'nigger*'),
	(408,'orospu'),
	(409,'paska*'),
	(410,'perse'),
	(411,'picka'),
	(412,'pierdol*'),
	(413,'pillu*'),
	(414,'pimmel'),
	(415,'piss*'),
	(416,'pizda'),
	(417,'poontsee'),
	(418,'poop'),
	(419,'porn'),
	(420,'p0rn'),
	(421,'pr0n'),
	(422,'preteen'),
	(423,'pula'),
	(424,'pule'),
	(425,'puta'),
	(426,'puto'),
	(427,'qahbeh'),
	(428,'queef*'),
	(429,'rautenberg'),
	(430,'schaffer'),
	(431,'scheiss*'),
	(432,'schlampe'),
	(433,'schmuck'),
	(434,'screw'),
	(435,'sh!t*'),
	(436,'sharmuta'),
	(437,'sharmute'),
	(438,'shipal'),
	(439,'shiz'),
	(440,'skribz'),
	(441,'skurwysyn'),
	(442,'sphencter'),
	(443,'spic'),
	(444,'spierdalaj'),
	(445,'splooge'),
	(446,'suka'),
	(447,'b00b*'),
	(448,'testicle*'),
	(449,'titt*'),
	(450,'twat'),
	(451,'vittu'),
	(452,'wank*'),
	(453,'wetback*'),
	(454,'wichser'),
	(455,'wop*'),
	(456,'yed'),
	(457,'zabourah'),
	(458,'vag');

/*!40000 ALTER TABLE `profanity_list` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table shop_currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_currency`;

CREATE TABLE `shop_currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(3) NOT NULL DEFAULT '',
  `symbol` varchar(10) NOT NULL DEFAULT '',
  `label` varchar(50) NOT NULL DEFAULT '',
  `decimal_precision` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `base_exchange` float(10,6) NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `shop_currency_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shop_currency_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shop_currency` WRITE;
/*!40000 ALTER TABLE `shop_currency` DISABLE KEYS */;

INSERT INTO `shop_currency` (`id`, `code`, `symbol`, `label`, `decimal_precision`, `base_exchange`, `is_active`, `created`, `created_by`, `modified`, `modified_by`)
VALUES
  (1,'ADP','','Andorran Peseta',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (2,'AED','','United Arab Emirates Dirham',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (3,'AFA','','Afghanistan Afghani',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (4,'ALL','','Albanian Lek',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (5,'ANG','','Netherlands Antillian Guilder',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (6,'AOK','','Angolan Kwanza',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (7,'ARS','','Argentine Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (9,'AUD','','Australian Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (10,'AWG','','Aruban Florin',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (11,'BBD','','Barbados Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (12,'BDT','','Bangladeshi Taka',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (14,'BGN','','Bulgarian Lev',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (15,'BHD','','Bahraini Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (16,'BIF','','Burundi Franc',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (17,'BMD','','Bermudian Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (18,'BND','','Brunei Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (19,'BOB','','Bolivian Boliviano',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (20,'BRL','','Brazilian Real',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (21,'BSD','','Bahamian Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (22,'BTN','','Bhutan Ngultrum',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (23,'BUK','','Burma Kyat',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (24,'BWP','','Botswanian Pula',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (25,'BZD','','Belize Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (26,'CAD','','Canadian Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (27,'CHF','','Swiss Franc',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (28,'CLF','','Chilean Unidades de Fomento',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (29,'CLP','','Chilean Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (30,'CNY','','Yuan (Chinese) Renminbi',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (31,'COP','','Colombian Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (32,'CRC','','Costa Rican Colon',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (33,'CZK','','Czech Republic Koruna',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (34,'CUP','','Cuban Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (35,'CVE','','Cape Verde Escudo',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (36,'CYP','','Cyprus Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (40,'DKK','','Danish Krone',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (41,'DOP','','Dominican Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (42,'DZD','','Algerian Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (43,'ECS','','Ecuador Sucre',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (44,'EGP','','Egyptian Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (45,'EEK','','Estonian Kroon (EEK)',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (46,'ETB','','Ethiopian Birr',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (47,'EUR',' &euro;','Euro',2,0.000000,1,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (49,'FJD','','Fiji Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (50,'FKP','','Falkland Islands Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (52,'GBP','&pound;','British Pound',2,0.000000,1,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (53,'GHC','','Ghanaian Cedi',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (54,'GIP','','Gibraltar Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (55,'GMD','','Gambian Dalasi',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (56,'GNF','','Guinea Franc',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (58,'GTQ','','Guatemalan Quetzal',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (59,'GWP','','Guinea-Bissau Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (60,'GYD','','Guyanan Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (61,'HKD','','Hong Kong Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (62,'HNL','','Honduran Lempira',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (63,'HTG','','Haitian Gourde',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (64,'HUF','','Hungarian Forint',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (65,'IDR','','Indonesian Rupiah',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (66,'IEP','','Irish Punt',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (67,'ILS','','Israeli Shekel',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (68,'INR','','Indian Rupee',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (69,'IQD','','Iraqi Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (70,'IRR','','Iranian Rial',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (73,'JMD','','Jamaican Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (74,'JOD','','Jordanian Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (75,'JPY','','Japanese Yen',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (76,'KES','','Kenyan Schilling',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (77,'KHR','','Kampuchean (Cambodian) Riel',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (78,'KMF','','Comoros Franc',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (79,'KPW','','North Korean Won',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (80,'KRW','','(South) Korean Won',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (81,'KWD','','Kuwaiti Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (82,'KYD','','Cayman Islands Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (83,'LAK','','Lao Kip',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (84,'LBP','','Lebanese Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (85,'LKR','','Sri Lanka Rupee',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (86,'LRD','','Liberian Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (87,'LSL','','Lesotho Loti',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (89,'LYD','','Libyan Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (90,'MAD','','Moroccan Dirham',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (91,'MGF','','Malagasy Franc',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (92,'MNT','','Mongolian Tugrik',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (93,'MOP','','Macau Pataca',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (94,'MRO','','Mauritanian Ouguiya',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (95,'MTL','','Maltese Lira',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (96,'MUR','','Mauritius Rupee',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (97,'MVR','','Maldive Rufiyaa',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (98,'MWK','','Malawi Kwacha',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (99,'MXP','','Mexican Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (100,'MYR','','Malaysian Ringgit',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (101,'MZM','','Mozambique Metical',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (102,'NAD','','Namibian Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (103,'NGN','','Nigerian Naira',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (104,'NIO','','Nicaraguan Cordoba',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (105,'NOK','','Norwegian Kroner',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (106,'NPR','','Nepalese Rupee',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (107,'NZD','','New Zealand Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (108,'OMR','','Omani Rial',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (109,'PAB','','Panamanian Balboa',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (110,'PEN','','Peruvian Nuevo Sol',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (111,'PGK','','Papua New Guinea Kina',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (112,'PHP','','Philippine Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (113,'PKR','','Pakistan Rupee',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (114,'PLN','','Polish Zloty',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (116,'PYG','','Paraguay Guarani',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (117,'QAR','','Qatari Rial',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (118,'RON','','Romanian Leu',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (119,'RWF','','Rwanda Franc',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (120,'SAR','','Saudi Arabian Riyal',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (121,'SBD','','Solomon Islands Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (122,'SCR','','Seychelles Rupee',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (123,'SDP','','Sudanese Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (124,'SEK','','Swedish Krona',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (125,'SGD','','Singapore Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (126,'SHP','','St. Helena Pound',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (127,'SLL','','Sierra Leone Leone',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (128,'SOS','','Somali Schilling',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (129,'SRG','','Suriname Guilder',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (130,'STD','','Sao Tome and Principe Dobra',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (131,'RUB','','Russian Ruble',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (132,'SVC','','El Salvador Colon',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (133,'SYP','','Syrian Potmd',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (134,'SZL','','Swaziland Lilangeni',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (135,'THB','','Thai Baht',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (136,'TND','','Tunisian Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (137,'TOP','','Tongan Paanga',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (138,'TPE','','East Timor Escudo',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (139,'TRY','','Turkish Lira',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (140,'TTD','','Trinidad and Tobago Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (141,'TWD','','Taiwan Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (142,'TZS','','Tanzanian Schilling',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (143,'UGX','','Uganda Shilling',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (144,'USD','&dollar;','US Dollar',2,0.000000,1,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (145,'UYU','','Uruguayan Peso',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (146,'VEF','','Venezualan Bolivar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (147,'VND','','Vietnamese Dong',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (148,'VUV','','Vanuatu Vatu',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (149,'WST','','Samoan Tala',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (150,'XAF','','CommunautÃ© FinanciÃ¨re Africaine BEAC, Francs',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (151,'XAG','','Silver, Ounces',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (152,'XAU','','Gold, Ounces',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (153,'XCD','','East Caribbean Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (154,'XDR','','International Monetary Fund (IMF) Special Drawing ',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (155,'XOF','','CommunautÃ© FinanciÃ¨re Africaine BCEAO - Francs',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (156,'XPD','','Palladium Ounces',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (157,'XPF','','Comptoirs FranÃ§ais du Pacifique Francs',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (158,'XPT','','Platinum, Ounces',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (159,'YDD','','Democratic Yemeni Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (160,'YER','','Yemeni Rial',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (161,'YUD','','New Yugoslavia Dinar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (162,'ZAR','','South African Rand',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (163,'ZMK','','Zambian Kwacha',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (164,'ZRZ','','Zaire Zaire',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (165,'ZWD','','Zimbabwe Dollar',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (166,'SKK','','Slovak Koruna',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL),
  (167,'AMD','','Armenian Dram',2,0.000000,0,'0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL);

/*!40000 ALTER TABLE `shop_currency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_order`;

CREATE TABLE `shop_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ref` char(13) NOT NULL DEFAULT '',
  `code` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) unsigned DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_first_name` varchar(150) DEFAULT NULL,
  `user_last_name` varchar(150) DEFAULT NULL,
  `ip_address` varchar(25) DEFAULT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  `base_currency_id` int(11) unsigned NOT NULL,
  `payment_gateway_id` int(11) unsigned DEFAULT NULL,
  `shipping_method_id` int(11) unsigned DEFAULT NULL,
  `voucher_id` int(11) unsigned DEFAULT NULL,
  `status` enum('UNPAID','PAID','ABANDONED','CANCELLED','FAILED') NOT NULL DEFAULT 'UNPAID',
  `requires_shipping` tinyint(1) unsigned NOT NULL,
  `fulfilment_status` enum('UNFULFILLED','FULFILLED') NOT NULL DEFAULT 'UNFULFILLED',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fulfilled` datetime DEFAULT NULL,
  `exchange_rate` float(10,6) unsigned NOT NULL DEFAULT '1.000000',
  `shipping_total` float(10,2) unsigned NOT NULL,
  `sub_total` float(10,2) unsigned NOT NULL,
  `tax_shipping` float(10,2) unsigned NOT NULL,
  `tax_items` float(10,2) unsigned NOT NULL,
  `discount_shipping` float(10,2) unsigned NOT NULL,
  `discount_items` float(10,2) unsigned NOT NULL,
  `grand_total` float(10,2) unsigned NOT NULL,
  `fees_deducted` float(10,2) unsigned NOT NULL,
  `shipping_addressee` varchar(150) DEFAULT NULL,
  `shipping_line_1` varchar(150) DEFAULT NULL,
  `shipping_line_2` varchar(150) DEFAULT NULL,
  `shipping_town` varchar(150) DEFAULT NULL,
  `shipping_postcode` varchar(150) DEFAULT NULL,
  `shipping_country` varchar(150) DEFAULT NULL,
  `shipping_state` varchar(150) DEFAULT NULL,
  `pp_txn_id` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `currency_id` (`currency_id`),
  KEY `payment_gateway_id` (`payment_gateway_id`),
  KEY `base_currency_id` (`base_currency_id`),
  KEY `ref` (`ref`),
  KEY `user_id_2` (`user_id`,`status`),
  KEY `voucher_id` (`voucher_id`),
  KEY `user_email` (`user_email`),
  KEY `shipping_method_id` (`shipping_method_id`),
  CONSTRAINT `shop_order_ibfk_7` FOREIGN KEY (`shipping_method_id`) REFERENCES `shop_shipping_method` (`id`),
  CONSTRAINT `shop_order_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `shop_currency` (`id`),
  CONSTRAINT `shop_order_ibfk_3` FOREIGN KEY (`payment_gateway_id`) REFERENCES `shop_payment_gateway` (`id`),
  CONSTRAINT `shop_order_ibfk_4` FOREIGN KEY (`base_currency_id`) REFERENCES `shop_currency` (`id`),
  CONSTRAINT `shop_order_ibfk_5` FOREIGN KEY (`voucher_id`) REFERENCES `shop_voucher` (`id`),
  CONSTRAINT `shop_order_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_order_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_order_product`;

CREATE TABLE `shop_order_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `quantity` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(150) DEFAULT '',
  `price` float(10,2) unsigned NOT NULL,
  `sale_price` float(10,2) unsigned NOT NULL,
  `tax` float(10,2) unsigned NOT NULL,
  `shipping` float(10,2) unsigned NOT NULL,
  `shipping_tax` float(10,2) unsigned DEFAULT NULL,
  `total` float(10,2) unsigned NOT NULL,
  `tax_rate_id` int(11) unsigned DEFAULT NULL,
  `was_on_sale` tinyint(1) unsigned NOT NULL,
  `processed` tinyint(1) unsigned NOT NULL,
  `refunded` tinyint(1) unsigned NOT NULL,
  `refunded_date` datetime DEFAULT NULL,
  `extra_data` text,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shop_order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `shop_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shop_order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_payment_gateway
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_payment_gateway`;

CREATE TABLE `shop_payment_gateway` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `label` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `account_id` varchar(100) DEFAULT NULL,
  `api_key` varchar(100) DEFAULT NULL,
  `api_secret` varchar(100) DEFAULT NULL,
  `sandbox_account_id` varchar(100) DEFAULT NULL,
  `sandbox_api_key` varchar(100) DEFAULT NULL,
  `sandbox_api_secret` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shop_payment_gateway` WRITE;
/*!40000 ALTER TABLE `shop_payment_gateway` DISABLE KEYS */;

INSERT INTO `shop_payment_gateway` (`id`, `slug`, `label`, `logo`, `website`, `enabled`, `account_id`, `api_key`, `api_secret`, `sandbox_account_id`, `sandbox_api_key`, `sandbox_api_secret`)
VALUES
  (1,'paypal','PayPal','paypal.gif','http://paypal.co.uk',1,'CGX9PJMBM48M6',NULL,NULL,'intern_1349085737_biz@shedcollective.org',NULL,NULL),
  (2,'shedpay','ShedPay','shedpay.png','http://shedpay.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
  (3,'cardsave','CardSave','cardsave.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
  (4,'sagepay','SagePay','sagepay.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
  (5,'worldpay','WorldPay','worldpay.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
  (6,'eway','eWay','eway.png',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `shop_payment_gateway` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product`;

CREATE TABLE `shop_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) unsigned NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `price` float(10,2) NOT NULL,
  `sale_price` float(10,2) NOT NULL,
  `tax_rate_id` int(11) unsigned DEFAULT NULL,
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sale_start` datetime DEFAULT NULL,
  `sale_end` datetime DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL,
  `is_deleted` tinyint(1) unsigned NOT NULL,
  `quantity_available` int(11) unsigned DEFAULT NULL,
  `quantity_sold` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `created_by` (`created_by`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `shop_product_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `shop_product_type` (`id`),
  CONSTRAINT `shop_product_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shop_product_ibfk_3` FOREIGN KEY (`tax_rate_id`) REFERENCES `shop_product_tax_rate` (`id`),
  CONSTRAINT `shop_product_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_product_gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_gallery`;

CREATE TABLE `shop_product_gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `media_type` enum('IMAGE','YOUTUBE','VIMEO') NOT NULL DEFAULT 'IMAGE',
  `title` varchar(150) NOT NULL DEFAULT '',
  `order` tinyint(1) unsigned NOT NULL,
  `image_filename` varchar(50) DEFAULT '',
  `youtube_id` varchar(50) DEFAULT NULL,
  `vimeo_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shop_product_gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_product_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_meta`;

CREATE TABLE `shop_product_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `download_bucket` varchar(50) DEFAULT NULL,
  `download_filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shop_product_meta_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_product_shipping_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_shipping_method`;

CREATE TABLE `shop_product_shipping_method` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `shipping_method_id` int(11) unsigned NOT NULL,
  `price` float(10,2) unsigned NOT NULL,
  `price_additional` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `shipping_method_id` (`shipping_method_id`),
  CONSTRAINT `shop_product_shipping_method_ibfk_2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shop_shipping_method` (`id`),
  CONSTRAINT `shop_product_shipping_method_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `shop_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_product_tax_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_tax_rate`;

CREATE TABLE `shop_product_tax_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(150) NOT NULL DEFAULT '',
  `rate` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shop_product_tax_rate` WRITE;
/*!40000 ALTER TABLE `shop_product_tax_rate` DISABLE KEYS */;

INSERT INTO `shop_product_tax_rate` (`id`, `label`, `rate`)
VALUES
  (1,'UK VAT',0.20);

/*!40000 ALTER TABLE `shop_product_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_product_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_type`;

CREATE TABLE `shop_product_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL DEFAULT '',
  `label` varchar(150) NOT NULL DEFAULT '',
  `requires_shipping` tinyint(1) unsigned NOT NULL,
  `ipn_method` varchar(50) DEFAULT NULL,
  `max_per_order` tinyint(1) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shop_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_settings`;

CREATE TABLE `shop_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shop_settings` WRITE;
/*!40000 ALTER TABLE `shop_settings` DISABLE KEYS */;

INSERT INTO `shop_settings` (`id`, `key`, `value`)
VALUES
  (1,'base_currency','i:52;'),
  (2,'notify_order','s:17:\"thomas@askivy.net\";'),
  (3,'shop_url','s:5:\"shop/\";'),
  (4,'free_shipping_threshold','d:0;'),
  (5,'invoice_company','s:0:\"\";'),
  (6,'invoice_company_no','s:0:\"\";'),
  (7,'invoice_address','s:0:\"\";'),
  (8,'invoice_vat_no','s:0:\"\";');

/*!40000 ALTER TABLE `shop_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_shipping_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_shipping_method`;

CREATE TABLE `shop_shipping_method` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `courier` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `notes` text,
  `default_price` float(10,2) unsigned NOT NULL,
  `default_price_additional` float(10,2) unsigned NOT NULL,
  `tax_rate_id` int(11) unsigned DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL,
  `is_deleted` tinyint(1) unsigned NOT NULL,
  `is_default` tinyint(1) unsigned NOT NULL,
  `order` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  CONSTRAINT `shop_shipping_method_ibfk_1` FOREIGN KEY (`tax_rate_id`) REFERENCES `shop_tax_rate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shop_shipping_method` WRITE;
/*!40000 ALTER TABLE `shop_shipping_method` DISABLE KEYS */;

INSERT INTO `shop_shipping_method` (`id`, `courier`, `method`, `notes`, `default_price`, `default_price_additional`, `tax_rate_id`, `is_active`, `is_deleted`, `is_default`, `order`)
VALUES
  (1,'Royal Mail','1st Class',NULL,2.50,1.00,NULL,1,0,0,0),
  (2,'Royal Mail','2nd Class',NULL,1.50,0.75,NULL,1,0,1,1),
  (3,'Royal Mail','Recorded',NULL,3.20,2.00,NULL,1,0,0,2),
  (4,'Royal Mail','Next Day','Orders placed before 1pm will be processed same day and delivered the next working day. Orders placed after 1pm will be processed the following day.',5.00,5.00,NULL,1,0,0,3),
  (5,'UPS','Next Day','For next day delivery orders must be placed before noon.',6.00,6.00,1,1,0,0,0);

/*!40000 ALTER TABLE `shop_shipping_method` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_tax_rate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_tax_rate`;

CREATE TABLE `shop_tax_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(150) NOT NULL DEFAULT '',
  `rate` float(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `shop_tax_rate` WRITE;
/*!40000 ALTER TABLE `shop_tax_rate` DISABLE KEYS */;

INSERT INTO `shop_tax_rate` (`id`, `label`, `rate`)
VALUES
  (1,'UK VAT',0.20);

/*!40000 ALTER TABLE `shop_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_voucher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_voucher`;

CREATE TABLE `shop_voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(25) NOT NULL,
  `type` enum('NORMAL','LIMITED_USE','GIFT_CARD') NOT NULL DEFAULT 'NORMAL',
  `discount_type` enum('PERCENTAGE','AMOUNT') NOT NULL DEFAULT 'PERCENTAGE',
  `discount_value` float(10,6) unsigned NOT NULL,
  `discount_application` enum('PRODUCTS','PRODUCT_TYPES','SHIPPING','ALL') NOT NULL DEFAULT 'PRODUCTS',
  `label` varchar(150) NOT NULL DEFAULT '',
  `valid_from` datetime NOT NULL,
  `valid_to` datetime DEFAULT NULL,
  `use_count` tinyint(1) unsigned NOT NULL,
  `limited_use_limit` int(11) unsigned NOT NULL,
  `gift_card_balance` float(10,6) unsigned NOT NULL,
  `product_type_id` int(11) unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `last_used` datetime DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL,
  `is_deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `code_2` (`code`,`is_deleted`),
  KEY `code_3` (`code`,`is_active`,`is_deleted`),
  KEY `product_type_id` (`product_type_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `shop_voucher_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shop_voucher_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `shop_product_type` (`id`),
  CONSTRAINT `shop_voucher_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table timezone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timezone`;

CREATE TABLE `timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gmt_offset` tinyint(11) NOT NULL,
  `label` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;

INSERT INTO `timezone` (`id`, `gmt_offset`, `label`)
VALUES
	(1,-11,'International Date Line West'),
	(2,-11,'Midway Island'),
	(3,-10,'Hawaii'),
	(4,-9,'Alaska'),
	(5,-8,'Pacific Time (US &amp; Canada)'),
	(6,-8,'Tijuana'),
	(7,-7,'Arizona'),
	(8,-7,'Chihuahua'),
	(9,-7,'Mazatlan'),
	(10,-7,'Mountain Time (US &amp; Canada)'),
	(11,-6,'Central America'),
	(12,-6,'Central Time (US &amp; Canada)'),
	(13,-6,'Guadalajara'),
	(14,-6,'Mexico City'),
	(15,-6,'Monterrey'),
	(16,-6,'Saskatchewan'),
	(17,-5,'Bogota'),
	(18,-5,'Eastern Time (US &amp; Canada)'),
	(19,-5,'Indiana (East)'),
	(20,-5,'Lima'),
	(21,-5,'Quito'),
	(22,-4,'Caracas'),
	(23,-4,'Atlantic Time (Canada)'),
	(24,-4,'Georgetown'),
	(25,-4,'La Paz'),
	(26,-4,'Santiago'),
	(27,-3,'Newfoundland'),
	(28,-3,'Brasilia'),
	(29,-3,'Buenos Aires'),
	(30,-3,'Greenland'),
	(31,-2,'Mid-Atlantic'),
	(32,-1,'Azores'),
	(33,-1,'Cape Verde Is.'),
	(34,0,'Casablanca'),
	(35,0,'Dublin'),
	(36,0,'Edinburgh'),
	(37,0,'Lisbon'),
	(38,0,'London'),
	(39,0,'Monrovia'),
	(40,0,'UTC'),
	(41,1,'Amsterdam'),
	(42,1,'Belgrade'),
	(43,1,'Berlin'),
	(44,1,'Bern'),
	(45,1,'Bratislava'),
	(46,1,'Brussels'),
	(47,1,'Budapest'),
	(48,1,'Copenhagen'),
	(49,1,'Ljubljana'),
	(50,1,'Madrid'),
	(51,1,'Paris'),
	(52,1,'Prague'),
	(53,1,'Rome'),
	(54,1,'Sarajevo'),
	(55,1,'Skopje'),
	(56,1,'Stockholm'),
	(57,1,'Vienna'),
	(58,1,'Warsaw'),
	(59,1,'West Central Africa'),
	(60,1,'Zagreb'),
	(61,2,'Athens'),
	(62,2,'Bucharest'),
	(63,2,'Cairo'),
	(64,2,'Harare'),
	(65,2,'Helsinki'),
	(66,2,'Istanbul'),
	(67,2,'Jerusalem'),
	(68,2,'Kyiv'),
	(69,2,'Pretoria'),
	(70,2,'Riga'),
	(71,2,'Sofia'),
	(72,2,'Tallinn'),
	(73,2,'Vilnius'),
	(74,3,'Baghdad'),
	(75,3,'Kuwait'),
	(76,3,'Minsk'),
	(77,3,'Nairobi'),
	(78,3,'Riyadh'),
	(79,3,'Tehran'),
	(80,4,'Abu Dhabi'),
	(81,4,'Baku'),
	(82,4,'Moscow'),
	(83,4,'Muscat'),
	(84,4,'St. Petersburg'),
	(85,4,'Tbilisi'),
	(86,4,'Volgograd'),
	(87,4,'Yerevan'),
	(88,4,'Kabul'),
	(89,5,'Islamabad'),
	(90,5,'Karachi'),
	(91,5,'Tashkent'),
	(92,5,'Chennai'),
	(93,5,'Kolkata'),
	(94,5,'Mumbai'),
	(95,5,'New Delhi'),
	(96,5,'Sri Jayawardenepura'),
	(97,5,'Kathmandu'),
	(98,6,'Almaty'),
	(99,6,'Astana'),
	(100,6,'Dhaka'),
	(101,6,'Ekaterinburg'),
	(102,6,'Rangoon'),
	(103,7,'Bangkok'),
	(104,7,'Hanoi'),
	(105,7,'Jakarta'),
	(106,7,'Novosibirsk'),
	(107,8,'Beijing'),
	(108,8,'Chongqing'),
	(109,8,'Hong Kong'),
	(110,8,'Krasnoyarsk'),
	(111,8,'Kuala Lumpur'),
	(112,8,'Perth'),
	(113,8,'Singapore'),
	(114,8,'Taipei'),
	(115,8,'Ulaan Bataar'),
	(116,8,'Urumqi'),
	(117,9,'Irkutsk'),
	(118,9,'Osaka'),
	(119,9,'Sapporo'),
	(120,9,'Seoul'),
	(121,9,'Tokyo'),
	(122,9,'Adelaide'),
	(123,9,'Darwin'),
	(124,10,'Brisbane'),
	(125,10,'Canberra'),
	(126,10,'Guam'),
	(127,10,'Hobart'),
	(128,10,'Melbourne'),
	(129,10,'Port Moresby'),
	(130,10,'Sydney'),
	(131,10,'Yakutsk'),
	(132,11,'New Caledonia'),
	(133,11,'Vladivostok'),
	(134,12,'Auckland'),
	(135,12,'Fiji'),
	(136,12,'Kamchatka'),
	(137,12,'Magadan'),
	(138,12,'Marshall Is.'),
	(139,12,'Solomon Is.'),
	(140,12,'Wellington'),
	(141,13,'Nuku\'alofa'),
	(142,13,'Samoa'),
	(143,13,'Tokelau Is.');

/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table url_short
# ------------------------------------------------------------

DROP TABLE IF EXISTS `url_short`;

CREATE TABLE `url_short` (
  `id` char(32) NOT NULL DEFAULT '',
  `translates_as` varchar(350) NOT NULL DEFAULT '',
  `created` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_md5` char(32) DEFAULT NULL,
  `auth_method_id` int(11) unsigned NOT NULL DEFAULT '1',
  `group_id` int(11) unsigned NOT NULL,
  `fb_id` bigint(20) unsigned DEFAULT NULL,
  `fb_token` varchar(255) DEFAULT NULL,
  `tw_id` bigint(20) unsigned DEFAULT NULL,
  `tw_token` varchar(255) DEFAULT NULL,
  `tw_secret` varchar(255) DEFAULT NULL,
  `li_id` varchar(15) DEFAULT NULL,
  `li_token` varchar(255) DEFAULT NULL,
  `li_secret` varchar(255) DEFAULT NULL,
  `ip_address` char(16) NOT NULL,
  `last_ip` char(16) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT '',
  `password_md5` char(32) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `is_verified` tinyint(1) unsigned DEFAULT '0',
  `is_suspended` tinyint(1) unsigned DEFAULT '0',
  `temp_pw` tinyint(1) unsigned DEFAULT '0',
  `failed_login_count` tinyint(4) unsigned DEFAULT '0',
  `failed_login_expires` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `user_acl` text,
  `login_count` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_nav` text,
  `admin_dashboard` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `group_id` (`group_id`),
  KEY `auth_method_id` (`auth_method_id`),
  KEY `email_index` (`email`),
  KEY `fb_token` (`fb_token`),
  KEY `fb_id` (`fb_id`),
  KEY `id_md5` (`id_md5`),
  KEY `password_md5` (`password_md5`),
  KEY `activation_code` (`activation_code`),
  KEY `email` (`email`),
  KEY `forgotten_password_code` (`forgotten_password_code`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`auth_method_id`) REFERENCES `user_auth_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_auth_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_auth_method`;

CREATE TABLE `user_auth_method` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_auth_method` WRITE;
/*!40000 ALTER TABLE `user_auth_method` DISABLE KEYS */;

INSERT INTO `user_auth_method` (`id`, `type`)
VALUES
	(2,'facebook'),
	(5,'linkedin'),
	(1,'native'),
	(4,'open_id'),
	(3,'twitter');

/*!40000 ALTER TABLE `user_auth_method` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `display_name` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL,
  `default_homepage` varchar(255) NOT NULL,
  `registration_redirect` varchar(255) DEFAULT NULL,
  `acl` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;

INSERT INTO `user_group` (`id`, `name`, `display_name`, `description`, `default_homepage`, `acl`)
VALUES
	(1,'superuser','Superuser','Superuser\'s have complete access to all modules in admin regardless of specific module allocations.','/admin','a:2:{s:9:\"superuser\";b:1;s:5:\"admin\";a:1:{i:0;s:9:\"dashboard\";}}'),
	(2,'admin','Administrator','Administrators have access to specific areas within admin.','/admin','a:1:{s:5:\"admin\";a:1:{i:0;s:9:\"dashboard\";}}'),
	(3,'member','Member','Members have no access to admin.','/',NULL);

/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_meta`;

CREATE TABLE `user_meta` (
  `user_id` int(11) unsigned NOT NULL,
  `referral` varchar(10) DEFAULT NULL,
  `referred_by` int(11) unsigned DEFAULT NULL,
  `first_name` varchar(150) NOT NULL DEFAULT '',
  `last_name` varchar(150) NOT NULL DEFAULT '',
  `gender` enum('undisclosed','male','female','transgender','other') NOT NULL DEFAULT 'undisclosed',
  `timezone_id` int(11) unsigned NOT NULL DEFAULT '40',
  `date_format_date_id` int(11) unsigned NOT NULL DEFAULT '1',
  `date_format_time_id` int(11) unsigned NOT NULL DEFAULT '1',
  `language_id` int(11) unsigned NOT NULL DEFAULT '202',
  `profile_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `last_name` (`last_name`,`first_name`),
  KEY `first_name` (`first_name`,`last_name`),
  KEY `referred_by` (`referred_by`),
  KEY `referral` (`referral`),
  KEY `timezone_id` (`timezone_id`),
  CONSTRAINT `user_meta_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_meta_ibfk_4` FOREIGN KEY (`timezone_id`) REFERENCES `timezone` (`id`),
  CONSTRAINT `user_meta_ibfk_5` FOREIGN KEY (`date_format_date_id`) REFERENCES `date_format_date` (`id`),
  CONSTRAINT `user_meta_ibfk_6` FOREIGN KEY (`date_format_time_id`) REFERENCES `date_format_time` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
