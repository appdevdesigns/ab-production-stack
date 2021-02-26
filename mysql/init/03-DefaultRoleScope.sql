# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: analytics.appdevdesigns.net (MySQL 5.5.5-10.4.12-MariaDB-1:10.4.12+maria~bionic)
# Database: appbuilder
# Generation Time: 2020-05-13 09:55:06 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


USE appbuilder;

# Dump of table AB_JOINMN_SCOPE_ROLE_roles
# ------------------------------------------------------------

CREATE TABLE `AB_JOINMN_SCOPE_ROLE_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCOPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ROLE_scopes` (`ROLE`),
  KEY `SCOPE_roles` (`SCOPE`),
  CONSTRAINT `ROLE_scopes` FOREIGN KEY (`ROLE`) REFERENCES `AB_SYSTEM_ROLE` (`uuid`) ON DELETE SET NULL,
  CONSTRAINT `SCOPE_roles` FOREIGN KEY (`SCOPE`) REFERENCES `AB_SYSTEM_SCOPE` (`uuid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `AB_JOINMN_SCOPE_ROLE_roles` WRITE;
/*!40000 ALTER TABLE `AB_JOINMN_SCOPE_ROLE_roles` DISABLE KEYS */;

INSERT INTO `AB_JOINMN_SCOPE_ROLE_roles` (`id`, `created_at`, `updated_at`, `ROLE`, `SCOPE`)
VALUES
	(1,NULL,NULL,'dd6c2d34-0982-48b7-bc44-2456474edbea','838beeb9-0a13-4b0f-9780-0d47e67f3752');

/*!40000 ALTER TABLE `AB_JOINMN_SCOPE_ROLE_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AB_SYSTEM_ROLE
# ------------------------------------------------------------

CREATE TABLE `AB_SYSTEM_ROLE` (
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `translations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `users` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `AB_SYSTEM_ROLE` WRITE;
/*!40000 ALTER TABLE `AB_SYSTEM_ROLE` DISABLE KEYS */;

INSERT INTO `AB_SYSTEM_ROLE` (`uuid`, `created_at`, `updated_at`, `properties`, `translations`, `users`)
VALUES
	('dd6c2d34-0982-48b7-bc44-2456474edbea','2020-05-13 09:48:10','2020-05-13 09:50:06',NULL,'[{\"language_code\":\"en\",\"name\":\"System Admin\",\"description\":\"Full Access\"}]','[{\"id\":\"admin\",\"image\":\"\",\"text\":\"admin\"}]');

/*!40000 ALTER TABLE `AB_SYSTEM_ROLE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AB_SYSTEM_SCOPE
# ------------------------------------------------------------

CREATE TABLE `AB_SYSTEM_SCOPE` (
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `properties` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `translations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdBy` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectIds` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filter` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowAll` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `AB_SYSTEM_SCOPE` WRITE;
/*!40000 ALTER TABLE `AB_SYSTEM_SCOPE` DISABLE KEYS */;

INSERT INTO `AB_SYSTEM_SCOPE` (`uuid`, `created_at`, `updated_at`, `properties`, `translations`, `createdBy`, `objectIds`, `filter`, `allowAll`)
VALUES
	('838beeb9-0a13-4b0f-9780-0d47e67f3752','2020-05-13 09:49:53',NULL,NULL,'[{\"language_code\":\"en\",\"name\":\"All Access\",\"description\":\"Provide Full Data Access to All Objects.\"}]','admin',NULL,NULL,1);

/*!40000 ALTER TABLE `AB_SYSTEM_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
