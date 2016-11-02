-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: iot_tvs
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add tvs_ truck_ data',7,'add_tvs_truck_data'),(20,'Can change tvs_ truck_ data',7,'change_tvs_truck_data'),(21,'Can delete tvs_ truck_ data',7,'delete_tvs_truck_data'),(22,'Can add tvs_ xml_ data',8,'add_tvs_xml_data'),(23,'Can change tvs_ xml_ data',8,'change_tvs_xml_data'),(24,'Can delete tvs_ xml_ data',8,'delete_tvs_xml_data'),(25,'Can add tvs_ truck_ data_ as_ raw',9,'add_tvs_truck_data_as_raw'),(26,'Can change tvs_ truck_ data_ as_ raw',9,'change_tvs_truck_data_as_raw'),(27,'Can delete tvs_ truck_ data_ as_ raw',9,'delete_tvs_truck_data_as_raw');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$15000$3jyLnuChB7iV$5igkL1NLmfVQeeSRIOl+lephfjpFfFkttt4BPPOGOFA=','2016-10-21 12:33:46',1,'mahiti','','','mahiti@mahiti.org',1,1,'2015-08-13 04:25:09'),(2,'pbkdf2_sha256$15000$flIzyoDnks6v$8S22AkW54gMS8YNuUreqXENfaqodZLAPXbz1NM45DYY=','2016-10-21 12:34:12',0,'tvs','','','',1,1,'2015-11-26 11:19:52');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (3,2,20);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-08-13 04:52:56','1','Tvs_Truck_Data object',1,'',7,1),(2,'2015-08-17 05:56:46','9','Tvs_Xml_Data object',3,'',8,1),(3,'2015-08-17 05:56:46','8','Tvs_Xml_Data object',3,'',8,1),(4,'2015-08-17 05:56:46','7','Tvs_Xml_Data object',3,'',8,1),(5,'2015-08-17 05:56:46','6','Tvs_Xml_Data object',3,'',8,1),(6,'2015-08-17 05:56:46','5','Tvs_Xml_Data object',3,'',8,1),(7,'2015-08-17 05:56:46','4','Tvs_Xml_Data object',3,'',8,1),(8,'2015-08-17 05:56:46','3','Tvs_Xml_Data object',3,'',8,1),(9,'2015-08-17 05:56:46','2','Tvs_Xml_Data object',3,'',8,1),(10,'2015-08-17 05:56:46','1','Tvs_Xml_Data object',3,'',8,1),(11,'2015-08-17 09:06:32','15','Tvs_Xml_Data object',3,'',8,1),(12,'2015-08-17 09:06:32','14','Tvs_Xml_Data object',3,'',8,1),(13,'2015-08-17 09:06:32','13','Tvs_Xml_Data object',3,'',8,1),(14,'2015-08-17 09:06:32','12','Tvs_Xml_Data object',3,'',8,1),(15,'2015-08-17 09:06:32','11','Tvs_Xml_Data object',3,'',8,1),(16,'2015-08-17 09:06:32','10','Tvs_Xml_Data object',3,'',8,1),(17,'2015-08-17 09:07:04','17','Tvs_Xml_Data object',3,'',8,1),(18,'2015-08-17 09:07:04','16','Tvs_Xml_Data object',3,'',8,1),(19,'2015-08-17 09:08:10','20','Tvs_Xml_Data object',3,'',8,1),(20,'2015-08-17 09:08:10','19','Tvs_Xml_Data object',3,'',8,1),(21,'2015-08-17 09:08:10','18','Tvs_Xml_Data object',3,'',8,1),(22,'2015-08-17 09:09:17','31','Tvs_Xml_Data object',3,'',8,1),(23,'2015-08-17 09:09:17','30','Tvs_Xml_Data object',3,'',8,1),(24,'2015-08-17 09:09:17','29','Tvs_Xml_Data object',3,'',8,1),(25,'2015-08-17 09:09:17','28','Tvs_Xml_Data object',3,'',8,1),(26,'2015-08-17 09:09:17','27','Tvs_Xml_Data object',3,'',8,1),(27,'2015-08-17 09:09:17','26','Tvs_Xml_Data object',3,'',8,1),(28,'2015-08-17 09:09:17','25','Tvs_Xml_Data object',3,'',8,1),(29,'2015-08-17 09:09:17','24','Tvs_Xml_Data object',3,'',8,1),(30,'2015-08-17 09:09:17','23','Tvs_Xml_Data object',3,'',8,1),(31,'2015-08-17 09:09:17','22','Tvs_Xml_Data object',3,'',8,1),(32,'2015-08-17 09:09:17','21','Tvs_Xml_Data object',3,'',8,1),(33,'2015-08-17 09:11:09','1','Tvs_Truck_Data object',2,'Changed info25, info26 and info27.',7,1),(34,'2015-08-17 09:11:18','32','Tvs_Xml_Data object',3,'',8,1),(35,'2015-11-26 10:56:51','1','Tvs_Truck_Data object',2,'No fields changed.',7,1),(36,'2015-11-26 10:58:01','1','Tvs_Truck_Data object',2,'No fields changed.',7,1),(37,'2015-11-26 11:19:01','1','Tvs_Truck_Data object',2,'Changed info27.',7,1),(38,'2015-11-26 11:19:52','2','tvs',1,'',4,1),(39,'2015-11-26 11:20:07','2','tvs',2,'Changed password and user_permissions.',4,1),(40,'2015-11-26 11:20:14','2','tvs',2,'Changed password and is_staff.',4,1),(41,'2015-11-26 11:23:32','2','tvs',2,'Changed password and user_permissions.',4,1),(42,'2015-11-26 11:23:46','1','Tvs_Truck_Data object',2,'Changed info27.',7,2),(43,'2015-11-26 11:25:55','1','Tvs_Truck_Data object',2,'No fields changed.',7,2),(44,'2015-11-26 11:26:14','1','Tvs_Truck_Data object',2,'No fields changed.',7,2),(45,'2015-11-26 11:26:32','1','Tvs_Truck_Data object',2,'No fields changed.',7,2),(46,'2016-10-21 12:33:59','2','tvs',2,'Changed password.',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'tvs_ truck_ data','tvsapp','tvs_truck_data'),(8,'tvs_ xml_ data','tvsapp','tvs_xml_data'),(9,'tvs_ truck_ data_ as_ raw','tvsapp','tvs_truck_data_as_raw');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-08-13 04:24:50'),(2,'auth','0001_initial','2015-08-13 04:24:52'),(3,'admin','0001_initial','2015-08-13 04:24:53'),(4,'sessions','0001_initial','2015-08-13 04:24:53'),(5,'auth','0002_auto_20160318_1919','2016-11-02 07:25:11'),(6,'auth','0003_auto_20160405_0556','2016-11-02 07:25:12'),(7,'auth','0004_auto_20160608_1759','2016-11-02 07:25:12'),(8,'auth','0005_auto_20160726_0952','2016-11-02 07:25:12');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3oki5x29jvr6qp5how3p81l6ym6n791p','ZTc0MGE2NGViNTIwMWQwODFlNjlhMzg2NzBhYTIxMDgwODA2MTBhODqAAn1xAVgKAAAAdGVzdGNvb2tpZVgGAAAAd29ya2VkcQJzLg==','2015-12-10 13:01:31'),('ajy5xs3xps4p5bxecmz0a7ltluwvotly','Y2Y4YmNlNGRiMTc2ZTkwODQ3ZGEyYTI2Y2Q0MTcxNGIwOWMwNzIyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZmNjOWEwYmU3MWE5NmRiYzJlZjE4ODgxYmM2MWIzMDI0YzI3NjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-08-27 04:49:27'),('enl30cvpanvnn1ou5wxsqjwxp5nunlg2','Y2Y4YmNlNGRiMTc2ZTkwODQ3ZGEyYTI2Y2Q0MTcxNGIwOWMwNzIyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZmNjOWEwYmU3MWE5NmRiYzJlZjE4ODgxYmM2MWIzMDI0YzI3NjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-08-27 04:40:24'),('h51qagbfbke87m9yhfnog86gg6y0lidw','Y2Y4YmNlNGRiMTc2ZTkwODQ3ZGEyYTI2Y2Q0MTcxNGIwOWMwNzIyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY2ZmNjOWEwYmU3MWE5NmRiYzJlZjE4ODgxYmM2MWIzMDI0YzI3NjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-08-31 05:54:50'),('tc3xsp6suabf3pc11veu3peflzu2qzwb','NGQ5MzQyODllMDQ3MzFlNTA3YmVlN2E3MTk5YzUxYzViZjMyYzBhMDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==','2015-12-10 11:23:38'),('tt33m8zroxntv2nks974sfwyfpb7k2bs','NmUxOTBlYjNiYzcwNGJhMzY3MjAxNWZlNTIxOWJjNTM5YTdjNjc3ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiMGU1MjdmNWZkZmJiY2U2ZTUxMzRhYzRjZTM4N2YxZmIxMWY1NTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2016-11-04 12:34:12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvsapp_tvs_truck_data`
--

DROP TABLE IF EXISTS `tvsapp_tvs_truck_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvsapp_tvs_truck_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  `info4` varchar(100) DEFAULT NULL,
  `info5` varchar(100) DEFAULT NULL,
  `info6` varchar(100) DEFAULT NULL,
  `info7` varchar(100) DEFAULT NULL,
  `info8` varchar(100) DEFAULT NULL,
  `info9` varchar(100) DEFAULT NULL,
  `info10` varchar(100) DEFAULT NULL,
  `info11` varchar(100) DEFAULT NULL,
  `info12` varchar(100) DEFAULT NULL,
  `info13` varchar(100) DEFAULT NULL,
  `info14` varchar(100) DEFAULT NULL,
  `info15` varchar(100) DEFAULT NULL,
  `info16` varchar(100) DEFAULT NULL,
  `info17` varchar(100) DEFAULT NULL,
  `info18` varchar(100) DEFAULT NULL,
  `info19` varchar(100) DEFAULT NULL,
  `info20` varchar(100) DEFAULT NULL,
  `info21` varchar(100) DEFAULT NULL,
  `info22` varchar(100) DEFAULT NULL,
  `info23` varchar(100) DEFAULT NULL,
  `info24` varchar(100) DEFAULT NULL,
  `info25` varchar(100) DEFAULT NULL,
  `info26` varchar(100) DEFAULT NULL,
  `info27` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvsapp_tvs_truck_data`
--

LOCK TABLES `tvsapp_tvs_truck_data` WRITE;
/*!40000 ALTER TABLE `tvsapp_tvs_truck_data` DISABLE KEYS */;
INSERT INTO `tvsapp_tvs_truck_data` VALUES (1,'STX9008800168[1]e','IND-10-PUN','TN05AC1992','919883322222','GPRMC','23-11-2010 10:10:53','A','22.327607','N','11.4047669','E','0.0','0.0','0.0','E','*7F','460,00','2795,0EA','14','94','1000','00','91','Tmer;1D','1','1','1');
/*!40000 ALTER TABLE `tvsapp_tvs_truck_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvsapp_tvs_truck_data_as_raw`
--

DROP TABLE IF EXISTS `tvsapp_tvs_truck_data_as_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvsapp_tvs_truck_data_as_raw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info1` varchar(100) DEFAULT NULL,
  `info2` varchar(100) DEFAULT NULL,
  `info3` varchar(100) DEFAULT NULL,
  `info4` varchar(100) DEFAULT NULL,
  `info5` varchar(100) DEFAULT NULL,
  `info6` varchar(100) DEFAULT NULL,
  `info7` varchar(100) DEFAULT NULL,
  `info8` varchar(100) DEFAULT NULL,
  `info9` varchar(100) DEFAULT NULL,
  `info10` varchar(100) DEFAULT NULL,
  `info11` varchar(100) DEFAULT NULL,
  `info12` varchar(100) DEFAULT NULL,
  `info13` varchar(100) DEFAULT NULL,
  `info14` varchar(100) DEFAULT NULL,
  `info15` varchar(100) DEFAULT NULL,
  `info16` varchar(100) DEFAULT NULL,
  `info17` varchar(100) DEFAULT NULL,
  `info18` varchar(100) DEFAULT NULL,
  `info19` varchar(100) DEFAULT NULL,
  `info20` varchar(100) DEFAULT NULL,
  `info21` varchar(100) DEFAULT NULL,
  `info22` varchar(100) DEFAULT NULL,
  `info23` varchar(100) DEFAULT NULL,
  `info24` varchar(100) DEFAULT NULL,
  `info25` varchar(100) DEFAULT NULL,
  `info26` varchar(100) DEFAULT NULL,
  `info27` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvsapp_tvs_truck_data_as_raw`
--

LOCK TABLES `tvsapp_tvs_truck_data_as_raw` WRITE;
/*!40000 ALTER TABLE `tvsapp_tvs_truck_data_as_raw` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvsapp_tvs_truck_data_as_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvsapp_tvs_xml_data`
--

DROP TABLE IF EXISTS `tvsapp_tvs_xml_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tvsapp_tvs_xml_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) NOT NULL,
  `customer_key` varchar(100) NOT NULL,
  `truck_id` varchar(100) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_id` int(11) NOT NULL,
  `no_of_records` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvsapp_tvs_xml_data`
--

LOCK TABLES `tvsapp_tvs_xml_data` WRITE;
/*!40000 ALTER TABLE `tvsapp_tvs_xml_data` DISABLE KEYS */;
INSERT INTO `tvsapp_tvs_xml_data` VALUES (33,'TVS-01-MAA','QvsX2@er',NULL,'2015-08-17 09:11:20',1,1),(34,'TVS-01-MAA','QvsX2@er',NULL,'2015-08-17 09:57:40',1,0),(35,'TVS-01-MAA','QvsX2@er',NULL,'2015-08-17 09:58:50',1,0),(36,'TVS-01-MAA','QvsX2@er',NULL,'2015-12-21 12:30:09',1,0),(37,'TVS-01-MAA','QvsX2@er',NULL,'2015-12-21 12:31:30',1,0),(38,'TVS-01-MAA','QvsX2@er',NULL,'2015-12-21 12:35:39',1,0),(39,'TVS-01-MAA','QvsX2@er',NULL,'2015-12-21 12:36:51',1,0),(40,'TVS-01-MAA','QvsX2@er',NULL,'2015-12-21 12:37:12',1,0);
/*!40000 ALTER TABLE `tvsapp_tvs_xml_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-02 12:56:36
