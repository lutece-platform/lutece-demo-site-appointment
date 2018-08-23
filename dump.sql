-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: appointmentdemo
-- ------------------------------------------------------
-- Server version	10.1.22-MariaDB

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
-- Table structure for table `appointment_appointment`
--

DROP TABLE IF EXISTS `appointment_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_appointment` (
  `id_appointment` int(11) NOT NULL,
  `reference` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nb_places` int(11) NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `id_action_cancelled` int(11) DEFAULT NULL,
  `notification` int(11) NOT NULL DEFAULT '0',
  `id_admin_user` int(11) DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `id_slot` int(11) NOT NULL,
  PRIMARY KEY (`id_appointment`,`id_user`,`id_slot`),
  KEY `fk_appointment_appointment_appointment_user_idx` (`id_user`),
  KEY `fk_appointment_appointment_appointment_slot_idx` (`id_slot`),
  KEY `reference_idx` (`reference`),
  CONSTRAINT `fk_appointment_appointment_appointment_slot` FOREIGN KEY (`id_slot`) REFERENCES `appointment_slot` (`id_slot`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_appointment_appointment_user` FOREIGN KEY (`id_user`) REFERENCES `appointment_user` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment`
--

LOCK TABLES `appointment_appointment` WRITE;
/*!40000 ALTER TABLE `appointment_appointment` DISABLE KEYS */;
INSERT INTO `appointment_appointment` VALUES (14,'1490026',1,0,103,0,0,7,31),(15,'15566f1',1,0,103,0,0,8,32),(16,'1621188',1,0,103,0,0,9,33),(17,'17b8a49',1,0,103,0,0,10,34),(18,'183d524',1,0,103,0,0,11,35),(19,'19eb0c5',1,0,103,0,0,12,36),(20,'203ff92',1,0,103,0,0,13,37),(21,'217e693',1,0,103,0,0,14,38),(22,'221341e',1,0,103,0,0,15,40),(23,'23e394a',1,0,103,0,0,16,41),(24,'24dc824',1,0,103,0,0,17,42),(25,'259935e',1,0,0,0,0,18,43),(26,'2649230',1,0,103,0,0,19,44),(27,'27066ca',1,0,103,0,0,20,39),(28,'281d55a',1,0,103,0,0,21,45),(29,'29c9e8d',1,0,103,0,0,22,46),(30,'30919d7',1,0,103,0,0,23,47);
/*!40000 ALTER TABLE `appointment_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_appointment_response`
--

DROP TABLE IF EXISTS `appointment_appointment_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_appointment_response` (
  `id_appointment_response` int(11) NOT NULL,
  `id_response` int(11) NOT NULL,
  `id_appointment` int(11) NOT NULL,
  PRIMARY KEY (`id_appointment_response`,`id_response`,`id_appointment`),
  UNIQUE KEY `unique_index` (`id_appointment`,`id_response`),
  KEY `fk_appointment_appointment_response_appointment_appointment_idx` (`id_appointment`),
  CONSTRAINT `fk_appointment_appointment_response_appointment_appointment` FOREIGN KEY (`id_appointment`) REFERENCES `appointment_appointment` (`id_appointment`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment_response`
--

LOCK TABLES `appointment_appointment_response` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_response` DISABLE KEYS */;
INSERT INTO `appointment_appointment_response` VALUES (130,130,14),(131,131,14),(132,132,14),(133,133,14),(134,134,14),(135,135,14),(136,136,14),(137,137,14),(138,138,14),(139,139,14),(140,140,14),(141,141,14),(142,142,14),(143,143,14),(144,144,14),(145,145,14),(146,146,14),(147,147,14),(148,148,14),(149,149,14),(150,150,15),(151,151,15),(152,152,15),(153,153,15),(154,154,15),(155,155,15),(156,156,15),(157,157,15),(158,158,15),(159,159,15),(160,160,15),(161,161,15),(162,162,15),(163,163,15),(164,164,15),(165,165,15),(166,166,15),(167,167,15),(168,168,15),(169,169,15),(170,170,16),(171,171,16),(172,172,16),(173,173,16),(174,174,16),(175,175,16),(176,176,16),(177,177,16),(178,178,16),(179,179,16),(180,180,16),(181,181,16),(182,182,16),(183,183,16),(184,184,16),(185,185,16),(186,186,16),(187,187,16),(188,188,16),(189,189,16),(190,190,17),(191,191,17),(192,192,17),(193,193,17),(194,194,17),(195,195,17),(196,196,17),(197,197,17),(198,198,17),(199,199,17),(200,200,17),(201,201,17),(202,202,17),(203,203,17),(204,204,17),(205,205,17),(206,206,17),(207,207,17),(208,208,17),(209,209,17),(210,210,18),(211,211,18),(212,212,18),(213,213,18),(214,214,18),(215,215,18),(216,216,18),(217,217,18),(218,218,18),(219,219,18),(220,220,18),(221,221,18),(222,222,18),(223,223,18),(224,224,18),(225,225,18),(226,226,18),(227,227,18),(228,228,18),(229,229,18),(230,230,19),(231,231,19),(232,232,19),(233,233,19),(234,234,19),(235,235,19),(236,236,19),(237,237,19),(238,238,19),(239,239,19),(240,240,19),(241,241,19),(242,242,19),(243,243,19),(244,244,19),(245,245,19),(246,246,19),(247,247,19),(248,248,19),(249,249,19),(250,250,20),(251,251,20),(252,252,20),(253,253,20),(254,254,20),(255,255,20),(256,256,20),(257,257,20),(258,258,20),(259,259,20),(260,260,20),(261,261,20),(262,262,20),(263,263,20),(264,264,20),(265,265,20),(266,266,20),(267,267,20),(268,268,20),(269,269,20),(270,270,21),(271,271,21),(272,272,21),(273,273,21),(274,274,21),(275,275,21),(276,276,21),(277,277,21),(278,278,21),(279,279,21),(280,280,21),(281,281,21),(282,282,21),(283,283,21),(284,284,21),(285,285,21),(286,286,21),(287,287,21),(288,288,21),(289,289,21),(290,290,22),(291,291,22),(292,292,22),(293,293,22),(294,294,22),(295,295,22),(296,296,22),(297,297,22),(298,298,22),(299,299,22),(300,300,22),(301,301,22),(302,302,22),(303,303,22),(304,304,22),(305,305,22),(306,306,22),(307,307,22),(308,308,22),(309,309,22),(310,310,23),(311,311,23),(312,312,23),(313,313,23),(314,314,23),(315,315,23),(316,316,23),(317,317,23),(318,318,23),(319,319,23),(320,320,23),(321,321,23),(322,322,23),(323,323,23),(324,324,23),(325,325,23),(326,326,23),(327,327,23),(328,328,23),(329,329,23),(330,330,24),(331,331,24),(332,332,24),(333,333,24),(334,334,24),(335,335,24),(336,336,24),(337,337,24),(338,338,24),(339,339,24),(340,340,24),(341,341,24),(342,342,24),(343,343,24),(344,344,24),(345,345,24),(346,346,24),(347,347,24),(348,348,24),(349,349,24),(350,350,25),(351,351,25),(352,352,25),(353,353,25),(354,354,25),(355,355,25),(356,356,25),(357,357,25),(358,358,25),(359,359,25),(360,360,25),(361,361,25),(362,362,25),(363,363,25),(364,364,25),(365,365,25),(366,366,25),(367,367,25),(368,368,25),(369,369,25),(370,370,26),(371,371,26),(372,372,26),(373,373,26),(374,374,26),(375,375,26),(376,376,26),(377,377,26),(378,378,26),(379,379,26),(380,380,26),(381,381,26),(382,382,26),(383,383,26),(384,384,26),(385,385,26),(386,386,26),(387,387,26),(388,388,26),(389,389,26),(390,390,27),(391,391,27),(392,392,27),(393,393,27),(394,394,27),(395,395,27),(396,396,27),(397,397,27),(398,398,27),(399,399,27),(400,400,27),(401,401,27),(402,402,27),(403,403,27),(404,404,27),(405,405,27),(406,406,27),(407,407,27),(408,408,27),(409,409,27),(410,410,28),(411,411,28),(412,412,28),(413,413,28),(414,414,28),(415,415,28),(416,416,28),(417,417,28),(418,418,28),(419,419,28),(420,420,28),(421,421,28),(422,422,28),(423,423,28),(424,424,28),(425,425,28),(426,426,28),(427,427,28),(428,428,28),(429,429,28),(430,430,29),(431,431,29),(432,432,29),(433,433,29),(434,434,29),(435,435,29),(436,436,29),(437,437,29),(438,438,29),(439,439,29),(440,440,29),(441,441,29),(442,442,29),(443,443,29),(444,444,29),(445,445,29),(446,446,29),(447,447,29),(448,448,29),(449,449,29),(450,450,30),(451,451,30),(452,452,30),(453,453,30),(454,454,30),(455,455,30),(456,456,30),(457,457,30),(458,458,30),(459,459,30),(460,460,30),(461,461,30),(462,462,30),(463,463,30),(464,464,30),(465,465,30),(466,466,30),(467,467,30),(468,468,30),(469,469,30);
/*!40000 ALTER TABLE `appointment_appointment_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_calendar_template`
--

DROP TABLE IF EXISTS `appointment_calendar_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_calendar_template` (
  `id_calendar_template` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_calendar_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_calendar_template`
--

LOCK TABLES `appointment_calendar_template` WRITE;
/*!40000 ALTER TABLE `appointment_calendar_template` DISABLE KEYS */;
INSERT INTO `appointment_calendar_template` VALUES (1,'Calendar','Display all slots','skin/plugins/appointment/calendar/appointment_form_calendar.html'),(2,'Opening days calendar','Display all slots on opening days','skin/plugins/appointment/calendar/appointment_form_calendar_opendays.html'),(3,'Vacant slots calendar','Display only vacant slots','skin/plugins/appointment/calendar/appointment_form_list_open_slots.html'),(4,'Vacant slots on opening days calendar','Display vacant slots on opening days','skin/plugins/appointment/calendar/appointment_form_list_open_slots_opendays.html');
/*!40000 ALTER TABLE `appointment_calendar_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_category`
--

DROP TABLE IF EXISTS `appointment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_category` (
  `id_category` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `unique_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_category`
--

LOCK TABLES `appointment_category` WRITE;
/*!40000 ALTER TABLE `appointment_category` DISABLE KEYS */;
INSERT INTO `appointment_category` VALUES (1,'cityhall'),(2,'identification');
/*!40000 ALTER TABLE `appointment_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_closing_day`
--

DROP TABLE IF EXISTS `appointment_closing_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_closing_day` (
  `id_closing_day` int(11) NOT NULL,
  `date_of_closing_day` date NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_closing_day`,`id_form`),
  UNIQUE KEY `unique_index` (`id_form`,`date_of_closing_day`),
  KEY `fk_appointment_closing_day_appointment_form_idx` (`id_form`),
  KEY `date_of_closing_day` (`date_of_closing_day`),
  CONSTRAINT `fk_appointment_closing_day_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_closing_day`
--

LOCK TABLES `appointment_closing_day` WRITE;
/*!40000 ALTER TABLE `appointment_closing_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_closing_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_display`
--

DROP TABLE IF EXISTS `appointment_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_display` (
  `id_display` int(11) NOT NULL,
  `display_title_fo` tinyint(1) NOT NULL DEFAULT '0',
  `icon_form_content` mediumblob,
  `icon_form_mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nb_weeks_to_display` int(11) NOT NULL DEFAULT '0',
  `is_displayed_on_portlet` tinyint(1) NOT NULL DEFAULT '1',
  `id_calendar_template` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_display`,`id_calendar_template`,`id_form`),
  UNIQUE KEY `unique_index` (`id_form`),
  KEY `fk_appointment_display_appointment_calendar_template_idx` (`id_calendar_template`),
  KEY `fk_appointment_display_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_display_appointment_calendar_template` FOREIGN KEY (`id_calendar_template`) REFERENCES `appointment_calendar_template` (`id_calendar_template`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_display_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_display`
--

LOCK TABLES `appointment_display` WRITE;
/*!40000 ALTER TABLE `appointment_display` DISABLE KEYS */;
INSERT INTO `appointment_display` VALUES (1,1,'','NULL',3,1,1,1),(2,1,'','NULL',6,1,1,2),(3,1,'','NULL',4,1,1,3);
/*!40000 ALTER TABLE `appointment_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form`
--

DROP TABLE IF EXISTS `appointment_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form` (
  `id_form` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `starting_validity_date` date DEFAULT NULL,
  `ending_validity_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `id_workflow` int(11) DEFAULT NULL,
  `workgroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_form`),
  KEY `starting_validity_date_idx` (`starting_validity_date`),
  KEY `ending_validity_date_idx` (`ending_validity_date`),
  KEY `fk_appointment_form_appointment_category_idx` (`id_category`),
  CONSTRAINT `fk_appointment_form_appointment_category` FOREIGN KEY (`id_category`) REFERENCES `appointment_category` (`id_category`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form`
--

LOCK TABLES `appointment_form` WRITE;
/*!40000 ALTER TABLE `appointment_form` DISABLE KEYS */;
INSERT INTO `appointment_form` VALUES (1,'Registering children','Schedule an appointment to register children','',1,'2018-08-14',NULL,1,101,'all'),(2,'Wedding reservation','Schedule an appointment to get married','',1,'2018-08-14',NULL,1,101,'all'),(3,'Passport','Get a passport','',2,'2018-08-16',NULL,1,101,'all');
/*!40000 ALTER TABLE `appointment_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_message`
--

DROP TABLE IF EXISTS `appointment_form_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form_message` (
  `id_form_message` int(11) NOT NULL,
  `calendar_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_firstname_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_firstname_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_lastname_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_lastname_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_email_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_email_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_confirmationEmail_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_confirmationEmail_help` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_appointment_created` text COLLATE utf8_unicode_ci NOT NULL,
  `url_redirect_after_creation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text_appointment_canceled` text COLLATE utf8_unicode_ci NOT NULL,
  `label_button_redirection` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `no_available_slot` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calendar_description` text COLLATE utf8_unicode_ci NOT NULL,
  `calendar_reserve_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calendar_full_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_form_message`,`id_form`),
  KEY `fk_appointment_form_message_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_form_message_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_message`
--

LOCK TABLES `appointment_form_message` WRITE;
/*!40000 ALTER TABLE `appointment_form_message` DISABLE KEYS */;
INSERT INTO `appointment_form_message` VALUES (1,'Select a date','First name contact','','Last name contact','','Email contact','','Email confirmation contact','','<p>Your appointment request has been created with the reference %%REF%%</p>','jsp/site/Portal.jsp','<p>Your appointment request has been canceled</p>','OK','No available slots have been found. Please repeat your search later.','','Booking','Full',1),(2,'Select a date','First name contact','','Last name contact','','Email contact','','Email confirmation contact','','<p>Your appointment request has been created with the reference %%REF%%</p>','jsp/site/Portal.jsp','<p>Your appointment request has been canceled</p>','OK','No available slots have been found. Please repeat your search later.','','Booking','Full',2),(3,'Select a date','First name','','Last name','','Email','','Email confirmation','','<p>Your appointment request has been created with the reference %%REF%%</p>','jsp/site/Portal.jsp','<p>Your appointment request has been canceled</p>','OK','No available slots have been found. Please repeat your search later.','','Booking','Full',3);
/*!40000 ALTER TABLE `appointment_form_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_portlet`
--

DROP TABLE IF EXISTS `appointment_form_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form_portlet` (
  `id_portlet` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_portlet`,`id_form`),
  KEY `fk_appointment_form_portlet_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_form_portlet_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_portlet`
--

LOCK TABLES `appointment_form_portlet` WRITE;
/*!40000 ALTER TABLE `appointment_form_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_rule`
--

DROP TABLE IF EXISTS `appointment_form_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_form_rule` (
  `id_form_rule` int(11) NOT NULL,
  `is_captcha_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_mandatory_email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_active_authentication` tinyint(1) NOT NULL DEFAULT '0',
  `nb_days_before_new_appointment` int(11) NOT NULL DEFAULT '0',
  `min_time_before_appointment` int(11) NOT NULL DEFAULT '0',
  `nb_max_appointments_per_user` int(11) NOT NULL DEFAULT '0',
  `nb_days_for_max_appointments_per_user` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_form_rule`,`id_form`),
  UNIQUE KEY `unique_index` (`id_form`),
  KEY `fk_appointment_form_rule_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_form_rule_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_rule`
--

LOCK TABLES `appointment_form_rule` WRITE;
/*!40000 ALTER TABLE `appointment_form_rule` DISABLE KEYS */;
INSERT INTO `appointment_form_rule` VALUES (1,0,0,0,0,0,0,0,1),(2,0,0,0,0,0,0,0,2),(3,0,0,0,0,0,0,0,3);
/*!40000 ALTER TABLE `appointment_form_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_localization`
--

DROP TABLE IF EXISTS `appointment_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_localization` (
  `id_localization` int(11) NOT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_localization`,`id_form`),
  KEY `fk_appointment_localization_appointment_form_idx` (`id_form`),
  CONSTRAINT `fk_appointment_localization_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_localization`
--

LOCK TABLES `appointment_localization` WRITE;
/*!40000 ALTER TABLE `appointment_localization` DISABLE KEYS */;
INSERT INTO `appointment_localization` VALUES (1,-76.6032,39.2916,'1001 E Fayette St, Baltimore, MD, 21202, USA',1),(2,-76.5944,39.3265,'Hall of Fame Row, Baltimore, MD, 21218, USA',2),(3,-76.6158,39.2965,'600 N Charles St, Baltimore, MD, 21201, USA',3);
/*!40000 ALTER TABLE `appointment_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_reservation_rule`
--

DROP TABLE IF EXISTS `appointment_reservation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_reservation_rule` (
  `id_reservation_rule` int(11) NOT NULL,
  `date_of_apply` date NOT NULL,
  `max_capacity_per_slot` int(11) NOT NULL DEFAULT '0',
  `max_people_per_appointment` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_reservation_rule`,`id_form`),
  UNIQUE KEY `unique_index_date_of_apply` (`id_form`,`date_of_apply`),
  KEY `fk_appointment_reservation_rule_appointment_form_idx` (`id_form`),
  KEY `date_of_apply_idx` (`date_of_apply`),
  CONSTRAINT `fk_appointment_reservation_rule_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_reservation_rule`
--

LOCK TABLES `appointment_reservation_rule` WRITE;
/*!40000 ALTER TABLE `appointment_reservation_rule` DISABLE KEYS */;
INSERT INTO `appointment_reservation_rule` VALUES (1,'2018-08-13',1,1,1),(2,'2018-08-13',1,1,2),(3,'2018-08-13',1,1,3),(4,'2018-08-16',1,1,3),(5,'2018-08-16',1,1,2),(6,'2018-08-16',1,1,1);
/*!40000 ALTER TABLE `appointment_reservation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_resource_app_res`
--

DROP TABLE IF EXISTS `appointment_resource_app_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_resource_app_res` (
  `id_appointment` int(11) NOT NULL DEFAULT '0',
  `id_app_form_res_type` int(11) NOT NULL DEFAULT '0',
  `id_resource` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_appointment`,`id_app_form_res_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_resource_app_res`
--

LOCK TABLES `appointment_resource_app_res` WRITE;
/*!40000 ALTER TABLE `appointment_resource_app_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_resource_app_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_resource_form_rt`
--

DROP TABLE IF EXISTS `appointment_resource_form_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_resource_form_rt` (
  `id` int(11) NOT NULL DEFAULT '0',
  `id_appointment_form` int(11) NOT NULL DEFAULT '0',
  `resource_type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_app_admin_user` smallint(6) NOT NULL DEFAULT '0',
  `is_localization` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_appointment_resource_form_rt_name` (`resource_type_name`),
  KEY `fk_appointment_res_form_rt_id_form` (`id_appointment_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_resource_form_rt`
--

LOCK TABLES `appointment_resource_form_rt` WRITE;
/*!40000 ALTER TABLE `appointment_resource_form_rt` DISABLE KEYS */;
INSERT INTO `appointment_resource_form_rt` VALUES (1,1,'salle','Lieu du rendez-vous',0,1),(3,1,'ADMIN_USER','Administrateur en charge du dossier',1,0);
/*!40000 ALTER TABLE `appointment_resource_form_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_slot`
--

DROP TABLE IF EXISTS `appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_slot` (
  `id_slot` int(11) NOT NULL,
  `starting_date_time` timestamp NULL DEFAULT NULL,
  `ending_date_time` timestamp NULL DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `is_specific` tinyint(1) NOT NULL DEFAULT '0',
  `max_capacity` int(11) NOT NULL DEFAULT '0',
  `nb_remaining_places` int(11) NOT NULL DEFAULT '0',
  `nb_potential_remaining_places` int(11) NOT NULL DEFAULT '0',
  `nb_places_taken` int(11) NOT NULL DEFAULT '0',
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_slot`,`id_form`),
  UNIQUE KEY `unique_index_starting_date_time` (`id_form`,`starting_date_time`),
  UNIQUE KEY `unique_index_ending_date_time` (`id_form`,`ending_date_time`),
  KEY `fk_appointment_slot_appointment_form_idx` (`id_form`),
  KEY `starting_date_time_idx` (`starting_date_time`),
  KEY `ending_date_time_idx` (`ending_date_time`),
  CONSTRAINT `fk_appointment_slot_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_slot`
--

LOCK TABLES `appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_slot` DISABLE KEYS */;
INSERT INTO `appointment_slot` VALUES (1,'2018-08-15 08:30:00','2018-08-15 09:00:00',1,0,1,1,1,0,1),(2,'2018-08-15 09:30:00','2018-08-15 10:00:00',1,0,1,1,1,0,1),(3,'2018-08-14 09:30:00','2018-08-14 10:00:00',1,0,1,1,1,0,1),(4,'2018-08-14 10:00:00','2018-08-14 10:30:00',1,0,1,1,1,0,1),(5,'2018-08-14 10:30:00','2018-08-14 11:00:00',1,0,1,1,1,0,1),(6,'2018-08-14 11:00:00','2018-08-14 11:30:00',1,0,1,1,1,0,1),(7,'2018-08-15 07:00:00','2018-08-15 07:30:00',1,0,1,1,1,0,2),(9,'2018-08-15 13:30:00','2018-08-15 14:00:00',1,0,1,1,1,0,1),(28,'2018-08-15 13:00:00','2018-08-15 13:30:00',1,0,1,1,1,0,1),(30,'2018-08-17 09:30:00','2018-08-17 10:00:00',1,0,1,1,1,0,3),(31,'2018-08-22 07:00:00','2018-08-22 08:00:00',1,0,1,0,0,1,3),(32,'2018-08-22 08:00:00','2018-08-22 09:00:00',1,0,1,0,0,1,3),(33,'2018-08-23 08:00:00','2018-08-23 09:00:00',1,0,1,0,0,1,3),(34,'2018-08-23 09:00:00','2018-08-23 10:00:00',1,0,1,0,0,1,3),(35,'2018-08-23 07:00:00','2018-08-23 08:00:00',1,0,1,0,0,1,3),(36,'2018-08-30 08:00:00','2018-08-30 09:00:00',1,0,1,0,0,1,3),(37,'2018-08-29 08:00:00','2018-08-29 09:00:00',1,0,1,0,0,1,3),(38,'2018-08-30 07:00:00','2018-08-30 08:00:00',1,0,1,0,0,1,3),(39,'2018-08-22 09:00:00','2018-08-22 10:00:00',1,0,1,0,0,1,3),(40,'2018-08-30 09:00:00','2018-08-30 10:00:00',1,0,1,0,0,1,3),(41,'2018-08-29 07:00:00','2018-08-29 08:00:00',1,0,1,0,0,1,3),(42,'2018-09-06 08:00:00','2018-09-06 09:00:00',1,0,1,0,0,1,3),(43,'2018-09-05 08:00:00','2018-09-05 09:00:00',1,0,1,0,0,1,3),(44,'2018-09-05 07:00:00','2018-09-05 08:00:00',1,0,1,0,0,1,3),(45,'2018-08-29 09:00:00','2018-08-29 10:00:00',1,0,1,0,0,1,3),(46,'2018-09-06 07:00:00','2018-09-06 08:00:00',1,0,1,0,0,1,3),(47,'2018-09-06 09:00:00','2018-09-06 10:00:00',1,0,1,0,0,1,3),(48,'2018-09-05 09:00:00','2018-09-05 10:00:00',1,0,1,1,1,0,3),(49,'2018-08-23 08:00:00','2018-08-23 09:00:00',1,0,1,1,1,0,1),(50,'2018-08-23 09:00:00','2018-08-23 10:00:00',1,0,1,1,1,0,1),(51,'2018-08-22 09:00:00','2018-08-22 10:00:00',1,0,1,1,1,0,1);
/*!40000 ALTER TABLE `appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_time_slot`
--

DROP TABLE IF EXISTS `appointment_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_time_slot` (
  `id_time_slot` int(11) NOT NULL,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity` int(11) NOT NULL DEFAULT '0',
  `id_working_day` int(11) NOT NULL,
  PRIMARY KEY (`id_time_slot`,`id_working_day`),
  UNIQUE KEY `unique_index_starting_time` (`id_working_day`,`starting_time`),
  UNIQUE KEY `unique_index_ending_time` (`id_working_day`,`ending_time`),
  KEY `fk_appointment_time_slot_appointment_working_day_idx` (`id_working_day`),
  KEY `starting_time_idx` (`starting_time`),
  KEY `ending_time_idx` (`ending_time`),
  CONSTRAINT `fk_appointment_time_slot_appointment_working_day` FOREIGN KEY (`id_working_day`) REFERENCES `appointment_working_day` (`id_working_day`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_time_slot`
--

LOCK TABLES `appointment_time_slot` WRITE;
/*!40000 ALTER TABLE `appointment_time_slot` DISABLE KEYS */;
INSERT INTO `appointment_time_slot` VALUES (1,'09:00:00','09:30:00',1,1,1),(2,'09:30:00','10:00:00',1,1,1),(3,'10:00:00','10:30:00',1,1,1),(4,'10:30:00','11:00:00',1,1,1),(5,'11:00:00','11:30:00',1,1,1),(6,'11:30:00','12:00:00',1,1,1),(7,'12:00:00','12:30:00',1,1,1),(8,'12:30:00','13:00:00',1,1,1),(9,'13:00:00','13:30:00',1,1,1),(10,'13:30:00','14:00:00',1,1,1),(11,'14:00:00','14:30:00',1,1,1),(12,'14:30:00','15:00:00',1,1,1),(13,'15:00:00','15:30:00',1,1,1),(14,'15:30:00','16:00:00',1,1,1),(15,'16:00:00','16:30:00',1,1,1),(16,'16:30:00','17:00:00',1,1,1),(17,'09:00:00','09:30:00',1,1,2),(18,'09:30:00','10:00:00',1,1,2),(19,'10:00:00','10:30:00',1,1,2),(20,'10:30:00','11:00:00',1,1,2),(21,'11:00:00','11:30:00',1,1,2),(22,'11:30:00','12:00:00',1,1,2),(23,'12:00:00','12:30:00',1,1,2),(24,'12:30:00','13:00:00',1,1,2),(25,'13:00:00','13:30:00',1,1,2),(26,'13:30:00','14:00:00',1,1,2),(27,'14:00:00','14:30:00',1,1,2),(28,'14:30:00','15:00:00',1,1,2),(29,'15:00:00','15:30:00',1,1,2),(30,'15:30:00','16:00:00',1,1,2),(31,'16:00:00','16:30:00',1,1,2),(32,'16:30:00','17:00:00',1,1,2),(33,'09:00:00','09:30:00',1,1,3),(34,'09:30:00','10:00:00',1,1,3),(35,'10:00:00','10:30:00',1,1,3),(36,'10:30:00','11:00:00',1,1,3),(37,'11:00:00','11:30:00',1,1,3),(38,'11:30:00','12:00:00',1,1,3),(39,'12:00:00','12:30:00',1,1,3),(40,'12:30:00','13:00:00',1,1,3),(41,'13:00:00','13:30:00',1,1,3),(42,'13:30:00','14:00:00',1,1,3),(43,'14:00:00','14:30:00',1,1,3),(44,'14:30:00','15:00:00',1,1,3),(45,'15:00:00','15:30:00',1,1,3),(46,'15:30:00','16:00:00',1,1,3),(47,'16:00:00','16:30:00',1,1,3),(48,'16:30:00','17:00:00',1,1,3),(49,'09:00:00','09:30:00',1,1,4),(50,'09:30:00','10:00:00',1,1,4),(51,'10:00:00','10:30:00',1,1,4),(52,'10:30:00','11:00:00',1,1,4),(53,'11:00:00','11:30:00',1,1,4),(54,'11:30:00','12:00:00',1,1,4),(55,'12:00:00','12:30:00',1,1,4),(56,'12:30:00','13:00:00',1,1,4),(57,'13:00:00','13:30:00',1,1,4),(58,'13:30:00','14:00:00',1,1,4),(59,'14:00:00','14:30:00',1,1,4),(60,'14:30:00','15:00:00',1,1,4),(61,'15:00:00','15:30:00',1,1,4),(62,'15:30:00','16:00:00',1,1,4),(63,'16:00:00','16:30:00',1,1,4),(64,'16:30:00','17:00:00',1,1,4),(65,'09:00:00','09:30:00',1,1,5),(66,'09:30:00','10:00:00',1,1,5),(67,'10:00:00','10:30:00',1,1,5),(68,'10:30:00','11:00:00',1,1,5),(69,'11:00:00','11:30:00',1,1,5),(70,'11:30:00','12:00:00',1,1,5),(71,'12:00:00','12:30:00',1,1,5),(72,'12:30:00','13:00:00',1,1,5),(73,'13:00:00','13:30:00',1,1,5),(74,'13:30:00','14:00:00',1,1,5),(75,'14:00:00','14:30:00',1,1,5),(76,'14:30:00','15:00:00',1,1,5),(77,'15:00:00','15:30:00',1,1,5),(78,'15:30:00','16:00:00',1,1,5),(79,'16:00:00','16:30:00',1,1,5),(80,'16:30:00','17:00:00',1,1,5),(81,'09:00:00','09:30:00',1,1,6),(82,'09:30:00','10:00:00',1,1,6),(83,'10:00:00','10:30:00',1,1,6),(84,'10:30:00','11:00:00',1,1,6),(85,'11:00:00','11:30:00',1,1,6),(86,'11:30:00','12:00:00',1,1,6),(87,'12:00:00','12:30:00',1,1,6),(88,'12:30:00','13:00:00',1,1,6),(89,'13:00:00','13:30:00',1,1,6),(90,'13:30:00','14:00:00',1,1,6),(91,'14:00:00','14:30:00',1,1,6),(92,'14:30:00','15:00:00',1,1,6),(93,'15:00:00','15:30:00',1,1,6),(94,'15:30:00','16:00:00',1,1,6),(95,'16:00:00','16:30:00',1,1,6),(96,'16:30:00','17:00:00',1,1,6),(97,'09:00:00','09:30:00',1,1,7),(98,'09:30:00','10:00:00',1,1,7),(99,'10:00:00','10:30:00',1,1,7),(100,'10:30:00','11:00:00',1,1,7),(101,'11:00:00','11:30:00',1,1,7),(102,'11:30:00','12:00:00',1,1,7),(103,'12:00:00','12:30:00',1,1,7),(104,'12:30:00','13:00:00',1,1,7),(105,'13:00:00','13:30:00',1,1,7),(106,'13:30:00','14:00:00',1,1,7),(107,'14:00:00','14:30:00',1,1,7),(108,'14:30:00','15:00:00',1,1,7),(109,'15:00:00','15:30:00',1,1,7),(110,'15:30:00','16:00:00',1,1,7),(111,'16:00:00','16:30:00',1,1,7),(112,'16:30:00','17:00:00',1,1,7),(113,'09:00:00','09:30:00',1,1,8),(114,'09:30:00','10:00:00',1,1,8),(115,'10:00:00','10:30:00',1,1,8),(116,'10:30:00','11:00:00',1,1,8),(117,'11:00:00','11:30:00',1,1,8),(118,'11:30:00','12:00:00',1,1,8),(119,'12:00:00','12:30:00',1,1,8),(120,'12:30:00','13:00:00',1,1,8),(121,'13:00:00','13:30:00',1,1,8),(122,'13:30:00','14:00:00',1,1,8),(123,'14:00:00','14:30:00',1,1,8),(124,'14:30:00','15:00:00',1,1,8),(125,'15:00:00','15:30:00',1,1,8),(126,'15:30:00','16:00:00',1,1,8),(127,'16:00:00','16:30:00',1,1,8),(128,'16:30:00','17:00:00',1,1,8),(129,'09:00:00','09:30:00',1,1,9),(130,'09:30:00','10:00:00',1,1,9),(131,'10:00:00','10:30:00',1,1,9),(132,'10:30:00','11:00:00',1,1,9),(133,'11:00:00','11:30:00',1,1,9),(134,'11:30:00','12:00:00',1,1,9),(135,'12:00:00','12:30:00',1,1,9),(136,'12:30:00','13:00:00',1,1,9),(137,'13:00:00','13:30:00',1,1,9),(138,'13:30:00','14:00:00',1,1,9),(139,'14:00:00','14:30:00',1,1,9),(140,'14:30:00','15:00:00',1,1,9),(141,'15:00:00','15:30:00',1,1,9),(142,'15:30:00','16:00:00',1,1,9),(143,'16:00:00','16:30:00',1,1,9),(144,'16:30:00','17:00:00',1,1,9),(145,'09:00:00','09:30:00',1,1,10),(146,'09:30:00','10:00:00',1,1,10),(147,'10:00:00','10:30:00',1,1,10),(148,'10:30:00','11:00:00',1,1,10),(149,'11:00:00','11:30:00',1,1,10),(150,'11:30:00','12:00:00',1,1,10),(151,'12:00:00','12:30:00',1,1,10),(152,'12:30:00','13:00:00',1,1,10),(153,'13:00:00','13:30:00',1,1,10),(154,'13:30:00','14:00:00',1,1,10),(155,'14:00:00','14:30:00',1,1,10),(156,'14:30:00','15:00:00',1,1,10),(157,'15:00:00','15:30:00',1,1,10),(158,'15:30:00','16:00:00',1,1,10),(159,'16:00:00','16:30:00',1,1,10),(160,'16:30:00','17:00:00',1,1,10),(161,'09:00:00','09:30:00',1,1,11),(162,'09:30:00','10:00:00',1,1,11),(163,'10:00:00','10:30:00',1,1,11),(164,'10:30:00','11:00:00',1,1,11),(165,'11:00:00','11:30:00',1,1,11),(166,'11:30:00','12:00:00',1,1,11),(167,'12:00:00','12:30:00',1,1,11),(168,'12:30:00','13:00:00',1,1,11),(169,'13:00:00','13:30:00',1,1,11),(170,'13:30:00','14:00:00',1,1,11),(171,'14:00:00','14:30:00',1,1,11),(172,'14:30:00','15:00:00',1,1,11),(173,'15:00:00','15:30:00',1,1,11),(174,'15:30:00','16:00:00',1,1,11),(175,'16:00:00','16:30:00',1,1,11),(176,'16:30:00','17:00:00',1,1,11),(177,'09:00:00','09:30:00',1,1,12),(178,'09:30:00','10:00:00',1,1,12),(179,'10:00:00','10:30:00',1,1,12),(180,'10:30:00','11:00:00',1,1,12),(181,'11:00:00','11:30:00',1,1,12),(182,'11:30:00','12:00:00',1,1,12),(183,'12:00:00','12:30:00',1,1,12),(184,'12:30:00','13:00:00',1,1,12),(185,'13:00:00','13:30:00',1,1,12),(186,'13:30:00','14:00:00',1,1,12),(187,'14:00:00','14:30:00',1,1,12),(188,'14:30:00','15:00:00',1,1,12),(189,'15:00:00','15:30:00',1,1,12),(190,'15:30:00','16:00:00',1,1,12),(191,'16:00:00','16:30:00',1,1,12),(192,'16:30:00','17:00:00',1,1,12),(193,'09:00:00','09:30:00',1,1,13),(194,'09:30:00','10:00:00',1,1,13),(195,'10:00:00','10:30:00',1,1,13),(196,'10:30:00','11:00:00',1,1,13),(197,'11:00:00','11:30:00',1,1,13),(198,'11:30:00','12:00:00',1,1,13),(199,'12:00:00','12:30:00',1,1,13),(200,'12:30:00','13:00:00',1,1,13),(201,'13:00:00','13:30:00',1,1,13),(202,'13:30:00','14:00:00',1,1,13),(203,'14:00:00','14:30:00',1,1,13),(204,'14:30:00','15:00:00',1,1,13),(205,'15:00:00','15:30:00',1,1,13),(206,'15:30:00','16:00:00',1,1,13),(207,'16:00:00','16:30:00',1,1,13),(208,'16:30:00','17:00:00',1,1,13),(209,'09:00:00','09:30:00',1,1,14),(210,'09:30:00','10:00:00',1,1,14),(211,'10:00:00','10:30:00',1,1,14),(212,'10:30:00','11:00:00',1,1,14),(213,'11:00:00','11:30:00',1,1,14),(214,'11:30:00','12:00:00',1,1,14),(215,'12:00:00','12:30:00',1,1,14),(216,'12:30:00','13:00:00',1,1,14),(217,'13:00:00','13:30:00',1,1,14),(218,'13:30:00','14:00:00',1,1,14),(219,'14:00:00','14:30:00',1,1,14),(220,'14:30:00','15:00:00',1,1,14),(221,'15:00:00','15:30:00',1,1,14),(222,'15:30:00','16:00:00',1,1,14),(223,'16:00:00','16:30:00',1,1,14),(224,'16:30:00','17:00:00',1,1,14),(225,'09:00:00','09:30:00',1,1,15),(226,'09:30:00','10:00:00',1,1,15),(227,'10:00:00','10:30:00',1,1,15),(228,'10:30:00','11:00:00',1,1,15),(229,'11:00:00','11:30:00',1,1,15),(230,'11:30:00','12:00:00',1,1,15),(231,'12:00:00','12:30:00',1,1,15),(232,'12:30:00','13:00:00',1,1,15),(233,'13:00:00','13:30:00',1,1,15),(234,'13:30:00','14:00:00',1,1,15),(235,'14:00:00','14:30:00',1,1,15),(236,'14:30:00','15:00:00',1,1,15),(237,'15:00:00','15:30:00',1,1,15),(238,'15:30:00','16:00:00',1,1,15),(239,'16:00:00','16:30:00',1,1,15),(240,'16:30:00','17:00:00',1,1,15),(241,'09:00:00','09:30:00',1,1,16),(242,'09:30:00','10:00:00',1,1,16),(243,'10:00:00','10:30:00',1,1,16),(244,'10:30:00','11:00:00',1,1,16),(245,'11:00:00','11:30:00',1,1,16),(246,'11:30:00','12:00:00',1,1,16),(247,'12:00:00','12:30:00',1,1,16),(248,'12:30:00','13:00:00',1,1,16),(249,'13:00:00','13:30:00',1,1,16),(250,'13:30:00','14:00:00',1,1,16),(251,'14:00:00','14:30:00',1,1,16),(252,'14:30:00','15:00:00',1,1,16),(253,'15:00:00','15:30:00',1,1,16),(254,'15:30:00','16:00:00',1,1,16),(255,'16:00:00','16:30:00',1,1,16),(256,'16:30:00','17:00:00',1,1,16),(257,'09:00:00','09:30:00',1,1,17),(258,'09:30:00','10:00:00',1,1,17),(259,'10:00:00','10:30:00',1,1,17),(260,'10:30:00','11:00:00',1,1,17),(261,'11:00:00','11:30:00',1,1,17),(262,'11:30:00','12:00:00',1,1,17),(263,'12:00:00','12:30:00',1,1,17),(264,'12:30:00','13:00:00',1,1,17),(265,'13:00:00','13:30:00',1,1,17),(266,'13:30:00','14:00:00',1,1,17),(267,'14:00:00','14:30:00',1,1,17),(268,'14:30:00','15:00:00',1,1,17),(269,'15:00:00','15:30:00',1,1,17),(270,'15:30:00','16:00:00',1,1,17),(271,'16:00:00','16:30:00',1,1,17),(272,'16:30:00','17:00:00',1,1,17),(273,'09:00:00','09:30:00',0,1,18),(274,'09:30:00','10:00:00',1,1,18),(275,'10:00:00','10:30:00',1,1,18),(276,'10:30:00','11:00:00',1,1,18),(277,'11:00:00','11:30:00',1,1,18),(278,'11:30:00','12:00:00',1,1,18),(279,'12:00:00','12:30:00',1,1,18),(280,'12:30:00','13:00:00',1,1,18),(281,'13:00:00','13:30:00',1,1,18),(282,'13:30:00','14:00:00',1,1,18),(283,'14:00:00','14:30:00',1,1,18),(284,'14:30:00','15:00:00',1,1,18),(285,'15:00:00','15:30:00',1,1,18),(286,'15:30:00','16:00:00',1,1,18),(287,'16:00:00','16:30:00',1,1,18),(288,'16:30:00','17:00:00',1,1,18),(289,'09:00:00','10:00:00',1,1,19),(290,'10:00:00','11:00:00',1,1,19),(291,'11:00:00','12:00:00',1,1,19),(292,'09:00:00','10:00:00',1,1,20),(293,'10:00:00','11:00:00',1,1,20),(294,'11:00:00','12:00:00',1,1,20),(295,'09:00:00','10:00:00',1,1,21),(296,'10:00:00','11:00:00',1,1,21),(297,'11:00:00','12:00:00',1,1,21),(298,'12:00:00','13:00:00',1,1,21),(299,'13:00:00','14:00:00',1,1,21),(300,'14:00:00','15:00:00',1,1,21),(301,'15:00:00','16:00:00',1,1,21),(302,'16:00:00','17:00:00',1,1,21),(303,'09:00:00','10:00:00',1,1,22),(304,'10:00:00','11:00:00',1,1,22),(305,'11:00:00','12:00:00',1,1,22),(306,'12:00:00','13:00:00',1,1,22),(307,'13:00:00','14:00:00',1,1,22),(308,'14:00:00','15:00:00',1,1,22),(309,'15:00:00','16:00:00',1,1,22),(310,'16:00:00','17:00:00',1,1,22),(311,'09:00:00','10:00:00',1,1,23),(312,'10:00:00','11:00:00',1,1,23),(313,'11:00:00','12:00:00',1,1,23),(314,'12:00:00','13:00:00',1,1,23),(315,'13:00:00','14:00:00',1,1,23),(316,'14:00:00','15:00:00',1,1,23),(317,'15:00:00','16:00:00',1,1,23),(318,'16:00:00','17:00:00',1,1,23),(319,'09:00:00','10:00:00',1,1,24),(320,'10:00:00','11:00:00',1,1,24),(321,'11:00:00','12:00:00',1,1,24),(322,'12:00:00','13:00:00',1,1,24),(323,'13:00:00','14:00:00',1,1,24),(324,'14:00:00','15:00:00',1,1,24),(325,'15:00:00','16:00:00',1,1,24),(326,'16:00:00','17:00:00',1,1,24),(327,'09:00:00','10:00:00',1,1,25),(328,'10:00:00','11:00:00',1,1,25),(329,'11:00:00','12:00:00',1,1,25),(330,'12:00:00','13:00:00',1,1,25),(331,'13:00:00','14:00:00',1,1,25),(332,'14:00:00','15:00:00',1,1,25),(333,'15:00:00','16:00:00',1,1,25),(334,'16:00:00','17:00:00',1,1,25),(335,'10:00:00','11:00:00',1,1,26),(336,'11:00:00','12:00:00',1,1,26),(337,'12:00:00','13:00:00',1,1,26),(338,'13:00:00','14:00:00',1,1,26),(339,'14:00:00','15:00:00',1,1,26),(340,'15:00:00','16:00:00',1,1,26),(341,'16:00:00','17:00:00',1,1,26),(342,'10:00:00','11:00:00',1,1,27),(343,'11:00:00','12:00:00',1,1,27),(344,'12:00:00','13:00:00',1,1,27),(345,'13:00:00','14:00:00',1,1,27),(346,'14:00:00','15:00:00',1,1,27),(347,'15:00:00','16:00:00',1,1,27),(348,'16:00:00','17:00:00',1,1,27),(349,'10:00:00','11:00:00',1,1,28),(350,'11:00:00','12:00:00',1,1,28),(351,'12:00:00','13:00:00',1,1,28),(352,'13:00:00','14:00:00',1,1,28),(353,'14:00:00','15:00:00',1,1,28),(354,'15:00:00','16:00:00',1,1,28),(355,'16:00:00','17:00:00',1,1,28),(356,'10:00:00','11:00:00',1,1,29),(357,'11:00:00','12:00:00',1,1,29),(358,'12:00:00','13:00:00',1,1,29),(359,'13:00:00','14:00:00',1,1,29),(360,'14:00:00','15:00:00',1,1,29),(361,'15:00:00','16:00:00',1,1,29),(362,'16:00:00','17:00:00',1,1,29);
/*!40000 ALTER TABLE `appointment_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_user`
--

DROP TABLE IF EXISTS `appointment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_user` (
  `id_user` int(11) NOT NULL,
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `unique_index_email` (`first_name`,`last_name`,`email`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_user`
--

LOCK TABLES `appointment_user` WRITE;
/*!40000 ALTER TABLE `appointment_user` DISABLE KEYS */;
INSERT INTO `appointment_user` VALUES (1,NULL,'Yvan','Michel','yvan.michel@paris.fr',NULL),(2,NULL,'nb','nbv','yvan.michel@paris.fr',NULL),(3,NULL,'hgfdhf','hgdhg','yvan.michel@paris.fr',NULL),(4,NULL,'bvc','bvc','yvan.michel@paris.fr',NULL),(5,NULL,'bvc','bvcx','yvan.michel@paris.fr',NULL),(6,NULL,'test','test','elysa.jouve@paris.fr',NULL),(7,NULL,'hgfh','hhghgf','yvan.michel@paris.fr',NULL),(8,NULL,'hg','fghfh','yvan.michel@paris.fr',NULL),(9,NULL,'ghd','hgfhf','yvan.michel@paris.fr',NULL),(10,NULL,'gfhfhd','hghgh','yvan.michel@paris.fr',NULL),(11,NULL,'hgfhf','dhfgh','yvan.michel@paris.fr',NULL),(12,NULL,'hgfdhd','hgfhfh','yvan.michel@paris.fr',NULL),(13,NULL,'fdgfg','fdgfdg','yvan.michel@paris.fr',NULL),(14,NULL,'hgfhfghgf','hghghg','yvan.michel@paris.fr',NULL),(15,NULL,'iuiu','iuiui','yvan.michel@paris.fr',NULL),(16,NULL,'tuitit','uiti','yvan.michel@paris.fr',NULL),(17,NULL,'oiuo','oiuoi','yvan.michel@paris.fr',NULL),(18,NULL,'poipoi','oipoip','',NULL),(19,NULL,'poipoi','opiup','yvan.michel@paris.fr',NULL),(20,NULL,'lkj','ljklk','yvan.michel@paris.fr',NULL),(21,NULL,'fgdhgfhfg','hghgfh','yvan.michel@paris.fr',NULL),(22,NULL,'jhgjfhj','hfjhj','yvan.michel@paris.fr',NULL),(23,NULL,'jhjhfjf','jghfjghj','yvan.michel@paris.fr',NULL);
/*!40000 ALTER TABLE `appointment_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_week_definition`
--

DROP TABLE IF EXISTS `appointment_week_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_week_definition` (
  `id_week_definition` int(11) NOT NULL,
  `date_of_apply` date NOT NULL,
  `id_form` int(11) NOT NULL,
  PRIMARY KEY (`id_week_definition`,`id_form`),
  UNIQUE KEY `unique_index_date_of_apply` (`id_form`,`date_of_apply`),
  KEY `fk_appointment_week_type_appointment_form_idx` (`id_form`),
  KEY `date_of_apply_idx` (`date_of_apply`),
  CONSTRAINT `fk_appointment_week_definition_appointment_form` FOREIGN KEY (`id_form`) REFERENCES `appointment_form` (`id_form`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_week_definition`
--

LOCK TABLES `appointment_week_definition` WRITE;
/*!40000 ALTER TABLE `appointment_week_definition` DISABLE KEYS */;
INSERT INTO `appointment_week_definition` VALUES (1,'2018-08-13',1),(2,'2018-08-13',2),(3,'2018-08-13',3),(4,'2018-08-16',3),(5,'2018-08-16',2),(6,'2018-08-16',1);
/*!40000 ALTER TABLE `appointment_week_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_working_day`
--

DROP TABLE IF EXISTS `appointment_working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_working_day` (
  `id_working_day` int(11) NOT NULL,
  `day_of_week` int(11) NOT NULL,
  `id_week_definition` int(11) NOT NULL,
  PRIMARY KEY (`id_working_day`,`id_week_definition`),
  UNIQUE KEY `unique_index` (`id_week_definition`,`day_of_week`),
  KEY `fk_appointment_working_day_appointment_week_definition_idx` (`id_week_definition`),
  CONSTRAINT `fk_appointment_working_day_appointment_week_definition` FOREIGN KEY (`id_week_definition`) REFERENCES `appointment_week_definition` (`id_week_definition`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_working_day`
--

LOCK TABLES `appointment_working_day` WRITE;
/*!40000 ALTER TABLE `appointment_working_day` DISABLE KEYS */;
INSERT INTO `appointment_working_day` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,1,2),(8,2,2),(9,3,2),(10,4,2),(11,5,2),(12,6,2),(13,1,3),(14,2,3),(15,3,3),(16,4,3),(17,5,3),(18,6,3),(19,3,4),(20,4,4),(21,1,5),(22,2,5),(23,3,5),(24,4,5),(25,5,5),(26,1,6),(27,2,6),(28,3,6),(29,4,6);
/*!40000 ALTER TABLE `appointment_working_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_dashboard`
--

DROP TABLE IF EXISTS `core_admin_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_dashboard`
--

LOCK TABLES `core_admin_dashboard` WRITE;
/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` VALUES ('usersAdminDashboardComponent',1,1),('searchAdminDashboardComponent',1,2),('myluteceAuthenticationFilterAdminDashboardComponent',1,3),('databaseAdminDashboardComponent',1,1),('workflowAdminDashboardComponent',1,1);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist`
--

DROP TABLE IF EXISTS `core_admin_mailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_mailinglist` (
  `id_mailinglist` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workgroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist`
--

LOCK TABLES `core_admin_mailinglist` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist` VALUES (1,'admin','admin','all');
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist_filter`
--

DROP TABLE IF EXISTS `core_admin_mailinglist_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_mailinglist_filter` (
  `id_mailinglist` int(11) NOT NULL DEFAULT '0',
  `workgroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist_filter`
--

LOCK TABLES `core_admin_mailinglist_filter` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist_filter` VALUES (1,'all','super_admin');
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_right`
--

DROP TABLE IF EXISTS `core_admin_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_right` (
  `id_right` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level_right` smallint(6) DEFAULT NULL,
  `admin_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_updatable` int(11) NOT NULL DEFAULT '0',
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_feature_group` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documentation_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `is_external_feature` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_right`),
  KEY `index_right` (`level_right`,`admin_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_right`
--

LOCK TABLES `core_admin_right` WRITE;
/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` VALUES ('CORE_ADMIN_SITE','portal.site.adminFeature.admin_site.name',2,'jsp/admin/site/AdminSite.jsp','portal.site.adminFeature.admin_site.description',1,NULL,'SITE','images/admin/skin/features/admin_site.png','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site',1,0),('CORE_CACHE_MANAGEMENT','portal.system.adminFeature.cache_management.name',0,'jsp/admin/system/ManageCaches.jsp','portal.system.adminFeature.cache_management.description',1,'','SYSTEM','images/admin/skin/features/manage_caches.png',NULL,0,0),('CORE_SEARCH_INDEXATION','portal.search.adminFeature.indexer.name',0,'jsp/admin/search/ManageSearchIndexation.jsp','portal.search.adminFeature.indexer.description',0,'','SYSTEM',NULL,NULL,0,0),('CORE_SEARCH_MANAGEMENT','portal.search.adminFeature.search_management.name',0,'jsp/admin/search/ManageSearch.jsp','portal.search.adminFeature.search_management.description',0,'','SYSTEM',NULL,NULL,0,0),('CORE_LOGS_VISUALISATION','portal.system.adminFeature.logs_visualisation.name',0,'jsp/admin/system/ManageFilesSystem.jsp','portal.system.adminFeature.logs_visualisation.description',1,'','SYSTEM','images/admin/skin/features/view_logs.png',NULL,0,0),('CORE_MODES_MANAGEMENT','portal.style.adminFeature.modes_management.name',0,'jsp/admin/style/ManageModes.jsp','portal.style.adminFeature.modes_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_modes.png',NULL,1,0),('CORE_PAGE_TEMPLATE_MANAGEMENT','portal.style.adminFeature.page_template_management.name',0,'jsp/admin/style/ManagePageTemplates.jsp','portal.style.adminFeature.page_template_management.description',0,NULL,'STYLE','images/admin/skin/features/manage_page_templates.png',NULL,2,0),('CORE_PLUGINS_MANAGEMENT','portal.system.adminFeature.plugins_management.name',0,'jsp/admin/system/ManagePlugins.jsp','portal.system.adminFeature.plugins_management.description',1,'','SYSTEM','images/admin/skin/features/manage_plugins.png',NULL,0,0),('CORE_PROPERTIES_MANAGEMENT','portal.site.adminFeature.properties_management.name',2,'jsp/admin/ManageProperties.jsp','portal.site.adminFeature.properties_management.description',0,NULL,'SITE',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties',2,0),('CORE_STYLESHEET_MANAGEMENT','portal.style.adminFeature.stylesheet_management.name',0,'jsp/admin/style/ManageStyleSheets.jsp','portal.style.adminFeature.stylesheet_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_stylesheets.png',NULL,3,0),('CORE_STYLES_MANAGEMENT','portal.style.adminFeature.styles_management.name',0,'jsp/admin/style/ManageStyles.jsp','portal.style.adminFeature.styles_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_styles.png',NULL,4,0),('CORE_USERS_MANAGEMENT','portal.users.adminFeature.users_management.name',2,'jsp/admin/user/ManageUsers.jsp','portal.users.adminFeature.users_management.description',1,'','MANAGERS','images/admin/skin/features/manage_users.png',NULL,1,0),('CORE_FEATURES_MANAGEMENT','portal.admin.adminFeature.features_management.name',0,'jsp/admin/features/DispatchFeatures.jsp','portal.admin.adminFeature.features_management.description',0,'','SYSTEM','images/admin/skin/features/manage_features.png',NULL,1,0),('CORE_RBAC_MANAGEMENT','portal.rbac.adminFeature.rbac_management.name',0,'jsp/admin/rbac/ManageRoles.jsp','portal.rbac.adminFeature.rbac_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rbac.png',NULL,2,0),('CORE_DAEMONS_MANAGEMENT','portal.system.adminFeature.daemons_management.name',0,'jsp/admin/system/ManageDaemons.jsp','portal.system.adminFeature.daemons_management.description',0,'','SYSTEM',NULL,NULL,2,0),('CORE_WORKGROUPS_MANAGEMENT','portal.workgroup.adminFeature.workgroups_management.name',2,'jsp/admin/workgroup/ManageWorkgroups.jsp','portal.workgroup.adminFeature.workgroups_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_workgroups.png',NULL,3,0),('CORE_ROLES_MANAGEMENT','portal.role.adminFeature.roles_management.name',2,'jsp/admin/role/ManagePageRole.jsp','portal.role.adminFeature.roles_management.description',0,'','USERS','images/admin/skin/features/manage_roles.png',NULL,0,0),('CORE_MAILINGLISTS_MANAGEMENT','portal.mailinglist.adminFeature.mailinglists_management.name',2,'jsp/admin/mailinglist/ManageMailingLists.jsp','portal.mailinglist.adminFeature.mailinglists_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_mailinglists.png',NULL,4,0),('CORE_LEVEL_RIGHT_MANAGEMENT','portal.users.adminFeature.level_right_management.name',2,'jsp/admin/features/ManageLevels.jsp','portal.users.adminFeature.level_right_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_LINK_SERVICE_MANAGEMENT','portal.insert.adminFeature.linkService_management.name',2,NULL,'portal.insert.adminFeature.linkService_management.description',0,NULL,NULL,NULL,NULL,1,0),('CORE_RIGHT_MANAGEMENT','portal.users.adminFeature.right_management.name',0,'jsp/admin/features/ManageRights.jsp','portal.users.adminFeature.right_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_ADMINDASHBOARD_MANAGEMENT','portal.admindashboard.adminFeature.right_management.name',0,'jsp/admin/admindashboard/ManageAdminDashboards.jsp','portal.admindashboard.adminFeature.right_management.description',0,'','SYSTEM','images/admin/skin/features/manage_admindashboards.png',NULL,3,0),('CORE_DASHBOARD_MANAGEMENT','portal.dashboard.adminFeature.dashboard_management.name',0,'jsp/admin/dashboard/ManageDashboards.jsp','portal.dashboard.adminFeature.dashboard_management.description',0,'','SYSTEM','images/admin/skin/features/manage_dashboards.png',NULL,4,0),('CORE_XSL_EXPORT_MANAGEMENT','portal.xsl.adminFeature.xsl_export_management.name',2,'jsp/admin/xsl/ManageXslExport.jsp','portal.xsl.adminFeature.xsl_export_management.description',1,'','SYSTEM',NULL,NULL,5,0),('CORE_GLOBAL_MANAGEMENT','portal.globalmanagement.adminFeature.global_management.name',2,'jsp/admin/globalmanagement/GetGlobalManagement.jsp','portal.globalmanagement.adminFeature.global_management.description',1,'','SYSTEM',NULL,NULL,5,0),('CORE_EXTERNAL_FEATURES_MANAGEMENT','portal.system.adminFeature.external_features_management.name',1,'jsp/admin/features/ManageExternalFeatures.jsp','portal.system.adminFeature.external_features_management.description',1,'','SYSTEM',NULL,NULL,6,0),('APPOINTMENT_FORM_MANAGEMENT','appointment.adminFeature.ManageAppointmentForm.name',1,'jsp/admin/plugins/appointment/ManageAppointmentForms.jsp','appointment.adminFeature.ManageAppointmentForm.description',0,'workflow-appointment','APPLICATIONS',NULL,NULL,9,0),('APPOINTMENT_CALENDAR_TEMPLATE','appointment.adminFeature.manageCalendarTemplates.name',0,'jsp/admin/plugins/appointment/ManageCalendarTemplates.jsp','appointment.adminFeature.manageCalendarTemplates.name',0,'appointment','APPLICATIONS',NULL,NULL,1,0),('APPOINTMENT_CATEGORY_MANAGEMENT','appointment.adminFeature.manageCategories.name',2,'jsp/admin/plugins/appointment/ManageAppointmentCategory.jsp','appointment.adminFeature.manageCategories.name',0,'appointment','APPLICATIONS',NULL,NULL,2,0),('MYLUTECE_MANAGEMENT','mylutece.adminFeature.mylutece_management.name',2,'jsp/admin/plugins/mylutece/attribute/ManageAttributes.jsp','mylutece.adminFeature.mylutece_management.description',0,'mylutece','USERS',NULL,NULL,NULL,0),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER','mylutece.adminFeature.mylutece_management_authentication_filter.name',3,'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp','mylutece.adminFeature.mylutece_management_authentication_filter.description',0,'mylutece','SYSTEM',NULL,NULL,16,0),('DATABASE_MANAGEMENT_USERS','module.mylutece.database.adminFeature.database_management_user.name',3,'jsp/admin/plugins/mylutece/modules/database/ManageUsers.jsp','module.mylutece.database.adminFeature.database_management_user.description',0,'mylutece-database','USERS',NULL,NULL,3,0),('DATABASE_GROUPS_MANAGEMENT','module.mylutece.database.adminFeature.groups_management.name',3,'jsp/admin/plugins/mylutece/modules/database/ManageGroups.jsp','module.mylutece.database.adminFeature.groups_management.description',0,'mylutece-database','USERS',NULL,NULL,4,0),('REGULAR_EXPRESSION_MANAGEMENT','regularexpression.adminFeature.regularexpression_management.name',0,'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp','regularexpression.adminFeature.regularexpression_management.description',0,'regularexpression','APPLICATIONS',NULL,NULL,4,0),('RESOURCE_MANAGEMENT','resource.resourceManagement.pageTitle',2,'jsp/admin/plugins/resource/ManageResources.jsp','resource.resourceManagement.description',0,'resource','APPLICATIONS',NULL,NULL,5,0),('SITELABELS_MANAGEMENT','sitelabels.adminFeature.ManageSiteLabels.name',0,'jsp/admin/plugins/sitelabels/ManageLabels.jsp','sitelabels.adminFeature.ManageSiteLabels.description',0,'sitelabels','APPLICATIONS',NULL,NULL,6,0),('SOLR_INDEX_MANAGEMENT','search.solr.adminFeature.title',1,'jsp/admin/search/solr/ManageSearchIndexation.jsp','search.solr.adminFeature.description',0,'solr','SYSTEM',NULL,'',13,0),('SOLR_CONFIGURATION_MANAGEMENT','search.solr.adminFeature.configuration.title',1,'jsp/admin/search/solr/ManageSearchConfiguration.jsp','search.solr.adminFeature.configuration.description',0,'solr','SYSTEM',NULL,'',14,0),('SOLR_FIELDS_MANAGEMENT','search.solr.adminFeature.fields.title',1,'jsp/admin/search/solr/ManageSolrFields.jsp','search.solr.adminFeature.fields.description',0,'solr','SYSTEM',NULL,'',15,0),('WORKFLOW_MANAGEMENT','workflow.adminFeature.workflow_management.name',3,'jsp/admin/plugins/workflow/ManageWorkflow.jsp','workflow.adminFeature.workflow_management.description',0,'workflow','APPLICATIONS',NULL,NULL,10,0),('RESOURCE_MANAGE_RESOURCES','resource.resourceManagement.pageTitle',2,'jsp/admin/plugins/resource/ManageResources.jsp','resource.resourceManagement.description',0,'resource','APPLICATIONS',NULL,NULL,11,0),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION','mylutece.adminFeature.mylutece_management_external_application.name',3,'jsp/admin/plugins/mylutece/ManageExternalApplicationUser.jsp','mylutece.adminFeature.mylutece_management_external_application.description',0,'mylutece','APPLICATIONS',NULL,NULL,3,0),('SORLSERVER_ADD_FILE','solrserver.adminFeature.addfile.name',2,'jsp/admin/plugins/solrserver/ManageFileInSolr.jsp','solrserver.adminFeature.addfile.description',0,'solrserver','APPLICATIONS',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-solrserver',7,0),('MYDASHBOARD_PANEL_MANAGEMENT','mydashboard.adminFeature.ManageMydashboardPanel.name',0,'jsp/admin/plugins/mydashboard/ManageMyDashboardPanel.jsp','mydashboard.adminFeature.ManageMydashboardPanel.description',0,'mydashboard',NULL,NULL,NULL,2,0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role`
--

DROP TABLE IF EXISTS `core_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_role` (
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role`
--

LOCK TABLES `core_admin_role` WRITE;
/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` VALUES ('all_site_manager','Site Manager'),('super_admin','Super Administrator'),('assign_roles','Assign roles to users'),('assign_groups','Assign groups to users'),('mylutece_manager','MyLutece advanced parameters management'),('mylutece_database_manager','MyLutece Database management'),('workflow_manager','Workflow management'),('appointment_manager','Appointment management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role_resource`
--

DROP TABLE IF EXISTS `core_admin_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_role_resource` (
  `rbac_id` int(11) NOT NULL DEFAULT '0',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resource_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resource_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`rbac_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role_resource`
--

LOCK TABLES `core_admin_role_resource` WRITE;
/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` VALUES (57,'all_site_manager','PAGE','*','VIEW'),(58,'all_site_manager','PAGE','*','MANAGE'),(77,'super_admin','INSERT_SERVICE','*','*'),(101,'all_site_manager','PORTLET_TYPE','*','*'),(111,'all_site_manager','ADMIN_USER','*','*'),(137,'all_site_manager','SEARCH_SERVICE','*','*'),(164,'all_site_manager','XSL_EXPORT','*','*'),(1026,'super_admin','APPOINTMENT_FORM','*','*'),(205,'assign_roles','ROLE_TYPE','*','ASSIGN_ROLE'),(207,'mylutece_manager','MYLUTECE','*','*'),(206,'assign_groups','GROUP_TYPE','*','ASSIGN_GROUP'),(350,'mylutece_database_manager','DATABASE','*','*'),(912,'workflow_manager','WORKFLOW_ACTION_TYPE','*','*'),(923,'workflow_manager','WORKFLOW_STATE_TYPE','*','*'),(1027,'appointment_manager','APPOINTMENT_FORM','*','VIEW_APPOINTMENT'),(1028,'appointment_manager','APPOINTMENT_FORM','*','CHANGE_APPOINTMENT_STATUS'),(1029,'appointment_manager','APPOINTMENT_FORM','*','CHANGE_STATE'),(1030,'appointment_manager','APPOINTMENT_FORM','*','MODIFY_ADVANCED_SETTING_FORM'),(1031,'appointment_manager','APPOINTMENT_FORM','*','CREATE_APPOINTMENT'),(1032,'appointment_manager','APPOINTMENT_FORM','*','DELETE_FORM'),(1033,'appointment_manager','APPOINTMENT_FORM','*','VIEW_FORM'),(1034,'appointment_manager','APPOINTMENT_FORM','*','DELETE_APPOINTMENT'),(1035,'appointment_manager','APPOINTMENT_FORM','*','CHANGE_APPOINTMENT_DATE'),(1036,'appointment_manager','APPOINTMENT_FORM','*','MODIFY_APPOINTMENT'),(1037,'appointment_manager','APPOINTMENT_FORM','*','MODIFY_FORM'),(1038,'appointment_manager','APPOINTMENT_FORM_CREATE','*','CREATE_FORM');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user`
--

DROP TABLE IF EXISTS `core_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `access_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `password` mediumtext COLLATE utf8_unicode_ci,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr',
  `level_user` smallint(6) NOT NULL DEFAULT '0',
  `reset_password` smallint(6) NOT NULL DEFAULT '0',
  `accessibility_mode` smallint(6) NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user`
--

LOCK TABLES `core_admin_user` WRITE;
/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` VALUES (1,'admin','Admin','admin','admin@test.com',0,'PBKDF2WITHHMACSHA512:40000:31d92b4a5e70c170a935f221d8716df6:74b829b76c2814d7f92885571291e8cb9a481682680555231f9db0f9dee4245cd59a0efacc0b0325d80c1e0c9d3373bff2d54b8540fba3fb99a364e142bd28a153fdb1bc1692a818e6b8649cf0700ba624802fa00e26dd23067da8e2fb42ba7d9f9807aa8dbc36e469d7a61785923eb0c767324387d37e6c9a7bf732af4611cb','fr',0,0,0,NULL,1566560684320,0,'2018-08-23 11:44:44','all'),(2,'appointment_manager','Manager','Appointment','appointment_manager@test.com',0,'PBKDF2WITHHMACSHA512:40000:4506b1dc76ec412b057bb9d2fb5000df:dba67e428cc711d940be47cfb276ad6edf0e39f4fd69df4e1d895df2334461753768054a082edea9839fcf80ef952b9e675d4251ecd7f9c371709d9811cda9f47f526ba09ae7924bb237881023a4fc075329f743e6f48fbc6e216cd5d0394d175541e67845d1f9e9953fb3f6f68c690a3f72780cc1c100f9d28ea5ca396b756a','fr',1,0,0,NULL,1566560656885,0,'2018-08-23 11:44:16','all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_anonymize_field`
--

DROP TABLE IF EXISTS `core_admin_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_anonymize_field`
--

LOCK TABLES `core_admin_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` VALUES ('access_code',1),('last_name',1),('first_name',1),('email',1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_field`
--

DROP TABLE IF EXISTS `core_admin_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user_field` (
  `id_user_field` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user_field`),
  KEY `core_admin_user_field_idx_file` (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_field`
--

LOCK TABLES `core_admin_user_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_preferences`
--

DROP TABLE IF EXISTS `core_admin_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_user_preferences` (
  `id_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_preferences`
--

LOCK TABLES `core_admin_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup`
--

DROP TABLE IF EXISTS `core_admin_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_workgroup` (
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `workgroup_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup`
--

LOCK TABLES `core_admin_workgroup` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup_user`
--

DROP TABLE IF EXISTS `core_admin_workgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup_user`
--

LOCK TABLES `core_admin_workgroup_user` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute`
--

DROP TABLE IF EXISTS `core_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_attribute` (
  `id_attribute` int(11) NOT NULL DEFAULT '0',
  `type_class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `help_message` mediumtext COLLATE utf8_unicode_ci,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_shown_in_search` smallint(6) DEFAULT '0',
  `is_shown_in_result_list` smallint(6) DEFAULT '0',
  `is_field_in_line` smallint(6) DEFAULT '0',
  `attribute_position` int(11) DEFAULT '0',
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute`
--

LOCK TABLES `core_attribute` WRITE;
/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute_field`
--

DROP TABLE IF EXISTS `core_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_attribute_field` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8_unicode_ci,
  `is_DEFAULT_value` smallint(6) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT '0',
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute_field`
--

LOCK TABLES `core_attribute_field` WRITE;
/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_connections_log`
--

DROP TABLE IF EXISTS `core_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_connections_log` (
  `access_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int(11) DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_connections_log`
--

LOCK TABLES `core_connections_log` WRITE;
/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
INSERT INTO `core_connections_log` VALUES ('admin','127.0.0.1','2018-08-14 15:21:30',0),('admin','127.0.0.1','2018-08-16 13:11:18',0),('admin','127.0.0.1','2018-08-16 15:12:06',0);
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_dashboard`
--

DROP TABLE IF EXISTS `core_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_dashboard`
--

LOCK TABLES `core_dashboard` WRITE;
/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` VALUES ('CORE_SYSTEM',1,2),('CORE_USERS',1,1),('CORE_USER',4,1),('CORE_PAGES',2,1),('APPOINTMENT_FORM',3,2),('APPOINTMENT_USER_CALENDAR',3,3),('WORKFLOW',3,1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_datastore`
--

DROP TABLE IF EXISTS `core_datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_datastore` (
  `entity_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`entity_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_datastore`
--

LOCK TABLES `core_datastore` WRITE;
/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` VALUES ('core.advanced_parameters.password_duration','120'),('core.advanced_parameters.default_user_level','0'),('core.advanced_parameters.default_user_notification','1'),('core.advanced_parameters.default_user_language','fr'),('core.advanced_parameters.default_user_status','0'),('core.advanced_parameters.email_pattern','^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),('core.advanced_parameters.email_pattern_verify_by',''),('core.advanced_parameters.force_change_password_reinit','false'),('core.advanced_parameters.password_minimum_length','8'),('core.advanced_parameters.password_format_upper_lower_case','false'),('core.advanced_parameters.password_format_numero','false'),('core.advanced_parameters.password_format_special_characters','false'),('core.advanced_parameters.password_history_size',''),('core.advanced_parameters.maximum_number_password_change',''),('core.advanced_parameters.tsw_size_password_change',''),('core.advanced_parameters.use_advanced_security_parameters',''),('core.advanced_parameters.account_life_time','12'),('core.advanced_parameters.time_before_alert_account','30'),('core.advanced_parameters.nb_alert_account','2'),('core.advanced_parameters.time_between_alerts_account','10'),('core.advanced_parameters.access_failures_max','3'),('core.advanced_parameters.access_failures_interval','10'),('core.advanced_parameters.expired_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.expired_alert_mail_subject','Votre compte a expir√©'),('core.advanced_parameters.first_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.first_alert_mail_subject','Votre compte va bient√¥t expirer'),('core.advanced_parameters.other_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.other_alert_mail_subject','Votre compte va bient√¥t expirer'),('core.advanced_parameters.account_reactivated_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.account_reactivated_mail_subject','Votre compte a bien √©t√© r√©activ√©'),('core.advanced_parameters.access_failures_captcha','1'),('core.advanced_parameters.notify_user_password_expired',''),('core.advanced_parameters.password_expired_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.password_expired_mail_subject','Votre mot de passe a expir√©'),('core.advanced_parameters.reset_token_validity','60'),('core.advanced_parameters.lock_reset_token_to_session','false'),('core.backOffice.defaultEditor','tinymce'),('core.frontOffice.defaultEditor','markitupbbcode'),('core_banned_domain_names','yopmail.com'),('portal.site.site_property.name','LUTECE'),('portal.site.site_property.meta.author','<author>'),('portal.site.site_property.meta.copyright','<copyright>'),('portal.site.site_property.meta.description','<description>'),('portal.site.site_property.meta.keywords','<keywords>'),('portal.site.site_property.email','<webmaster email>'),('portal.site.site_property.noreply_email','no-reply@mydomain.com'),('portal.site.site_property.home_url','jsp/site/Portal.jsp'),('portal.site.site_property.admin_home_url','jsp/admin/AdminMenu.jsp'),('portal.site.site_property.popup_credits.textblock','&lt;credits text&gt;'),('portal.site.site_property.popup_legal_info.copyright.textblock','&lt;copyright text&gt;'),('portal.site.site_property.popup_legal_info.privacy.textblock','&lt;privacy text&gt;'),('portal.site.site_property.logo_url','images/logo-header-icon.png'),('portal.site.site_property.menu.position','top'),('portal.site.site_property.locale.default','fr'),('portal.site.site_property.avatar_default','images/admin/skin/unknown.png'),('portal.site.site_property.back_images','\'images/admin/skin/bg_login1.jpg\' , \'images/admin/skin/bg_login2.jpg\' , \'images/admin/skin/bg_login3.jpg\' , \'images/admin/skin/bg_login4.jpg\''),('core.cache.status.appointment.appointmentFormCacheService.enabled','1'),('core.cache.status.EntryTypeServiceManagerCache.enabled','1'),('leaflet.icon.icons.default.installed','true'),('leaflet.icon.icons.red.installed','true'),('leaflet.icon.icons.yellow.installed','true'),('leaflet.icon.icons.green.installed','true'),('mylutece.security.public_url.mylutece.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece.url.createAccount.page','jsp/site/Portal.jsp?page=mylutece&action=createAccount'),('mylutece.security.public_url.mylutece.url.modifyAccount.page','jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),('mylutece.security.public_url.mylutece.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),('mylutece.security.public_url.mylutece.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece.url.doActionsAll','jsp/site/plugins/mylutece/Do*'),('mylutece-database_banned_domain_names','yopmail.com'),('mylutece.security.public_url.mylutece-database.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece-database.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece-database.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece-database.url.createAccount.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=createAccount'),('mylutece.security.public_url.mylutece-database.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostPassword'),('mylutece.security.public_url.mylutece-database.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece-database.url.reinitPassword.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=reinitPassword'),('mylutece.security.public_url.mylutece-database.url.doActionsAll','jsp/site/plugins/mylutece/modules/database/Do*'),('core.cache.status.resource.resourceCacheService.enabled','1'),('core.cache.status.resource.resourceCacheService.maxElementsInMemory','500'),('core.cache.status.PageCachingFilter.enabled','0'),('core.cache.status.LuteceUserCacheService.enabled','1'),('core.cache.status.StaticFilesCachingFilter.enabled','0'),('core.cache.status.PageCacheService.enabled','0'),('core.cache.status.MailAttachmentCacheService.overflowToDisk','true'),('core.cache.status.PortletCacheService.enabled','0'),('core.cache.status.LuteceUserCacheService.maxElementsInMemory','1000'),('core.cache.status.MailAttachmentCacheService.enabled','1'),('core.cache.status.PortalMenuService.enabled','1'),('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds','604800'),('core.cache.status.MailAttachmentCacheService.diskPersistent','true'),('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory','1000'),('core.cache.status.MyPortalWidgetContentService.enabled','1'),('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds','7200'),('core.cache.status.MailAttachmentCacheService.maxElementsInMemory','10'),('core.cache.status.pathCacheService.enabled','1'),('core.cache.status.MyPortalWidgetService.enabled','1'),('core.cache.status.LinksIncludeCacheService.enabled','1'),('core.cache.status.SiteMapService.enabled','1'),('core.cache.status.BaseUserPreferencesCacheService.enabled','1'),('core.plugins.status.core_extensions.installed','true'),('core.plugins.status.lucene.installed','true'),('core.daemon.indexer.interval','300'),('core.daemon.indexer.onStartUp','true'),('core.daemon.mailSender.interval','86400'),('core.daemon.mailSender.onStartUp','true'),('core.daemon.anonymizationDaemon.interval','86400'),('core.daemon.anonymizationDaemon.onStartUp','false'),('core.daemon.accountLifeTimeDaemon.interval','86400'),('core.daemon.accountLifeTimeDaemon.onStartUp','true'),('core.daemon.threadLauncherDaemon.interval','86400'),('core.daemon.threadLauncherDaemon.onStartUp','true'),('core.daemon.crmClientSender.interval','60'),('core.daemon.crmClientSender.onStartUp','true'),('core.daemon.AppointmentReminderDaemon.interval','600'),('core.daemon.AppointmentReminderDaemon.onStartUp','true'),('core.daemon.databaseAnonymizationDaemon.interval','86400'),('core.daemon.databaseAnonymizationDaemon.onStartUp','true'),('core.daemon.databaseAccountLifeTimeDaemon.interval','86400'),('core.daemon.databaseAccountLifeTimeDaemon.onStartUp','true'),('core.daemon.solrindexer.interval','300'),('core.daemon.solrindexer.onStartUp','true'),('core.daemon.automaticActionDaemon.interval','14400'),('core.daemon.automaticActionDaemon.onStartUp','true'),('core.startup.time','22 ao√ªt 2018 13:58:29'),('core.cache.status.DatastoreCacheService.enabled','0'),('core.plugins.status.appointment.installed','true'),('core.plugins.status.appointment.pool','portal'),('core.plugins.status.appointment-filling.installed','true'),('core.plugins.status.appointment-filling.pool','portal'),('core.plugins.status.appointment-leaflet.installed','true'),('core.plugins.status.appointment-resource.installed','true'),('core.plugins.status.appointment-resource.pool','portal'),('core.plugins.status.appointment-solr.installed','true'),('core.plugins.status.appointment-solrsearchapp.installed','true'),('core.plugins.status.asynchronous-upload.installed','true'),('core.plugins.status.asynchronous-upload.pool','portal'),('core.plugins.status.captcha.installed','true'),('core.plugins.status.crmclient.installed','true'),('core.plugins.status.crmclient.pool','portal'),('core.plugins.status.genericalert.installed','true'),('core.plugins.status.genericalert.pool','portal'),('core.plugins.status.genericattributes.installed','true'),('core.plugins.status.genericattributes.pool','portal'),('core.plugins.status.genericattributes-googlemaps.installed','true'),('core.plugins.status.html.installed','true'),('core.plugins.status.jcaptcha.installed','true'),('core.plugins.status.leaflet.installed','true'),('core.plugins.status.mylutece.installed','true'),('core.plugins.status.mylutece.pool','portal'),('core.plugins.status.mylutece-database.installed','true'),('core.plugins.status.mylutece-database.pool','portal'),('core.plugins.status.regularexpression.installed','true'),('core.plugins.status.regularexpression.pool','portal'),('core.plugins.status.resource.installed','true'),('core.plugins.status.resource.pool','portal'),('core.plugins.status.resource-adminuser.installed','true'),('core.plugins.status.resource-mylutece.installed','true'),('core.plugins.status.rest.installed','true'),('core.plugins.status.sitelabels.installed','true'),('core.plugins.status.solr.installed','true'),('core.plugins.status.solr.pool','portal'),('core.plugins.status.solrserver.installed','true'),('core.plugins.status.workflow.installed','true'),('core.plugins.status.workflow.pool','portal'),('core.plugins.status.workflow-appointment.installed','true'),('core.plugins.status.workflow-appointment.pool','portal'),('core.cache.status.XMLTransformerCacheService(XSLT).enabled','1'),('core.cache.status.asynchronousupload.asynchronousUploadCacheService.enabled','0'),('core.crypto.key','d6d84cceb8a7a3b924dbe3ac326a1fc01ca2ba6fc5233f98aeb19f7ef7e67adf'),('core.plugins.status.appointment-mydashboard.installed','true'),('core.plugins.status.appointment-mydashboard.pool','portal'),('core.plugins.status.mydashboard.installed','true'),('core.plugins.status.mydashboard.pool','portal'),('core.plugins.status.mydashboard-mylutecedatabase.installed','true'),('core.plugins.status.address.installed','true'),('core.plugins.status.address-autocomplete.installed','true'),('captcha.defaultProvider','JCaptcha');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_feature_group`
--

DROP TABLE IF EXISTS `core_feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_feature_group` (
  `id_feature_group` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_group_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_group_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_feature_group`
--

LOCK TABLES `core_feature_group` WRITE;
/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` VALUES ('CONTENT','portal.features.group.content.description','portal.features.group.content.label',1),('APPLICATIONS','portal.features.group.applications.description','portal.features.group.applications.label',3),('SYSTEM','portal.features.group.system.description','portal.features.group.system.label',7),('SITE','portal.features.group.site.description','portal.features.group.site.label',2),('STYLE','portal.features.group.charter.description','portal.features.group.charter.label',6),('USERS','portal.features.group.users.description','portal.features.group.users.label',4),('MANAGERS','portal.features.group.managers.description','portal.features.group.managers.label',5);
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_file`
--

DROP TABLE IF EXISTS `core_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_file` (
  `id_file` int(11) NOT NULL DEFAULT '0',
  `title` mediumtext COLLATE utf8_unicode_ci,
  `id_physical_file` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_file`
--

LOCK TABLES `core_file` WRITE;
/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` VALUES (125,'export_users_csv.xml',125,2523,'application/xml','2005-10-10 08:10:10'),(126,'export_users_xml.xml',126,259,'application/xml','2005-10-10 08:10:10'),(127,'export_users_csv.xml',127,1861,'application/xml',NULL),(128,'export_users_xml.xml',128,259,'application/xml',NULL);
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_id_generator`
--

DROP TABLE IF EXISTS `core_id_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_id_generator` (
  `class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `current_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_id_generator`
--

LOCK TABLES `core_id_generator` WRITE;
/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_indexer_action`
--

DROP TABLE IF EXISTS `core_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_indexer_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `id_document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_task` int(11) NOT NULL DEFAULT '0',
  `indexer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_indexer_action`
--

LOCK TABLES `core_indexer_action` WRITE;
/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_level_right`
--

DROP TABLE IF EXISTS `core_level_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_level_right` (
  `id_level` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_level_right`
--

LOCK TABLES `core_level_right` WRITE;
/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` VALUES (0,'Niveau 0 - Droits de l\'administrateur technique'),(1,'Niveau 1 - Droits de l\'administrateur fonctionnel'),(2,'Niveau 2 - Droits du webmestre'),(3,'Niveau 3 - Droits de l\'assistant webmestre');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_item`
--

DROP TABLE IF EXISTS `core_mail_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_mail_item` (
  `id_mail_queue` int(11) NOT NULL DEFAULT '0',
  `mail_item` mediumblob,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_item`
--

LOCK TABLES `core_mail_item` WRITE;
/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
INSERT INTO `core_mail_item` VALUES (74,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppte<html>\r\n	<head>\r\n		<title>[LUTECE] Cr√©ation de votre compte administrateur</title>\r\n	</head>\r\n	<body>\r\n			<h2><a title=\"LUTECE\" href=\"http://localhost:8080/appointment/jsp/admin/AdminMenu.jsp\" >LUTECE</a></h2>\r\n		Bonjour Appointment Manager Appointment Manager,<br /><br />\r\n		Votre compte administrateur a √©t√© cr√©√©. Voici les informations relatives √† votre compte :\r\n		 <br/>----------------------------------------------------------<br />    \r\n		&nbsp;&nbsp;&nbsp;Code d\'acc√®s : appointment_manager\r\n		<br />\r\n		&nbsp;&nbsp;&nbsp;Mot de passe : adminadmin\r\n		<br/>----------------------------------------------------------<br />\r\n		La page de connexion √† l\'interface d\'administration est disponible ici  : <a href=\"http://localhost:8080/appointment/jsp/admin/AdminLogin.jsp\">http://localhost:8080/appointment/jsp/admin/AdminLogin.jsp</a>	\r\n	</body>\r\n</html>\r\nppt\0appointment_manager@test.comt\0no-reply@mydomain.comq\0~\0t\01[LUTECE] Cr√©ation de votre compte administrateur'),(73,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0ppptR<html>\r\n	<head>\r\n		<title>[LUTECE] Cr√©ation de votre compte administrateur</title>\r\n	</head>\r\n	<body>\r\n			<h2><a title=\"LUTECE\" href=\"http://localhost:8080/appointment/jsp/admin/AdminMenu.jsp\" >LUTECE</a></h2>\r\n		Bonjour Appointment Manager,<br /><br />\r\n		Votre compte administrateur a √©t√© cr√©√©. Voici les informations relatives √† votre compte :\r\n		 <br/>----------------------------------------------------------<br />    \r\n		&nbsp;&nbsp;&nbsp;Code d\'acc√®s : appointment_manager\r\n		<br />\r\n		&nbsp;&nbsp;&nbsp;Mot de passe : appointment\r\n		<br/>----------------------------------------------------------<br />\r\n		La page de connexion √† l\'interface d\'administration est disponible ici  : <a href=\"http://localhost:8080/appointment/jsp/admin/AdminLogin.jsp\">http://localhost:8080/appointment/jsp/admin/AdminLogin.jsp</a>	\r\n	</body>\r\n</html>\r\nppt\0\rtest@test.comt\0no-reply@mydomain.comq\0~\0t\01[LUTECE] Cr√©ation de votre compte administrateur'),(72,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-09-06 11:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=30&id_admin_user=1&timestamp=1534430239484&key=98f996cbf8536194f271dbc7dbf436b0c774d99f52accca9aea78897912cbf7d\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=30&id_admin_user=1&timestamp=1534430239483&key=9aa9c935ac13c60c708dd5d943c52208e9e7a1ef04c06bdcd63540edd9bc85a9\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-09-06 at 11:00'),(71,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt.<p>Dear jhjhfjf jghfjghj,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-09-06 11:00 has been registered (reference number:<strong> 30919d7</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=30919d7\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-09-06'),(70,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-09-06 09:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=29&id_admin_user=1&timestamp=1534430184506&key=71e0afe4b6005b4a37f3ece874365acbc5a5f654f153e32cec2b4b150c0ad938\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=29&id_admin_user=1&timestamp=1534430184505&key=ccd82f3ba1876968bd46e6a0db7fada3da50e9e74517e655fb971bcfc7ac7cbe\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-09-06 at 09:00'),(69,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt+<p>Dear jhgjfhj hfjhj,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-09-06 09:00 has been registered (reference number:<strong> 29c9e8d</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=29c9e8d\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-09-06'),(40,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt)<p>Dear hgfh hhghgf,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-22 09:00 has been registered (reference number:<strong> 1490026</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=1490026\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-22'),(41,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-22 09:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=14&id_admin_user=1&timestamp=1534428702008&key=f4711abbd41de327b6ff6591bd35c428ea1ead8636ff218b464ecda1c3fead2a\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=14&id_admin_user=1&timestamp=1534428702007&key=51b44c91268a58af009e664432c55ec25fd7edb4a8dbc22a761b8d4ab4e6d9d6\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-22 at 09:00'),(42,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt&<p>Dear hg fghfh,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-22 10:00 has been registered (reference number:<strong> 15566f1</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=15566f1\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-22'),(43,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-22 10:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=15&id_admin_user=1&timestamp=1534428748832&key=b193573faae0aeba4044606685419afce7fc39e433d7686a4e2b3d77713e7d21\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=15&id_admin_user=1&timestamp=1534428748832&key=835f207d8f3703d338d53aa9011bed51953d126613b09980ae187e08aa50f06b\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-22 at 10:00'),(44,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt\'<p>Dear ghd hgfhf,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-23 10:00 has been registered (reference number:<strong> 1621188</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=1621188\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-23'),(45,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-23 10:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=16&id_admin_user=1&timestamp=1534428768874&key=ef00e90ac2bbd91541f7fcaee7f8706d2b4722d7ba02986249dde3fc149cc7cf\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=16&id_admin_user=1&timestamp=1534428768874&key=f99259daa5e696179a61a588aa33363d355222b469fce582884b4740a739c70b\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-23 at 10:00'),(46,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt*<p>Dear gfhfhd hghgh,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-23 11:00 has been registered (reference number:<strong> 17b8a49</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=17b8a49\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-23'),(47,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-23 11:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=17&id_admin_user=1&timestamp=1534428877705&key=304f0012a0fb8e9ed559a449a0fb9d261ef3b672efa3a009c90d5ca8ba845a75\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=17&id_admin_user=1&timestamp=1534428877705&key=1b584ec8bc22f5c3ba967c139548818e1786088b74d4bf6fc8a146504353649c\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-23 at 11:00'),(48,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt)<p>Dear hgfhf dhfgh,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-23 09:00 has been registered (reference number:<strong> 183d524</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=183d524\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-23'),(49,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-23 09:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=18&id_admin_user=1&timestamp=1534428902982&key=d5b38a76ce72191214703cdcdcd7075f1a58b4c829794a9790436fda87a495d9\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=18&id_admin_user=1&timestamp=1534428902982&key=ab3c237484f8f4496258fa6c4c327cecf4227639c9dd64e4306f2f97a21a67da\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-23 at 09:00'),(50,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt+<p>Dear hgfdhd hgfhfh,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-30 10:00 has been registered (reference number:<strong> 19eb0c5</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=19eb0c5\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-30'),(51,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-30 10:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=19&id_admin_user=1&timestamp=1534428923284&key=3f3b9dc9f0dfa85953fb3b11f05ad83d84b582d1272279ec4dc8fdc8107c63d2\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=19&id_admin_user=1&timestamp=1534428923284&key=be9ed4387227e1a17912a415dfc730e6e6e79f11dcc2b7b80b44dad7eabb4e89\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-30 at 10:00'),(52,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt*<p>Dear fdgfg fdgfdg,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-29 10:00 has been registered (reference number:<strong> 203ff92</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=203ff92\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-29'),(53,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-29 10:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=20&id_admin_user=1&timestamp=1534428992564&key=edefac7b43b472b765d5238a34b5f447592bef3180519a4c09195f0ecfd542b6\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=20&id_admin_user=1&timestamp=1534428992563&key=9106ff2a142ac14e453d0da94c4474fff179dd9f6c880a1a24e92b42b69ca4c2\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-29 at 10:00'),(54,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt.<p>Dear hgfhfghgf hghghg,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-30 09:00 has been registered (reference number:<strong> 217e693</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=217e693\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-30'),(55,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-30 09:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=21&id_admin_user=1&timestamp=1534429122868&key=43c63ad4caceeac0e0c158659fd31d3498ded8267c688322359d9d4cf499b659\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=21&id_admin_user=1&timestamp=1534429122867&key=107c6d6e7b482efe4b418445cf2cbf97d277fad77cc16ae1e3ddd5bd1a2b7ae6\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-30 at 09:00'),(56,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt(<p>Dear iuiu iuiui,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-30 11:00 has been registered (reference number:<strong> 221341e</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=221341e\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-30'),(57,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-30 11:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=22&id_admin_user=1&timestamp=1534429948487&key=4cc3fb7a8b88b196d5d3499c5a1428023fdef02d60affabe5dc8312b39eef822\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=22&id_admin_user=1&timestamp=1534429948487&key=fa5862513bed5f6485087390fc1d38841ec38844053f331ff29be71bba4a842f\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-30 at 11:00'),(58,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt)<p>Dear tuitit uiti,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-29 09:00 has been registered (reference number:<strong> 23e394a</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=23e394a\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-29'),(59,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-29 09:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=23&id_admin_user=1&timestamp=1534429970524&key=6f90fd0fc886a4106ac21421335fe43d485fcb1fbd705285e8dcd7b181034401\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=23&id_admin_user=1&timestamp=1534429970524&key=7ace3c5790b6f440230a3da243b4e5bdc30b8efd21f611aecc95d2c3fc65f665\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-29 at 09:00'),(60,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt(<p>Dear oiuo oiuoi,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-09-06 10:00 has been registered (reference number:<strong> 24dc824</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=24dc824\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-09-06'),(61,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-09-06 10:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=24&id_admin_user=1&timestamp=1534430028527&key=d83d924f492ff5b2668c66af27c3da0b76b8d72cec718aae7797f80f3ebc9cfd\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=24&id_admin_user=1&timestamp=1534430028527&key=ef02f319a68837228d58277d5b95d8a1f79aaaeae77ebaaefc58285def2bdbd3\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-09-06 at 10:00'),(62,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-09-05 10:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=25&id_admin_user=1&timestamp=1534430045546&key=c2d312d5aa8882718a997a4320317ccf74d60ada92dd34b2e907730898fc70ff\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=25&id_admin_user=1&timestamp=1534430045546&key=ed34a711757261db938451ce722dd5c7edbf000f4696944e15b2b76a857a6776\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-09-05 at 10:00'),(63,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt*<p>Dear poipoi opiup,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-09-05 09:00 has been registered (reference number:<strong> 2649230</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=2649230\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-09-05'),(64,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-09-05 09:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=26&id_admin_user=1&timestamp=1534430079754&key=a82ac68fa81588f57fc42791f730c1b735917d3d8a97de18977c304b0f722390\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=26&id_admin_user=1&timestamp=1534430079754&key=8ee606c146870de9e9ac8326c07c93b08245e004c110b32d96bec8b5a1e84246\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-09-05 at 09:00'),(65,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt\'<p>Dear lkj ljklk,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-22 11:00 has been registered (reference number:<strong> 27066ca</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=27066ca\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-22'),(66,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-22 11:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=27&id_admin_user=1&timestamp=1534430118381&key=66a29f38b35e3fb313b912d8f615a3e832bb18d725bc6fba48957edefa8da2e8\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=27&id_admin_user=1&timestamp=1534430118381&key=4354a147f30b630fb8130e4403d7d408688d76845438744be9af75655a61b13e\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-22 at 11:00'),(67,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt.<p>Dear fgdhgfhfg hghgfh,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-29 11:00 has been registered (reference number:<strong> 281d55a</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://localhost:8080/appointment/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=281d55a\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-29'),(68,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¡<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-29 11:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n	</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=28&id_admin_user=1&timestamp=1534430138831&key=00a3831d3159c3b4ffc43dd1fb3e64fdc85cda72635999952b5068a7bb60ee11\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appointment/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=28&id_admin_user=1&timestamp=1534430138830&key=50d7e8d085325e3caaab04a0d3c74f75822160ea11ba837ddaf68bb05d4ac4d9\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-29 at 11:00');
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_queue`
--

DROP TABLE IF EXISTS `core_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_mail_queue` (
  `id_mail_queue` int(11) NOT NULL AUTO_INCREMENT,
  `is_locked` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_queue`
--

LOCK TABLES `core_mail_queue` WRITE;
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
INSERT INTO `core_mail_queue` VALUES (70,0),(69,0),(68,0),(67,0),(66,0),(65,0),(64,0),(63,0),(62,0),(61,0),(60,0),(40,0),(41,0),(59,0),(58,0),(57,0),(56,0),(55,0),(54,0),(53,0),(52,0),(51,0),(50,0),(49,0),(48,0),(47,0),(46,0),(45,0),(44,0),(43,0),(42,0),(71,0),(72,0),(73,0),(74,0);
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mode`
--

DROP TABLE IF EXISTS `core_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_mode` (
  `id_mode` int(11) NOT NULL DEFAULT '0',
  `description_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `output_xsl_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_media_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_encoding` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_indent` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_omit_xml_dec` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_standalone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mode`
--

LOCK TABLES `core_mode` WRITE;
/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` VALUES (0,'Normal','normal/','xml','1.0','text/xml','UTF-8','yes','yes','yes'),(1,'Administration','admin/','xml','1.0','text/xml','UTF-8','yes','yes','yes'),(2,'Wap','wml/','xml','1.0','text/xml','UTF-8','yes','yes','yes');
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_page` (
  `id_page` int(11) NOT NULL DEFAULT '0',
  `id_parent` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) DEFAULT NULL,
  `page_order` int(11) DEFAULT '0',
  `id_template` int(11) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_theme` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `node_status` smallint(6) NOT NULL DEFAULT '1',
  `image_content` mediumblob,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_authorization_node` int(11) DEFAULT NULL,
  `display_date_update` smallint(6) NOT NULL DEFAULT '0',
  `is_manual_date_update` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `index_page` (`id_template`,`id_parent`),
  KEY `index_childpage` (`id_parent`,`page_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page`
--

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES (1,0,'Home','Home Page','2014-06-08 15:20:44',1,1,4,'2003-09-08 22:38:01','none','default',0,'','application/octet-stream',NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_page_template` (
  `id_template` int(11) NOT NULL DEFAULT '0',
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page_template`
--

LOCK TABLES `core_page_template` WRITE;
/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` VALUES (1,'Une colonne','skin/site/page_template1.html','page_template1.gif'),(2,'Deux colonnes','skin/site/page_template2.html','page_template2.gif'),(3,'Trois colonnes','skin/site/page_template3.html','page_template3.gif'),(4,'1 + 2 colonnes','skin/site/page_template4.html','page_template4.gif'),(5,'Deux colonnes √©gales','skin/site/page_template5.html','page_template5.gif'),(6,'Trois colonnes in√©gales','skin/site/page_template6.html','page_template6.gif');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_physical_file`
--

DROP TABLE IF EXISTS `core_physical_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_physical_file` (
  `id_physical_file` int(11) NOT NULL DEFAULT '0',
  `file_value` mediumblob,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_physical_file`
--

LOCK TABLES `core_physical_file` WRITE;
/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` VALUES (125,'<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"locale\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"level\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"must_change_password\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"accessibility_mode\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"date_last_login\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"rights\" />\r\n		<xsl:apply-templates select=\"workgroups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"rights\">\r\n		<xsl:apply-templates select=\"right\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"right\">\r\n		<xsl:text>;\"right:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroups\">\r\n		<xsl:apply-templates select=\"workgroup\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroup\">\r\n		<xsl:text>;\"workgroup:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),(126,'<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>'),(127,'<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"groups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"groups\">\r\n		<xsl:apply-templates select=\"group\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"group\">\r\n		<xsl:text>;\"group:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),(128,'<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>');
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portal_component`
--

DROP TABLE IF EXISTS `core_portal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portal_component` (
  `id_portal_component` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portal_component`
--

LOCK TABLES `core_portal_component` WRITE;
/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` VALUES (0,'Rubrique'),(1,'Article'),(2,'Rubrique Liste Article'),(3,'Menu Init'),(4,'Menu Principal'),(5,'Chemin Page'),(6,'Plan du site'),(7,'Arborescence'),(8,'Plan du site admin');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet`
--

DROP TABLE IF EXISTS `core_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `portlet_order` int(11) DEFAULT NULL,
  `column_no` int(11) DEFAULT NULL,
  `id_style` int(11) DEFAULT NULL,
  `accept_alias` smallint(6) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `display_portlet_title` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_display_flags` int(11) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id_portlet`),
  KEY `index_portlet` (`id_page`,`id_portlet_type`,`id_style`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet`
--

LOCK TABLES `core_portlet` WRITE;
/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
INSERT INTO `core_portlet` VALUES (5,'APPOINTMENT_FORM_LIST_PORTLET',1,'Appointment list','2018-08-13 16:47:44',0,1,1,0,0,'2018-08-13 16:47:44',0,'none',4369);
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_alias`
--

DROP TABLE IF EXISTS `core_portlet_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portlet_alias` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `id_alias` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_alias`
--

LOCK TABLES `core_portlet_alias` WRITE;
/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_type`
--

DROP TABLE IF EXISTS `core_portlet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_portlet_type` (
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_creation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_update` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_docreate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_specific` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_specific_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_domodify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_specific` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_specific_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_type`
--

LOCK TABLES `core_portlet_type` WRITE;
/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` VALUES ('ALIAS_PORTLET','portal.site.portletAlias.name','plugins/alias/CreatePortletAlias.jsp','plugins/alias/ModifyPortletAlias.jsp','fr.paris.lutece.portal.business.portlet.AliasPortletHome','alias','plugins/alias/DoCreatePortletAlias.jsp','/admin/portlet/script_create_portlet.html','/admin/portlet/alias/create_portlet_alias.html','','plugins/alias/DoModifyPortletAlias.jsp','/admin/portlet/script_modify_portlet.html','/admin/portlet/alias/modify_portlet_alias.html',''),('APPOINTMENT_FORM_PORTLET','appointment.appointmentForm.name','plugins/appointment/CreatePortletAppointmentForm.jsp','plugins/appointment/ModifyPortletAppointmentForm.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentFormPortletHome','appointment','plugins/appointment/DoCreatePortletAppointmentForm.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointmentform.html','','plugins/appointment/DoModifyPortletAppointmentForm.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointmentform.html',''),('APPOINTMENT_FORM_LIST_PORTLET','appointment.portlet.appointmentFormListPortlet.name','plugins/appointment/CreatePortletAppointmentFormList.jsp','plugins/appointment/ModifyPortletAppointmentFormList.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentFormListPortletHome','appointment','plugins/appointment/DoCreatePortletAppointmentFormList.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointmentformlist.html','','plugins/appointment/DoModifyPortletAppointmentFormList.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointmentformlist.html',''),('HTML_PORTLET','html.portlet.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html',''),('MYLUTECE_PORTLET','mylutece.portlet.name','plugins/mylutece/CreatePortletMyLutece.jsp','plugins/mylutece/ModifyPortletMyLutece.jsp','fr.paris.lutece.plugins.mylutece.business.portlet.MyLutecePortletHome','mylutece','plugins/mylutece/DoCreatePortletMyLutece.jsp','/admin/portlet/script_create_portlet.html','','','plugins/mylutece/DoModifyPortletMyLutece.jsp','/admin/portlet/script_modify_portlet.html','',''),('APPOINTMENT_PORTLET','appointment.portlet.appointmentAppointmentPortlet.name','plugins/appointment/CreatePortletAppointment.jsp','plugins/appointment/ModifyPortletAppointment.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentPortletHome','workflow-appointment','plugins/appointment/DoCreatePortletAppointment.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointment.html','','plugins/appointment/DoModifyPortletAppointment.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointment.html',''),('MYDASHBOARD_PORTLET','mydashboard.portlet.myDashboardPortlet.name','plugins/mydashboard/GetCreateMyDashboardPortlet.jsp','plugins/mydashboard/GetModifyMyDashboardPortlet.jsp','fr.paris.lutece.plugins.mydashboard.business.portlet.MyDashboardPortletHome','mydashboard','plugins/mydashboard/DoCreateMyDashboardPortlet.jsp','/admin/portlet/script_create_portlet.html','','','plugins/mydashboard/DoModifyMyDashboardPortlet.jsp','/admin/portlet/script_modify_portlet.html','','');
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_role`
--

DROP TABLE IF EXISTS `core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_role` (
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role`
--

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_search_parameter`
--

DROP TABLE IF EXISTS `core_search_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_search_parameter` (
  `parameter_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_search_parameter`
--

LOCK TABLES `core_search_parameter` WRITE;
/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` VALUES ('type_filter','none'),('default_operator','OR'),('help_message','Message d aide pour la recherche'),('date_filter','0'),('tag_filter','0'),('taglist',NULL);
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style`
--

DROP TABLE IF EXISTS `core_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_style` (
  `id_style` int(11) NOT NULL DEFAULT '0',
  `description_style` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_portal_component` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`),
  KEY `index_style` (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style`
--

LOCK TABLES `core_style` WRITE;
/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` VALUES (3,'Menu Init','',3),(4,'Main Menu','',4),(5,'Chemin Page','',5),(6,'Plan du site','',6),(7,'Arborescence','',7),(8,'Plan du Site Admin',NULL,8),(100,'D√©faut','HTML_PORTLET',0),(101,'Fond color√©','HTML_PORTLET',0),(200,'D√©faut','MYLUTECE_PORTLET',0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style_mode_stylesheet`
--

DROP TABLE IF EXISTS `core_style_mode_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_style_mode_stylesheet` (
  `id_style` int(11) NOT NULL DEFAULT '0',
  `id_mode` int(11) NOT NULL DEFAULT '0',
  `id_stylesheet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style_mode_stylesheet`
--

LOCK TABLES `core_style_mode_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` VALUES (3,0,211),(4,0,213),(5,0,215),(6,0,217),(7,0,253),(8,1,279),(100,0,10),(101,0,285),(200,0,310);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stylesheet`
--

DROP TABLE IF EXISTS `core_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stylesheet` (
  `id_stylesheet` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` mediumblob,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stylesheet`
--

LOCK TABLES `core_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` VALUES (253,'Pages filles - Arborescence','menu_tree.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n	<xsl:variable name=\"menu-list\" select=\"menu\" />\r\n\r\n	<script type=\"text/javascript\">\r\n		$(document).ready(function(){\r\n			$(\"#tree\").treeview({\r\n				animated: \"fast\",\r\n				collapsed: false,\r\n				unique: true,\r\n				persist: \"cookie\"\r\n			});\r\n		\r\n		});\r\n	</script>    \r\n	\r\n	<!-- Menu Tree -->      \r\n	<xsl:if test=\"not(string(menu)=\'\')\">\r\n	    <xsl:text disable-output-escaping=\"yes\">		    \r\n            <div class=\"tree4\">		\r\n			<h2>&#160;</h2>\r\n			<ul id=\"tree\" class=\"tree4\">\r\n                <xsl:apply-templates select=\"menu\" />        \r\n			</ul>	\r\n			</div>\r\n		 	 <br />\r\n		</xsl:text> \r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n		<li>\r\n    <!--<xsl:if test=\"$index &lt; 7\">-->        \r\n          <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\" >\r\n               <xsl:value-of select=\"page-name\" />\r\n           </a>	   \r\n		   <br />\r\n		   <xsl:value-of select=\"page-description\" />\r\n		   <!--<xsl:value-of select=\"page-description\" /><br />-->		   			\r\n			<xsl:apply-templates select=\"sublevel-menu-list\" /> \r\n			\r\n		</li> 	\r\n    <!--</xsl:if>-->\r\n		\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" > \r\n	\r\n	<xsl:apply-templates select=\"sublevel-menu\" /> 	    	\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n		 <ul >\r\n			<li>\r\n<!--	<span> -->\r\n				<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n				</a>\r\n			</li>			\r\n		</ul>\r\n	<!--</span>	-->\r\n		\r\n   \r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(215,'Chemin page','page_path.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page_link\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?{page-url}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>'),(213,'Menu principal','menu_main.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\"\r\n	xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n	<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n	<xsl:template match=\"menu-list\">\r\n		<xsl:apply-templates select=\"menu\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"menu\">\r\n		<li>\r\n			<a href=\"{$site-path}?page_id={page-id}\" class=\"first-level\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n			</a>\r\n		</li>\r\n	</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n'),(211,'Menu Init','menu_init.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n<br /><br />\r\n	<div id=\"menu-init\">\r\n		<div id=\"menu-init-content\">\r\n            <ul id=\"menu-verti\">\r\n                <xsl:apply-templates select=\"menu\" />\r\n            </ul>\r\n        </div>\r\n     </div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n\r\n    <xsl:if test=\"$index &gt; 7\">\r\n        <li class=\"first-verti\">\r\n        	<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n          		<xsl:value-of select=\"page-name\" />\r\n	        </a>\r\n    	    <xsl:apply-templates select=\"sublevel-menu-list\" />\r\n        </li>\r\n   </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" >\r\n	<ul>\r\n    	<li class=\"last-verti\">\r\n		 	<xsl:apply-templates select=\"sublevel-menu\" />\r\n 	    </li>\r\n    </ul>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n\r\n   <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n		<span><xsl:value-of select=\"page-name\" /></span>\r\n   </a>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(217,'Plan du site','site_map.xsl','<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page[page-level=0]\">\r\n	<div class=\"span-15 prepend-1 append-1 append-bottom\">\r\n		<div class=\"portlet -lutece-border-radius\">\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level=1]\" >\r\n<ul class=\"site-map-level-one\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"page-image\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	    <xsl:text disable-output-escaping=\"yes\">\r\n		    <![CDATA[<div class=\"clear\">&#160;</div>]]>\r\n	    </xsl:text>\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level=2]\" >\r\n<ul class=\"site-map-level-two\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level>2]\" >\r\n<ul class=\"site-map-level-highest\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page-description\">\r\n	<br /><xsl:value-of select=\".\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=0]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=1]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=2]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"child-pages-list[page-level>2]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page-image\">\r\n	<div class=\"level-one-image\">\r\n    	<div class=\"polaroid\">\r\n		<img  border=\"0\" width=\"80\" height=\"80\" src=\"images/local/data/pages/{.}\" alt=\"\" />\r\n         </div>\r\n	</div >\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>\r\n'),(279,'Plan du Site module d\'Administration','admin_site_map_admin.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n<xsl:variable name=\"current-page-id\" select=\"current-page-id\" />\r\n\r\n<xsl:template match=\"page[page-level=0]\"> \r\n	<div id=\"tree\" class=\"jstree-default\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\" >\r\n			<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\"> \r\n				<strong><xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n				<xsl:value-of select=\"page-role\" /></strong>\r\n			</xsl:if>            \r\n		</a>\r\n		<ul>\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</ul>\r\n	</div>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"page[page-level>0]\" >\r\n	<xsl:variable name=\"index\" select=\"page-id\" />\r\n	<xsl:variable name=\"description\" select=\"page-description\" />\r\n	\r\n	<li id=\"node-{$index}\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\">\r\n		<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\">\r\n				<strong>\r\n				  <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text><xsl:value-of select=\"page-role\" />\r\n				</strong>\r\n			</xsl:if>\r\n		</a>\r\n		<xsl:choose>\r\n			<xsl:when test=\"count(child-pages-list/*)>0\">\r\n				<ul>\r\n				   <xsl:apply-templates select=\"child-pages-list\" />\r\n				</ul>\r\n			</xsl:when>\r\n		   <xsl:otherwise>\r\n				<xsl:apply-templates select=\"child-pages-list\" />\r\n		   </xsl:otherwise>\r\n		</xsl:choose>\r\n	</li>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"child-pages-list\">\r\n	<xsl:apply-templates select=\"page\" />\r\n</xsl:template>\r\n    \r\n</xsl:stylesheet>\r\n'),(10,'Rubrique HTML - D√©faut','portlet_html.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n<xsl:variable name=\"device_class\">\r\n<xsl:choose>\r\n	<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n	<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n	<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n	<xsl:otherwise></xsl:otherwise>\r\n</xsl:choose>\r\n</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n	<xsl:choose>\r\n	<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n	<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:when>\r\n	<xsl:otherwise>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:otherwise>\r\n</xsl:choose>\r\n</div>\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n\r\n\r\n\r\n'),(285,'Rubrique HTML - Fond color√©','portlet_html_background.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n		<xsl:choose>\r\n			<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h2>\r\n					<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n				</h2>\r\n				<div class=\"portlet-background-content -lutece-border-radius-bottom\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<div class=\"portlet-background-content -lutece-border-radius\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n		</div>\r\n    </div>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>'),(310,'Rubrique MyLutece - D√©faut','portlet_mylutece.xsl','<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n			<xsl:choose>\r\n	        <xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:when>\r\n	        <xsl:otherwise>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:otherwise>\r\n			</xsl:choose>\r\n			<div class=\"clearfix\">&#160;</div>\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"mylutece-portlet\">\r\n	<xsl:apply-templates select=\"user-not-signed\" />\r\n	<xsl:apply-templates select=\"lutece-user\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"user-not-signed\">\r\n	<form class=\"form\" action=\"jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp\" method=\"post\">\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@delegated=\'true\']\" />\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\" />\r\n		<xsl:if test=\"count(lutece-user-authentication-service[@loginpassword-required=\'true\']) &gt;= 1\">\r\n			<label for=\"username\">Code d\'acc&#232;s :</label>\r\n			<input name=\"username\" class=\"input-normal\" id=\"username\" autocomplete=\"off\" tabindex=\"1\" type=\"text\"/><br />\r\n			<label for=\"password\">Mot de passe :</label>\r\n			<input name=\"password\" class=\"input-normal\" id=\"password\" autocomplete=\"off\" tabindex=\"2\" type=\"password\" />\r\n			<button class=\"btn btn-small\" tabindex=\"3\" type=\"submit\"><i class=\"icon-user\">&#160;</i>&#160;Connexion</button>\r\n		</xsl:if>\r\n	</form>\r\n	<xsl:apply-templates select=\"lutece-user-new-account-url\" />\r\n	<xsl:apply-templates select=\"lutece-user-lost-password-url\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\">\r\n	<label class=\"radio\" for=\"auth_provider\" >\r\n		<input type=\"radio\" name=\"auth_provider\" value=\"{name}\" checked=\"checked\" />\r\n		<xsl:value-of select=\"display-name\" />\r\n	</label>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@delegated=\'true\']\">\r\n	<a href=\"{url}?auth_provider={name}\">\r\n		<img src=\"{icon-url}\" alt=\"{display-name}\" title=\"{display-name}\"/>\r\n	</a>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user\">\r\n    <p>\r\n	<strong>Bienvenue&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-given\" />&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-family\" />\r\n	</strong>\r\n	</p>\r\n    <xsl:apply-templates select=\"lutece-user-logout-url\" />\r\n    <xsl:apply-templates select=\"lutece-user-view-account-url\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-logout-url\">\r\n   <form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n   	<button type=\"submit\" class=\"btn\"><i class=\"icon-off\">&#160;</i>&#160;D&#233;connexion</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-new-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n		<button type=\"submit\" class=\"btn\"><i class=\"icon-plus\">&#160;</i>&#160;Cr&#233;er un compte</button>&#160;\r\n    </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-lost-password-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-lock\">&#160;</i>&#160;Mot de passe perdu</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-view-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-edit\">&#160;</i>&#160;Voir mon compte</button>&#160;\r\n	</form>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n');
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_template`
--

DROP TABLE IF EXISTS `core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_template` (
  `template_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `template_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`template_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_template`
--

LOCK TABLES `core_template` WRITE;
/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` VALUES ('core_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive √† expiration. Pour prolonger sa validit√©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera d√©sactiv√©.'),('core_expiration_mail','Bonjour ${first_name} ! Votre compte a expir√©. Vous ne pourrez plus vous connecter avec, et les donn√©es vous concernant ont √©t√© anonymis√©es'),('core_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive √† expiration. Pour prolonger sa validit√©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera d√©sactiv√©.'),('core_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien √©t√© r√©activ√©. Il est d√©sormais valable jusqu\'au ${date_valid}.'),('core_password_expired','Bonjour ! Votre mot de passe a expir√©. Lors de votre prochaine connexion, vous pourrez le changer.'),('mylutece_database_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive √† expiration. Pour prolonger sa validit√©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera d√©sactiv√©.'),('mylutece_database_expiration_mail','Bonjour ${first_name} ! Votre compte a expir√©. Vous ne pourrez plus vous connecter avec, et les donn√©es vous concernant ont √©t√© anonymis√©es'),('mylutece_database_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive √† expiration. Pour prolonger sa validit√©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera d√©sactiv√©.'),('mylutece_database_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien √©t√© r√©activ√©. Il est d√©sormais valable jusqu\'au ${date_valid}.'),('mylutece_database_unblock_user','${site_link!}<br />Bonjour ! Votre IP a √©t√© bloqu√©e. Pour la d√©bloquer, vous pouvez suivre le lien suivant : <a href=\"${url}\">debloquer</a>.'),('mylutece_database_password_expired','Bonjour ! Votre mot de passe a √©xpir√©. Lors de votre prochaine connection, vous pourrez le changer.'),('mylutece_database_mailLostPassword','<html><head><title>#i18n{mylutece.email_reinit.object}</title></head><body><p>#i18n{mylutece.email_reinit.content.text}<br /></p><p>#i18n{mylutece.email_reinit.content.newPassword} : ${new_password}<br /></p></body></html><p>#i18n{mylutece.email_reinit.content.reinitPassword}<a href=\"${reinit_url}\">#i18n{mylutece.email_reinit.content.labelLink}</a></p>'),('mylutece_database_mailPasswordEncryptionChanged','<html><head><title>Votre mot de passe a √©t√© r√©initialis√©</title></head><body><p>Pour des raisons de s√©curit√©, votre mot de passe a √©t√© r√©initialis√©.<br />----------------------------------------------------------</p><p>Votre nouveau mot de passe est : ${new_password}<br />----------------------------------------------------------</p></body></html>');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_text_editor`
--

DROP TABLE IF EXISTS `core_text_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_text_editor` (
  `editor_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `editor_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backOffice` smallint(6) NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_text_editor`
--

LOCK TABLES `core_text_editor` WRITE;
/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` VALUES ('tinymce','portal.globalmanagement.editors.labelBackTinyMCE',1),('','portal.globalmanagement.editors.labelBackNoEditor',1),('','portal.globalmanagement.editors.labelFrontNoEditor',0),('markitupbbcode','portal.globalmanagement.editors.labelFrontMarkitupBBCode',0);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_password_history`
--

DROP TABLE IF EXISTS `core_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_password_history` (
  `id_user` int(11) NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_password_history`
--

LOCK TABLES `core_user_password_history` WRITE;
/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
INSERT INTO `core_user_password_history` VALUES (1,'PBKDF2WITHHMACSHA512:40000:31d92b4a5e70c170a935f221d8716df6:74b829b76c2814d7f92885571291e8cb9a481682680555231f9db0f9dee4245cd59a0efacc0b0325d80c1e0c9d3373bff2d54b8540fba3fb99a364e142bd28a153fdb1bc1692a818e6b8649cf0700ba624802fa00e26dd23067da8e2fb42ba7d9f9807aa8dbc36e469d7a61785923eb0c767324387d37e6c9a7bf732af4611cb','2018-08-13 12:55:47'),(2,'PBKDF2WITHHMACSHA512:40000:4506b1dc76ec412b057bb9d2fb5000df:dba67e428cc711d940be47cfb276ad6edf0e39f4fd69df4e1d895df2334461753768054a082edea9839fcf80ef952b9e675d4251ecd7f9c371709d9811cda9f47f526ba09ae7924bb237881023a4fc075329f743e6f48fbc6e216cd5d0394d175541e67845d1f9e9953fb3f6f68c690a3f72780cc1c100f9d28ea5ca396b756a','2018-08-23 11:39:16');
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_preferences`
--

DROP TABLE IF EXISTS `core_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_preferences` (
  `id_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_preferences`
--

LOCK TABLES `core_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
INSERT INTO `core_user_preferences` VALUES ('ejo','mydashboard.dashboardConfigId','2-58929');
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_right`
--

DROP TABLE IF EXISTS `core_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_right` (
  `id_right` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_right`
--

LOCK TABLES `core_user_right` WRITE;
/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` VALUES ('APPOINTMENT_CALENDAR_TEMPLATE',1),('APPOINTMENT_CATEGORY_MANAGEMENT',1),('APPOINTMENT_CATEGORY_MANAGEMENT',2),('APPOINTMENT_FORM_MANAGEMENT',1),('APPOINTMENT_FORM_MANAGEMENT',2),('APPOINTMENT_MANAGEMENT',1),('CORE_ADMIN_SITE',1),('CORE_ADMIN_SITE',2),('CORE_ADMINDASHBOARD_MANAGEMENT',1),('CORE_CACHE_MANAGEMENT',1),('CORE_DAEMONS_MANAGEMENT',1),('CORE_DASHBOARD_MANAGEMENT',1),('CORE_EXTERNAL_FEATURES_MANAGEMENT',1),('CORE_EXTERNAL_FEATURES_MANAGEMENT',2),('CORE_FEATURES_MANAGEMENT',1),('CORE_GLOBAL_MANAGEMENT',1),('CORE_GLOBAL_MANAGEMENT',2),('CORE_LEVEL_RIGHT_MANAGEMENT',1),('CORE_LEVEL_RIGHT_MANAGEMENT',2),('CORE_LINK_SERVICE_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',2),('CORE_LOGS_VISUALISATION',1),('CORE_MAILINGLISTS_MANAGEMENT',1),('CORE_MAILINGLISTS_MANAGEMENT',2),('CORE_MODES_MANAGEMENT',1),('CORE_PAGE_TEMPLATE_MANAGEMENT',1),('CORE_PLUGINS_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',2),('CORE_RBAC_MANAGEMENT',1),('CORE_RIGHT_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',2),('CORE_SEARCH_INDEXATION',1),('CORE_SEARCH_MANAGEMENT',1),('CORE_STYLES_MANAGEMENT',1),('CORE_STYLESHEET_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',2),('CORE_WORKGROUPS_MANAGEMENT',1),('CORE_WORKGROUPS_MANAGEMENT',2),('CORE_XSL_EXPORT_MANAGEMENT',1),('CORE_XSL_EXPORT_MANAGEMENT',2),('DATABASE_GROUPS_MANAGEMENT',1),('DATABASE_GROUPS_MANAGEMENT',2),('DATABASE_MANAGEMENT_USERS',1),('DATABASE_MANAGEMENT_USERS',2),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER',1),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER',2),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION',1),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION',2),('MYLUTECE_MANAGEMENT',1),('MYLUTECE_MANAGEMENT',2),('REGULAR_EXPRESSION_MANAGEMENT',1),('RESOURCE_MANAGE_RESOURCES',1),('RESOURCE_MANAGE_RESOURCES',2),('RESOURCE_MANAGEMENT',1),('RESOURCE_MANAGEMENT',2),('SITELABELS_MANAGEMENT',1),('SOLR_CONFIGURATION_MANAGEMENT',1),('SOLR_CONFIGURATION_MANAGEMENT',2),('SOLR_FIELDS_MANAGEMENT',1),('SOLR_FIELDS_MANAGEMENT',2),('SOLR_INDEX_MANAGEMENT',1),('SOLR_INDEX_MANAGEMENT',2),('SORLSERVER_ADD_FILE',1),('SORLSERVER_ADD_FILE',2),('WORKFLOW_MANAGEMENT',1),('WORKFLOW_MANAGEMENT',2);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_role`
--

DROP TABLE IF EXISTS `core_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_role` (
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_role`
--

LOCK TABLES `core_user_role` WRITE;
/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` VALUES ('all_site_manager',1),('all_site_manager',2),('appointment_manager',1),('appointment_manager',2),('assign_groups',1),('assign_groups',2),('assign_roles',1),('assign_roles',2),('mylutece_database_manager',1),('mylutece_database_manager',2),('mylutece_manager',1),('mylutece_manager',2),('super_admin',1),('super_admin',2),('workflow_manager',1),('workflow_manager',2);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_xsl_export`
--

DROP TABLE IF EXISTS `core_xsl_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_xsl_export` (
  `id_xsl_export` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_xsl_export`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_xsl_export`
--

LOCK TABLES `core_xsl_export` WRITE;
/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` VALUES (125,'Coeur - Export CSV des administrateurs','Export des utilisateurs back office dans un fichier CSV','csv',125,'core'),(126,'Coeur - Export XML des administrateurs','Export des utilisateurs back office dans un fichier XML','xml',126,'core'),(127,'MyLutece Database - Export CSV des utilisateurs','Export des utilisateur MyLutece Database dans un fichier CSV','csv',127,'mylutece-database'),(128,'MyLutece Database - Export XML des utilisateurs','Export des utilisateur MyLutece Database dans un fichier XML','xml',128,'mylutece-database');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_crm_item`
--

DROP TABLE IF EXISTS `crm_client_crm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_client_crm_item` (
  `id_crm_queue` int(11) NOT NULL DEFAULT '0',
  `crm_item` mediumblob,
  PRIMARY KEY (`id_crm_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_crm_item`
--

LOCK TABLES `crm_client_crm_item` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_crm_queue`
--

DROP TABLE IF EXISTS `crm_client_crm_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_client_crm_queue` (
  `id_crm_queue` int(11) NOT NULL DEFAULT '0',
  `is_locked` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_crm_queue`),
  KEY `is_locked_crm_client_crm_queue` (`is_locked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_crm_queue`
--

LOCK TABLES `crm_client_crm_queue` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry`
--

DROP TABLE IF EXISTS `genatt_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_entry` (
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_type` int(11) NOT NULL DEFAULT '0',
  `id_parent` int(11) DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help_message` mediumtext COLLATE utf8_unicode_ci,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `mandatory` smallint(6) DEFAULT NULL,
  `fields_in_line` smallint(6) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `id_field_depend` int(11) DEFAULT NULL,
  `confirm_field` smallint(6) DEFAULT NULL,
  `confirm_field_title` mediumtext COLLATE utf8_unicode_ci,
  `field_unique` smallint(6) DEFAULT NULL,
  `map_provider` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_conditional` int(11) DEFAULT '0',
  `error_message` mediumtext COLLATE utf8_unicode_ci,
  `num_row` smallint(6) DEFAULT '0',
  `num_column` smallint(6) DEFAULT '0',
  `is_role_associated` smallint(6) DEFAULT '0',
  `is_only_display_back` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_entry`),
  KEY `index_genatt_entry_resource` (`id_resource`),
  KEY `index_genatt_entry_parent` (`id_parent`),
  KEY `fk_genatt_entry_type` (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry`
--

LOCK TABLES `genatt_entry` WRITE;
/*!40000 ALTER TABLE `genatt_entry` DISABLE KEYS */;
INSERT INTO `genatt_entry` VALUES (1,1,'APPOINTMENT_FORM',106,4,'Place of birth',NULL,'Enter the place the baby was born.','',1,0,7,NULL,0,NULL,0,'','',0,'',0,0,0,0),(2,1,'APPOINTMENT_FORM',104,4,'Date of birth',NULL,'The baby\'s date of birth.','',1,0,8,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(3,1,'APPOINTMENT_FORM',106,4,'First name',NULL,'The baby\'s first name','',0,0,9,NULL,0,NULL,0,'','',0,'',0,0,0,0),(4,1,'APPOINTMENT_FORM',109,NULL,'The baby',NULL,NULL,NULL,0,0,6,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(5,1,'APPOINTMENT_FORM',106,4,'Last name',NULL,'The baby\'s last name','',0,0,10,NULL,0,NULL,0,'','',0,'',0,0,0,0),(6,1,'APPOINTMENT_FORM',109,NULL,'The parents',NULL,NULL,NULL,0,0,1,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(7,1,'APPOINTMENT_FORM',106,6,'Mother\'s first name',NULL,'','',0,0,2,NULL,0,NULL,0,'','',0,'',0,0,0,0),(8,1,'APPOINTMENT_FORM',106,6,'Mother\'s last name',NULL,'','',0,0,3,NULL,0,NULL,0,'','',0,'',0,0,0,0),(9,1,'APPOINTMENT_FORM',106,6,'Mother\'s address',NULL,'','',0,0,4,NULL,0,NULL,0,'','',0,'',0,0,0,0),(10,1,'APPOINTMENT_FORM',115,6,'Mother\'s passport',NULL,'Please upload your passport as a JPEG file.','',0,0,5,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(11,2,'APPOINTMENT_FORM',109,NULL,'First person data',NULL,NULL,NULL,0,0,1,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(12,2,'APPOINTMENT_FORM',106,NULL,'First name',NULL,'','',1,0,2,NULL,0,NULL,0,'','',0,'',0,0,0,0),(13,2,'APPOINTMENT_FORM',106,NULL,'Last Name',NULL,'','',0,0,3,NULL,0,NULL,0,'','',0,'',0,0,0,0),(14,2,'APPOINTMENT_FORM',104,NULL,'Date of birth',NULL,'','',1,0,4,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(15,2,'APPOINTMENT_FORM',106,NULL,'Place of birth',NULL,'','',0,0,5,NULL,0,NULL,0,'','',0,'',0,0,0,0),(18,2,'APPOINTMENT_FORM',106,NULL,'Address',NULL,'','',0,0,7,NULL,0,NULL,0,'','',0,'',0,0,0,0),(17,2,'APPOINTMENT_FORM',101,NULL,'Last marriage/SRDP ended by',NULL,'','',1,1,6,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(19,2,'APPOINTMENT_FORM',106,NULL,'City',NULL,'','',0,0,8,NULL,0,NULL,0,'','',0,'',0,0,0,0),(20,2,'APPOINTMENT_FORM',106,NULL,'State/country',NULL,'','',0,0,9,NULL,0,NULL,0,'','',0,'',0,0,0,0),(21,2,'APPOINTMENT_FORM',106,NULL,'ZIP code',NULL,'','',0,0,10,NULL,0,NULL,0,'','',0,'',0,0,0,0),(22,2,'APPOINTMENT_FORM',109,NULL,'Second person data',NULL,NULL,NULL,0,0,11,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(23,2,'APPOINTMENT_FORM',106,NULL,'First name',NULL,'','',1,0,12,NULL,0,NULL,0,'','',0,'',0,0,0,0),(24,2,'APPOINTMENT_FORM',106,NULL,'Last Name',NULL,'','',0,0,13,NULL,0,NULL,0,'','',0,'',0,0,0,0),(25,2,'APPOINTMENT_FORM',104,NULL,'Date of birth',NULL,'','',1,0,14,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(26,2,'APPOINTMENT_FORM',106,NULL,'Place of birth',NULL,'','',0,0,15,NULL,0,NULL,0,'','',0,'',0,0,0,0),(36,2,'APPOINTMENT_FORM',101,NULL,'Last marriage/SRDP ended by',NULL,'','',1,1,16,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(28,2,'APPOINTMENT_FORM',106,NULL,'Address',NULL,'','',0,0,17,NULL,0,NULL,0,'','',0,'',0,0,0,0),(29,2,'APPOINTMENT_FORM',106,NULL,'City',NULL,'','',0,0,18,NULL,0,NULL,0,'','',0,'',0,0,0,0),(30,2,'APPOINTMENT_FORM',106,NULL,'State/country',NULL,'','',0,0,19,NULL,0,NULL,0,'','',0,'',0,0,0,0),(31,2,'APPOINTMENT_FORM',106,NULL,'ZIP code',NULL,'','',0,0,20,NULL,0,NULL,0,'','',0,'',0,0,0,0),(32,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,21,0,NULL,0,'','',1,NULL,0,0,0,0),(33,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,22,0,NULL,0,'','',1,NULL,0,0,0,0),(34,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,23,0,NULL,0,'','',1,NULL,0,0,0,0),(35,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,24,0,NULL,0,'','',1,NULL,0,0,0,0),(37,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,47,0,NULL,0,'','',1,NULL,0,0,0,0),(38,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,49,0,NULL,0,'','',1,NULL,0,0,0,0),(39,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,51,0,NULL,0,'','',1,NULL,0,0,0,0),(40,2,'APPOINTMENT_FORM',104,NULL,'Date ended',NULL,'','',0,0,0,53,0,NULL,0,'','',1,NULL,0,0,0,0),(41,3,'APPOINTMENT_FORM',109,NULL,'About the Applicant',NULL,NULL,NULL,0,0,1,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(42,3,'APPOINTMENT_FORM',104,NULL,'Date of birth',NULL,'','',0,0,2,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(43,3,'APPOINTMENT_FORM',106,NULL,'Place of birth',NULL,'','',0,0,3,NULL,0,NULL,0,'','',0,'',0,0,0,0),(44,3,'APPOINTMENT_FORM',106,NULL,'Social Security Number',NULL,'','',0,0,4,NULL,0,NULL,0,'','',0,'',0,0,0,0),(45,3,'APPOINTMENT_FORM',101,NULL,'Sex',NULL,'','',0,1,5,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(46,3,'APPOINTMENT_FORM',105,NULL,'Height (Feet)',NULL,'','',0,0,6,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(47,3,'APPOINTMENT_FORM',105,NULL,'Height (Inches)',NULL,'','',0,0,7,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(48,3,'APPOINTMENT_FORM',105,NULL,'Hair color',NULL,'','',0,0,8,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(49,3,'APPOINTMENT_FORM',105,NULL,'Eye color',NULL,'','',0,0,9,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(50,3,'APPOINTMENT_FORM',106,NULL,'Occupation',NULL,'','',0,0,10,NULL,0,NULL,0,'','',0,'',0,0,0,0),(51,3,'APPOINTMENT_FORM',106,NULL,'Employer',NULL,'','',0,0,11,NULL,0,NULL,0,'','',0,'',0,0,0,0),(52,3,'APPOINTMENT_FORM',109,NULL,'Contact Information',NULL,NULL,NULL,0,0,12,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(53,3,'APPOINTMENT_FORM',103,NULL,NULL,NULL,NULL,'Where should the passport be mailed ?',0,0,13,NULL,0,NULL,0,'','where',0,NULL,0,0,0,0),(54,3,'APPOINTMENT_FORM',106,NULL,'Street Address/RFD#, P.O. Box, or URB',NULL,'','',0,0,14,NULL,0,NULL,0,'','',0,'',0,0,0,0),(55,3,'APPOINTMENT_FORM',106,NULL,'Street Address 2 ',NULL,'(apartment, company, suite, unit, building or floor if applicable)','',0,0,15,NULL,0,NULL,0,'','',0,'',0,0,0,0),(56,3,'APPOINTMENT_FORM',106,NULL,'City',NULL,'','',0,0,16,NULL,0,NULL,0,'','',0,'',0,0,0,0),(57,3,'APPOINTMENT_FORM',106,NULL,'Country',NULL,'','',0,0,17,NULL,0,NULL,0,'','',0,'',0,0,0,0),(58,3,'APPOINTMENT_FORM',106,NULL,'State',NULL,'','',0,0,18,NULL,0,NULL,0,'','',0,'',0,0,0,0),(59,3,'APPOINTMENT_FORM',106,NULL,'Zip code',NULL,'','',0,0,19,NULL,0,NULL,0,'','',0,'',0,0,0,0),(60,3,'APPOINTMENT_FORM',106,NULL,'In Care Of (e.g. In Care Of - Jane Doe)',NULL,'','',0,0,20,NULL,0,NULL,0,'','',0,'',0,0,0,0),(61,3,'APPOINTMENT_FORM',101,NULL,'Is This Your Permanent Address ? ',NULL,'','',0,1,21,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(62,3,'APPOINTMENT_FORM',106,NULL,'Your Email Address',NULL,'','',0,0,22,NULL,1,'Confirm Your Email Address',0,'','',0,'',0,0,0,0),(63,3,'APPOINTMENT_FORM',106,NULL,'Your Phone Number',NULL,'','',0,0,23,NULL,0,NULL,0,'','',0,'',0,0,0,0);
/*!40000 ALTER TABLE `genatt_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry_type`
--

DROP TABLE IF EXISTS `genatt_entry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_entry_type` (
  `id_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_group` smallint(6) DEFAULT NULL,
  `is_comment` int(11) DEFAULT NULL,
  `is_mylutece_user` smallint(6) DEFAULT NULL,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type`),
  KEY `index_genatt_entry_type_plugin` (`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry_type`
--

LOCK TABLES `genatt_entry_type` WRITE;
/*!40000 ALTER TABLE `genatt_entry_type` DISABLE KEYS */;
INSERT INTO `genatt_entry_type` VALUES (101,'Bouton radio',0,0,0,'appointment.entryTypeRadioButton','appointment'),(102,'Case √† cocher',0,0,0,'appointment.entryTypeCheckBox','appointment'),(103,'Commentaire',0,1,0,'appointment.entryTypeComment','appointment'),(104,'Date',0,0,0,'appointment.entryTypeDate','appointment'),(105,'Liste d√©roulante',0,0,0,'appointment.entryTypeSelect','appointment'),(106,'Zone de texte court',0,0,0,'appointment.entryTypeText','appointment'),(107,'Zone de texte long',0,0,0,'appointment.entryTypeTextArea','appointment'),(108,'Num√©rotation',0,0,0,'appointment.entryTypeNumbering','appointment'),(109,'Regroupement',1,0,0,'appointment.entryTypeGroup','appointment'),(110,'Liste d√©roulante SQL',0,0,0,'appointment.entryTypeSelectSQL','appointment'),(111,'G√©olocalisation',0,0,0,'appointment.entryTypeGeolocation','appointment'),(112,'Session',0,0,0,'appointment.entryTypeSession','appointment'),(113,'Utilisateur MyLutece',0,0,1,'appointment.entryTypeMyLuteceUser','appointment'),(114,'Image',0,0,0,'appointment.entryTypeImage','appointment'),(115,'Fichier',0,0,0,'appointment.entryTypeFile','appointment'),(116,'Num√©ro de t√©l√©phone',0,0,0,'appointment.entryTypePhone','appointment');
/*!40000 ALTER TABLE `genatt_entry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_field`
--

DROP TABLE IF EXISTS `genatt_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_field` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `default_value` smallint(6) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint(6) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `role_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_field`),
  KEY `index_genatt_field_entry` (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_field`
--

LOCK TABLES `genatt_field` WRITE;
/*!40000 ALTER TABLE `genatt_field` DISABLE KEYS */;
INSERT INTO `genatt_field` VALUES (1,1,NULL,NULL,'',0,50,0,-1,1,NULL,0,NULL,NULL,NULL),(2,2,NULL,NULL,NULL,0,0,0,0,2,NULL,0,NULL,NULL,NULL),(3,3,NULL,NULL,'',0,50,0,-1,3,NULL,0,NULL,NULL,NULL),(4,5,NULL,NULL,'',0,50,0,-1,4,NULL,0,NULL,NULL,NULL),(5,7,NULL,NULL,'',0,50,0,-1,5,NULL,0,NULL,NULL,NULL),(6,8,NULL,NULL,'',0,50,0,-1,6,NULL,0,NULL,NULL,NULL),(7,9,NULL,NULL,'',0,50,0,-1,7,NULL,0,NULL,NULL,NULL),(8,10,NULL,NULL,NULL,0,255,0,0,8,NULL,0,NULL,NULL,NULL),(9,10,'max_files',NULL,'1',0,0,0,0,9,NULL,0,NULL,NULL,NULL),(10,10,'file_max_size',NULL,'10000000',0,0,0,0,10,NULL,0,NULL,NULL,NULL),(11,10,'export_binary',NULL,'false',0,0,0,0,11,NULL,0,NULL,NULL,NULL),(12,12,NULL,NULL,'',0,50,0,-1,12,NULL,0,NULL,NULL,NULL),(13,13,NULL,NULL,'',0,50,0,-1,13,NULL,0,NULL,NULL,NULL),(14,14,NULL,NULL,NULL,0,0,0,0,14,NULL,0,NULL,NULL,NULL),(15,15,NULL,NULL,'',0,50,0,-1,15,NULL,0,NULL,NULL,NULL),(30,23,NULL,NULL,'',0,50,0,-1,30,NULL,0,NULL,NULL,NULL),(29,21,NULL,NULL,'',0,50,0,-1,29,NULL,0,NULL,NULL,NULL),(28,20,NULL,NULL,'',0,50,0,-1,28,NULL,0,NULL,NULL,NULL),(27,19,NULL,NULL,'',0,50,0,-1,27,NULL,0,NULL,NULL,NULL),(26,18,NULL,NULL,'',0,50,0,-1,26,NULL,0,NULL,NULL,NULL),(21,17,'Death',NULL,'Death',0,0,0,0,21,NULL,0,'',NULL,NULL),(22,17,'Dissolution',NULL,'Dissolution',0,0,0,0,22,NULL,0,'',NULL,NULL),(23,17,'Annulement',NULL,'Annulement',0,0,0,0,23,NULL,0,'',NULL,NULL),(24,17,'Term SRDP',NULL,'TermSRDP',0,0,0,0,24,NULL,0,'',NULL,NULL),(25,17,'N/A',NULL,'NA',0,0,1,0,25,NULL,0,'',NULL,NULL),(31,24,NULL,NULL,'',0,50,0,-1,31,NULL,0,NULL,NULL,NULL),(32,25,NULL,NULL,NULL,0,0,0,0,32,NULL,0,NULL,NULL,NULL),(33,26,NULL,NULL,'',0,50,0,-1,33,NULL,0,NULL,NULL,NULL),(51,36,'Annulement',NULL,'Annulement',0,0,0,0,51,NULL,0,'',NULL,NULL),(50,38,NULL,NULL,NULL,0,0,0,0,50,NULL,0,NULL,NULL,NULL),(49,36,'Dissolution',NULL,'Dissolution',0,0,0,0,49,NULL,0,'',NULL,NULL),(48,37,NULL,NULL,NULL,0,0,0,0,48,NULL,0,NULL,NULL,NULL),(47,36,'Death',NULL,'Death',0,0,0,0,47,NULL,0,'',NULL,NULL),(39,28,NULL,NULL,'',0,50,0,-1,39,NULL,0,NULL,NULL,NULL),(40,29,NULL,NULL,'',0,50,0,-1,40,NULL,0,NULL,NULL,NULL),(41,30,NULL,NULL,'',0,50,0,-1,41,NULL,0,NULL,NULL,NULL),(42,31,NULL,NULL,'',0,50,0,-1,42,NULL,0,NULL,NULL,NULL),(43,32,NULL,NULL,NULL,0,0,0,0,43,NULL,0,NULL,NULL,NULL),(44,33,NULL,NULL,NULL,0,0,0,0,44,NULL,0,NULL,NULL,NULL),(45,34,NULL,NULL,NULL,0,0,0,0,45,NULL,0,NULL,NULL,NULL),(46,35,NULL,NULL,NULL,0,0,0,0,46,NULL,0,NULL,NULL,NULL),(52,39,NULL,NULL,NULL,0,0,0,0,52,NULL,0,NULL,NULL,NULL),(53,36,'Term SRDP',NULL,'TermSRDP',0,0,0,0,53,NULL,0,'',NULL,NULL),(54,40,NULL,NULL,NULL,0,0,0,0,54,NULL,0,NULL,NULL,NULL),(55,36,'N/A',NULL,'NA',0,0,1,0,55,NULL,0,'',NULL,NULL),(56,42,NULL,NULL,NULL,0,0,0,0,56,NULL,0,NULL,NULL,NULL),(57,43,NULL,NULL,'',0,50,0,-1,57,NULL,0,NULL,NULL,NULL),(58,44,NULL,NULL,'',0,50,0,-1,58,NULL,0,NULL,NULL,NULL),(59,45,'Male',NULL,'Male',0,0,0,0,59,NULL,0,'',NULL,NULL),(60,45,'Female',NULL,'Female',0,0,0,0,60,NULL,0,'',NULL,NULL),(61,46,'0',NULL,'0',0,0,0,0,61,NULL,0,'',NULL,NULL),(62,46,'1',NULL,'1',0,0,0,0,62,NULL,0,'',NULL,NULL),(63,46,'2',NULL,'2',0,0,0,0,63,NULL,0,'',NULL,NULL),(64,46,'3',NULL,'3',0,0,0,0,64,NULL,0,'',NULL,NULL),(65,46,'4',NULL,'4',0,0,0,0,65,NULL,0,'',NULL,NULL),(66,46,'5',NULL,'5',0,0,0,0,66,NULL,0,'',NULL,NULL),(67,46,'6',NULL,'6',0,0,0,0,67,NULL,0,'',NULL,NULL),(68,46,'7',NULL,'7',0,0,0,0,68,NULL,0,'',NULL,NULL),(69,46,'8',NULL,'8',0,0,0,0,69,NULL,0,'',NULL,NULL),(70,46,'9',NULL,'9',0,0,0,0,70,NULL,0,'',NULL,NULL),(71,46,'10',NULL,'10',0,0,0,0,71,NULL,0,'',NULL,NULL),(72,47,'0',NULL,'0',0,0,0,0,72,NULL,0,'',NULL,NULL),(73,47,'1',NULL,'1',0,0,0,0,73,NULL,0,'',NULL,NULL),(74,47,'2',NULL,'2',0,0,0,0,74,NULL,0,'',NULL,NULL),(75,47,'3',NULL,'3',0,0,0,0,75,NULL,0,'',NULL,NULL),(76,47,'4',NULL,'4',0,0,0,0,76,NULL,0,'',NULL,NULL),(77,47,'5',NULL,'5',0,0,0,0,77,NULL,0,'',NULL,NULL),(78,47,'6',NULL,'6',0,0,0,0,78,NULL,0,'',NULL,NULL),(79,47,'7',NULL,'7',0,0,0,0,79,NULL,0,'',NULL,NULL),(80,47,'8',NULL,'8',0,0,0,0,80,NULL,0,'',NULL,NULL),(81,47,'9',NULL,'9',0,0,0,0,81,NULL,0,'',NULL,NULL),(82,47,'10',NULL,'10',0,0,0,0,82,NULL,0,'',NULL,NULL),(83,47,'11',NULL,'11',0,0,0,0,83,NULL,0,'',NULL,NULL),(84,48,'Black',NULL,'Black',0,0,0,0,84,NULL,0,'',NULL,NULL),(85,48,'Blonde',NULL,'Blonde',0,0,0,0,85,NULL,0,'',NULL,NULL),(86,48,'Brown',NULL,'Brown',0,0,0,0,86,NULL,0,'',NULL,NULL),(87,48,'Red',NULL,'Red',0,0,0,0,87,NULL,0,'',NULL,NULL),(88,48,'Gray',NULL,'Gray',0,0,0,0,88,NULL,0,'',NULL,NULL),(89,48,'Bald',NULL,'Bald',0,0,0,0,89,NULL,0,'',NULL,NULL),(90,48,'Other',NULL,'Other',0,0,0,0,90,NULL,0,'',NULL,NULL),(91,49,'Amber',NULL,'Amber',0,0,0,0,91,NULL,0,'',NULL,NULL),(92,49,'Black',NULL,'Black',0,0,0,0,92,NULL,0,'',NULL,NULL),(93,49,'Blue',NULL,'Blue',0,0,0,0,93,NULL,0,'',NULL,NULL),(94,49,'Brown',NULL,'Brown',0,0,0,0,94,NULL,0,'',NULL,NULL),(95,49,'Gray',NULL,'Gray',0,0,0,0,95,NULL,0,'',NULL,NULL),(96,49,'Green',NULL,'Green',0,0,0,0,96,NULL,0,'',NULL,NULL),(97,49,'Hazel',NULL,'Hazel',0,0,0,0,97,NULL,0,'',NULL,NULL),(98,50,NULL,NULL,'',0,50,0,-1,98,NULL,0,NULL,NULL,NULL),(99,51,NULL,NULL,'',0,50,0,-1,99,NULL,0,NULL,NULL,NULL),(100,54,NULL,NULL,'',0,50,0,-1,100,NULL,0,NULL,NULL,NULL),(101,55,NULL,NULL,'',0,50,0,-1,101,NULL,0,NULL,NULL,NULL),(102,56,NULL,NULL,'',0,50,0,-1,102,NULL,0,NULL,NULL,NULL),(103,57,NULL,NULL,'',0,50,0,-1,103,NULL,0,NULL,NULL,NULL),(104,58,NULL,NULL,'',0,50,0,-1,104,NULL,0,NULL,NULL,NULL),(105,59,NULL,NULL,'',0,50,0,-1,105,NULL,0,NULL,NULL,NULL),(106,60,NULL,NULL,'',0,50,0,-1,106,NULL,0,NULL,NULL,NULL),(107,61,'Yes',NULL,'yes',0,0,0,0,107,NULL,0,'',NULL,NULL),(108,61,'No',NULL,'No',0,0,0,0,108,NULL,0,'',NULL,NULL),(109,62,NULL,NULL,'',0,50,0,-1,109,NULL,0,NULL,NULL,NULL),(110,63,NULL,NULL,'',0,50,0,-1,110,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `genatt_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_response`
--

DROP TABLE IF EXISTS `genatt_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_response` (
  `id_response` int(11) NOT NULL DEFAULT '0',
  `response_value` mediumtext COLLATE utf8_unicode_ci,
  `id_entry` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id_response`),
  KEY `index_genatt_response_entry` (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_response`
--

LOCK TABLES `genatt_response` WRITE;
/*!40000 ALTER TABLE `genatt_response` DISABLE KEYS */;
INSERT INTO `genatt_response` VALUES (296,NULL,48,NULL,NULL,1),(295,NULL,47,NULL,NULL,1),(294,NULL,46,NULL,NULL,1),(4,'hgf',5,NULL,NULL,1),(293,NULL,45,NULL,NULL,1),(6,'hgh',8,NULL,NULL,1),(292,'',44,NULL,NULL,1),(291,'',43,NULL,NULL,1),(290,'',42,NULL,NULL,1),(10,'',3,NULL,NULL,1),(11,'',5,NULL,NULL,1),(79,NULL,32,NULL,NULL,1),(78,'75012',31,NULL,NULL,1),(77,'France',30,NULL,NULL,1),(76,'Paris',29,NULL,NULL,1),(16,'08/01/2018',2,NULL,NULL,1),(75,'227 rue de Bercy',28,NULL,NULL,1),(74,'Villemomble',26,NULL,NULL,1),(22,'Paris',1,NULL,NULL,1),(73,'05/04/1967',25,NULL,NULL,1),(72,'Michel',24,NULL,NULL,1),(27,'',8,NULL,NULL,1),(71,'Yvan',23,NULL,NULL,1),(70,'7787',21,NULL,NULL,1),(69,'gfsdg',20,NULL,NULL,1),(68,'gfdgsdf',19,NULL,NULL,1),(67,'fggfdg',18,NULL,NULL,1),(66,'NA',17,25,NULL,1),(65,'New York',15,NULL,NULL,1),(64,'11/11/0084',14,NULL,NULL,1),(63,'Johansson',13,NULL,NULL,1),(62,'Scarlett',12,NULL,NULL,1),(41,'Si je le savais.....',18,NULL,NULL,1),(42,'Quelque part',19,NULL,NULL,1),(43,'US',20,NULL,NULL,1),(44,'Pfff',21,NULL,NULL,1),(45,'Yvan',23,NULL,NULL,1),(46,'Michel',24,NULL,NULL,1),(47,'05/04/1967',25,NULL,NULL,1),(48,'Villemomble',26,NULL,NULL,1),(49,'227 rue de Bercy',28,NULL,NULL,1),(50,'Paris',29,NULL,NULL,1),(51,'France',30,NULL,NULL,1),(52,'75012',31,NULL,NULL,1),(53,NULL,32,NULL,NULL,1),(54,NULL,33,NULL,NULL,1),(55,NULL,34,NULL,NULL,1),(56,'',35,NULL,NULL,1),(57,'Annulement',36,51,NULL,1),(58,NULL,37,NULL,NULL,1),(59,NULL,38,NULL,NULL,1),(60,'12/12/2002',39,NULL,NULL,1),(61,NULL,40,NULL,NULL,1),(80,NULL,33,NULL,NULL,1),(81,NULL,34,NULL,NULL,1),(82,NULL,35,NULL,NULL,1),(83,'Annulement',36,51,NULL,1),(84,NULL,37,NULL,NULL,1),(85,NULL,38,NULL,NULL,1),(86,'12/12/2002',39,NULL,NULL,1),(87,NULL,40,NULL,NULL,1),(88,'paris',1,NULL,NULL,1),(89,'08/02/2018',2,NULL,NULL,1),(90,'',3,NULL,NULL,1),(91,'',5,NULL,NULL,1),(92,'',7,NULL,NULL,1),(93,'',8,NULL,NULL,1),(94,'',9,NULL,NULL,1),(95,'paris',1,NULL,NULL,1),(96,'01/08/2018',2,NULL,NULL,1),(97,'',3,NULL,NULL,1),(98,'',5,NULL,NULL,1),(99,'',7,NULL,NULL,1),(100,'',8,NULL,NULL,1),(101,'',9,NULL,NULL,1),(102,'paris',1,NULL,NULL,1),(103,'08/01/2018',2,NULL,NULL,1),(104,'',3,NULL,NULL,1),(105,'',5,NULL,NULL,1),(106,'',7,NULL,NULL,1),(107,'',8,NULL,NULL,1),(108,'',9,NULL,NULL,1),(109,'Paris',1,NULL,NULL,1),(110,'08/01/2018',2,NULL,NULL,1),(111,'',3,NULL,NULL,1),(112,'',5,NULL,NULL,1),(113,'',7,NULL,NULL,1),(114,'',8,NULL,NULL,1),(115,'',9,NULL,NULL,1),(116,'paris',1,NULL,NULL,1),(117,'08/01/2018',2,NULL,NULL,1),(118,'',3,NULL,NULL,1),(119,'',5,NULL,NULL,1),(120,'vc',7,NULL,NULL,1),(121,'vcx',8,NULL,NULL,1),(122,'vcxw',9,NULL,NULL,1),(123,'Test',1,NULL,NULL,1),(124,'08/22/2018',2,NULL,NULL,1),(125,'Test',3,NULL,NULL,1),(126,'Test',5,NULL,NULL,1),(127,'Test',7,NULL,NULL,1),(128,'Test',8,NULL,NULL,1),(129,'Test',9,NULL,NULL,1),(130,'',42,NULL,NULL,1),(131,'',43,NULL,NULL,1),(132,'',44,NULL,NULL,1),(133,NULL,45,NULL,NULL,1),(134,NULL,46,NULL,NULL,1),(135,NULL,47,NULL,NULL,1),(136,NULL,48,NULL,NULL,1),(137,NULL,49,NULL,NULL,1),(138,'',50,NULL,NULL,1),(139,'',51,NULL,NULL,1),(140,'',54,NULL,NULL,1),(141,'',55,NULL,NULL,1),(142,'',56,NULL,NULL,1),(143,'',57,NULL,NULL,1),(144,'',58,NULL,NULL,1),(145,'',59,NULL,NULL,1),(146,'',60,NULL,NULL,1),(147,NULL,61,NULL,NULL,1),(148,'',62,NULL,NULL,1),(149,'',63,NULL,NULL,1),(150,'',42,NULL,NULL,1),(151,'',43,NULL,NULL,1),(152,'',44,NULL,NULL,1),(153,NULL,45,NULL,NULL,1),(154,NULL,46,NULL,NULL,1),(155,NULL,47,NULL,NULL,1),(156,NULL,48,NULL,NULL,1),(157,NULL,49,NULL,NULL,1),(158,'',50,NULL,NULL,1),(159,'',51,NULL,NULL,1),(160,'',54,NULL,NULL,1),(161,'',55,NULL,NULL,1),(162,'',56,NULL,NULL,1),(163,'',57,NULL,NULL,1),(164,'',58,NULL,NULL,1),(165,'',59,NULL,NULL,1),(166,'',60,NULL,NULL,1),(167,NULL,61,NULL,NULL,1),(168,'',62,NULL,NULL,1),(169,'',63,NULL,NULL,1),(170,'',42,NULL,NULL,1),(171,'',43,NULL,NULL,1),(172,'',44,NULL,NULL,1),(173,NULL,45,NULL,NULL,1),(174,NULL,46,NULL,NULL,1),(175,NULL,47,NULL,NULL,1),(176,NULL,48,NULL,NULL,1),(177,NULL,49,NULL,NULL,1),(178,'',50,NULL,NULL,1),(179,'',51,NULL,NULL,1),(180,'',54,NULL,NULL,1),(181,'',55,NULL,NULL,1),(182,'',56,NULL,NULL,1),(183,'',57,NULL,NULL,1),(184,'',58,NULL,NULL,1),(185,'',59,NULL,NULL,1),(186,'',60,NULL,NULL,1),(187,NULL,61,NULL,NULL,1),(188,'',62,NULL,NULL,1),(189,'',63,NULL,NULL,1),(190,'',42,NULL,NULL,1),(191,'',43,NULL,NULL,1),(192,'',44,NULL,NULL,1),(193,NULL,45,NULL,NULL,1),(194,NULL,46,NULL,NULL,1),(195,NULL,47,NULL,NULL,1),(196,NULL,48,NULL,NULL,1),(197,NULL,49,NULL,NULL,1),(198,'',50,NULL,NULL,1),(199,'',51,NULL,NULL,1),(200,'',54,NULL,NULL,1),(201,'',55,NULL,NULL,1),(202,'',56,NULL,NULL,1),(203,'',57,NULL,NULL,1),(204,'',58,NULL,NULL,1),(205,'',59,NULL,NULL,1),(206,'',60,NULL,NULL,1),(207,NULL,61,NULL,NULL,1),(208,'',62,NULL,NULL,1),(209,'',63,NULL,NULL,1),(210,'',42,NULL,NULL,1),(211,'',43,NULL,NULL,1),(212,'',44,NULL,NULL,1),(213,NULL,45,NULL,NULL,1),(214,NULL,46,NULL,NULL,1),(215,NULL,47,NULL,NULL,1),(216,NULL,48,NULL,NULL,1),(217,NULL,49,NULL,NULL,1),(218,'',50,NULL,NULL,1),(219,'',51,NULL,NULL,1),(220,'',54,NULL,NULL,1),(221,'',55,NULL,NULL,1),(222,'',56,NULL,NULL,1),(223,'',57,NULL,NULL,1),(224,'',58,NULL,NULL,1),(225,'',59,NULL,NULL,1),(226,'',60,NULL,NULL,1),(227,NULL,61,NULL,NULL,1),(228,'',62,NULL,NULL,1),(229,'',63,NULL,NULL,1),(230,'',42,NULL,NULL,1),(231,'',43,NULL,NULL,1),(232,'',44,NULL,NULL,1),(233,NULL,45,NULL,NULL,1),(234,NULL,46,NULL,NULL,1),(235,NULL,47,NULL,NULL,1),(236,NULL,48,NULL,NULL,1),(237,NULL,49,NULL,NULL,1),(238,'',50,NULL,NULL,1),(239,'',51,NULL,NULL,1),(240,'',54,NULL,NULL,1),(241,'',55,NULL,NULL,1),(242,'',56,NULL,NULL,1),(243,'',57,NULL,NULL,1),(244,'',58,NULL,NULL,1),(245,'',59,NULL,NULL,1),(246,'',60,NULL,NULL,1),(247,NULL,61,NULL,NULL,1),(248,'',62,NULL,NULL,1),(249,'',63,NULL,NULL,1),(250,'',42,NULL,NULL,1),(251,'',43,NULL,NULL,1),(252,'',44,NULL,NULL,1),(253,NULL,45,NULL,NULL,1),(254,NULL,46,NULL,NULL,1),(255,NULL,47,NULL,NULL,1),(256,NULL,48,NULL,NULL,1),(257,NULL,49,NULL,NULL,1),(258,'',50,NULL,NULL,1),(259,'',51,NULL,NULL,1),(260,'',54,NULL,NULL,1),(261,'',55,NULL,NULL,1),(262,'',56,NULL,NULL,1),(263,'',57,NULL,NULL,1),(264,'',58,NULL,NULL,1),(265,'',59,NULL,NULL,1),(266,'',60,NULL,NULL,1),(267,NULL,61,NULL,NULL,1),(268,'',62,NULL,NULL,1),(269,'',63,NULL,NULL,1),(270,'',42,NULL,NULL,1),(271,'',43,NULL,NULL,1),(272,'',44,NULL,NULL,1),(273,NULL,45,NULL,NULL,1),(274,NULL,46,NULL,NULL,1),(275,NULL,47,NULL,NULL,1),(276,NULL,48,NULL,NULL,1),(277,NULL,49,NULL,NULL,1),(278,'',50,NULL,NULL,1),(279,'',51,NULL,NULL,1),(280,'',54,NULL,NULL,1),(281,'',55,NULL,NULL,1),(282,'',56,NULL,NULL,1),(283,'',57,NULL,NULL,1),(284,'',58,NULL,NULL,1),(285,'',59,NULL,NULL,1),(286,'',60,NULL,NULL,1),(287,NULL,61,NULL,NULL,1),(288,'',62,NULL,NULL,1),(289,'',63,NULL,NULL,1),(297,NULL,49,NULL,NULL,1),(298,'',50,NULL,NULL,1),(299,'',51,NULL,NULL,1),(300,'',54,NULL,NULL,1),(301,'',55,NULL,NULL,1),(302,'',56,NULL,NULL,1),(303,'',57,NULL,NULL,1),(304,'',58,NULL,NULL,1),(305,'',59,NULL,NULL,1),(306,'',60,NULL,NULL,1),(307,NULL,61,NULL,NULL,1),(308,'',62,NULL,NULL,1),(309,'',63,NULL,NULL,1),(310,'',42,NULL,NULL,1),(311,'',43,NULL,NULL,1),(312,'',44,NULL,NULL,1),(313,NULL,45,NULL,NULL,1),(314,NULL,46,NULL,NULL,1),(315,NULL,47,NULL,NULL,1),(316,NULL,48,NULL,NULL,1),(317,NULL,49,NULL,NULL,1),(318,'',50,NULL,NULL,1),(319,'',51,NULL,NULL,1),(320,'',54,NULL,NULL,1),(321,'',55,NULL,NULL,1),(322,'',56,NULL,NULL,1),(323,'',57,NULL,NULL,1),(324,'',58,NULL,NULL,1),(325,'',59,NULL,NULL,1),(326,'',60,NULL,NULL,1),(327,NULL,61,NULL,NULL,1),(328,'',62,NULL,NULL,1),(329,'',63,NULL,NULL,1),(330,'',42,NULL,NULL,1),(331,'',43,NULL,NULL,1),(332,'',44,NULL,NULL,1),(333,NULL,45,NULL,NULL,1),(334,NULL,46,NULL,NULL,1),(335,NULL,47,NULL,NULL,1),(336,NULL,48,NULL,NULL,1),(337,NULL,49,NULL,NULL,1),(338,'',50,NULL,NULL,1),(339,'',51,NULL,NULL,1),(340,'',54,NULL,NULL,1),(341,'',55,NULL,NULL,1),(342,'',56,NULL,NULL,1),(343,'',57,NULL,NULL,1),(344,'',58,NULL,NULL,1),(345,'',59,NULL,NULL,1),(346,'',60,NULL,NULL,1),(347,NULL,61,NULL,NULL,1),(348,'',62,NULL,NULL,1),(349,'',63,NULL,NULL,1),(350,'',42,NULL,NULL,1),(351,'',43,NULL,NULL,1),(352,'',44,NULL,NULL,1),(353,NULL,45,NULL,NULL,1),(354,NULL,46,NULL,NULL,1),(355,NULL,47,NULL,NULL,1),(356,NULL,48,NULL,NULL,1),(357,NULL,49,NULL,NULL,1),(358,'',50,NULL,NULL,1),(359,'',51,NULL,NULL,1),(360,'',54,NULL,NULL,1),(361,'',55,NULL,NULL,1),(362,'',56,NULL,NULL,1),(363,'',57,NULL,NULL,1),(364,'',58,NULL,NULL,1),(365,'',59,NULL,NULL,1),(366,'',60,NULL,NULL,1),(367,NULL,61,NULL,NULL,1),(368,'',62,NULL,NULL,1),(369,'',63,NULL,NULL,1),(370,'',42,NULL,NULL,1),(371,'',43,NULL,NULL,1),(372,'',44,NULL,NULL,1),(373,NULL,45,NULL,NULL,1),(374,NULL,46,NULL,NULL,1),(375,NULL,47,NULL,NULL,1),(376,NULL,48,NULL,NULL,1),(377,NULL,49,NULL,NULL,1),(378,'',50,NULL,NULL,1),(379,'',51,NULL,NULL,1),(380,'',54,NULL,NULL,1),(381,'',55,NULL,NULL,1),(382,'',56,NULL,NULL,1),(383,'',57,NULL,NULL,1),(384,'',58,NULL,NULL,1),(385,'',59,NULL,NULL,1),(386,'',60,NULL,NULL,1),(387,NULL,61,NULL,NULL,1),(388,'',62,NULL,NULL,1),(389,'',63,NULL,NULL,1),(390,'',42,NULL,NULL,1),(391,'',43,NULL,NULL,1),(392,'',44,NULL,NULL,1),(393,NULL,45,NULL,NULL,1),(394,NULL,46,NULL,NULL,1),(395,NULL,47,NULL,NULL,1),(396,NULL,48,NULL,NULL,1),(397,NULL,49,NULL,NULL,1),(398,'',50,NULL,NULL,1),(399,'',51,NULL,NULL,1),(400,'',54,NULL,NULL,1),(401,'',55,NULL,NULL,1),(402,'',56,NULL,NULL,1),(403,'',57,NULL,NULL,1),(404,'',58,NULL,NULL,1),(405,'',59,NULL,NULL,1),(406,'',60,NULL,NULL,1),(407,NULL,61,NULL,NULL,1),(408,'',62,NULL,NULL,1),(409,'',63,NULL,NULL,1),(410,'',42,NULL,NULL,1),(411,'',43,NULL,NULL,1),(412,'',44,NULL,NULL,1),(413,NULL,45,NULL,NULL,1),(414,NULL,46,NULL,NULL,1),(415,NULL,47,NULL,NULL,1),(416,NULL,48,NULL,NULL,1),(417,NULL,49,NULL,NULL,1),(418,'',50,NULL,NULL,1),(419,'',51,NULL,NULL,1),(420,'',54,NULL,NULL,1),(421,'',55,NULL,NULL,1),(422,'',56,NULL,NULL,1),(423,'',57,NULL,NULL,1),(424,'',58,NULL,NULL,1),(425,'',59,NULL,NULL,1),(426,'',60,NULL,NULL,1),(427,NULL,61,NULL,NULL,1),(428,'',62,NULL,NULL,1),(429,'',63,NULL,NULL,1),(430,'',42,NULL,NULL,1),(431,'',43,NULL,NULL,1),(432,'',44,NULL,NULL,1),(433,NULL,45,NULL,NULL,1),(434,NULL,46,NULL,NULL,1),(435,NULL,47,NULL,NULL,1),(436,NULL,48,NULL,NULL,1),(437,NULL,49,NULL,NULL,1),(438,'',50,NULL,NULL,1),(439,'',51,NULL,NULL,1),(440,'',54,NULL,NULL,1),(441,'',55,NULL,NULL,1),(442,'',56,NULL,NULL,1),(443,'',57,NULL,NULL,1),(444,'',58,NULL,NULL,1),(445,'',59,NULL,NULL,1),(446,'',60,NULL,NULL,1),(447,NULL,61,NULL,NULL,1),(448,'',62,NULL,NULL,1),(449,'',63,NULL,NULL,1),(450,'',42,NULL,NULL,1),(451,'',43,NULL,NULL,1),(452,'',44,NULL,NULL,1),(453,NULL,45,NULL,NULL,1),(454,NULL,46,NULL,NULL,1),(455,NULL,47,NULL,NULL,1),(456,NULL,48,NULL,NULL,1),(457,NULL,49,NULL,NULL,1),(458,'',50,NULL,NULL,1),(459,'',51,NULL,NULL,1),(460,'',54,NULL,NULL,1),(461,'',55,NULL,NULL,1),(462,'',56,NULL,NULL,1),(463,'',57,NULL,NULL,1),(464,'',58,NULL,NULL,1),(465,'',59,NULL,NULL,1),(466,'',60,NULL,NULL,1),(467,NULL,61,NULL,NULL,1),(468,'',62,NULL,NULL,1),(469,'',63,NULL,NULL,1);
/*!40000 ALTER TABLE `genatt_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_verify_by`
--

DROP TABLE IF EXISTS `genatt_verify_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genatt_verify_by` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_expression` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`,`id_expression`),
  KEY `index_genatt_verify_by_field` (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_verify_by`
--

LOCK TABLES `genatt_verify_by` WRITE;
/*!40000 ALTER TABLE `genatt_verify_by` DISABLE KEYS */;
INSERT INTO `genatt_verify_by` VALUES (8,1),(109,2);
/*!40000 ALTER TABLE `genatt_verify_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `html_portlet`
--

DROP TABLE IF EXISTS `html_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `html_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `html` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `html_portlet`
--

LOCK TABLES `html_portlet` WRITE;
/*!40000 ALTER TABLE `html_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `html_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_configuration`
--

DROP TABLE IF EXISTS `mydashboard_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mydashboard_configuration` (
  `my_dashboard_component_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_config` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  `hide_dashboard` smallint(6) NOT NULL,
  PRIMARY KEY (`my_dashboard_component_id`,`id_config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_configuration`
--

LOCK TABLES `mydashboard_configuration` WRITE;
/*!40000 ALTER TABLE `mydashboard_configuration` DISABLE KEYS */;
INSERT INTO `mydashboard_configuration` VALUES ('mydashboard.dashboardMyAppointments','2-58929',1,0),('mydashboard.myDashboardComponentMyDashboard','2-58929',2,0),('mydashboard.myDashboardComponentNickname','2-58929',3,0),('mydashboard.myLuteceDatabaseComponent','2-58929',4,0);
/*!40000 ALTER TABLE `mydashboard_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_dashboard_association`
--

DROP TABLE IF EXISTS `mydashboard_dashboard_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mydashboard_dashboard_association` (
  `id_dashboard_association` int(6) NOT NULL,
  `id_dashboard` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `id_panel` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dashboard_association`),
  KEY `fk_id_panel` (`id_panel`),
  CONSTRAINT `fk_id_panel` FOREIGN KEY (`id_panel`) REFERENCES `mydashboard_panel` (`id_panel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_dashboard_association`
--

LOCK TABLES `mydashboard_dashboard_association` WRITE;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_panel`
--

DROP TABLE IF EXISTS `mydashboard_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mydashboard_panel` (
  `id_panel` int(6) NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `is_default` smallint(6) NOT NULL,
  PRIMARY KEY (`id_panel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_panel`
--

LOCK TABLES `mydashboard_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_attribute`
--

DROP TABLE IF EXISTS `mylutece_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_attribute` (
  `id_attribute` int(11) NOT NULL DEFAULT '0',
  `type_class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `help_message` mediumtext COLLATE utf8_unicode_ci,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_shown_in_search` smallint(6) DEFAULT '0',
  `attribute_position` int(11) DEFAULT '0',
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_attribute`
--

LOCK TABLES `mylutece_attribute` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_attribute_field`
--

DROP TABLE IF EXISTS `mylutece_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_attribute_field` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8_unicode_ci,
  `is_DEFAULT_value` smallint(6) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT '0',
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_attribute_field`
--

LOCK TABLES `mylutece_attribute_field` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_connections_log`
--

DROP TABLE IF EXISTS `mylutece_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_connections_log` (
  `ip_address` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_connections_log`
--

LOCK TABLES `mylutece_connections_log` WRITE;
/*!40000 ALTER TABLE `mylutece_connections_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_group`
--

DROP TABLE IF EXISTS `mylutece_database_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_group` (
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `group_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_group`
--

LOCK TABLES `mylutece_database_group` WRITE;
/*!40000 ALTER TABLE `mylutece_database_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_group_role`
--

DROP TABLE IF EXISTS `mylutece_database_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_group_role` (
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_group_role`
--

LOCK TABLES `mylutece_database_group_role` WRITE;
/*!40000 ALTER TABLE `mylutece_database_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_key`
--

DROP TABLE IF EXISTS `mylutece_database_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_key` (
  `mylutece_database_user_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mylutece_database_user_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_key`
--

LOCK TABLES `mylutece_database_key` WRITE;
/*!40000 ALTER TABLE `mylutece_database_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user`
--

DROP TABLE IF EXISTS `mylutece_database_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_user` (
  `mylutece_database_user_id` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `name_given` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_family` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `reset_password` smallint(6) NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  PRIMARY KEY (`mylutece_database_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user`
--

LOCK TABLES `mylutece_database_user` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user` DISABLE KEYS */;
INSERT INTO `mylutece_database_user` VALUES (1,'ejo','PBKDF2WITHHMACSHA512:40000:79f1c045e8e4922c29f74455b720ab99:b978e3a4a3e81cdc8316d67c1efd2cf34e5e5c090f4781c432d5e2941a54fbcd55d4744a88c4ad273bbf1e293fcf1e91aeff054eea8673bde8ad6fbd45c12870b642edc833d4d1e0d010d255dfd085b055668b4be46a5e898712ab8553aee70b04a275dcd949985d58124062316ccb7a9e424cdbffb8f2e5139c8c270e5660fb','Elysa','Jouve','elysa.jouve@paris.fr',1,0,NULL,1565541000112,0,'2018-08-16 16:30:00'),(2,'yvan.michel@paris.fr','PBKDF2WITHHMACSHA512:40000:2373a8e63d339741276f18f94f6ad159:e0a1f0db3648c70e86de5f04aa1433f77c7dd7ee609a96293b7fcd1a8ac3f502fa3e6c47a0f1640ddaacf1e8778ccc547d890783189acc7722bf1f6253b989303d13829233bcde696920a087d21067b82c089cee0da837ef5ca14955ce6327ac5bfb196d213af69721f8bedc2d754ff335661e9e362027ef8edd5b978c622417','Yvan','Michel','yvan.michel@paris.fr',1,0,NULL,1565534334293,0,'2018-08-16 14:38:54');
/*!40000 ALTER TABLE `mylutece_database_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_group`
--

DROP TABLE IF EXISTS `mylutece_database_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_user_group` (
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT '0',
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_group`
--

LOCK TABLES `mylutece_database_user_group` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_parameter`
--

DROP TABLE IF EXISTS `mylutece_database_user_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_user_parameter` (
  `parameter_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_parameter`
--

LOCK TABLES `mylutece_database_user_parameter` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_parameter` DISABLE KEYS */;
INSERT INTO `mylutece_database_user_parameter` VALUES ('account_creation_validation_email','false'),('auto_login_after_validation_email','false'),('enable_jcaptcha','false'),('force_change_password_reinit',''),('password_minimum_length','8'),('password_format_upper_lower_case','false'),('password_format_numero','false'),('password_format_special_characters','false'),('password_duration',''),('password_history_size',''),('maximum_number_password_change',''),('tsw_size_password_change',''),('use_advanced_security_parameters','false'),('account_life_time','360'),('time_before_alert_account','30'),('nb_alert_account','2'),('time_between_alerts_account','10'),('access_failures_max','3'),('access_failures_interval','10'),('expired_alert_mail_sender','LUTECE'),('expired_alert_mail_subject','Votre compte a expir√©'),('first_alert_mail_sender','LUTECE'),('first_alert_mail_subject','Votre compte va bientot expirer'),('other_alert_mail_sender','LUTECE'),('other_alert_mail_subject','Votre compte va bientot expirer'),('account_reactivated_mail_sender','LUTECE'),('account_reactivated_mail_subject','Votre compte a bien √©t√© r√©activ√©'),('access_failures_captcha','1'),('unblock_user_mail_sender','LUTECE'),('unblock_user_mail_subject','Votre IP a √©t√© bloqu√©e'),('enable_unblock_ip','false'),('notify_user_password_expired',''),('password_expired_mail_sender','LUTECE'),('password_expired_mail_subject','Votre mot de passe a expir√©'),('mail_lost_password_sender','LUTECE'),('mail_lost_password_subject','Votre mot de passe a √©t√© r√©initialis√©'),('mail_password_encryption_changed_sender','LUTECE'),('mail_password_encryption_changed_subject','Votre mot de passe a √©t√© r√©initialis√©');
/*!40000 ALTER TABLE `mylutece_database_user_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_password_history`
--

DROP TABLE IF EXISTS `mylutece_database_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_user_password_history` (
  `mylutece_database_user_id` int(11) NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mylutece_database_user_id`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_password_history`
--

LOCK TABLES `mylutece_database_user_password_history` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` DISABLE KEYS */;
INSERT INTO `mylutece_database_user_password_history` VALUES (1,'PBKDF2WITHHMACSHA512:40000:404dad136d0f8cd8ca1e58e80fe5278d:e36d716ec43288913a0f6539f60d57b2f2e634150021b71c7f89cd61ed95b386c0987afe950d537ff42cbff568f10a9d6b8415404eec882b8ebf0c70a5b0733d81739855e4f5778cd9f7163cf170ff8ff0ece97fbb5cda102c3bf86c622e63f71f362e9459995c03b00c775448a351366ae2d69e92a86492c3660d1cb7592459','2018-08-16 14:30:10'),(2,'PBKDF2WITHHMACSHA512:40000:de4769084540b6676b766e3b423babfa:b51548bccab4e569cc9793aa1aac2c5677a754b2df7e0a001259e57278df8ddf144b3b02474b27e4be6ce597ffca382fd27cc4626712f71b022b939f38f3aa6af8a196ce90c9b28f1dbca46c193ad01d32fa8a6d87c0d9be64e7e69a8967c410f06b5c7daff695f7d2f7912c554efa7dc0ee77329823d0fa4967b32551e45378','2018-08-16 14:38:33'),(1,'PBKDF2WITHHMACSHA512:40000:d5f3a6de223cef03ad188e9504b05411:241f4c6a6b6aedce4296a2b0b6563db7e5ac88f8c67956dc9156e23ff1c7fd3683a23fc503cbcba96eb4e5e2dc40053ce23513c66cb7b1527d63e104f8d4e6ecdd2db54cac4212939e96e7cb398974fb3948b5b7130ff99c920ac2e5ecb77af168db3a5388825809cf3e793fd609d8dfb313db4d91854731d88c7ad8105d175a','2018-08-16 15:05:59');
/*!40000 ALTER TABLE `mylutece_database_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_role`
--

DROP TABLE IF EXISTS `mylutece_database_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_database_user_role` (
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT '0',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_role`
--

LOCK TABLES `mylutece_database_user_role` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_user_anonymize_field`
--

DROP TABLE IF EXISTS `mylutece_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_user_anonymize_field`
--

LOCK TABLES `mylutece_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `mylutece_user_anonymize_field` VALUES ('login',1),('name_given',1),('name_family',1),('email',1);
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_user_field`
--

DROP TABLE IF EXISTS `mylutece_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mylutece_user_field` (
  `id_user_field` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_user_field`
--

LOCK TABLES `mylutece_user_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regularexpression_regular_expression`
--

DROP TABLE IF EXISTS `regularexpression_regular_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regularexpression_regular_expression` (
  `id_expression` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regular_expression_value` mediumtext COLLATE utf8_unicode_ci,
  `valid_exemple` mediumtext COLLATE utf8_unicode_ci,
  `information_message` mediumtext COLLATE utf8_unicode_ci,
  `error_message` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_expression`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regularexpression_regular_expression`
--

LOCK TABLES `regularexpression_regular_expression` WRITE;
/*!40000 ALTER TABLE `regularexpression_regular_expression` DISABLE KEYS */;
INSERT INTO `regularexpression_regular_expression` VALUES (1,'Fichier JPG','image/jpeg','image/jpeg','Expression r√©guli√®re pour les fichiers de type jpeg.','Le format du fichier n\'est pas valide. Veuillez choisir une image de type jpeg.'),(2,'Email','(^([a-zA-Z0-9]+(([\\.\\-\\_]?[a-zA-Z0-9]+)+)?)\\@(([a-zA-Z0-9]+[\\.\\-\\_])+[a-zA-Z]{2,4})$)|(^$)','admin@lutece.fr','Expression r√©guli√®re pour les emails.','Le format de l\'email est incorrect.');
/*!40000 ALTER TABLE `regularexpression_regular_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_resource`
--

DROP TABLE IF EXISTS `resource_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_resource` (
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_resource`),
  KEY `resource_resource_type_idx` (`resource_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_resource`
--

LOCK TABLES `resource_resource` WRITE;
/*!40000 ALTER TABLE `resource_resource` DISABLE KEYS */;
INSERT INTO `resource_resource` VALUES (1,'salle','Salle 1'),(2,'salle','Salle 2');
/*!40000 ALTER TABLE `resource_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_resource_type`
--

DROP TABLE IF EXISTS `resource_resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_resource_type` (
  `resource_type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`resource_type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_resource_type`
--

LOCK TABLES `resource_resource_type` WRITE;
/*!40000 ALTER TABLE `resource_resource_type` DISABLE KEYS */;
INSERT INTO `resource_resource_type` VALUES ('salle','Salle');
/*!40000 ALTER TABLE `resource_resource_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_facet_intersection`
--

DROP TABLE IF EXISTS `solr_facet_intersection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solr_facet_intersection` (
  `id_field1` int(11) DEFAULT NULL,
  `id_field2` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_facet_intersection`
--

LOCK TABLES `solr_facet_intersection` WRITE;
/*!40000 ALTER TABLE `solr_facet_intersection` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_facet_intersection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_fields`
--

DROP TABLE IF EXISTS `solr_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solr_fields` (
  `id_field` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_facet` tinyint(1) DEFAULT '0',
  `enable_facet` tinyint(1) DEFAULT '0',
  `is_sort` tinyint(1) DEFAULT '0',
  `enable_sort` tinyint(1) DEFAULT '0',
  `default_sort` tinyint(1) DEFAULT '0',
  `weight` float DEFAULT '0',
  `facet_mincount` int(11) DEFAULT '1',
  `operator_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'OR',
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_fields`
--

LOCK TABLES `solr_fields` WRITE;
/*!40000 ALTER TABLE `solr_fields` DISABLE KEYS */;
INSERT INTO `solr_fields` VALUES (1,'site','Site','Site',1,1,0,0,0,0,1,'OR'),(2,'type','Type','Type',1,1,0,0,0,0,1,'OR'),(3,'date','Date','Date',1,1,1,1,0,0,1,'OR'),(4,'score','Score','Score',0,0,1,1,1,0,1,'OR'),(5,'categorie','Categorie','Category',1,1,0,0,0,0,1,'OR'),(6,'title','title','Title',0,0,0,0,0,10,1,'AND'),(7,'content','content','Content',0,0,0,0,0,0.1,1,'AND'),(8,'summary','summary','Summary',0,0,0,0,0,1,1,'AND');
/*!40000 ALTER TABLE `solr_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_indexer_action`
--

DROP TABLE IF EXISTS `solr_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solr_indexer_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `id_document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_task` int(11) NOT NULL DEFAULT '0',
  `type_ressource` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_indexer_action`
--

LOCK TABLES `solr_indexer_action` WRITE;
/*!40000 ALTER TABLE `solr_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action`
--

DROP TABLE IF EXISTS `workflow_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `id_workflow` int(11) DEFAULT NULL,
  `id_state_before` int(11) DEFAULT NULL,
  `id_state_after` int(11) DEFAULT NULL,
  `id_icon` int(11) DEFAULT NULL,
  `is_automatic` smallint(6) DEFAULT '0',
  `is_mass_action` smallint(6) DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  `is_automatic_reflexive_action` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_action`),
  KEY `action_id_workflow_fk` (`id_workflow`),
  KEY `action_id_state_before_fk` (`id_state_before`),
  KEY `action_id_state_after_fk` (`id_state_after`),
  KEY `action_id_icon_fk` (`id_icon`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action`
--

LOCK TABLES `workflow_action` WRITE;
/*!40000 ALTER TABLE `workflow_action` DISABLE KEYS */;
INSERT INTO `workflow_action` VALUES (101,'Validate','Validate',101,101,102,1,0,0,1,0),(102,'Annuler par un administrateur','Annuler par un administrateur',101,102,103,2,0,0,2,0),(103,'Annuler par l\'utilisateur','Annuler par l\'utilisateur',101,101,103,2,0,0,3,0),(104,'Action d\'arriv√© sur l\'etat Non valid√©','',101,101,101,1,0,0,0,1),(105,'Annuler par un administrateur','Annuler par un administrateur',101,101,103,2,0,0,4,0),(106,'Annuler par l\'utilisateur','Annuler par l\'utilisateur',101,102,103,2,0,0,5,0),(107,'Associer √† un administrateur','Associer √† un administrateur',101,102,102,3,0,0,6,0),(118,'Valider','Valider',105,109,110,1,0,0,1,0),(119,'Annuler par un administrateur','Annuler par un administrateur',105,110,111,2,0,0,2,0),(120,'Annuler par l\'utilisateur','Annuler par l\'utilisateur',105,109,111,2,0,0,3,0),(121,'Annuler par un administrateur','Annuler par un administrateur',105,109,111,2,0,0,4,0),(122,'Annuler par l\'utilisateur','Annuler par l\'utilisateur',105,110,111,2,0,0,5,0),(123,'Associer √† un administrateur','Associer √† un administrateur',105,110,110,3,0,0,6,0),(125,'Action d\'arriver sur l\'etat Non valid√©','',105,109,109,1,0,0,0,1);
/*!40000 ALTER TABLE `workflow_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action_action`
--

DROP TABLE IF EXISTS `workflow_action_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_action_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `id_linked_action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`,`id_linked_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action_action`
--

LOCK TABLES `workflow_action_action` WRITE;
/*!40000 ALTER TABLE `workflow_action_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_appointment_reminder`
--

DROP TABLE IF EXISTS `workflow_appointment_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_appointment_reminder` (
  `id_task` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `time_to_alert` int(11) NOT NULL,
  `email_notify` smallint(6) NOT NULL,
  `sms_notify` smallint(6) NOT NULL,
  `email_alert_message` mediumtext COLLATE utf8_unicode_ci,
  `sms_alert_message` mediumtext COLLATE utf8_unicode_ci,
  `alert_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_state_after` int(11) NOT NULL,
  PRIMARY KEY (`id_task`,`id_form`,`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_appointment_reminder`
--

LOCK TABLES `workflow_appointment_reminder` WRITE;
/*!40000 ALTER TABLE `workflow_appointment_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_appointment_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assignment_history`
--

DROP TABLE IF EXISTS `workflow_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_assignment_history` (
  `id_history` int(11) NOT NULL DEFAULT '0',
  `id_task` int(11) NOT NULL,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`workgroup_key`),
  KEY `assignment_id_history_fk` (`id_history`),
  KEY `assignment_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assignment_history`
--

LOCK TABLES `workflow_assignment_history` WRITE;
/*!40000 ALTER TABLE `workflow_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_icon`
--

DROP TABLE IF EXISTS `workflow_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_value` mediumblob,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_icon`
--

LOCK TABLES `workflow_icon` WRITE;
/*!40000 ALTER TABLE `workflow_icon` DISABLE KEYS */;
INSERT INTO `workflow_icon` VALUES (1,'Valider','image/png','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0◊©Õ \0\0ºPLTEˇˇˇ˝˝˝˚˚˚¸¸¸˘˘˘ˆˆˆÛÛÛ“““˙˙˙ÎÎÎÿÿÿ”””≤«€≥≥≥±±±ó≥ŒèÆ wù¿cé∂}}}O~™GqòNNN\r¯¯¯ıııÙÙÙÒÒÒÓÓÓÌÌÌÍÍÍÁÁÁ‚‚‚···◊‚Ïﬁﬁﬁ€€€÷÷÷’’’———œœœ¡“‚ŒŒŒÀÀÀ   ∫Õﬂ≈≈≈√√√Ø≈œ≠√ÿ©¿÷§Ω’£º‘¥µµ≤≤≤´´´©©©®®®ê≠«ßßßå¨…ã´…£££ûûûùùùõõõ}°¬ôôôzü¡xùøvúøíììrôΩèêêfê∑bçµ_ã¥]ä¥ÄÄÄYá≤XÜ±WÖ∞UÑ∞TÉØyyywwwuuuN}©sssLy£nnnItúHsõGrö[htGlçBjèBiç___@fâ]^^=bÑ<`ÅVY[<_~PZ`VVV5VtOOOKOR3Rn3Qk2Qm@LT:M^HHH<AC<?A)AX<<<1>I(=Q&<Q$:O\'9J&9I$7I,5;-01!2B&08,,,-=+:\'\'\'#(,%%%$$$(	ÀS%\0\0\0tRNS\0@Êÿf\0\0\0˚IDATx⁄c`¿ò∞Ffl¢\\bb\ZåX$llçKx90≈\r˘Eª˘∞ËòÆè)°U /⁄fâ≈Ue‚ë∫ò\Z¨≥uä;yY·|V&à\Z∆S?ÒXu∏7ÿíö¥Y¿6˚õÂıZ…¬5pV´÷;≤10∞ÁòıÂr#¨fvÊ©ÒícÃrŒúË∆âdßtπªg£OtOX{ïëJ\05\nµÙõ•L\nTFq+KzºØ´Å}Tm™‰[BBEí%R5—Çú…ÆN$&ÆR“I›œ2i	˘z,±¶“Uÿ!È¢à%ûŸõ\'Gp≥`â:%v5ViÄëÅ\0\0«K+˘; ë÷\0\0\0\0IENDÆB`Ç',14,14),(2,'Refuser','image/png','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0◊©Õ \0\0CPLTEˇˇˇ¸¸¸˝˝˝˚˚˚√L6˙˙˙˜˜˜ËËËˆˆˆ˘˘˘ÚÚÚÊÊÊæ;\"∫:\"ÒÒÒÏÏÏÎÎÎ‡‡‡ﬂﬂﬂ«««¥¥¥;ÂÂÂ‚‚‚···‘‘‘ÕÕÕ   ………≈≈≈æææÆÆÆ•••£££†††Àxhqqq»N7∆M7ƒM6mmm¿;\"ø;\"Ω;\"___º;\"ª;\"∫;\"π;$∑9\"\\\\\\≤8!WWWTTTñ.NL<--¯¯¯ÙÙÙÛÛÛÓÓÓÌÌÌÈÈÈÁÁÁ„„„‹‹‹◊◊◊÷÷÷”””–––œœœ∆∆∆¡¡¡πππ∏∏∏∂∂∂µµµ∞∞∞™™™ßßß§§§›ç}üüüùùùöööôôô—pîîîìììèèèéééŸp[÷o[ÕraÃraäää m[¡n^ÑÑÑÉÉÉŒfS”cN–_I~~~zzz∞cTxxxvvv…VAŒR:ttt¥[Jrrrnnn¬M6llljjj¬F/¬A)ccc≠F2æ?\'Ω?(Ω=%¬;\"∏>\'Ω<$∂=&π:\"¥:#∂9\"¥9\"∞7 ≠6 ¢:&°5!QQQò1ñ1ô/î0í/ë/í,Ç&Ç&>>>P3.;86e$F/*\\%50.W!B 9\";\Z&&&<N\rI$$$3A7\Z5.- ,.107%\Z&\Z/$(\n\"\r#%\n,!			Võo\0\0\0tRNS\0@Êÿf\0\0sIDATx⁄c`†.∞ëfcÜqò·1sÁk∞≥AÿÅK»qA•òfÜdöõr0ŸækS™7KÚ1Å%ße‰´Yò\nq00».ç´4€Ë«\r—¬<ùESK}F±8õ‡¶xÉIãT¸°å¬ÎYxxXf∫lInò≤∑L—jWÑ5ã∂Æ±ËÆúä…;≥Ç•`Ndà≤b—”7,*Ë€W¢ ≈œ\nw/+{ö%/ØjÎ∂©·¬¸ÃH^‰‰6Zúﬁ»Àkl©!iãÏw&Ÿ\rë5MÜ˙zmV±‹úH>˚ïk\'l-’’n∑éfGÿë¥PŸ†ww™ë(–Ÿ-k‰·Æ õìÿl∂\'[¡[eô∫ñfÁj.à?òÊ%‘ıÏ(Wîbó0±P´ÔX%\"ı˘Ïâ˝™îd¯YŸ$LÕUªV	AÃbî[æ]\'‘Àh\'áêŒäu›Ú‚PK∏‹Edÿ¡Æ‰ÀUvÄÜ#üò≥=‘ılÏÆnN6H—…c3≥q∞‚K\071PÎÍ£‚‘\0\0\0\0IENDÆB`Ç',14,14),(3,'Commentaire','image/png','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szzÙ\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0xIDATxú≈ñMlÈ«ˇÛe«ƒÕáùè\rdÌ∏4¬ã£©!(@‘\"N8Jî{ÿm√°j•Hë∏QÑ†R7Ÿj•*=ÄÑ*Uäê‡¬\n@|‰@Làl«ﬁÜuL$\'1¨âg<∂«3Û>=êDŸ¨◊v™~¸•˜4ÔºœÔyﬁy˛Û\0ˇg	ïn‹ø˜È”ßO<œÀ≤ú◊4-˜ü\0+›xÍ‘©¡ëëëﬂ¨ÆÆ‚Ì€∑…x<˛M$ôôôô	É¡ŸH$Úm:ù~ø]\0ÆÃs·Í’´øw:ùwuu˝ ÌvlAÄ$IÑÃÂrH&ìÀÒx¸üKKKQ∆òVÏl\"Ç$I\\ çéé~Y	`√ÏÏlÇ÷T(H7 õ&es9 f≥îÀÂ(üœS°P†J511ÿ»∞Ä„‹πsøﬁµkW˝∑H…2‰dlní”	Ní@åÅà¿ÉÆÎe«q0MsáÀÂj\rÖB!æ\\	xûGN”ùöÇîLb~dz>±∫\Z «q€Zå1Ï‹π≥vhhËÛ∆∆∆væøøˇ»Ò„«Y\nÇàP]Ws|ZK,}}\0cï\\aQqáp8¸]$Yè=:244tÙ∆çI$Yñó«∆∆∆\0ËÎ¡´,X\Z\Z∞:0\0ái¬™ÎÄ Ä„ }√≈É[,Ñ√·òÆÎ	Ò“•KWc±òÁ‚≈ãüutt‡˛˝˚°ÊÊÊ∂ÒÒÒ?-,,§cE?ÔÍ„8ÓÃ4ˇÌ\n\0¿ÏÏÏ\0Y ¢Â`0ò™≠≠=∞gœ˚ﬁΩ{Üaÿöõõ€à®™øøˇn∑ª^Vd3Ë<§”‡%	*ˆ±\r	Ç\0UU166v+ã=\0Ëå±ÖßOüæN•Rû∂∂∂]ΩΩΩ’‘‘ÿﬂΩ{W∑oﬂ>ü”È¥=æÜ$a˛ã/PùN£∆Ôx‹ZY+]í$!ëH–µk◊FE˘f=Ö<≈^Ωzı*\nŸùNÁﬁûûû∆ÓÓnW>ü∑(πú$æ˜◊_ce~m√√∞UUÅ€và¢à`0ò\Z˝3Ä‰Ê\ZÍ\0ñgû<y¢X,üœÁ´Ûx<í™(H®*“ô“ü|Çü˙|∞äª¯Üà¢(‚Ÿ≥g±âââØ\0d∂^\"êR%899ìeŸ€–––‰Òx–Ëp†Æ≥?Û˚Q]U\"⁄V‡Õ\0/_æ\\º}˚ˆﬂ\0‰ãX—u˝ÔwÔﬁ˝Rñe<˛]á√náE¡qxû/[Ó≠¡◊µπ}K9aŒÔ˜KΩΩΩzΩòûûF4\ZÖÆÎ0◊ZPí§íYo]¨àyïº»ÆÆ.ø zΩ∞ŸlòôôÅ™™∞Z≠òöö¬â\'‡rπ`hÕñ7‹\nSL•\0Døﬂøo˝‡¶¶&:tìììÑ√·@(¬¿¿\08\0∆ÿ2,R±l6[ÎÙÙÙ€T*EDDÜaêa§(\n]æ|ôDQ§;v–ë#GË÷≠[DDdö&iöFö¶Q>üß‹⁄/[UURUï2ô›ºy3\0†Æ$@gggˇ““K&ìﬂ0MìààÓ›ªGªwÔ&\0‘⁄⁄JWÆ\\!UUI◊u“4m#¯:@&ì!EQààË˙ıÎœ\0‘î8{ˆÏo≥Ÿ,-//`3ƒõ7ohppê\0êœÁ£L&Cå±çÏUU›ÿØi\Zô¶Iè?÷ZZZ˛\0¿îHŒü?ˇÈ¡ÉªsπÏv;\0¸†ΩÍÍÍpÚ‰I¯|>‘÷÷Bí$477√jµÇ1√0 ä\"√\0cÅ@¿8sÊÃWâD‚Ø\0JŒèñáNõ¶πQ”4ãÆÕ„⁄£GèËŒù;á)üœS*ï\"EQ(ïJQ8¶···Y\0{∞i^¸1p®™Zè«À~∂å1ò¶	ûÁq¯·çé \"Ë∫él6ãππ9Hí√0\0ÊÒ¡ÏJÍ\'Ç kjj∫¸‚≈ã’rC&cåL”$]◊…0\"\"Z]]•h4J<†H$BDD«é˚›÷@?Ê”4$ì…ïB°i9⁄Õˆkö&“È4^ø~çt:çéé¥¥¥@ñeçFÁ* \0Äï.¸√n∑∑≥b>∫˘ Q‰ÎÎÎk‹nwC{{{CgggM__¨V+\0`qqÒªx<>_)¿∫ﬁáB°?‚Éiîª7@ÄZûÁ?rπ\\nØ◊ÎÒ˘|ûûûû∂X,∞≤ı•ÌOïÂ%\0ê\0ÿ\0ÿ‘hê0@˚o”z∑*ËÄˇ©˛M]<6¬H \0\0\0\0IENDÆB`Ç',14,14);
/*!40000 ALTER TABLE `workflow_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite`
--

DROP TABLE IF EXISTS `workflow_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_prerequisite` (
  `id_prerequisite` int(11) NOT NULL,
  `id_action` int(11) NOT NULL,
  `prerequisite_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite`
--

LOCK TABLES `workflow_prerequisite` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite_duration_cf`
--

DROP TABLE IF EXISTS `workflow_prerequisite_duration_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_prerequisite_duration_cf` (
  `id_prerequisite` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite_duration_cf`
--

LOCK TABLES `workflow_prerequisite_duration_cf` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_history`
--

DROP TABLE IF EXISTS `workflow_resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_resource_history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `id_action` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_access_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`),
  KEY `history_id_workflow_fk` (`id_workflow`),
  KEY `history_id_action_fk` (`id_action`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_history`
--

LOCK TABLES `workflow_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
INSERT INTO `workflow_resource_history` VALUES (30,22,'appointment',101,104,'2018-08-16 14:32:28','auto'),(31,23,'appointment',101,104,'2018-08-16 14:32:50','auto'),(32,24,'appointment',101,104,'2018-08-16 14:33:48','auto'),(33,25,'appointment',101,104,'2018-08-16 14:34:05','auto'),(34,26,'appointment',101,104,'2018-08-16 14:34:39','auto'),(35,27,'appointment',101,104,'2018-08-16 14:35:18','auto'),(36,28,'appointment',101,104,'2018-08-16 14:35:38','auto'),(37,29,'appointment',101,104,'2018-08-16 14:36:24','auto'),(38,30,'appointment',101,104,'2018-08-16 14:37:19','auto'),(22,14,'appointment',101,104,'2018-08-16 14:11:41','auto'),(23,15,'appointment',101,104,'2018-08-16 14:12:28','auto'),(24,16,'appointment',101,104,'2018-08-16 14:12:48','auto'),(25,17,'appointment',101,104,'2018-08-16 14:14:37','auto'),(26,18,'appointment',101,104,'2018-08-16 14:15:02','auto'),(27,19,'appointment',101,104,'2018-08-16 14:15:23','auto'),(28,20,'appointment',101,104,'2018-08-16 14:16:32','auto'),(29,21,'appointment',101,104,'2018-08-16 14:18:42','auto');
/*!40000 ALTER TABLE `workflow_resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workflow`
--

DROP TABLE IF EXISTS `workflow_resource_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_resource_workflow` (
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_workflow` int(11) NOT NULL,
  `id_external_parent` int(11) DEFAULT NULL,
  `is_associated_workgroups` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_resource`,`resource_type`,`id_workflow`),
  KEY `workflow_resource_workflow_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workflow_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workflow_id_workflow_fk` (`id_workflow`),
  KEY `fk_document_id_state` (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workflow`
--

LOCK TABLES `workflow_resource_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workflow` DISABLE KEYS */;
INSERT INTO `workflow_resource_workflow` VALUES (22,'appointment',101,101,3,0),(23,'appointment',101,101,3,0),(24,'appointment',101,101,3,0),(25,'appointment',101,101,3,0),(26,'appointment',101,101,3,0),(27,'appointment',101,101,3,0),(28,'appointment',101,101,3,0),(29,'appointment',101,101,3,0),(30,'appointment',101,101,3,0),(14,'appointment',101,101,3,0),(15,'appointment',101,101,3,0),(16,'appointment',101,101,3,0),(17,'appointment',101,101,3,0),(18,'appointment',101,101,3,0),(19,'appointment',101,101,3,0),(20,'appointment',101,101,3,0),(21,'appointment',101,101,3,0);
/*!40000 ALTER TABLE `workflow_resource_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workgroup`
--

DROP TABLE IF EXISTS `workflow_resource_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_resource_workgroup` (
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_workflow` int(11) DEFAULT NULL,
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `workflow_resource_workgroup_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workgroup_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workgroup_id_workflow_fk` (`id_workflow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workgroup`
--

LOCK TABLES `workflow_resource_workgroup` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state`
--

DROP TABLE IF EXISTS `workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `id_workflow` int(11) DEFAULT NULL,
  `is_initial_state` smallint(6) DEFAULT '0',
  `is_required_workgroup_assigned` smallint(6) DEFAULT '0',
  `id_icon` int(11) DEFAULT NULL,
  `display_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `fk_state_id_workflow` (`id_workflow`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state`
--

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
INSERT INTO `workflow_state` VALUES (101,'Not validated','Not validated',101,1,0,NULL,1),(102,'Validated','Validated',101,0,0,NULL,2),(103,'Canceled','Canceled',101,0,0,NULL,3),(109,'Non valid√©','Non valid√©',105,1,0,0,1),(110,'Valid√©','Valid√©',105,0,0,0,2),(111,'Annul√©','Annul√©',105,0,0,0,3);
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task`
--

DROP TABLE IF EXISTS `workflow_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `task_type_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_action` int(11) NOT NULL DEFAULT '0',
  `display_order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_task`),
  KEY `task_id_action_fk` (`id_action`)
) ENGINE=MyISAM AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task`
--

LOCK TABLES `workflow_task` WRITE;
/*!40000 ALTER TABLE `workflow_task` DISABLE KEYS */;
INSERT INTO `workflow_task` VALUES (101,'taskNotifyAppointment',101,3),(103,'taskNotifyAppointment',104,1),(104,'taskNotifyAdminAppointment',104,2),(105,'taskUpdateAppointmentCancelAction',101,5),(106,'taskChangeAppointmentStatus',101,2),(107,'taskChangeAppointmentStatus',102,2),(108,'taskManualAppointmentNotification',102,4),(109,'taskChangeAppointmentStatus',103,1),(110,'taskNotifyAppointment',103,2),(111,'taskChangeAppointmentStatus',105,2),(112,'taskNotifyAppointment',105,3),(113,'taskTypeComment',105,1),(114,'taskTypeComment',102,1),(115,'taskChangeAppointmentStatus',106,1),(116,'taskNotifyAdminAppointment',106,2),(117,'taskUpdateAdminAppointment',107,2),(118,'taskNotifyAdminAppointment',102,3),(119,'taskUpdateAdminAppointment',101,1),(120,'taskNotifyAdminAppointment',101,4),(121,'taskNotifyAppointment',106,3),(122,'taskNotifyAdminAppointment',105,4),(123,'taskNotifyAdminAppointment',107,1),(124,'taskNotifyAdminAppointment',107,3),(147,'taskChangeAppointmentStatus',118,3),(148,'taskNotifyAppointment',118,4),(149,'taskNotifyAdminAppointment',118,5),(150,'taskUpdateAppointmentCancelAction',118,6),(151,'taskTypeComment',119,1),(152,'taskChangeAppointmentStatus',119,2),(153,'taskNotifyAdminAppointment',119,3),(154,'taskManualAppointmentNotification',119,4),(156,'taskChangeAppointmentStatus',120,1),(157,'taskNotifyAppointment',120,2),(158,'taskTypeComment',121,1),(159,'taskChangeAppointmentStatus',121,2),(160,'taskNotifyAppointment',121,3),(161,'taskNotifyAdminAppointment',121,4),(162,'taskChangeAppointmentStatus',122,1),(163,'taskNotifyAdminAppointment',122,2),(164,'taskNotifyAppointment',122,3),(165,'taskNotifyAdminAppointment',123,2),(167,'taskNotifyAdminAppointment',123,3),(168,'taskSetAppointmentResource',123,1),(169,'taskSetAppointmentResource',118,1),(170,'taskSetAppointmentResource',118,2),(172,'taskUpdateAppointmentCancelAction',125,1);
/*!40000 ALTER TABLE `workflow_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_assignment_cf`
--

DROP TABLE IF EXISTS `workflow_task_assignment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_assignment_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_multiple_owner` smallint(6) DEFAULT '0',
  `is_notify` smallint(6) DEFAULT '0',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_use_user_name` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_assignment_cf`
--

LOCK TABLES `workflow_task_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_appointment_status_cf`
--

DROP TABLE IF EXISTS `workflow_task_change_appointment_status_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_change_appointment_status_cf` (
  `id_task` int(11) NOT NULL,
  `appointment_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_appointment_status_cf`
--

LOCK TABLES `workflow_task_change_appointment_status_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` DISABLE KEYS */;
INSERT INTO `workflow_task_change_appointment_status_cf` VALUES (106,1),(107,0),(109,0),(111,0),(115,0),(147,10),(152,-10),(156,-10),(159,-10),(162,-10);
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_config`
--

DROP TABLE IF EXISTS `workflow_task_comment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_comment_config` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_richtext` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_config`
--

LOCK TABLES `workflow_task_comment_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_config` DISABLE KEYS */;
INSERT INTO `workflow_task_comment_config` VALUES (113,'Veuillez saisir le motif de l\'annulation',1,0),(114,'Veuillez saisir le motif de l\'annulation',1,0),(151,'Veuillez saisir le motif de l\'annulation',1,0),(158,'Veuillez saisir le motif de l\'annulation',1,0);
/*!40000 ALTER TABLE `workflow_task_comment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_value`
--

DROP TABLE IF EXISTS `workflow_task_comment_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_comment_value` (
  `id_history` int(11) NOT NULL DEFAULT '0',
  `id_task` int(11) NOT NULL,
  `comment_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`),
  KEY `comment_value_id_history_fk` (`id_history`),
  KEY `comment_value_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_value`
--

LOCK TABLES `workflow_task_comment_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_manual_app_notify`
--

DROP TABLE IF EXISTS `workflow_task_manual_app_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_manual_app_notify` (
  `id_notif` int(11) NOT NULL,
  `id_history` int(11) DEFAULT NULL,
  `id_appointment` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_notif`),
  KEY `idx_wf_task_manual_app_notify` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_manual_app_notify`
--

LOCK TABLES `workflow_task_manual_app_notify` WRITE;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notification_cf`
--

DROP TABLE IF EXISTS `workflow_task_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_notification_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `id_mailing_list` int(11) DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notification_cf`
--

LOCK TABLES `workflow_task_notification_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notification_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_admin_appointment_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_admin_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_notify_admin_appointment_cf` (
  `id_task` int(11) NOT NULL,
  `id_admin_user` int(11) DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `recipients_cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int(11) DEFAULT NULL,
  `id_action_validate` int(11) DEFAULT NULL,
  `ical_notification` smallint(6) DEFAULT '0',
  `create_notif` smallint(6) DEFAULT '0',
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_admin_appointment_cf`
--

LOCK TABLES `workflow_task_notify_admin_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` DISABLE KEYS */;
INSERT INTO `workflow_task_notify_admin_appointment_cf` VALUES (104,1,'The Lutece team','no-reply@mydomain.com','Your appointment request on ${date_appointment} at ${time_appointment}','<p>Hello,</p>\r\n<p>A new appointment has been scheduled on ${date_appointment} ${time_appointment}.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p>${recap}</p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"${url_validate}\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"${url_cancel}\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',105,101,0,0,'Salle 216'),(116,1,'Lutece team','no-reply@mydomain.com','Canceling an appointment by the user','<p>Hello,</p>\r\n<p>The appointment on ${date_appointment} ${time_appointment} (reference number ${reference}) has been canceled by the user.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',0,0,1,0,''),(118,0,'Lutece team','no-reply@mydomain.com','Cancellation of the appointment of  ${date_appointment}','<p>Hello,</p>\r\n<p>The appointment on ${date_appointment} ${time_appointment} (reference number ${reference}) has been canceled by the manager.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',0,0,1,0,'Salle 216'),(120,1,'The Lutece Team','no-reply@mydomain.com','Appointment request on ${date_appointment} ${time_appointment}','<p>Hello,</p>\r\n<p>Your appointment request on ${date_appointment} ${time_appointment} has been approved. Please make sure to be available for that date, or cancel the appointment in case you\'re unavailable.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',102,0,1,1,''),(122,0,'Lutece team','no-reply@mydomain.com','Cancellation of your appointment on ${date_appointment}','<p>Hello,</p>\r\n<p>The appointment on ${date_appointment} ${time_appointment} (reference number ${reference}) has been canceled by the manager.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',0,0,1,0,''),(123,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} a √©t√© r√©attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; r&eacute;attribu&eacute; &agrave; un autre agent.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,0,1,0,''),(124,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} vous a √©t√© attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} vous a &eacute;t&eacute; attribu&eacute;. Merci de vous rendre disponible pour cet horraire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',102,0,1,1,'salle 216'),(149,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Une demande de rendez-vous vous a √©t√© attribu√©e pour le ${date_appointment} √† ${time_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>Le rendez-vous du ${date_appointment} &agrave; ${time_appointment} vous a &eacute;t&eacute; attribu&eacute;. Merci de vous rendez disponible pour cet horraire, ou d\'annuler le rendez-vous en cas d\'impossibilit&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',102,0,1,1,''),(153,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation du rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>je rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(161,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du&nbsp;${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute; par le gestionnaire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(163,1,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation d\'un rendez-vous par l\'utilisateur','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>${firstName} ${lastName} a annul&eacute; le rendez-vous du ${date_appointment} &agrave; ${time_appointment}.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(165,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} a √©t√© r√©attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; r&eacute;attribu&eacute; &agrave; un autre agent.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,0,1,0,''),(167,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} vous a √©t√© attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} vous a &eacute;t&eacute; attribu&eacute;. Merci de vous rendre disponible pour cet horraire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',102,0,1,1,'');
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_appointment_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_notify_appointment_cf` (
  `id_task` int(11) NOT NULL,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `recipients_cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int(11) DEFAULT NULL,
  `ical_notification` smallint(6) DEFAULT '0',
  `create_notif` smallint(6) DEFAULT '0',
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_sms` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_appointment_cf`
--

LOCK TABLES `workflow_task_notify_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` DISABLE KEYS */;
INSERT INTO `workflow_task_notify_appointment_cf` VALUES (101,'The Lutece Team','no-reply@mydomain.com','Your appointment on ${date_appointment} has been confirmed','<p>Dear ${firstName} ${lastName},</p>\r\n<p>Your appointment request on ${date_appointment} ${time_appointment} (reference number <strong>${reference}</strong>) has been validated.</p>\r\n<p>If you wish to cancel your appointment, you can do so by clicking on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"${url_cancel}\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',106,1,1,'',0),(103,'The Lutece team','no-reply@mydomain.com','Your scheduled appointment on ${date_appointment}','<p>Dear ${firstName} ${lastName},</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on ${date_appointment} ${time_appointment} has been registered (reference number:<strong> ${reference}</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"${url_cancel}\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',103,0,0,'',0),(112,'Lutece team','no-reply@mydomain.com','Cancellation of your appointment on ${date_appointment}','<p>Dear ${firstName} ${lastName},</p>\r\n<p>Due to constraints beyond our control, your appointment on ${date_appointment} ${time_appointment} (reference number ${reference}) has been canceled.</p>\r\n<p>We are sorry for the inconvenience.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',0,1,0,'',0),(110,'Lutece team','no-reply@mydomain.com','Cancellation of your appointment on ${date_appointment!}','<p>Dear ${firstName} ${lastName},</p>\r\n<p>At your request your appointment on ${date_appointment} ${time_appointment} (reference number ${reference}) has been canceled.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',0,1,0,'',0),(121,'Lutece team','no-reply@mydomain.com','Your appointment of ${date_appointment} has been canceled','<p>Dear ${firstName} ${lastName},</p>\r\n<p>At your request your appointment on ${date_appointment} ${time_appointment} (reference number ${reference}) has been canceled.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',0,1,0,'',0),(148,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Votre rendez-vous du ${date_appointment} a √©t√© valid√©','<p>Bonjour ${firstName} ${lastName},</p>\r\n<p>&nbsp;</p>\r\n<p>votre demande de rendez-vous du ${date_appointment} &agrave; ${time_appointment} avec la reference <strong>${reference}</strong> a &eacute;t&eacute; valid&eacute;.</p>\r\n<p>En cas d\'indisponibilit&eacute;, vous pouvez annuler le rendez-vous en suivante le lien suivant :</p>\r\n<p><a title=\"Annuler le rendez-vous\" href=\"${url_cancel}\">Annuler le rendez-vous</a></p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',106,1,1,'',0),(157,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>A votre demande, votre rendez-vous a bien &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,1,0,'',0),(160,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>En raison de l\'indisponibilit&eacute; de nos agents, votre rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Veuillez nous excuser pour la g&egrave;ne ocasion&eacute;e.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,1,0,'',0),(164,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Votre rendez-vous du ${date_appointment} a bien √©t√© annul√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>A votre demande, votre rendez-vous du ${date_appointment} &agrave; ${time_appointment} avec nos services a bien &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,1,0,'',0);
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_appointment_crm`
--

DROP TABLE IF EXISTS `workflow_task_notify_appointment_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_notify_appointment_crm` (
  `id_task` int(11) NOT NULL,
  `id_demand_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_status_crm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_appointment_crm`
--

LOCK TABLES `workflow_task_notify_appointment_crm` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_reminder_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_reminder_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_notify_reminder_cf` (
  `id_task` int(11) NOT NULL,
  `id_form` int(11) NOT NULL DEFAULT '0',
  `nb_alerts` int(11) DEFAULT '0',
  PRIMARY KEY (`id_task`,`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_reminder_cf`
--

LOCK TABLES `workflow_task_notify_reminder_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_set_app_resource_cf`
--

DROP TABLE IF EXISTS `workflow_task_set_app_resource_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_set_app_resource_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `id_form_resource_type` int(11) NOT NULL DEFAULT '0',
  `is_mandatory` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_set_app_resource_cf`
--

LOCK TABLES `workflow_task_set_app_resource_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_set_app_resource_cf` DISABLE KEYS */;
INSERT INTO `workflow_task_set_app_resource_cf` VALUES (168,3,1),(169,3,1),(170,1,1);
/*!40000 ALTER TABLE `workflow_task_set_app_resource_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_set_appointment_resource_history`
--

DROP TABLE IF EXISTS `workflow_task_set_appointment_resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_set_appointment_resource_history` (
  `id` int(11) NOT NULL DEFAULT '0',
  `id_history` int(11) NOT NULL DEFAULT '0',
  `id_appointment` int(11) NOT NULL DEFAULT '0',
  `id_resource` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_form_resource_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_wf_set_app_res_hist_id_hist` (`id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_set_appointment_resource_history`
--

LOCK TABLES `workflow_task_set_appointment_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_set_appointment_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_set_appointment_resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_update_admin_appointment`
--

DROP TABLE IF EXISTS `workflow_task_update_admin_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_update_admin_appointment` (
  `id_update` int(11) NOT NULL,
  `id_history` int(11) DEFAULT NULL,
  `id_appointment` int(11) DEFAULT NULL,
  `id_admin_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_update`),
  KEY `idx_wf_task_update_admin_app` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_update_admin_appointment`
--

LOCK TABLES `workflow_task_update_admin_appointment` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_update_appointment_cancel_cf`
--

DROP TABLE IF EXISTS `workflow_task_update_appointment_cancel_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_task_update_appointment_cancel_cf` (
  `id_task` int(11) NOT NULL,
  `id_action_cancel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `fk_wf_task_up_app_cancel_cf` (`id_action_cancel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_update_appointment_cancel_cf`
--

LOCK TABLES `workflow_task_update_appointment_cancel_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` DISABLE KEYS */;
INSERT INTO `workflow_task_update_appointment_cancel_cf` VALUES (105,106),(150,122),(172,120);
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflow`
--

DROP TABLE IF EXISTS `workflow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workflow` (
  `id_workflow` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_enabled` smallint(6) DEFAULT '0',
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_workflow`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflow`
--

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` VALUES (101,'Appointment management workflow','Appointment management workflow','2014-02-11 07:36:34',1,'all'),(105,'Appointment management workflow (with resources)','Appointment management workflow (with resources)','2014-02-11 06:36:34',1,'all');
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workgroup_cf`
--

DROP TABLE IF EXISTS `workflow_workgroup_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workgroup_cf` (
  `id_task` int(11) NOT NULL DEFAULT '0',
  `workgroup_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_mailing_list` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workgroup_cf`
--

LOCK TABLES `workflow_workgroup_cf` WRITE;
/*!40000 ALTER TABLE `workflow_workgroup_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_workgroup_cf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-23 14:36:00
