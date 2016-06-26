-- MySQL dump 10.16  Distrib 10.1.14-MariaDB, for Linux (x86_64)
--
-- Host: 172.17.0.2    Database: mima
-- ------------------------------------------------------
-- Server version	10.1.14-MariaDB-1~jessie

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add artist',7,'add_artist'),(20,'Can change artist',7,'change_artist'),(21,'Can delete artist',7,'delete_artist'),(22,'Can add song',8,'add_song'),(23,'Can change song',8,'change_song'),(24,'Can delete song',8,'delete_song'),(25,'Can add fact',9,'add_fact'),(26,'Can change fact',9,'change_fact'),(27,'Can delete fact',9,'delete_fact');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$XjgSo5xbeEdA$T//vZEP/KsOHWnjRaJID7VpicWu82E/WooZQyOAWwMc=','2016-06-20 10:09:57.926746',1,'admin','','','',1,1,'2016-06-20 10:09:51.222272');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-06-20 10:10:28.374877','1','Artist object',1,'Added.',7,1),(2,'2016-06-20 10:10:33.317692','1','Artist object',2,'No fields changed.',7,1),(3,'2016-06-20 10:10:46.260301','2','Artist object',1,'Added.',7,1),(4,'2016-06-20 10:11:02.300684','3','Artist object',1,'Added.',7,1),(5,'2016-06-20 10:11:09.366063','4','Artist object',1,'Added.',7,1),(6,'2016-06-20 10:11:57.057410','1','Song object',1,'Added.',8,1),(7,'2016-06-20 10:12:11.611320','2','Song object',1,'Added.',8,1),(8,'2016-06-20 10:12:24.732346','3','Song object',1,'Added.',8,1),(9,'2016-06-20 10:12:35.094283','4','Song object',1,'Added.',8,1),(10,'2016-06-20 10:13:42.749938','1','Fact object',1,'Added.',9,1),(11,'2016-06-20 10:13:55.531265','2','Fact object',1,'Added.',9,1),(12,'2016-06-20 10:14:08.229068','3','Fact object',1,'Added.',9,1),(13,'2016-06-20 10:14:18.164843','4','Fact object',1,'Added.',9,1),(14,'2016-06-20 10:14:32.709364','5','Fact object',1,'Added.',9,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'facts','artist'),(9,'facts','fact'),(8,'facts','song'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-06-20 09:37:17.098314'),(2,'auth','0001_initial','2016-06-20 09:37:17.511189'),(3,'admin','0001_initial','2016-06-20 09:37:17.551806'),(4,'admin','0002_logentry_remove_auto_add','2016-06-20 09:37:17.572637'),(5,'contenttypes','0002_remove_content_type_name','2016-06-20 09:37:17.619854'),(6,'auth','0002_alter_permission_name_max_length','2016-06-20 09:37:17.641924'),(7,'auth','0003_alter_user_email_max_length','2016-06-20 09:37:17.665618'),(8,'auth','0004_alter_user_username_opts','2016-06-20 09:37:17.681678'),(9,'auth','0005_alter_user_last_login_null','2016-06-20 09:37:17.702173'),(10,'auth','0006_require_contenttypes_0002','2016-06-20 09:37:17.704171'),(11,'auth','0007_alter_validators_add_error_messages','2016-06-20 09:37:17.723053'),(12,'facts','0001_initial','2016-06-20 09:37:17.811394'),(13,'facts','0002_remove_fact_artist','2016-06-20 09:37:17.831615'),(14,'sessions','0001_initial','2016-06-20 09:37:17.845457');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3f1ksecb8cgccc9g1irtf7kb5taq8cfp','YTA3MmIyOGM3ZWJhNzdhODgyZDQyNDM5NTJhMGQ3NTgxMmZlYTk2Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE5MmMyM2Q1MTlkNDk0MjdhNDVmZmRhOGIyZDljZTE1NDczM2RkMjgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-07-04 10:09:57.928779');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facts_artist`
--

DROP TABLE IF EXISTS `facts_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facts_artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts_artist`
--

LOCK TABLES `facts_artist` WRITE;
/*!40000 ALTER TABLE `facts_artist` DISABLE KEYS */;
INSERT INTO `facts_artist` VALUES (1,'ניסים','גראמה'),(2,'משה','שושן'),(3,'חופני','כהן'),(4,'חני','לבנה'),(5,'איזי והפתולוגים',NULL),(6,'אבי גרייניק','אבי גרייניק'),(7,'אבי טולדנו','אבי טולדנו'),(8,'אביב גפן','אביב גפן'),(9,'אביגייל רוז','אביגייל רוז'),(10,'אביתר בנאי','אביתר בנאי'),(11,'אבנר גדסי','אבנר גדסי'),(12,'אברהם טל','אברהם טל'),(13,'אדם','אדם'),(14,'אהוד בנאי','אהוד בנאי'),(15,'אוהד חיטמן','אוהד חיטמן'),(16,'אורי מור','אורי מור'),(17,'אורי רווח','אורי רווח'),(18,'אורלי זילברשץ בנאי','אורלי זילברשץ בנאי'),(19,'אורנה ומשה דץ','אורנה ומשה דץ'),(20,'אושיק לוי','אושיק לוי'),(21,'אחרית הימים','אחרית הימים'),(22,'אטרף','אטרף'),(23,'איגי וקסמן','איגי וקסמן'),(24,'איה כורם','איה כורם'),(25,'איזי והפתולוגים','איזי והפתולוגים'),(26,'אייל גולן','אייל גולן'),(27,'אילן ואילנית','אילן ואילנית'),(28,'אילן וירצברג','אילן וירצברג'),(29,'אילנה רובינא','אילנה רובינא'),(30,'אילנה רובינא ושמעון ישראלי  ','אילנה רובינא ושמעון ישראלי  '),(31,'אילנית','אילנית'),(32,'אינפקציה','אינפקציה'),(33,'איפה הילד','איפה הילד'),(34,'איתי פרל','איתי פרל'),(35,'אלונה דניאל','אלונה דניאל'),(36,'אלי מגן','אלי מגן'),(37,'אליסף קובנר','אליסף קובנר'),(38,'אליפלט','אליפלט'),(39,'אם תלך','אם תלך'),(40,'אסי אברג','אסי אברג'),(41,'אסף אמדורסקי','אסף אמדורסקי'),(42,'אסף וייס','אסף וייס'),(43,'אסף קרן ולהקת מוסיקת המקרה','אסף קרן ולהקת מוסיקת המקרה'),(44,'אסתר עופרים','אסתר עופרים'),(45,'אסתר שמיר','אסתר שמיר'),(46,'אפרים שמיר','אפרים שמיר'),(47,'אפרת בן צור','אפרת בן צור'),(48,'אפרת גוש','אפרת גוש'),(49,'ארז לב ארי','ארז לב ארי'),(50,'אריאל הורוביץ','אריאל הורוביץ'),(51,'אריאל זילבר','אריאל זילבר'),(52,'אריק איינשטיין','אריק איינשטיין'),(53,'אריק איינשטיין ושלום חנוך','אריק איינשטיין ושלום חנוך'),(54,'אריק ברמן','אריק ברמן'),(55,'אריק לביא','אריק לביא'),(56,'אריק סיני','אריק סיני'),(57,'ארקדי דוכין','ארקדי דוכין'),(58,'אתי אנקרי','אתי אנקרי'),(59,'אתניקס','אתניקס'),(60,'אבי גרייניק','אבי גרייניק'),(61,'אבי טולדנו','אבי טולדנו'),(62,'אביב גפן','אביב גפן'),(63,'אביגייל רוז','אביגייל רוז'),(64,'אביתר בנאי','אביתר בנאי'),(65,'אבנר גדסי','אבנר גדסי'),(66,'אברהם טל','אברהם טל'),(67,'אדם','אדם'),(68,'אהוד בנאי','אהוד בנאי'),(69,'אוהד חיטמן','אוהד חיטמן'),(70,'אורי מור','אורי מור'),(71,'אורי רווח','אורי רווח'),(72,'אורלי זילברשץ בנאי','אורלי זילברשץ בנאי'),(73,'אורנה ומשה דץ','אורנה ומשה דץ'),(74,'אושיק לוי','אושיק לוי'),(75,'אחרית הימים','אחרית הימים'),(76,'אטרף','אטרף'),(77,'איגי וקסמן','איגי וקסמן'),(78,'איה כורם','איה כורם'),(79,'איזי והפתולוגים','איזי והפתולוגים'),(80,'אייל גולן','אייל גולן'),(81,'אילן ואילנית','אילן ואילנית'),(82,'אילן וירצברג','אילן וירצברג'),(83,'אילנה רובינא','אילנה רובינא'),(84,'אילנה רובינא ושמעון ישראלי  ','אילנה רובינא ושמעון ישראלי  '),(85,'אילנית','אילנית'),(86,'אינפקציה','אינפקציה'),(87,'איפה הילד','איפה הילד'),(88,'איתי פרל','איתי פרל'),(89,'אלונה דניאל','אלונה דניאל'),(90,'אלי מגן','אלי מגן'),(91,'אליסף קובנר','אליסף קובנר'),(92,'אליפלט','אליפלט'),(93,'אם תלך','אם תלך'),(94,'אסי אברג','אסי אברג'),(95,'אסף אמדורסקי','אסף אמדורסקי'),(96,'אסף וייס','אסף וייס'),(97,'אסף קרן ולהקת מוסיקת המקרה','אסף קרן ולהקת מוסיקת המקרה'),(98,'אסתר עופרים','אסתר עופרים'),(99,'אסתר שמיר','אסתר שמיר'),(100,'אפרים שמיר','אפרים שמיר'),(101,'אפרת בן צור','אפרת בן צור'),(102,'אפרת גוש','אפרת גוש'),(103,'ארז לב ארי','ארז לב ארי'),(104,'אריאל הורוביץ','אריאל הורוביץ'),(105,'אריאל זילבר','אריאל זילבר'),(106,'אריק איינשטיין','אריק איינשטיין'),(107,'אריק איינשטיין ושלום חנוך','אריק איינשטיין ושלום חנוך'),(108,'אריק ברמן','אריק ברמן'),(109,'אריק לביא','אריק לביא'),(110,'אריק סיני','אריק סיני'),(111,'ארקדי דוכין','ארקדי דוכין'),(112,'אתי אנקרי','אתי אנקרי'),(113,'אתניקס','אתניקס'),(114,'בוטן מתוק בקרקס','בוטן מתוק בקרקס'),(115,'בועז בנאי','בועז בנאי'),(116,'בטי','בטי'),(117,'בית הבובות','בית הבובות'),(118,'בן ארצי','בן ארצי'),(119,'בני אמדורסקי','בני אמדורסקי'),(120,'בני בשן','בני בשן'),(121,'בעז שרעבי','בעז שרעבי'),(122,'בצל ירוק','בצל ירוק'),(123,'ברי סחרוף','ברי סחרוף'),(124,'ברי סחרוף ורע מוכיח','ברי סחרוף ורע מוכיח'),(125,'ברכה צפירה','ברכה צפירה'),(126,'גזוז','גזוז'),(127,'גידי גוב','גידי גוב'),(128,'גידי גוב ומיקה קרני','גידי גוב ומיקה קרני'),(129,'גילי וגלית','גילי וגלית'),(130,'גירפות','גירפות'),(131,'גל דה פז','גל דה פז'),(132,'גלי עטרי','גלי עטרי'),(133,'גליה ירון','גליה ירון'),(134,'גלעד שגב','גלעד שגב'),(135,'גרי אקשטיין','גרי אקשטיין'),(136,'גשר הירקון','גשר הירקון'),(137,'דודה','דודה'),(138,'דודו זכאי','דודו זכאי'),(139,'דודו טסה','דודו טסה'),(140,'דויד ברוזה','דויד ברוזה'),(141,'דורון מזר','דורון מזר'),(142,'דורי בן זאב','דורי בן זאב'),(143,'דורית ראובני','דורית ראובני'),(144,'דידי שחר','דידי שחר'),(145,'דין דין אביב','דין דין אביב'),(146,'דן תורן','דן תורן'),(147,'דנה אינטרנשיונל','דנה אינטרנשיונל'),(148,'דנה ברגר','דנה ברגר'),(149,'דני בסן','דני בסן'),(150,'דני ליטני','דני ליטני'),(151,'דני סנדרסון','דני סנדרסון'),(152,'דני רובס','דני רובס'),(153,'דניאל סלומון','דניאל סלומון'),(154,'דפנה ארמוני','דפנה ארמוני'),(155,'דפנה דקל','דפנה דקל'),(156,'דפנה והעוגיות','דפנה והעוגיות'),(157,'דקלון','דקלון'),(158,'האחיות יוספי','האחיות יוספי'),(159,'האחים והאחיות','האחים והאחיות'),(160,'האחים לוי','האחים לוי'),(161,'הבטלנים - נתן דטנר ואבי קושניר','הבטלנים - נתן דטנר ואבי קושניר'),(162,'הבילויים','הבילויים'),(163,'הבנות נחמה','הבנות נחמה'),(164,'הגבעטרון','הגבעטרון'),(165,'הגשש החיוור','הגשש החיוור'),(166,'הדג נחש','הדג נחש'),(167,'הדורבנים','הדורבנים'),(168,'הזבובים','הזבובים'),(169,'החברים של נטאשה','החברים של נטאשה'),(170,'החלונות הגבוהים','החלונות הגבוהים'),(171,'הטוב הרע והנערה','הטוב הרע והנערה'),(172,'היהודים','היהודים'),(173,'היי פייב','היי פייב'),(174,'הכבש השישה עשר','הכבש השישה עשר'),(175,'הכל עובר חביבי','הכל עובר חביבי'),(176,'הלילה','הלילה'),(177,'המכשפות','המכשפות'),(178,'הנשמות הטהורות','הנשמות הטהורות'),(179,'הפה והטלפיים','הפה והטלפיים'),(180,'הפיל נכחול','הפיל נכחול'),(181,'הפרברים','הפרברים'),(182,'הפרברים והדודאים','הפרברים והדודאים'),(183,'הראל מויאל','הראל מויאל'),(184,'הראל סקעת','הראל סקעת'),(185,'השוונג של הפיתה','השוונג של הפיתה'),(186,'השלושרים','השלושרים'),(187,'השמחות','השמחות'),(188,'השפן הנכון','השפן הנכון'),(189,'התאומים','התאומים'),(190,'התרנגולים','התרנגולים'),(191,'ורדינה כהן','ורדינה כהן'),(192,'זוהר ארגוב','זוהר ארגוב'),(193,'זקני צפת','זקני צפת'),(194,'חבורת אטומיק','חבורת אטומיק'),(195,'חדווה ודוד','חדווה ודוד'),(196,'חובבי ציון','חובבי ציון'),(197,'חוה אלברשטיין','חוה אלברשטיין'),(198,'חיים משה','חיים משה'),(199,'חיים צינוביץ','חיים צינוביץ'),(200,'חלוצי החלל','חלוצי החלל'),(201,'חמי רודנר','חמי רודנר'),(202,'חמסה','חמסה'),(203,'חנן אלבלק','חנן אלבלק'),(204,'חנן יובל','חנן יובל'),(205,'טאטו','טאטו'),(206,'טיפקס','טיפקס'),(207,'טל שגב','טל שגב'),(208,'יגאל בשן','יגאל בשן'),(209,'יגאל בשן ולהקת פיקוד צפון','יגאל בשן ולהקת פיקוד צפון'),(210,'יגאל כרמל','יגאל כרמל'),(211,'יהודה עדר','יהודה עדר'),(212,'יהודה פוליקר','יהודה פוליקר'),(213,'יהודית רביץ','יהודית רביץ'),(214,'יהודית תמיר','יהודית תמיר'),(215,'יהורם גאון','יהורם גאון'),(216,'יובל בנאי','יובל בנאי'),(217,'יוני בלוך','יוני בלוך'),(218,'יוני רועה','יוני רועה'),(219,'יוני רכטר','יוני רכטר'),(220,'יוסי בנאי','יוסי בנאי'),(221,'יורם ארבל','יורם ארבל'),(222,'יזהר אשדות','יזהר אשדות'),(223,'יזהר כהן','יזהר כהן'),(224,'יידישע פיראטען','יידישע פיראטען'),(225,'יעל לוי','יעל לוי'),(226,'יענקלה רוטבליט','יענקלה רוטבליט'),(227,'יפה ירקוני','יפה ירקוני'),(228,'יצחק קלפטר','יצחק קלפטר'),(229,'יציאת חירום','יציאת חירום'),(230,'ירדנה ארזי','ירדנה ארזי'),(231,'ירמי קפלן','ירמי קפלן'),(232,'ישי לוי','ישי לוי'),(233,'ישראל יצחקי','ישראל יצחקי'),(234,'כוורת','כוורת'),(235,'כיף התקוה הטובה','כיף התקוה הטובה'),(236,'כלא 6','כלא 6'),(237,'כמו צועני','כמו צועני'),(238,'כנסיית השכל','כנסיית השכל'),(239,'כרמלה גרוס ואגנר','כרמלה גרוס ואגנר'),(240,'להקה רטורית','להקה רטורית'),(241,'להקת גייסות השריון','להקת גייסות השריון'),(242,'להקת הנח\"ל','להקת הנח\"ל'),(243,'להקת התותחנים','להקת התותחנים'),(244,'להקת חיל האוויר','להקת חיל האוויר'),(245,'להקת פיקוד הדרום','להקת פיקוד הדרום'),(246,'להקת פיקוד המרכז','להקת פיקוד המרכז'),(247,'להקת פיקוד הצפון','להקת פיקוד הצפון'),(248,'לולה','לולה'),(249,'ליאור ייני','ליאור ייני'),(250,'ליאת יצחקי','ליאת יצחקי'),(251,'ליליה','ליליה'),(252,'לך תזכור','לך תזכור'),(253,'ללדין','ללדין'),(254,'מאור כהן','מאור כהן'),(255,'מאיה בוסקילה','מאיה בוסקילה'),(256,'מאיר אריאל','מאיר אריאל'),(257,'מאיר בנאי','מאיר בנאי'),(258,'מוטי פליישר','מוטי פליישר'),(259,'מוניקה סקס','מוניקה סקס'),(260,'מופע הארנבות של דוקטור קספר','מופע הארנבות של דוקטור קספר'),(261,'מוקי','מוקי'),(262,'מוש בן ארי','מוש בן ארי'),(263,'מטרופולין','מטרופולין'),(264,'מיטל טרבלסי','מיטל טרבלסי'),(265,'מיכאל גריילסאמר','מיכאל גריילסאמר'),(266,'מיכה שטרית','מיכה שטרית'),(267,'מיכל אמדורסקי','מיכל אמדורסקי'),(268,'מיקה קרני','מיקה קרני'),(269,'מיקי גבריאלוב','מיקי גבריאלוב'),(270,'מירי אלוני','מירי אלוני'),(271,'מירי מסיקה','מירי מסיקה'),(272,'מנגו','מנגו'),(273,'מני בגר','מני בגר'),(274,'מרגלית צנעני','מרגלית צנעני'),(275,'משה בקר','משה בקר'),(276,'משה פרץ','משה פרץ'),(277,'משינה','משינה'),(278,'מתי כספי','מתי כספי'),(279,'נוער שוליים','נוער שוליים'),(280,'נורית גלרון','נורית גלרון'),(281,'נושאי המגבעת','נושאי המגבעת'),(282,'ניצה טרמין','ניצה טרמין'),(283,'נירה גל','נירה גל'),(284,'נעם רותם','נעם רותם'),(285,'נעמי שמר','נעמי שמר'),(286,'נקמת הטרקטור','נקמת הטרקטור'),(287,'נתן כהן','נתן כהן'),(288,'נתנאלה','נתנאלה'),(289,'סאבלימינל','סאבלימינל'),(290,'סגול 59','סגול 59'),(291,'סדרני הדשא','סדרני הדשא'),(292,'סוליקו','סוליקו'),(293,'סטלה מאריס','סטלה מאריס'),(294,'סי היימן','סי היימן'),(295,'סיון שביט','סיון שביט'),(296,'סינרגיה','סינרגיה'),(297,'סמיר שוקרי','סמיר שוקרי'),(298,'עברי לידר','עברי לידר'),(299,'עדנה גורן','עדנה גורן'),(300,'עדנה לב','עדנה לב'),(301,'עוזי חיטמן','עוזי חיטמן'),(302,'עוזי פוקס','עוזי פוקס'),(303,'עופר אקרלינג','עופר אקרלינג'),(304,'עופר לוי ולאה לופטין','עופר לוי ולאה לופטין'),(305,'עידו לדרמן','עידו לדרמן'),(306,'עידן עמדי','עידן עמדי'),(307,'עידן רייכל','עידן רייכל'),(308,'עלמה זהר','עלמה זהר'),(309,'עמיר בניון','עמיר בניון'),(310,'עמיר בניון ומיכה שטרית','עמיר בניון ומיכה שטרית'),(311,'עמיר לב','עמיר לב'),(312,'עמית פרקש','עמית פרקש'),(313,'ענבל פרלמוטר','ענבל פרלמוטר'),(314,'עפרה חזה','עפרה חזה'),(315,'עקיבא נוף','עקיבא נוף'),(316,'ערן צור','ערן צור'),(317,'פבלו רוזנברג','פבלו רוזנברג'),(318,'פונץ','פונץ'),(319,'פופלקס','פופלקס'),(320,'פורטיסחרוף','פורטיסחרוף'),(321,'פיטר רוט','פיטר רוט'),(322,'פנינה רוזנבלום','פנינה רוזנבלום'),(323,'פרוייקט 30','פרוייקט 30'),(324,'פרישמן והחלוצים עם סגול 59','פרישמן והחלוצים עם סגול 59'),(325,'צביקה פיק','צביקה פיק'),(326,'צוות הווי הנח\"ל','צוות הווי הנח\"ל'),(327,'צוות הווי צנחנים','צוות הווי צנחנים'),(328,'ציפי שביט','ציפי שביט'),(329,'צליל מכוון','צליל מכוון'),(330,'צלילי העוד','צלילי העוד'),(331,'צמד העופרים','צמד העופרים'),(332,'קובי אוז','קובי אוז'),(333,'קובי אפללו','קובי אפללו'),(334,'קוואמי','קוואמי'),(335,'קורין אלאל','קורין אלאל'),(336,'קצת אחרת','קצת אחרת'),(337,'קרן הכט','קרן הכט'),(338,'קרן פלס','קרן פלס'),(339,'רביעיית הזמר של חיל האוויר','רביעיית הזמר של חיל האוויר'),(340,'רבקה זוהר','רבקה זוהר'),(341,'רוחמה רז','רוחמה רז'),(342,'רון שובל','רון שובל'),(343,'רונה קינן','רונה קינן'),(344,'רונה קינן וגידי גוב','רונה קינן וגידי גוב'),(345,'רונית שחר','רונית שחר'),(346,'רונן בן טל','רונן בן טל'),(347,'רוקפור','רוקפור'),(348,'רחל אטאס','רחל אטאס'),(349,'ריטה','ריטה'),(350,'ריקי גל','ריקי גל'),(351,'רם אוריון','רם אוריון'),(352,'רמי פורטיס','רמי פורטיס'),(353,'רמי קליינשטיין','רמי קליינשטיין'),(354,'רן דנקר ועילי בוטנר','רן דנקר ועילי בוטנר'),(355,'רעש','רעש'),(356,'רפי פרסקי','רפי פרסקי'),(357,'שב\"ק ס','שב\"ק ס'),(358,'שוטי הנבואה','שוטי הנבואה'),(359,'שולה חן','שולה חן'),(360,'שולי נתן','שולי נתן'),(361,'שולי רנד','שולי רנד'),(362,'שוקולד מנטה מסטיק','שוקולד מנטה מסטיק'),(363,'שוקי ודורית','שוקי ודורית'),(364,'שושנה דמארי','שושנה דמארי'),(365,'שושנה דמארי ועידן רייכל','שושנה דמארי ועידן רייכל'),(366,'שי גבסו','שי גבסו'),(367,'שי זורניצר','שי זורניצר'),(368,'שילה פרבר','שילה פרבר'),(369,'שירי מימון','שירי מימון'),(370,'שלום גד','שלום גד'),(371,'שלום חנוך','שלום חנוך'),(372,'שלומי שבן','שלומי שבן'),(373,'שלומי שבן וחוה אלברשטיין','שלומי שבן וחוה אלברשטיין'),(374,'שלומי שבת','שלומי שבת'),(375,'שלישיית גשר הירקון','שלישיית גשר הירקון'),(376,'שלישיית דרך הגב','שלישיית דרך הגב'),(377,'שלישיית התאומים','שלישיית התאומים'),(378,'שלמה ארצי','שלמה ארצי'),(379,'שלמה בר','שלמה בר'),(380,'שלמה גרוניך','שלמה גרוניך'),(381,'שלמה גרוניך ומתי כספי','שלמה גרוניך ומתי כספי'),(382,'שלמה יידוב','שלמה יידוב'),(383,'שם טוב לוי','שם טוב לוי'),(384,'שמוליק קראוס','שמוליק קראוס'),(385,'שמשון בר נוי','שמשון בר נוי'),(386,'שפי ישי','שפי ישי'),(387,'שפיות זמנית','שפיות זמנית'),(388,'שרון הולצמן','שרון הולצמן'),(389,'שרון חזיז','שרון חזיז'),(390,'שרון ליפשיץ','שרון ליפשיץ'),(391,'שרון רוטר','שרון רוטר'),(392,'שרית חדד','שרית חדד'),(393,'ששי קשת','ששי קשת'),(394,'תומר יוסף','תומר יוסף'),(395,'תיסלם','תיסלם'),(396,'תיקי דיין','תיקי דיין'),(397,'תמוז','תמוז'),(398,'תמי','תמי'),(399,'תמר גלעדי','תמר גלעדי'),(400,'תערובת אסקוט','תערובת אסקוט');
/*!40000 ALTER TABLE `facts_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facts_fact`
--

DROP TABLE IF EXISTS `facts_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facts_fact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fact` longtext NOT NULL,
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facts_fact_e5c27d73` (`song_id`),
  CONSTRAINT `facts_fact_song_id_c7a39239_fk_facts_song_id` FOREIGN KEY (`song_id`) REFERENCES `facts_song` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts_fact`
--

LOCK TABLES `facts_fact` WRITE;
/*!40000 ALTER TABLE `facts_fact` DISABLE KEYS */;
INSERT INTO `facts_fact` VALUES (1,'\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"',4),(2,'\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"',3),(3,'\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"',4),(4,'\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"',3),(5,'\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"',2);
/*!40000 ALTER TABLE `facts_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facts_song`
--

DROP TABLE IF EXISTS `facts_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facts_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `release_date` date NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facts_song_artist_id_4a65aba9_fk_facts_artist_id` (`artist_id`),
  KEY `facts_song_b068931c` (`name`),
  KEY `facts_song_1d0083dc` (`release_date`),
  CONSTRAINT `facts_song_artist_id_4a65aba9_fk_facts_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `facts_artist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts_song`
--

LOCK TABLES `facts_song` WRITE;
/*!40000 ALTER TABLE `facts_song` DISABLE KEYS */;
INSERT INTO `facts_song` VALUES (1,'לילה ליל לילהל','2016-06-20',4),(2,'ערברבששדג','2016-06-20',4),(3,'שדש דצל שדד','2016-06-20',3),(4,'דשדש','2016-06-20',3);
/*!40000 ALTER TABLE `facts_song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-24 17:55:28
