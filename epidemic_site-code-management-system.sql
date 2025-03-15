CREATE DATABASE  IF NOT EXISTS `epidemic_site_code_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `epidemic_site_code_management_system`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: epidemic_site_code_management_system
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idadmin` int NOT NULL AUTO_INCREMENT,
  `admin_no` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add admin',7,'add_admin'),(26,'Can change admin',7,'change_admin'),(27,'Can delete admin',7,'delete_admin'),(28,'Can view admin',7,'view_admin'),(29,'Can add site',8,'add_site'),(30,'Can change site',8,'change_site'),(31,'Can delete site',8,'delete_site'),(32,'Can view site',8,'view_site'),(33,'Can add us',9,'add_us'),(34,'Can change us',9,'change_us'),(35,'Can delete us',9,'delete_us'),(36,'Can view us',9,'view_us'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add site_ ad',11,'add_site_ad'),(42,'Can change site_ ad',11,'change_site_ad'),(43,'Can delete site_ ad',11,'delete_site_ad'),(44,'Can view site_ ad',11,'view_site_ad'),(45,'Can add admin',12,'add_admin'),(46,'Can change admin',12,'change_admin'),(47,'Can delete admin',12,'delete_admin'),(48,'Can view admin',12,'view_admin'),(49,'Can add auth group',13,'add_authgroup'),(50,'Can change auth group',13,'change_authgroup'),(51,'Can delete auth group',13,'delete_authgroup'),(52,'Can view auth group',13,'view_authgroup'),(53,'Can add auth group permissions',14,'add_authgrouppermissions'),(54,'Can change auth group permissions',14,'change_authgrouppermissions'),(55,'Can delete auth group permissions',14,'delete_authgrouppermissions'),(56,'Can view auth group permissions',14,'view_authgrouppermissions'),(57,'Can add auth permission',15,'add_authpermission'),(58,'Can change auth permission',15,'change_authpermission'),(59,'Can delete auth permission',15,'delete_authpermission'),(60,'Can view auth permission',15,'view_authpermission'),(61,'Can add auth user',16,'add_authuser'),(62,'Can change auth user',16,'change_authuser'),(63,'Can delete auth user',16,'delete_authuser'),(64,'Can view auth user',16,'view_authuser'),(65,'Can add auth user groups',17,'add_authusergroups'),(66,'Can change auth user groups',17,'change_authusergroups'),(67,'Can delete auth user groups',17,'delete_authusergroups'),(68,'Can view auth user groups',17,'view_authusergroups'),(69,'Can add auth user user permissions',18,'add_authuseruserpermissions'),(70,'Can change auth user user permissions',18,'change_authuseruserpermissions'),(71,'Can delete auth user user permissions',18,'delete_authuseruserpermissions'),(72,'Can view auth user user permissions',18,'view_authuseruserpermissions'),(73,'Can add django admin log',19,'add_djangoadminlog'),(74,'Can change django admin log',19,'change_djangoadminlog'),(75,'Can delete django admin log',19,'delete_djangoadminlog'),(76,'Can view django admin log',19,'view_djangoadminlog'),(77,'Can add django content type',20,'add_djangocontenttype'),(78,'Can change django content type',20,'change_djangocontenttype'),(79,'Can delete django content type',20,'delete_djangocontenttype'),(80,'Can view django content type',20,'view_djangocontenttype'),(81,'Can add django migrations',21,'add_djangomigrations'),(82,'Can change django migrations',21,'change_djangomigrations'),(83,'Can delete django migrations',21,'delete_djangomigrations'),(84,'Can view django migrations',21,'view_djangomigrations'),(85,'Can add django session',22,'add_djangosession'),(86,'Can change django session',22,'change_djangosession'),(87,'Can delete django session',22,'delete_djangosession'),(88,'Can view django session',22,'view_djangosession'),(89,'Can add site',23,'add_site'),(90,'Can change site',23,'change_site'),(91,'Can delete site',23,'delete_site'),(92,'Can view site',23,'view_site'),(93,'Can add site ad',24,'add_sitead'),(94,'Can change site ad',24,'change_sitead'),(95,'Can delete site ad',24,'delete_sitead'),(96,'Can view site ad',24,'view_sitead'),(97,'Can add us',25,'add_us'),(98,'Can change us',25,'change_us'),(99,'Can delete us',25,'delete_us'),(100,'Can view us',25,'view_us'),(101,'Can add user',26,'add_user'),(102,'Can change user',26,'change_user'),(103,'Can delete user',26,'delete_user'),(104,'Can view user',26,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'QRcode','admin'),(13,'QRcode','authgroup'),(14,'QRcode','authgrouppermissions'),(15,'QRcode','authpermission'),(16,'QRcode','authuser'),(17,'QRcode','authusergroups'),(18,'QRcode','authuseruserpermissions'),(19,'QRcode','djangoadminlog'),(20,'QRcode','djangocontenttype'),(21,'QRcode','djangomigrations'),(22,'QRcode','djangosession'),(23,'QRcode','site'),(24,'QRcode','sitead'),(25,'QRcode','us'),(26,'QRcode','user'),(6,'sessions','session'),(7,'user','admin'),(8,'user','site'),(11,'user','site_ad'),(9,'user','us'),(10,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-17 18:53:46.592410'),(2,'auth','0001_initial','2023-02-17 18:53:46.790978'),(3,'admin','0001_initial','2023-02-17 18:53:46.844937'),(4,'admin','0002_logentry_remove_auto_add','2023-02-17 18:53:46.850920'),(5,'admin','0003_logentry_add_action_flag_choices','2023-02-17 18:53:46.856904'),(6,'contenttypes','0002_remove_content_type_name','2023-02-17 18:53:46.895653'),(7,'auth','0002_alter_permission_name_max_length','2023-02-17 18:53:46.922560'),(8,'auth','0003_alter_user_email_max_length','2023-02-17 18:53:46.953255'),(9,'auth','0004_alter_user_username_opts','2023-02-17 18:53:46.959238'),(10,'auth','0005_alter_user_last_login_null','2023-02-17 18:53:46.984016'),(11,'auth','0006_require_contenttypes_0002','2023-02-17 18:53:46.986416'),(12,'auth','0007_alter_validators_add_error_messages','2023-02-17 18:53:46.992400'),(13,'auth','0008_alter_user_username_max_length','2023-02-17 18:53:47.022302'),(14,'auth','0009_alter_user_last_name_max_length','2023-02-17 18:53:47.052292'),(15,'auth','0010_alter_group_name_max_length','2023-02-17 18:53:47.081709'),(16,'auth','0011_update_proxy_permissions','2023-02-17 18:53:47.088692'),(17,'auth','0012_alter_user_first_name_max_length','2023-02-17 18:53:47.116626'),(18,'sessions','0001_initial','2023-02-17 18:53:47.134361'),(19,'user','0001_initial','2023-02-17 18:53:47.139345'),(20,'QRcode','0001_initial','2023-03-12 12:09:05.350188');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('08dgyx2hgwjbjgb3fnsohndhlrzgjm0g','.eJyrVsrMTUxPjU_OT0lVslJydY90ClHSUfLMS8tXsqpWykxRsjLUUSrIyM8DSSem5GbmAaWL8nMQ3NpaAO2qFZc:1pr9f5:JLCaqIRSscEUufQg2gKO5baOSCRHsP0mMuB_4Kpnu7c','2023-05-09 03:48:15.097714'),('2tkrsnqsp85ws0k7q56vsh2r2dl37nd4','eyJpbWFnZV9jb2RlIjoiRllQRUgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1phXT0:0EM53IRhaKP5OmP0gz6omLY99zRok5EguhyADIBu_pI','2023-03-29 15:13:02.845768'),('61jjr2pfwf7le88u28hbw4zorq2zrqbt','eyJpbWFnZV9jb2RlIjoiVVZJSkQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pis4b:Gu1tXo-9OVOXa9Fdzbi2MzkrL1IT5QqMEd_4jRxrn_c','2023-04-02 07:25:21.388034'),('8samj6t01q3ypaz3mwspzcq4fmy1spae','eyJpbWFnZV9jb2RlIjoiU1pIUVAiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1pisek:s5fXJHhaBmygJZ2ycYyoqZL-rUkzeZN5yCXYmpyHG1Y','2023-04-02 08:02:42.517379'),('8wy9jeoeeegl97ub1sus3z1cxxytpo3e','.eJwVy00OwiAQQOG7zJpFbZQSbuBPL-CGjBZlksI0TEnUpncXtl_e24Aivr178uTBwni9Xe6gwIkXIU7OfxbKX7C6U3BOLwa7AU1g-6OCJXBq08H0WptTNwymrgljw19AlkC5UDVZcS1SFR-Jc8S5Wua5dUV8hn3_A2wgKvY:1pisYq:rxwFSnm9EPOKkav1Z73i4u_DQB0LgMJvaU5fzmItaHc','2023-04-02 07:56:36.251485'),('96qtdx1d3r5iixzg7y24t1cp3gi1tvl2','.eJyrVsrMTUxPjU_OT0lVslLyco6K8lTSUfLMS8tXsqpWykxRsjLUUSrIyM8DSSem5GbmAaWL8nMQ3NpaAPC6FaY:1piyuG:49huJLyz9BYYoOoT4kZJmiNzSEKULtoybCyyJjjjAp8','2023-04-16 14:42:08.733651'),('b3m8cfxl3vt3qh1apvl84gwd63ubjw9v','.eJwVirsKgCAUht_lnxsqKMU3cGwJmuKQloGXSJ2kd0_H71JwO7r0fgSlIbCsUm7oIP0ZIApuBTHyDo8JvvWBj_PMp54xVi9Prkly1laKiVKOlY0mm0w1b7Ct56hffN8Pp4kgGg:1pjCZr:8At8Diw1RB2yXvvEBUCuVVnoBvoSVuRxpDV5s7werg0','2023-04-17 05:17:59.836127'),('dl3t83tlutjvxy1cqqac5h5c9m3cm4vn','eyJpbWFnZV9jb2RlIjoiSEtTWEQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1phmVw:8UGEFEW25aziUj_czJJo7j9IK2ScYrSXxDxqN31XBNQ','2023-03-30 07:17:04.359809'),('dm9cj2qgh6urf4imggkwti8gtxjcnbn9','.eJwVy7EKwjAQgOF3uTlDLZqGzC6Cg0vBLZw2moMmV3INqKXvbrJ-_P8GFPHt3ZMnDxZu9-t5BAVOvAhxcv6zUP6C1Z2CS3ox2A1oAtsfFSyBU5sOptfanLphMHVNGBv-ArIEyoWqyYprkar4SJwjztUyz60r4jPs-x9ulir7:1phXeD:ijl4TcdwCImLYSXlgotLwLxn8pDzNzyDuFG-MTpii6M','2023-03-29 15:24:37.883734'),('id2at1xwo16kjgzt6zdhyc5pb18o14x4','eyJJbmZvIjp7ImlkIjoxOSwicGhvbmUiOiIxMTExMTExIiwibmFtZSI6IjEifX0:1paCDw:RmwEhmQKMZMBYASXQmyy0cElp1rh1loK1yG8J7gtQK0','2023-03-23 09:06:08.310314'),('idfl9qzkgnqa351gvil1a28duqjl9r01','eyJpbWFnZV9jb2RlIjoiSVZYSUoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1phXVr:FQ64eevpI07ftkB7px3wdjpazesv_doKbv1vOHGOaoc','2023-03-29 15:15:59.977049'),('j2f3latbpqcqdcp5stts1lknqevwkgpu','eyJJbmZvIjp7ImlkIjoxOSwicGhvbmUiOiIxMTExMTExIiwibmFtZSI6IjEifX0:1paC5w:9y3MV0T4Gak0FMzMJwHFwy1OuQTABZy9zhabOX-dMYA','2023-03-23 08:57:52.664708'),('j68y7uomn9vof2blhcl3sav26f9abekl','.eJwVy7EOwiAQgOF3uZmhNkoJuxo7u5PTolxSuIYridr03YX1y_9vQBHf3j158mDhfhnPV1DgxIsQJ-c_C-UvWN0puKUXg92AJrD9UcESOLXpYHqtzakbBlPXhLHhLyBLoFyomqy4FqmKj8Q54lwt89y6Ij7Dvv8BYSwq3g:1pisHb:6z10Hosh3nWoB4-0Yj6aelCvxU-ZLQZuAvgb76sSW8c','2023-04-02 07:38:47.120684'),('kdjieknsxdv0wsomo9mvewrgub7xd2mc','e30:1paI6E:ANahiljlTXR8BSKEtnluh7iaztDTiD5UcCHGlmHUyOU','2023-03-23 15:22:34.472180'),('ktnas742ju94iukbt9k1rb8gpe3is7rl','.eJwVy7EOwiAQgOF3uZmhNkoJo5txduhETotySeEariTVpu8urF_-fweK-PHuxZMHC-P4uN5BgRMvQpyc3xbKX7C6U3BLbwa7A01g-7OCJXBq08n0WptLNwymrgljw19AlkC5UDVZcS1SFZ-Jc8S5Wua5dUV8huP4A3IAKwI:1pisbx:noaRX_FIS6wulFILyBxqnxq-0SRB7ClhJrdXInsIu_s','2023-04-02 07:59:49.654467'),('prjc1c8rlvz9oryh5j9bbbl8gbfph5yx','.eJwVyksKgzAURuG9_GMHVqqGjEUoddYFyKVGb0BzSx6Tins3mX7nnLAHbWb-ymKgMbzH6YMKL7cK9Am7QDfPCj8WV_pDNV2n2rrvVb4cHQX_TBLY-mSzhUgxhaxsaI-cxcterhSMx3XdfDsimQ:1pqazW:AI0lJx3oKEotZHTQ7WH2j-i9v5jMbABPXdIfo-z0bGQ','2023-05-07 14:47:02.141329'),('vhgvpbkdabjf7ty493t37bxnob8mfksu','eyJpbWFnZV9jb2RlIjoiS0pEVlMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1phnYG:BIjqA5XbEAX-oFjRwNKGkKIhdoX7JHFXeE_0y7CDvjc','2023-03-30 08:23:32.169701');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `idsite` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'health',
  `idadmin` int NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idsite`),
  KEY `fk_user_idx` (`iduser`),
  KEY `fk_admin_idx` (`idadmin`),
  CONSTRAINT `fk_admin` FOREIGN KEY (`idadmin`) REFERENCES `admin` (`idadmin`),
  CONSTRAINT `fk_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,19,'sdszcs','qqjd','health',1,'static/qrcode/1.png'),(2,19,'bjshdq','hyljd','health',1,'static/qrcode/2.png'),(3,19,'wadadaw','dwadawd','health',1,'static/qrcode/3.png'),(4,19,'fniquqf','1243u890','health',1,'static/qrcode/4.png'),(5,19,'18ceng','123','health',1,'static/qrcode/5.png'),(6,19,'18ceng1','1234','health',1,'static/qrcode/6.png'),(7,24,'Yongjia Post, Beijing University of Aeronautics and Astronautics.','No. 37 Garden Road Street, Haidian District, Beijing','health',1,'static/qrcode/7.png'),(8,24,'bjshdq','huayuanlujiedao','health',1,'static/qrcode/8.png'),(9,19,'18ceng23','12345','health',1,'static/qrcode/9.png'),(10,19,'11111111111111','11111111111111','health',1,'static/qrcode/10.png'),(11,43,'Beijing.Haidian.Huayuan Road.No.37','BUAA New Building Room D535','health',1,'static/qrcode/11.png'),(12,43,'Beijing.Haidian.Huayuan Road.No.37','BUAA New Building Room D536','health',1,'static/qrcode/12.png'),(13,43,'Beijing.Haidian.Huayuan Road.No.37','BUAA New Building Room D533','health',1,'static/qrcode/13.png'),(14,24,'Beijing.Haidian.Huayuan Road.No.37','New North Gate No15. Apartment','health',1,'static/qrcode/14.png'),(15,24,'Beijing.Haidian.Huayuan Road.No.37','New North Gate No15. Apartment2','health',1,'static/qrcode/15.png'),(16,24,'Beijing.Haidian.Huayuan Road.No.37','New North Gate No15. Apartment3','health',1,'static/qrcode/16.png'),(17,19,'sdszcs','fsnl10086','health',1,'static/qrcode/17.png'),(18,46,'beijing','huayuanlu No37','unknown',1,'static/qrcode/18.png');
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_ad`
--

DROP TABLE IF EXISTS `site_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_ad` (
  `idSA` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  PRIMARY KEY (`idSA`),
  KEY `fk_sad_user_idx` (`iduser`),
  CONSTRAINT `fk_sad_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_ad`
--

LOCK TABLES `site_ad` WRITE;
/*!40000 ALTER TABLE `site_ad` DISABLE KEYS */;
INSERT INTO `site_ad` VALUES (13,25,'Beijing Haidianqu','Qingxue Road No.18'),(14,40,'Beijing Haidianqu','Qinghua Road No.20'),(15,40,'Beijing Chaoyangqu','Tianmen Road No.3'),(16,40,'Beijing Chaoyangqu','Jianmen Road no.9'),(17,29,'Beijing Shijingshanqu','Dongzhimen Road no.9'),(18,33,'Beijing Dongchengqu','Hucheng river'),(19,30,'Beijing Xichengqu','Beidai River'),(20,31,'Beijing Shunyiqu','Dongsheng Road No.3'),(21,25,'Beijing Daxingqu','Qinghedong Road No.78'),(22,26,'Beijing Daxingqu','Qingxian Qoad No.77'),(23,25,'Shandong Jining','Zoucheng Fushan Road No.1188'),(24,29,'Shandong Jining','Qufu Beicheng Road No.33'),(25,45,'Shandong Jinan','Tianjingqu Tianhe Road No.159'),(26,45,'Shandong Jinan','Tianjingqu Tianhe Road No.158'),(27,37,'Shanxi Yulin','Yushuwan Coal Mine'),(28,37,'Shanxi Xian','Tiannan Road No.88'),(29,40,'Shanxi Yulin','Mahualiang Coal Mine'),(30,40,'Shanxi Xian','PL No.9 Arena'),(31,41,'Beijing Xichengqu','Zhanlan Road No.79'),(32,42,'Beijing Xichengqu','Litang Road No.111'),(33,42,'Sichuan Chengdu','LinQing Road No.159'),(34,43,'Fujian Wuhu','Dasima ROad No.114');
/*!40000 ALTER TABLE `site_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `us`
--

DROP TABLE IF EXISTS `us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `us` (
  `idus` int NOT NULL AUTO_INCREMENT,
  `idsite` int NOT NULL,
  `iduser` int NOT NULL,
  `e_time` datetime NOT NULL,
  PRIMARY KEY (`idus`),
  KEY `fk_uss_idx` (`idsite`),
  KEY `fk_user_idx` (`iduser`),
  CONSTRAINT `dk_user` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`),
  CONSTRAINT `fk_uss` FOREIGN KEY (`idsite`) REFERENCES `site` (`idsite`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `us`
--

LOCK TABLES `us` WRITE;
/*!40000 ALTER TABLE `us` DISABLE KEYS */;
INSERT INTO `us` VALUES (1,1,19,'2023-03-11 17:07:19'),(2,4,19,'2023-03-12 12:04:02'),(3,1,19,'2023-03-12 20:10:38'),(4,6,24,'2023-03-13 22:56:25'),(5,8,24,'2023-03-14 10:32:46'),(6,8,24,'2023-03-14 10:33:24'),(7,7,24,'2023-03-14 17:51:33'),(8,8,19,'2023-03-14 22:27:18'),(9,13,24,'2023-04-02 22:33:30'),(10,16,24,'2023-04-02 22:33:40'),(11,12,24,'2023-04-02 22:33:52'),(12,11,24,'2023-04-02 22:34:12'),(13,13,24,'2023-04-02 22:34:28'),(14,11,24,'2023-04-02 22:34:53'),(15,13,24,'2023-04-02 22:35:07'),(16,11,43,'2023-04-02 22:35:51'),(17,16,43,'2023-04-02 22:36:09'),(18,16,43,'2023-04-02 22:36:23'),(19,13,43,'2023-04-02 22:36:40'),(20,12,43,'2023-04-02 22:36:52'),(21,7,43,'2023-04-02 22:37:02'),(22,6,43,'2023-04-02 22:37:31'),(23,12,43,'2023-04-02 22:37:38'),(24,11,43,'2023-04-02 22:37:49'),(25,16,43,'2023-04-02 22:38:05'),(26,8,43,'2023-04-02 22:38:22'),(27,5,43,'2023-04-02 22:38:37'),(28,15,43,'2023-04-02 22:38:49'),(29,14,43,'2023-04-02 22:39:00'),(30,8,43,'2023-04-02 22:39:14'),(31,4,43,'2023-04-02 22:39:23'),(32,9,43,'2023-04-02 22:39:35'),(33,8,40,'2023-04-02 22:40:53'),(34,4,40,'2023-04-02 22:41:02'),(35,12,40,'2023-04-02 22:41:11'),(36,4,40,'2023-04-02 22:41:21'),(37,15,40,'2023-04-02 22:41:30'),(38,4,40,'2023-04-02 22:41:37'),(39,6,24,'2023-04-03 10:33:49'),(40,17,46,'2023-04-25 11:46:49');
/*!40000 ALTER TABLE `us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'health',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1111','12','123','health'),(2,'11111111111','zsr','111','abnormal'),(3,'22222222222','123','123','health'),(14,'11111','name','111',''),(16,'321321','123','111111',''),(17,'0','1','2','health'),(18,'3213213','123','96e79218965eb72c92a549dd5a330112','health'),(19,'1111111','1','96e79218965eb72c92a549dd5a330112','health'),(20,'8008208820','An Moli','96e79218965eb72c92a549dd5a330112','health'),(22,'1234567890','z1','96e79218965eb72c92a549dd5a330112','health'),(23,'1234567','z2','96e79218965eb72c92a549dd5a330112','health'),(24,'18266850778','zhaoshirui','96e79218965eb72c92a549dd5a330112','health'),(25,'18510507255','aml','96e79218965eb72c92a549dd5a330112','health'),(26,'18510507256','aml1','96e79218965eb72c92a549dd5a330112','health'),(28,'18266850777','amll','96e79218965eb72c92a549dd5a330112','health'),(29,'18266850779','amlll','96e79218965eb72c92a549dd5a330112','health'),(30,'18266850770','amllll','96e79218965eb72c92a549dd5a330112','health'),(31,'15965101095','zsr','96e79218965eb72c92a549dd5a330112','health'),(32,'15965101096','zsrr','96e79218965eb72c92a549dd5a330112','health'),(33,'15965101098','zsrrr','96e79218965eb72c92a549dd5a330112','health'),(34,'15965101099','Dawn','96e79218965eb72c92a549dd5a330112','health'),(35,'15965101085','Dawn1','96e79218965eb72c92a549dd5a330112','health'),(36,'15965101084','Dawn11','96e79218965eb72c92a549dd5a330112','health'),(37,'15965101083','Dawn111','96e79218965eb72c92a549dd5a330112','health'),(38,'17853799875','lll','96e79218965eb72c92a549dd5a330112','health'),(39,'17853799874','llll','96e79218965eb72c92a549dd5a330112','health'),(40,'17853799873','dz','96e79218965eb72c92a549dd5a330112','health'),(41,'17853799872','litangdingzhen','96e79218965eb72c92a549dd5a330112','health'),(42,'17853799870','litangwang','96e79218965eb72c92a549dd5a330112','health'),(43,'17853799832','dsm','96e79218965eb72c92a549dd5a330112','health'),(45,'15965101000','zsr','96e79218965eb72c92a549dd5a330112','health'),(46,'18266857599','zhaoshirui','96e79218965eb72c92a549dd5a330112','abnormal');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'epidemic_site_code_management_system'
--

--
-- Dumping routines for database 'epidemic_site_code_management_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-26 13:41:47
