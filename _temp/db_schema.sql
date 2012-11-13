# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.19)
# Database: shedlove_nails
# Generation Time: 2012-04-07 23:47:04 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table db_version
# ------------------------------------------------------------

DROP TABLE IF EXISTS `db_version`;

CREATE TABLE `db_version` (
  `version` smallint(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;

INSERT INTO `db_version` (`version`)
VALUES
	(1);

/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue`;

CREATE TABLE `email_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `user_email` varchar(150) DEFAULT NULL,
  `time_queued` int(11) unsigned NOT NULL,
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
  `time_queued` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `email_vars` longtext,
  `internal_ref` int(11) unsigned DEFAULT NULL,
  `read_count` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`user_id`),
  KEY `type_id_2` (`type_id`,`internal_ref`),
  CONSTRAINT `email_queue_archive_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `email_queue_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `email_queue_archive_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_track_open
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_track_open`;

CREATE TABLE `email_queue_track_open` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`),
  CONSTRAINT `email_queue_track_open_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `email_queue_archive` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table email_queue_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_queue_type`;

CREATE TABLE `email_queue_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_string` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `cron_run` enum('instant','prompt','hourly','daily','weekly-sun','weekly-mon','weekly-tue','weekly-wed','weekly-thur','weekly-fri','weekly-sat','fortnightly','monthly') NOT NULL DEFAULT 'instant',
  `type` enum('service_acct') NOT NULL DEFAULT 'service_acct',
  `description` text,
  `template_file` varchar(150) NOT NULL,
  `template_file_plaintext` varchar(150) NOT NULL DEFAULT '',
  `subject` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_string` (`id_string`),
  KEY `id_string_2` (`id_string`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `email_queue_type` WRITE;
/*!40000 ALTER TABLE `email_queue_type` DISABLE KEYS */;

INSERT INTO `email_queue_type` (`id`, `id_string`, `name`, `cron_run`, `type`, `description`, `template_file`, `template_file_plaintext`, `subject`)
VALUES
	(1,'forgotten_password','Forgotten Password - instant','instant','service_acct','Email which is sent when a user requests a password reset.','auth/forgotten_password','auth/forgotten_password_plaintext','Reset your Password');

/*!40000 ALTER TABLE `email_queue_type` ENABLE KEYS */;
UNLOCK TABLES;


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


# Dump of table quickcache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quickcache`;

CREATE TABLE `quickcache` (
  `id` varchar(100) NOT NULL,
  `cache_file` varchar(100) NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_file` (`cache_file`),
  KEY `expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table url_short
# ------------------------------------------------------------

DROP TABLE IF EXISTS `url_short`;

CREATE TABLE `url_short` (
  `id` char(32) NOT NULL DEFAULT '',
  `translates_as` varchar(350) NOT NULL DEFAULT '',
  `created` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
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
  `acl` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;

INSERT INTO `user_group` (`id`, `name`, `display_name`, `description`, `default_homepage`, `acl`)
VALUES
	(1, 'superuser', 'Superuser', 'Superuser\'s have complete access to all modules in admin regardless of specific module allocations.', '/admin', 'a:2:{s:9:\"superuser\";b:1;s:5:\"admin\";a:1:{i:0;s:9:\"dashboard\";}}'),
	(2, 'admin', 'Adminsitrator', 'Administrators have access to specific areas within admin.', '/admin', 'a:1:{s:5:\"admin\";a:1:{i:0;s:9:\"dashboard\";}}'),
	(3, 'member', 'Member', 'Members have no access to admin.', '/', NULL);

/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_md5` char(32) DEFAULT NULL,
  `auth_method_id` int(11) unsigned NOT NULL DEFAULT '1',
  `group_id` int(11) unsigned NOT NULL,
  `fb_token` varchar(255) DEFAULT NULL,
  `fb_id` bigint(20) unsigned DEFAULT NULL,
  `linkedin_id` varchar(15) DEFAULT NULL,
  `linkedin_token` varchar(50) DEFAULT NULL,
  `linkedin_secret` varchar(50) DEFAULT NULL,
  `ip_address` char(16) NOT NULL,
  `last_ip` char(16) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) DEFAULT '',
  `password_md5` char(32) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned NOT NULL,
  `last_seen` int(11) unsigned NOT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `temp_pw` tinyint(1) unsigned DEFAULT NULL,
  `failed_login_count` tinyint(4) unsigned DEFAULT '0',
  `failed_login_expires` int(11) unsigned DEFAULT NULL,
  `last_update` int(11) unsigned DEFAULT NULL,
  `user_acl` text,
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


# Dump of table user_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_meta`;

CREATE TABLE `user_meta` (
  `user_id` int(11) unsigned NOT NULL,
  `referral` varchar(10) DEFAULT NULL,
  `referred_by` int(11) unsigned DEFAULT NULL,
  `first_name` varchar(150) NOT NULL DEFAULT '',
  `last_name` varchar(150) NOT NULL DEFAULT '',
  `profile_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `last_name` (`last_name`,`first_name`),
  KEY `first_name` (`first_name`,`last_name`),
  KEY `referred_by` (`referred_by`),
  KEY `referral` (`referral`),
  CONSTRAINT `user_meta_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
