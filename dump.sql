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
INSERT INTO `appointment_appointment` VALUES (1,'14e7c8',1,0,103,0,0,1,3),(2,'26f9b3',1,0,103,0,0,2,4),(3,'3a632b',1,0,103,0,0,3,6);
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
INSERT INTO `appointment_appointment_response` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,2),(9,9,2),(10,10,2),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,3),(16,16,3),(17,17,3),(18,18,3),(19,19,3),(20,20,3),(21,21,3);
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
INSERT INTO `appointment_display` VALUES (1,1,'','NULL',52,1,1,1),(2,1,'','NULL',52,1,1,2);
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
INSERT INTO `appointment_form` VALUES (1,'Registering children','Schedule an appointment to register children','',NULL,'2018-08-14',NULL,1,101,'all'),(2,'Copie de  Registering children','Schedule an appointment to register children','',NULL,'2018-08-14',NULL,1,101,'all');
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
INSERT INTO `appointment_form_message` VALUES (1,'Select a date','Firstname','','Lastname','','Email','','Email confirmation','','<p>Your appointment request has been created with the reference %%REF%%</p>','jsp/site/Portal.jsp','<p>Your appointment request has been canceled</p>','OK','No available slots have been found. Please repeat your search later.','','Booking','Full',1),(2,'Select a date','Firstname','','Lastname','','Email','','Email confirmation','','<p>Your appointment request has been created with the reference %%REF%%</p>','jsp/site/Portal.jsp','<p>Your appointment request has been canceled</p>','OK','No available slots have been found. Please repeat your search later.','','Booking','Full',2);
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
INSERT INTO `appointment_form_rule` VALUES (1,0,0,0,0,0,0,0,1),(2,0,0,0,0,0,0,0,2);
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
INSERT INTO `appointment_localization` VALUES (1,NULL,NULL,NULL,1),(2,NULL,NULL,NULL,2);
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
INSERT INTO `appointment_reservation_rule` VALUES (1,'2018-08-13',1,1,1),(2,'2018-08-13',1,1,2);
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
INSERT INTO `appointment_slot` VALUES (1,'2018-08-15 08:30:00','2018-08-15 09:00:00',1,0,1,1,1,0,1),(2,'2018-08-15 09:30:00','2018-08-15 10:00:00',1,0,1,1,1,0,1),(3,'2018-08-14 09:30:00','2018-08-14 10:00:00',1,0,1,0,0,1,1),(4,'2018-08-14 10:00:00','2018-08-14 10:30:00',1,0,1,0,0,1,1),(5,'2018-08-14 10:30:00','2018-08-14 11:00:00',1,0,1,1,1,0,1),(6,'2018-08-14 11:00:00','2018-08-14 11:30:00',1,0,1,0,0,1,1);
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
INSERT INTO `appointment_time_slot` VALUES (1,'09:00:00','09:30:00',1,1,1),(2,'09:30:00','10:00:00',1,1,1),(3,'10:00:00','10:30:00',1,1,1),(4,'10:30:00','11:00:00',1,1,1),(5,'11:00:00','11:30:00',1,1,1),(6,'11:30:00','12:00:00',1,1,1),(7,'12:00:00','12:30:00',1,1,1),(8,'12:30:00','13:00:00',1,1,1),(9,'13:00:00','13:30:00',1,1,1),(10,'13:30:00','14:00:00',1,1,1),(11,'14:00:00','14:30:00',1,1,1),(12,'14:30:00','15:00:00',1,1,1),(13,'15:00:00','15:30:00',1,1,1),(14,'15:30:00','16:00:00',1,1,1),(15,'16:00:00','16:30:00',1,1,1),(16,'16:30:00','17:00:00',1,1,1),(17,'09:00:00','09:30:00',1,1,2),(18,'09:30:00','10:00:00',1,1,2),(19,'10:00:00','10:30:00',1,1,2),(20,'10:30:00','11:00:00',1,1,2),(21,'11:00:00','11:30:00',1,1,2),(22,'11:30:00','12:00:00',1,1,2),(23,'12:00:00','12:30:00',1,1,2),(24,'12:30:00','13:00:00',1,1,2),(25,'13:00:00','13:30:00',1,1,2),(26,'13:30:00','14:00:00',1,1,2),(27,'14:00:00','14:30:00',1,1,2),(28,'14:30:00','15:00:00',1,1,2),(29,'15:00:00','15:30:00',1,1,2),(30,'15:30:00','16:00:00',1,1,2),(31,'16:00:00','16:30:00',1,1,2),(32,'16:30:00','17:00:00',1,1,2),(33,'09:00:00','09:30:00',1,1,3),(34,'09:30:00','10:00:00',1,1,3),(35,'10:00:00','10:30:00',1,1,3),(36,'10:30:00','11:00:00',1,1,3),(37,'11:00:00','11:30:00',1,1,3),(38,'11:30:00','12:00:00',1,1,3),(39,'12:00:00','12:30:00',1,1,3),(40,'12:30:00','13:00:00',1,1,3),(41,'13:00:00','13:30:00',1,1,3),(42,'13:30:00','14:00:00',1,1,3),(43,'14:00:00','14:30:00',1,1,3),(44,'14:30:00','15:00:00',1,1,3),(45,'15:00:00','15:30:00',1,1,3),(46,'15:30:00','16:00:00',1,1,3),(47,'16:00:00','16:30:00',1,1,3),(48,'16:30:00','17:00:00',1,1,3),(49,'09:00:00','09:30:00',1,1,4),(50,'09:30:00','10:00:00',1,1,4),(51,'10:00:00','10:30:00',1,1,4),(52,'10:30:00','11:00:00',1,1,4),(53,'11:00:00','11:30:00',1,1,4),(54,'11:30:00','12:00:00',1,1,4),(55,'12:00:00','12:30:00',1,1,4),(56,'12:30:00','13:00:00',1,1,4),(57,'13:00:00','13:30:00',1,1,4),(58,'13:30:00','14:00:00',1,1,4),(59,'14:00:00','14:30:00',1,1,4),(60,'14:30:00','15:00:00',1,1,4),(61,'15:00:00','15:30:00',1,1,4),(62,'15:30:00','16:00:00',1,1,4),(63,'16:00:00','16:30:00',1,1,4),(64,'16:30:00','17:00:00',1,1,4),(65,'09:00:00','09:30:00',1,1,5),(66,'09:30:00','10:00:00',1,1,5),(67,'10:00:00','10:30:00',1,1,5),(68,'10:30:00','11:00:00',1,1,5),(69,'11:00:00','11:30:00',1,1,5),(70,'11:30:00','12:00:00',1,1,5),(71,'12:00:00','12:30:00',1,1,5),(72,'12:30:00','13:00:00',1,1,5),(73,'13:00:00','13:30:00',1,1,5),(74,'13:30:00','14:00:00',1,1,5),(75,'14:00:00','14:30:00',1,1,5),(76,'14:30:00','15:00:00',1,1,5),(77,'15:00:00','15:30:00',1,1,5),(78,'15:30:00','16:00:00',1,1,5),(79,'16:00:00','16:30:00',1,1,5),(80,'16:30:00','17:00:00',1,1,5),(81,'09:00:00','09:30:00',1,1,6),(82,'09:30:00','10:00:00',1,1,6),(83,'10:00:00','10:30:00',1,1,6),(84,'10:30:00','11:00:00',1,1,6),(85,'11:00:00','11:30:00',1,1,6),(86,'11:30:00','12:00:00',1,1,6),(87,'12:00:00','12:30:00',1,1,6),(88,'12:30:00','13:00:00',1,1,6),(89,'13:00:00','13:30:00',1,1,6),(90,'13:30:00','14:00:00',1,1,6),(91,'14:00:00','14:30:00',1,1,6),(92,'14:30:00','15:00:00',1,1,6),(93,'15:00:00','15:30:00',1,1,6),(94,'15:30:00','16:00:00',1,1,6),(95,'16:00:00','16:30:00',1,1,6),(96,'16:30:00','17:00:00',1,1,6),(97,'09:00:00','09:30:00',1,1,7),(98,'09:30:00','10:00:00',1,1,7),(99,'10:00:00','10:30:00',1,1,7),(100,'10:30:00','11:00:00',1,1,7),(101,'11:00:00','11:30:00',1,1,7),(102,'11:30:00','12:00:00',1,1,7),(103,'12:00:00','12:30:00',1,1,7),(104,'12:30:00','13:00:00',1,1,7),(105,'13:00:00','13:30:00',1,1,7),(106,'13:30:00','14:00:00',1,1,7),(107,'14:00:00','14:30:00',1,1,7),(108,'14:30:00','15:00:00',1,1,7),(109,'15:00:00','15:30:00',1,1,7),(110,'15:30:00','16:00:00',1,1,7),(111,'16:00:00','16:30:00',1,1,7),(112,'16:30:00','17:00:00',1,1,7),(113,'09:00:00','09:30:00',1,1,8),(114,'09:30:00','10:00:00',1,1,8),(115,'10:00:00','10:30:00',1,1,8),(116,'10:30:00','11:00:00',1,1,8),(117,'11:00:00','11:30:00',1,1,8),(118,'11:30:00','12:00:00',1,1,8),(119,'12:00:00','12:30:00',1,1,8),(120,'12:30:00','13:00:00',1,1,8),(121,'13:00:00','13:30:00',1,1,8),(122,'13:30:00','14:00:00',1,1,8),(123,'14:00:00','14:30:00',1,1,8),(124,'14:30:00','15:00:00',1,1,8),(125,'15:00:00','15:30:00',1,1,8),(126,'15:30:00','16:00:00',1,1,8),(127,'16:00:00','16:30:00',1,1,8),(128,'16:30:00','17:00:00',1,1,8),(129,'09:00:00','09:30:00',1,1,9),(130,'09:30:00','10:00:00',1,1,9),(131,'10:00:00','10:30:00',1,1,9),(132,'10:30:00','11:00:00',1,1,9),(133,'11:00:00','11:30:00',1,1,9),(134,'11:30:00','12:00:00',1,1,9),(135,'12:00:00','12:30:00',1,1,9),(136,'12:30:00','13:00:00',1,1,9),(137,'13:00:00','13:30:00',1,1,9),(138,'13:30:00','14:00:00',1,1,9),(139,'14:00:00','14:30:00',1,1,9),(140,'14:30:00','15:00:00',1,1,9),(141,'15:00:00','15:30:00',1,1,9),(142,'15:30:00','16:00:00',1,1,9),(143,'16:00:00','16:30:00',1,1,9),(144,'16:30:00','17:00:00',1,1,9),(145,'09:00:00','09:30:00',1,1,10),(146,'09:30:00','10:00:00',1,1,10),(147,'10:00:00','10:30:00',1,1,10),(148,'10:30:00','11:00:00',1,1,10),(149,'11:00:00','11:30:00',1,1,10),(150,'11:30:00','12:00:00',1,1,10),(151,'12:00:00','12:30:00',1,1,10),(152,'12:30:00','13:00:00',1,1,10),(153,'13:00:00','13:30:00',1,1,10),(154,'13:30:00','14:00:00',1,1,10),(155,'14:00:00','14:30:00',1,1,10),(156,'14:30:00','15:00:00',1,1,10),(157,'15:00:00','15:30:00',1,1,10),(158,'15:30:00','16:00:00',1,1,10),(159,'16:00:00','16:30:00',1,1,10),(160,'16:30:00','17:00:00',1,1,10),(161,'09:00:00','09:30:00',1,1,11),(162,'09:30:00','10:00:00',1,1,11),(163,'10:00:00','10:30:00',1,1,11),(164,'10:30:00','11:00:00',1,1,11),(165,'11:00:00','11:30:00',1,1,11),(166,'11:30:00','12:00:00',1,1,11),(167,'12:00:00','12:30:00',1,1,11),(168,'12:30:00','13:00:00',1,1,11),(169,'13:00:00','13:30:00',1,1,11),(170,'13:30:00','14:00:00',1,1,11),(171,'14:00:00','14:30:00',1,1,11),(172,'14:30:00','15:00:00',1,1,11),(173,'15:00:00','15:30:00',1,1,11),(174,'15:30:00','16:00:00',1,1,11),(175,'16:00:00','16:30:00',1,1,11),(176,'16:30:00','17:00:00',1,1,11),(177,'09:00:00','09:30:00',1,1,12),(178,'09:30:00','10:00:00',1,1,12),(179,'10:00:00','10:30:00',1,1,12),(180,'10:30:00','11:00:00',1,1,12),(181,'11:00:00','11:30:00',1,1,12),(182,'11:30:00','12:00:00',1,1,12),(183,'12:00:00','12:30:00',1,1,12),(184,'12:30:00','13:00:00',1,1,12),(185,'13:00:00','13:30:00',1,1,12),(186,'13:30:00','14:00:00',1,1,12),(187,'14:00:00','14:30:00',1,1,12),(188,'14:30:00','15:00:00',1,1,12),(189,'15:00:00','15:30:00',1,1,12),(190,'15:30:00','16:00:00',1,1,12),(191,'16:00:00','16:30:00',1,1,12),(192,'16:30:00','17:00:00',1,1,12);
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
INSERT INTO `appointment_user` VALUES (1,NULL,'Yvan','Michel','yvan.michel@paris.fr',NULL),(2,NULL,'nb','nbv','yvan.michel@paris.fr',NULL),(3,NULL,'hgfdhf','hgdhg','yvan.michel@paris.fr',NULL);
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
INSERT INTO `appointment_week_definition` VALUES (1,'2018-08-13',1),(2,'2018-08-13',2);
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
INSERT INTO `appointment_working_day` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,1,2),(8,2,2),(9,3,2),(10,4,2),(11,5,2),(12,6,2);
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
INSERT INTO `core_admin_right` VALUES ('CORE_ADMIN_SITE','portal.site.adminFeature.admin_site.name',2,'jsp/admin/site/AdminSite.jsp','portal.site.adminFeature.admin_site.description',1,NULL,'SITE','images/admin/skin/features/admin_site.png','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site',1,0),('CORE_CACHE_MANAGEMENT','portal.system.adminFeature.cache_management.name',0,'jsp/admin/system/ManageCaches.jsp','portal.system.adminFeature.cache_management.description',1,'','SYSTEM','images/admin/skin/features/manage_caches.png',NULL,0,0),('CORE_SEARCH_INDEXATION','portal.search.adminFeature.indexer.name',0,'jsp/admin/search/ManageSearchIndexation.jsp','portal.search.adminFeature.indexer.description',0,'','SYSTEM',NULL,NULL,0,0),('CORE_SEARCH_MANAGEMENT','portal.search.adminFeature.search_management.name',0,'jsp/admin/search/ManageSearch.jsp','portal.search.adminFeature.search_management.description',0,'','SYSTEM',NULL,NULL,0,0),('CORE_LOGS_VISUALISATION','portal.system.adminFeature.logs_visualisation.name',0,'jsp/admin/system/ManageFilesSystem.jsp','portal.system.adminFeature.logs_visualisation.description',1,'','SYSTEM','images/admin/skin/features/view_logs.png',NULL,0,0),('CORE_MODES_MANAGEMENT','portal.style.adminFeature.modes_management.name',0,'jsp/admin/style/ManageModes.jsp','portal.style.adminFeature.modes_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_modes.png',NULL,1,0),('CORE_PAGE_TEMPLATE_MANAGEMENT','portal.style.adminFeature.page_template_management.name',0,'jsp/admin/style/ManagePageTemplates.jsp','portal.style.adminFeature.page_template_management.description',0,NULL,'STYLE','images/admin/skin/features/manage_page_templates.png',NULL,2,0),('CORE_PLUGINS_MANAGEMENT','portal.system.adminFeature.plugins_management.name',0,'jsp/admin/system/ManagePlugins.jsp','portal.system.adminFeature.plugins_management.description',1,'','SYSTEM','images/admin/skin/features/manage_plugins.png',NULL,0,0),('CORE_PROPERTIES_MANAGEMENT','portal.site.adminFeature.properties_management.name',2,'jsp/admin/ManageProperties.jsp','portal.site.adminFeature.properties_management.description',0,NULL,'SITE',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties',2,0),('CORE_STYLESHEET_MANAGEMENT','portal.style.adminFeature.stylesheet_management.name',0,'jsp/admin/style/ManageStyleSheets.jsp','portal.style.adminFeature.stylesheet_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_stylesheets.png',NULL,3,0),('CORE_STYLES_MANAGEMENT','portal.style.adminFeature.styles_management.name',0,'jsp/admin/style/ManageStyles.jsp','portal.style.adminFeature.styles_management.description',1,NULL,'STYLE','images/admin/skin/features/manage_styles.png',NULL,4,0),('CORE_USERS_MANAGEMENT','portal.users.adminFeature.users_management.name',2,'jsp/admin/user/ManageUsers.jsp','portal.users.adminFeature.users_management.description',1,'','MANAGERS','images/admin/skin/features/manage_users.png',NULL,1,0),('CORE_FEATURES_MANAGEMENT','portal.admin.adminFeature.features_management.name',0,'jsp/admin/features/DispatchFeatures.jsp','portal.admin.adminFeature.features_management.description',0,'','SYSTEM','images/admin/skin/features/manage_features.png',NULL,1,0),('CORE_RBAC_MANAGEMENT','portal.rbac.adminFeature.rbac_management.name',0,'jsp/admin/rbac/ManageRoles.jsp','portal.rbac.adminFeature.rbac_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rbac.png',NULL,2,0),('CORE_DAEMONS_MANAGEMENT','portal.system.adminFeature.daemons_management.name',0,'jsp/admin/system/ManageDaemons.jsp','portal.system.adminFeature.daemons_management.description',0,'','SYSTEM',NULL,NULL,2,0),('CORE_WORKGROUPS_MANAGEMENT','portal.workgroup.adminFeature.workgroups_management.name',2,'jsp/admin/workgroup/ManageWorkgroups.jsp','portal.workgroup.adminFeature.workgroups_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_workgroups.png',NULL,3,0),('CORE_ROLES_MANAGEMENT','portal.role.adminFeature.roles_management.name',2,'jsp/admin/role/ManagePageRole.jsp','portal.role.adminFeature.roles_management.description',0,'','USERS','images/admin/skin/features/manage_roles.png',NULL,0,0),('CORE_MAILINGLISTS_MANAGEMENT','portal.mailinglist.adminFeature.mailinglists_management.name',2,'jsp/admin/mailinglist/ManageMailingLists.jsp','portal.mailinglist.adminFeature.mailinglists_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_mailinglists.png',NULL,4,0),('CORE_LEVEL_RIGHT_MANAGEMENT','portal.users.adminFeature.level_right_management.name',2,'jsp/admin/features/ManageLevels.jsp','portal.users.adminFeature.level_right_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_LINK_SERVICE_MANAGEMENT','portal.insert.adminFeature.linkService_management.name',2,NULL,'portal.insert.adminFeature.linkService_management.description',0,NULL,NULL,NULL,NULL,1,0),('CORE_RIGHT_MANAGEMENT','portal.users.adminFeature.right_management.name',0,'jsp/admin/features/ManageRights.jsp','portal.users.adminFeature.right_management.description',0,NULL,'MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_ADMINDASHBOARD_MANAGEMENT','portal.admindashboard.adminFeature.right_management.name',0,'jsp/admin/admindashboard/ManageAdminDashboards.jsp','portal.admindashboard.adminFeature.right_management.description',0,'','SYSTEM','images/admin/skin/features/manage_admindashboards.png',NULL,3,0),('CORE_DASHBOARD_MANAGEMENT','portal.dashboard.adminFeature.dashboard_management.name',0,'jsp/admin/dashboard/ManageDashboards.jsp','portal.dashboard.adminFeature.dashboard_management.description',0,'','SYSTEM','images/admin/skin/features/manage_dashboards.png',NULL,4,0),('CORE_XSL_EXPORT_MANAGEMENT','portal.xsl.adminFeature.xsl_export_management.name',2,'jsp/admin/xsl/ManageXslExport.jsp','portal.xsl.adminFeature.xsl_export_management.description',1,'','SYSTEM',NULL,NULL,5,0),('CORE_GLOBAL_MANAGEMENT','portal.globalmanagement.adminFeature.global_management.name',2,'jsp/admin/globalmanagement/GetGlobalManagement.jsp','portal.globalmanagement.adminFeature.global_management.description',1,'','SYSTEM',NULL,NULL,5,0),('CORE_EXTERNAL_FEATURES_MANAGEMENT','portal.system.adminFeature.external_features_management.name',1,'jsp/admin/features/ManageExternalFeatures.jsp','portal.system.adminFeature.external_features_management.description',1,'','SYSTEM',NULL,NULL,6,0),('APPOINTMENT_FORM_MANAGEMENT','appointment.adminFeature.ManageAppointmentForm.name',0,'jsp/admin/plugins/appointment/ManageAppointmentForms.jsp','appointment.adminFeature.ManageAppointmentForm.description',0,'workflow-appointment','APPLICATIONS',NULL,NULL,9,0),('APPOINTMENT_CALENDAR_TEMPLATE','appointment.adminFeature.manageCalendarTemplates.name',0,'jsp/admin/plugins/appointment/ManageCalendarTemplates.jsp','appointment.adminFeature.manageCalendarTemplates.name',0,'appointment','APPLICATIONS',NULL,NULL,1,0),('APPOINTMENT_CATEGORY_MANAGEMENT','appointment.adminFeature.manageCategories.name',2,'jsp/admin/plugins/appointment/ManageAppointmentCategory.jsp','appointment.adminFeature.manageCategories.name',0,'appointment','APPLICATIONS',NULL,NULL,2,0),('MYLUTECE_MANAGEMENT','mylutece.adminFeature.mylutece_management.name',2,'jsp/admin/plugins/mylutece/attribute/ManageAttributes.jsp','mylutece.adminFeature.mylutece_management.description',0,'mylutece','USERS',NULL,NULL,NULL,0),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER','mylutece.adminFeature.mylutece_management_authentication_filter.name',3,'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp','mylutece.adminFeature.mylutece_management_authentication_filter.description',0,'mylutece','SYSTEM',NULL,NULL,16,0),('DATABASE_MANAGEMENT_USERS','module.mylutece.database.adminFeature.database_management_user.name',3,'jsp/admin/plugins/mylutece/modules/database/ManageUsers.jsp','module.mylutece.database.adminFeature.database_management_user.description',0,'mylutece-database','USERS',NULL,NULL,3,0),('DATABASE_GROUPS_MANAGEMENT','module.mylutece.database.adminFeature.groups_management.name',3,'jsp/admin/plugins/mylutece/modules/database/ManageGroups.jsp','module.mylutece.database.adminFeature.groups_management.description',0,'mylutece-database','USERS',NULL,NULL,4,0),('REGULAR_EXPRESSION_MANAGEMENT','regularexpression.adminFeature.regularexpression_management.name',0,'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp','regularexpression.adminFeature.regularexpression_management.description',0,'regularexpression','APPLICATIONS',NULL,NULL,4,0),('RESOURCE_MANAGEMENT','resource.resourceManagement.pageTitle',2,'jsp/admin/plugins/resource/ManageResources.jsp','resource.resourceManagement.description',0,'resource','APPLICATIONS',NULL,NULL,5,0),('SITELABELS_MANAGEMENT','sitelabels.adminFeature.ManageSiteLabels.name',0,'jsp/admin/plugins/sitelabels/ManageLabels.jsp','sitelabels.adminFeature.ManageSiteLabels.description',0,'sitelabels','APPLICATIONS',NULL,NULL,6,0),('SOLR_INDEX_MANAGEMENT','search.solr.adminFeature.title',1,'jsp/admin/search/solr/ManageSearchIndexation.jsp','search.solr.adminFeature.description',0,'solr','SYSTEM',NULL,'',13,0),('SOLR_CONFIGURATION_MANAGEMENT','search.solr.adminFeature.configuration.title',1,'jsp/admin/search/solr/ManageSearchConfiguration.jsp','search.solr.adminFeature.configuration.description',0,'solr','SYSTEM',NULL,'',14,0),('SOLR_FIELDS_MANAGEMENT','search.solr.adminFeature.fields.title',1,'jsp/admin/search/solr/ManageSolrFields.jsp','search.solr.adminFeature.fields.description',0,'solr','SYSTEM',NULL,'',15,0),('WORKFLOW_MANAGEMENT','workflow.adminFeature.workflow_management.name',3,'jsp/admin/plugins/workflow/ManageWorkflow.jsp','workflow.adminFeature.workflow_management.description',0,'workflow','APPLICATIONS',NULL,NULL,10,0),('APPOINTMENT_MANAGEMENT','appointment.adminFeature.ManageAppointment.name',1,'jsp/admin/plugins/appointment/ManageAppointments.jsp','appointment.adminFeature.ManageAppointment.description',0,'workflow-appointment','APPLICATIONS',NULL,NULL,8,0),('RESOURCE_MANAGE_RESOURCES','resource.resourceManagement.pageTitle',2,'jsp/admin/plugins/resource/ManageResources.jsp','resource.resourceManagement.description',0,'resource','APPLICATIONS',NULL,NULL,11,0),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION','mylutece.adminFeature.mylutece_management_external_application.name',3,'jsp/admin/plugins/mylutece/ManageExternalApplicationUser.jsp','mylutece.adminFeature.mylutece_management_external_application.description',0,'mylutece','APPLICATIONS',NULL,NULL,3,0),('SORLSERVER_ADD_FILE','solrserver.adminFeature.addfile.name',2,'jsp/admin/plugins/solrserver/ManageFileInSolr.jsp','solrserver.adminFeature.addfile.description',0,'solrserver','APPLICATIONS',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-solrserver',7,0),('MYDASHBOARD_PANEL_MANAGEMENT','mydashboard.adminFeature.ManageMydashboardPanel.name',1,'jsp/admin/plugins/mydashboard/ManageMyDashboardPanel.jsp','mydashboard.adminFeature.ManageMydashboardPanel.description',0,'mydashboard',NULL,NULL,NULL,4,0);
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
INSERT INTO `core_admin_user` VALUES (1,'admin','Admin','admin','admin@lutece.fr',0,'PBKDF2WITHHMACSHA512:40000:31d92b4a5e70c170a935f221d8716df6:74b829b76c2814d7f92885571291e8cb9a481682680555231f9db0f9dee4245cd59a0efacc0b0325d80c1e0c9d3373bff2d54b8540fba3fb99a364e142bd28a153fdb1bc1692a818e6b8649cf0700ba624802fa00e26dd23067da8e2fb42ba7d9f9807aa8dbc36e469d7a61785923eb0c767324387d37e6c9a7bf732af4611cb','fr',0,0,0,'2018-12-11 12:55:47',1565772422674,0,'2018-08-14 08:47:02','all'),(2,'lutece','Lut√®ce','lutece','lutece@lutece.fr',1,'PLAINTEXT:adminadmin','fr',1,0,0,'1979-12-31 23:00:00',NULL,0,'1979-12-31 23:00:00','all'),(3,'redac','redac','redac','redac@lutece.fr',1,'PLAINTEXT:adminadmin','fr',2,0,0,'1979-12-31 23:00:00',NULL,0,'1979-12-31 23:00:00','all'),(4,'valid','valid','valid','valid@lutece.fr',1,'PLAINTEXT:adminadmin','fr',3,0,0,'1979-12-31 23:00:00',NULL,0,'1979-12-31 23:00:00','all');
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
INSERT INTO `core_datastore` VALUES ('core.advanced_parameters.password_duration','120'),('core.advanced_parameters.default_user_level','0'),('core.advanced_parameters.default_user_notification','1'),('core.advanced_parameters.default_user_language','fr'),('core.advanced_parameters.default_user_status','0'),('core.advanced_parameters.email_pattern','^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),('core.advanced_parameters.email_pattern_verify_by',''),('core.advanced_parameters.force_change_password_reinit','false'),('core.advanced_parameters.password_minimum_length','8'),('core.advanced_parameters.password_format_upper_lower_case','false'),('core.advanced_parameters.password_format_numero','false'),('core.advanced_parameters.password_format_special_characters','false'),('core.advanced_parameters.password_history_size',''),('core.advanced_parameters.maximum_number_password_change',''),('core.advanced_parameters.tsw_size_password_change',''),('core.advanced_parameters.use_advanced_security_parameters',''),('core.advanced_parameters.account_life_time','12'),('core.advanced_parameters.time_before_alert_account','30'),('core.advanced_parameters.nb_alert_account','2'),('core.advanced_parameters.time_between_alerts_account','10'),('core.advanced_parameters.access_failures_max','3'),('core.advanced_parameters.access_failures_interval','10'),('core.advanced_parameters.expired_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.expired_alert_mail_subject','Votre compte a expir√©'),('core.advanced_parameters.first_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.first_alert_mail_subject','Votre compte va bient√¥t expirer'),('core.advanced_parameters.other_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.other_alert_mail_subject','Votre compte va bient√¥t expirer'),('core.advanced_parameters.account_reactivated_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.account_reactivated_mail_subject','Votre compte a bien √©t√© r√©activ√©'),('core.advanced_parameters.access_failures_captcha','1'),('core.advanced_parameters.notify_user_password_expired',''),('core.advanced_parameters.password_expired_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.password_expired_mail_subject','Votre mot de passe a expir√©'),('core.advanced_parameters.reset_token_validity','60'),('core.advanced_parameters.lock_reset_token_to_session','false'),('core.backOffice.defaultEditor','tinymce'),('core.frontOffice.defaultEditor','markitupbbcode'),('core_banned_domain_names','yopmail.com'),('portal.site.site_property.name','LUTECE'),('portal.site.site_property.meta.author','<author>'),('portal.site.site_property.meta.copyright','<copyright>'),('portal.site.site_property.meta.description','<description>'),('portal.site.site_property.meta.keywords','<keywords>'),('portal.site.site_property.email','<webmaster email>'),('portal.site.site_property.noreply_email','no-reply@mydomain.com'),('portal.site.site_property.home_url','jsp/site/Portal.jsp'),('portal.site.site_property.admin_home_url','jsp/admin/AdminMenu.jsp'),('portal.site.site_property.popup_credits.textblock','&lt;credits text&gt;'),('portal.site.site_property.popup_legal_info.copyright.textblock','&lt;copyright text&gt;'),('portal.site.site_property.popup_legal_info.privacy.textblock','&lt;privacy text&gt;'),('portal.site.site_property.logo_url','images/logo-header-icon.png'),('portal.site.site_property.menu.position','top'),('portal.site.site_property.locale.default','fr'),('portal.site.site_property.avatar_default','images/admin/skin/unknown.png'),('portal.site.site_property.back_images','\'images/admin/skin/bg_login1.jpg\' , \'images/admin/skin/bg_login2.jpg\' , \'images/admin/skin/bg_login3.jpg\' , \'images/admin/skin/bg_login4.jpg\''),('core.cache.status.appointment.appointmentFormCacheService.enabled','1'),('core.cache.status.EntryTypeServiceManagerCache.enabled','1'),('leaflet.icon.icons.default.installed','true'),('leaflet.icon.icons.red.installed','true'),('leaflet.icon.icons.yellow.installed','true'),('leaflet.icon.icons.green.installed','true'),('mylutece.security.public_url.mylutece.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece.url.createAccount.page','jsp/site/Portal.jsp?page=mylutece&action=createAccount'),('mylutece.security.public_url.mylutece.url.modifyAccount.page','jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),('mylutece.security.public_url.mylutece.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),('mylutece.security.public_url.mylutece.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece.url.doActionsAll','jsp/site/plugins/mylutece/Do*'),('mylutece-database_banned_domain_names','yopmail.com'),('mylutece.security.public_url.mylutece-database.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece-database.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece-database.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece-database.url.createAccount.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=createAccount'),('mylutece.security.public_url.mylutece-database.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostPassword'),('mylutece.security.public_url.mylutece-database.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece-database.url.reinitPassword.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=reinitPassword'),('mylutece.security.public_url.mylutece-database.url.doActionsAll','jsp/site/plugins/mylutece/modules/database/Do*'),('core.cache.status.resource.resourceCacheService.enabled','1'),('core.cache.status.resource.resourceCacheService.maxElementsInMemory','500'),('core.cache.status.PageCachingFilter.enabled','0'),('core.cache.status.LuteceUserCacheService.enabled','1'),('core.cache.status.StaticFilesCachingFilter.enabled','1'),('core.cache.status.PageCacheService.enabled','1'),('core.cache.status.MailAttachmentCacheService.overflowToDisk','true'),('core.cache.status.PortletCacheService.enabled','0'),('core.cache.status.LuteceUserCacheService.maxElementsInMemory','1000'),('core.cache.status.MailAttachmentCacheService.enabled','1'),('core.cache.status.PortalMenuService.enabled','1'),('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds','604800'),('core.cache.status.MailAttachmentCacheService.diskPersistent','true'),('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory','1000'),('core.cache.status.MyPortalWidgetContentService.enabled','1'),('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds','7200'),('core.cache.status.MailAttachmentCacheService.maxElementsInMemory','10'),('core.cache.status.pathCacheService.enabled','1'),('core.cache.status.MyPortalWidgetService.enabled','1'),('core.cache.status.LinksIncludeCacheService.enabled','1'),('core.cache.status.SiteMapService.enabled','1'),('core.cache.status.BaseUserPreferencesCacheService.enabled','1'),('core.plugins.status.core_extensions.installed','true'),('core.plugins.status.lucene.installed','true'),('core.daemon.indexer.interval','300'),('core.daemon.indexer.onStartUp','true'),('core.daemon.mailSender.interval','86400'),('core.daemon.mailSender.onStartUp','true'),('core.daemon.anonymizationDaemon.interval','86400'),('core.daemon.anonymizationDaemon.onStartUp','false'),('core.daemon.accountLifeTimeDaemon.interval','86400'),('core.daemon.accountLifeTimeDaemon.onStartUp','true'),('core.daemon.threadLauncherDaemon.interval','86400'),('core.daemon.threadLauncherDaemon.onStartUp','true'),('core.daemon.crmClientSender.interval','60'),('core.daemon.crmClientSender.onStartUp','true'),('core.daemon.AppointmentReminderDaemon.interval','600'),('core.daemon.AppointmentReminderDaemon.onStartUp','true'),('core.daemon.databaseAnonymizationDaemon.interval','86400'),('core.daemon.databaseAnonymizationDaemon.onStartUp','true'),('core.daemon.databaseAccountLifeTimeDaemon.interval','86400'),('core.daemon.databaseAccountLifeTimeDaemon.onStartUp','true'),('core.daemon.solrindexer.interval','300'),('core.daemon.solrindexer.onStartUp','false'),('core.daemon.automaticActionDaemon.interval','14400'),('core.daemon.automaticActionDaemon.onStartUp','true'),('core.startup.time','14 ao√ªt 2018 10:33:38'),('core.cache.status.DatastoreCacheService.enabled','0'),('core.plugins.status.appointment.installed','true'),('core.plugins.status.appointment.pool','portal'),('core.plugins.status.appointment-filling.installed','true'),('core.plugins.status.appointment-filling.pool','portal'),('core.plugins.status.appointment-leaflet.installed','true'),('core.plugins.status.appointment-resource.installed','true'),('core.plugins.status.appointment-resource.pool','portal'),('core.plugins.status.appointment-solr.installed','true'),('core.plugins.status.appointment-solrsearchapp.installed','true'),('core.plugins.status.asynchronous-upload.installed','true'),('core.plugins.status.asynchronous-upload.pool','portal'),('core.plugins.status.captcha.installed','true'),('core.plugins.status.crmclient.installed','true'),('core.plugins.status.crmclient.pool','portal'),('core.plugins.status.genericalert.installed','true'),('core.plugins.status.genericalert.pool','portal'),('core.plugins.status.genericattributes.installed','true'),('core.plugins.status.genericattributes.pool','portal'),('core.plugins.status.genericattributes-googlemaps.installed','true'),('core.plugins.status.html.installed','true'),('core.plugins.status.jcaptcha.installed','true'),('core.plugins.status.leaflet.installed','true'),('core.plugins.status.mylutece.installed','true'),('core.plugins.status.mylutece.pool','portal'),('core.plugins.status.mylutece-database.installed','true'),('core.plugins.status.mylutece-database.pool','portal'),('core.plugins.status.regularexpression.installed','true'),('core.plugins.status.regularexpression.pool','portal'),('core.plugins.status.resource.installed','true'),('core.plugins.status.resource.pool','portal'),('core.plugins.status.resource-adminuser.installed','true'),('core.plugins.status.resource-mylutece.installed','true'),('core.plugins.status.rest.installed','true'),('core.plugins.status.sitelabels.installed','true'),('core.plugins.status.solr.installed','true'),('core.plugins.status.solr.pool','portal'),('core.plugins.status.solrserver.installed','true'),('core.plugins.status.workflow.installed','true'),('core.plugins.status.workflow.pool','portal'),('core.plugins.status.workflow-appointment.installed','true'),('core.plugins.status.workflow-appointment.pool','portal'),('core.cache.status.XMLTransformerCacheService(XSLT).enabled','1'),('core.cache.status.asynchronousupload.asynchronousUploadCacheService.enabled','0'),('core.crypto.key','d6d84cceb8a7a3b924dbe3ac326a1fc01ca2ba6fc5233f98aeb19f7ef7e67adf');
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
INSERT INTO `core_mail_item` VALUES (1,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt=<p>Dear Yvan Michel,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-14 11:30 has been registered (reference number:<strong> 14e7c8</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=14e7c8\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-14'),(2,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0ppptπ<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-14 11:30.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n			<div class=\"control-group\">\r\n			<label class=\"control-label\">Place of birth</label>\r\n			<div class=\"controls\">\r\n				paris\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Date of birth</label>\r\n			<div class=\"controls\">\r\n				08/01/2018\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">First name</label>\r\n			<div class=\"controls\">\r\n				hgd\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Last name</label>\r\n			<div class=\"controls\">\r\n				hgf\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s first name</label>\r\n			<div class=\"controls\">\r\n				hgh\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s last name</label>\r\n			<div class=\"controls\">\r\n				hgh\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s address</label>\r\n			<div class=\"controls\">\r\n				hgh\r\n			</div>\r\n		</div>\r\n</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=1&id_admin_user=1&timestamp=1534237524435&key=a24ecb561794d1baae1f4ea5c43fe498e44ed4ae7735f5bda6698dca2f9df7af\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=1&id_admin_user=1&timestamp=1534237524435&key=aa2fab03e35d62ce1711495e87070a614072aafbfcc38b157953301c52cb7f4e\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-14 at 11:30'),(3,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt8<p>Dear nb nbv,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-14 12:00 has been registered (reference number:<strong> 26f9b3</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=26f9b3\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-14'),(4,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt¢<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-14 12:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n			<div class=\"control-group\">\r\n			<label class=\"control-label\">Place of birth</label>\r\n			<div class=\"controls\">\r\n				paris\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Date of birth</label>\r\n			<div class=\"controls\">\r\n				08/01/2018\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s first name</label>\r\n			<div class=\"controls\">\r\n				nbv\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s last name</label>\r\n			<div class=\"controls\">\r\n				nbv\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s address</label>\r\n			<div class=\"controls\">\r\n				nbv\r\n			</div>\r\n		</div>\r\n</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=2&id_admin_user=1&timestamp=1534237962335&key=24b030f1de0e0c2b873f8020665a753fc56d3cffa88445acc62df3d91886d0cc\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=2&id_admin_user=1&timestamp=1534237962335&key=fde4f9772bf055e38da5b1aa2a5be71329d4c3d7f1d58660c55c6592bf90180e\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-14 at 12:00'),(5,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt><p>Dear hgfdhf hgdhg,</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on 2018-08-14 13:00 has been registered (reference number:<strong> 3a632b</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/Portal.jsp?page=appointment&view=getViewCancelAppointment&refAppointment=3a632b\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0yvan.michel@paris.frt\0no-reply@mydomain.comt\0The Lutece teamt\0(Your scheduled appointment on 2018-08-14'),(6,'¨Ì\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0ppptΩ<p>Hello,</p>\r\n<p>A new appointment has been scheduled on 2018-08-14 13:00.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p><div>\r\n			<div class=\"control-group\">\r\n			<label class=\"control-label\">Place of birth</label>\r\n			<div class=\"controls\">\r\n				paris\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Date of birth</label>\r\n			<div class=\"controls\">\r\n				08/01/2018\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">First name</label>\r\n			<div class=\"controls\">\r\n				jhfj\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Last name</label>\r\n			<div class=\"controls\">\r\n				jh\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s first name</label>\r\n			<div class=\"controls\">\r\n				hgfhfg\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s last name</label>\r\n			<div class=\"controls\">\r\n				jhgh\r\n			</div>\r\n		</div>\r\n		<div class=\"control-group\">\r\n			<label class=\"control-label\">Mother\'s address</label>\r\n			<div class=\"controls\">\r\n				jhg\r\n			</div>\r\n		</div>\r\n</div></p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=101&id_resource=3&id_admin_user=1&timestamp=1534238213946&key=8c90102fe1d8a547f7efea526cd86ccfa674bcbbfa5132a7fb0d6708a2bb0356\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"http://dstipc0a1dq1.stations.paris.mdp:8080/appt-docker/jsp/site/plugins/workflow/modules/appointment/DoExecuteWorkflowAction.jsp?id_action=105&id_resource=3&id_admin_user=1&timestamp=1534238213946&key=7bf0c6cd3eb14808ca70f0a5c84529c308804fc389e3d5035bb0a2f190533548\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>ppt\0admin@lutece.frt\0no-reply@mydomain.comt\0The Lutece teamt\0/Your appointment request on 2018-08-14 at 13:00');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_queue`
--

LOCK TABLES `core_mail_queue` WRITE;
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
INSERT INTO `core_mail_queue` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0);
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
INSERT INTO `core_page` VALUES (1,0,'Home','Home Page','2014-06-08 15:20:44',1,1,4,'2003-09-08 22:38:01','none','default',0,'','application/octet-stream',NULL,NULL,1,0,0),(2,1,'Page 1','A child page','2014-06-08 16:23:42',0,1,2,'2014-06-08 16:23:42','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0);
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
INSERT INTO `core_portlet` VALUES (5,'APPOINTMENT_FORM_LIST_PORTLET',1,'Appointment list','2018-08-13 16:47:44',0,1,1,0,0,'2018-08-13 16:47:44',0,'none',4369),(3,'HTML_PORTLET',1,'Back Office quick access','2014-06-08 15:49:37',0,1,3,100,0,'2009-05-15 02:38:08',0,'none',273),(4,'HTML_PORTLET',2,'Page 1','2014-06-08 16:28:50',0,1,1,100,0,'2014-06-08 16:27:59',0,'none',273);
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
INSERT INTO `core_user_password_history` VALUES (1,'PBKDF2WITHHMACSHA512:40000:31d92b4a5e70c170a935f221d8716df6:74b829b76c2814d7f92885571291e8cb9a481682680555231f9db0f9dee4245cd59a0efacc0b0325d80c1e0c9d3373bff2d54b8540fba3fb99a364e142bd28a153fdb1bc1692a818e6b8649cf0700ba624802fa00e26dd23067da8e2fb42ba7d9f9807aa8dbc36e469d7a61785923eb0c767324387d37e6c9a7bf732af4611cb','2018-08-13 12:55:47');
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
INSERT INTO `core_user_right` VALUES ('APPOINTMENT_CALENDAR_TEMPLATE',1),('APPOINTMENT_CATEGORY_MANAGEMENT',1),('APPOINTMENT_FORM_MANAGEMENT',1),('APPOINTMENT_MANAGEMENT',1),('CORE_ADMIN_SITE',1),('CORE_ADMIN_SITE',2),('CORE_ADMINDASHBOARD_MANAGEMENT',1),('CORE_CACHE_MANAGEMENT',1),('CORE_DAEMONS_MANAGEMENT',1),('CORE_DASHBOARD_MANAGEMENT',1),('CORE_EXTERNAL_FEATURES_MANAGEMENT',1),('CORE_EXTERNAL_FEATURES_MANAGEMENT',2),('CORE_FEATURES_MANAGEMENT',1),('CORE_GLOBAL_MANAGEMENT',1),('CORE_LEVEL_RIGHT_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',2),('CORE_LOGS_VISUALISATION',1),('CORE_MAILINGLISTS_MANAGEMENT',1),('CORE_MODES_MANAGEMENT',1),('CORE_PAGE_TEMPLATE_MANAGEMENT',1),('CORE_PAGE_TEMPLATE_MANAGEMENT',2),('CORE_PLUGINS_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',2),('CORE_RBAC_MANAGEMENT',1),('CORE_RIGHT_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',2),('CORE_SEARCH_INDEXATION',1),('CORE_SEARCH_INDEXATION',2),('CORE_SEARCH_MANAGEMENT',1),('CORE_SEARCH_MANAGEMENT',2),('CORE_STYLES_MANAGEMENT',1),('CORE_STYLESHEET_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',2),('CORE_WORKGROUPS_MANAGEMENT',1),('CORE_WORKGROUPS_MANAGEMENT',2),('CORE_XSL_EXPORT_MANAGEMENT',1),('DATABASE_GROUPS_MANAGEMENT',1),('DATABASE_MANAGEMENT_USERS',1),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER',1),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION',1),('MYLUTECE_MANAGEMENT',1),('REGULAR_EXPRESSION_MANAGEMENT',1),('RESOURCE_MANAGE_RESOURCES',1),('RESOURCE_MANAGEMENT',1),('SITELABELS_MANAGEMENT',1),('SOLR_CONFIGURATION_MANAGEMENT',1),('SOLR_FIELDS_MANAGEMENT',1),('SOLR_INDEX_MANAGEMENT',1),('SORLSERVER_ADD_FILE',1),('WORKFLOW_MANAGEMENT',1);
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
INSERT INTO `core_user_role` VALUES ('all_site_manager',1),('all_site_manager',2),('appointment_manager',1),('assign_groups',1),('assign_groups',2),('assign_groups',3),('assign_roles',1),('assign_roles',2),('assign_roles',3),('mylutece_database_manager',1),('mylutece_manager',1),('super_admin',1),('super_admin',2),('workflow_manager',1),('workflow_manager',2);
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
INSERT INTO `genatt_entry` VALUES (1,1,'APPOINTMENT_FORM',106,4,'Place of birth',NULL,'Enter the place the baby was born.','',1,0,7,NULL,0,NULL,0,'','',0,'',0,0,0,0),(2,1,'APPOINTMENT_FORM',104,4,'Date of birth',NULL,'The baby\'s date of birth.','',1,0,8,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(3,1,'APPOINTMENT_FORM',106,4,'First name',NULL,'The baby\'s first name','',0,0,9,NULL,0,NULL,0,'','',0,'',0,0,0,0),(4,1,'APPOINTMENT_FORM',109,NULL,'The baby',NULL,NULL,NULL,0,0,6,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(5,1,'APPOINTMENT_FORM',106,4,'Last name',NULL,'The baby\'s last name','',0,0,10,NULL,0,NULL,0,'','',0,'',0,0,0,0),(6,1,'APPOINTMENT_FORM',109,NULL,'The parents',NULL,NULL,NULL,0,0,1,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(7,1,'APPOINTMENT_FORM',106,6,'Mother\'s first name',NULL,'','',0,0,2,NULL,0,NULL,0,'','',0,'',0,0,0,0),(8,1,'APPOINTMENT_FORM',106,6,'Mother\'s last name',NULL,'','',0,0,3,NULL,0,NULL,0,'','',0,'',0,0,0,0),(9,1,'APPOINTMENT_FORM',106,6,'Mother\'s address',NULL,'','',0,0,4,NULL,0,NULL,0,'','',0,'',0,0,0,0),(10,1,'APPOINTMENT_FORM',115,6,'Mother\'s passport',NULL,'Please upload your passport as a JPEG file.','',0,0,5,NULL,0,NULL,0,'','',0,NULL,0,0,0,0),(11,2,'APPOINTMENT_FORM',109,NULL,'The parents',NULL,NULL,NULL,0,0,1,NULL,0,NULL,0,'','',0,NULL,0,0,0,0);
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
INSERT INTO `genatt_field` VALUES (1,1,NULL,NULL,'',0,50,0,-1,1,NULL,0,NULL,NULL,NULL),(2,2,NULL,NULL,NULL,0,0,0,0,2,NULL,0,NULL,NULL,NULL),(3,3,NULL,NULL,'',0,50,0,-1,3,NULL,0,NULL,NULL,NULL),(4,5,NULL,NULL,'',0,50,0,-1,4,NULL,0,NULL,NULL,NULL),(5,7,NULL,NULL,'',0,50,0,-1,5,NULL,0,NULL,NULL,NULL),(6,8,NULL,NULL,'',0,50,0,-1,6,NULL,0,NULL,NULL,NULL),(7,9,NULL,NULL,'',0,50,0,-1,7,NULL,0,NULL,NULL,NULL),(8,10,NULL,NULL,NULL,0,255,0,0,8,NULL,0,NULL,NULL,NULL),(9,10,'max_files',NULL,'1',0,0,0,0,9,NULL,0,NULL,NULL,NULL),(10,10,'file_max_size',NULL,'10000',0,0,0,0,10,NULL,0,NULL,NULL,NULL),(11,10,'export_binary',NULL,'false',0,0,0,0,11,NULL,0,NULL,NULL,NULL);
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
INSERT INTO `genatt_response` VALUES (1,'paris',1,NULL,NULL,1),(2,'08/01/2018',2,NULL,NULL,1),(3,'hgd',3,NULL,NULL,1),(4,'hgf',5,NULL,NULL,1),(5,'hgh',7,NULL,NULL,1),(6,'hgh',8,NULL,NULL,1),(7,'hgh',9,NULL,NULL,1),(8,'paris',1,NULL,NULL,1),(9,'08/01/2018',2,NULL,NULL,1),(10,'',3,NULL,NULL,1),(11,'',5,NULL,NULL,1),(12,'nbv',7,NULL,NULL,1),(13,'nbv',8,NULL,NULL,1),(14,'nbv',9,NULL,NULL,1),(15,'paris',1,NULL,NULL,1),(16,'08/01/2018',2,NULL,NULL,1),(17,'jhfj',3,NULL,NULL,1),(18,'jh',5,NULL,NULL,1),(19,'hgfhfg',7,NULL,NULL,1),(20,'jhgh',8,NULL,NULL,1),(21,'jhg',9,NULL,NULL,1);
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
INSERT INTO `genatt_verify_by` VALUES (8,1);
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
INSERT INTO `html_portlet` VALUES (3,'<form action=\"jsp/admin/DoAdminLogin.jsp\" method=\"post\">\n  <div class=\"well\">\n  <p>\n    <strong>Choose your profile :</strong>\n  </p>\n  <div>\n  <input id=\"access_code_admin\" title=\"administrateur\"\n  checked=\"checked\" name=\"access_code\" type=\"radio\"\n  value=\"admin\" /> &#160; Administrator</div>\n  <div>\n  <input id=\"access_code_webmaster\" title=\"webmaster\"\n  name=\"access_code\" type=\"radio\" value=\"lutece\" /> &#160;\n  Webmaster - Content manager</div>\n  <div>\n  <input id=\"access_code_redac\" title=\"redacteur\"\n  name=\"access_code\" type=\"radio\" value=\"redac\" /> &#160; Writer -\n  Content producer</div>\n  <div>\n    <input name=\"password\" type=\"hidden\" value=\"adminadmin\" />\n  </div>\n  <br /> \n  <button class=\"btn btn-primary\" type=\"submit\">&#160;\n  Enter</button></div>\n</form>\n'),(4,'<h2>Here is a child page sample.</h2>\n<p>&#160;</p>\n<p>This page is divided into 2 columns.</p>\n<p>In each column you can publish several and different portlets :\nHTML, documents, ...</p>\n<p>This page can also have childs.</p>\n<p>&#160;</p>\n<p>&#160;</p>\n');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_history`
--

LOCK TABLES `workflow_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
INSERT INTO `workflow_resource_history` VALUES (1,1,'appointment',101,104,'2018-08-14 09:05:24','auto'),(2,2,'appointment',101,104,'2018-08-14 09:12:42','auto'),(3,3,'appointment',101,104,'2018-08-14 09:16:53','auto');
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
INSERT INTO `workflow_resource_workflow` VALUES (1,'appointment',101,101,1,0),(2,'appointment',101,101,1,0),(3,'appointment',101,101,1,0);
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
INSERT INTO `workflow_task_change_appointment_status_cf` VALUES (106,10),(107,-10),(109,-10),(111,-10),(115,-10),(147,10),(152,-10),(156,-10),(159,-10),(162,-10);
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
INSERT INTO `workflow_task_notify_admin_appointment_cf` VALUES (104,1,'The Lutece team','no-reply@mydomain.com','Your appointment request on ${date_appointment} at ${time_appointment}','<p>Hello,</p>\r\n<p>A new appointment has been scheduled on ${date_appointment} ${time_appointment}.</p>\r\n<p>The information submitted by the user is the following:</p>\r\n<p>${recap}</p>\r\n<p>Please validate or cancel this appointment request:</p>\r\n<p><a title=\"Confirm appointment\" href=\"${url_validate}\">Confirm appointment</a></p>\r\n<p><a title=\"Cancel appointment\" href=\"${url_cancel}\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',105,101,0,0,'Salle 216'),(116,1,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation d\'un rendez-vous par l\'utilisateur','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>${firstName} ${lastName} a annul&eacute; le rendez-vous du ${date_appointment} &agrave; ${time_appointment}.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(118,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation du rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>je rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,'Salle 216'),(120,1,'The Lutece Team','no-reply@mydomain.com','Appointment request on ${date_appointment} ${time_appointment}','<p>Hello,</p>\r\n<p>Your appointment request on ${date_appointment} ${time_appointment} has been approved. Please make sure to be available for that date, or cancel the appointment in case you\'re unavailable.</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',102,0,1,1,''),(122,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du&nbsp;${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute; par le gestionnaire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(123,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} a √©t√© r√©attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; r&eacute;attribu&eacute; &agrave; un autre agent.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,0,1,0,''),(124,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} vous a √©t√© attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} vous a &eacute;t&eacute; attribu&eacute;. Merci de vous rendre disponible pour cet horraire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',102,0,1,1,'salle 216'),(149,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Une demande de rendez-vous vous a √©t√© attribu√©e pour le ${date_appointment} √† ${time_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>Le rendez-vous du ${date_appointment} &agrave; ${time_appointment} vous a &eacute;t&eacute; attribu&eacute;. Merci de vous rendez disponible pour cet horraire, ou d\'annuler le rendez-vous en cas d\'impossibilit&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',102,0,1,1,''),(153,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation du rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>je rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(161,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du&nbsp;${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute; par le gestionnaire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(163,1,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation d\'un rendez-vous par l\'utilisateur','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>${firstName} ${lastName} a annul&eacute; le rendez-vous du ${date_appointment} &agrave; ${time_appointment}.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',0,0,1,0,''),(165,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} a √©t√© r√©attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; r&eacute;attribu&eacute; &agrave; un autre agent.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,0,1,0,''),(167,0,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Le rendez-vous du ${date_appointment} √† ${time_appointment} vous a √©t√© attribu√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>le rendez-vous du ${date_appointment} &agrave; ${time_appointment} vous a &eacute;t&eacute; attribu&eacute;. Merci de vous rendre disponible pour cet horraire.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',102,0,1,1,'');
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
INSERT INTO `workflow_task_notify_appointment_cf` VALUES (101,'The Lutece Team','no-reply@mydomain.com','Your appointment on ${date_appointment} has been confirmed','<p>Dear ${firstName} ${lastName},</p>\r\n<p>Your appointment request on ${date_appointment} ${time_appointment} (reference number <strong>${reference}</strong>) has been validated.</p>\r\n<p>If you wish to cancel your appointment, you can do so by clicking on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"${url_cancel}\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',106,1,1,'',0),(103,'The Lutece team','no-reply@mydomain.com','Your scheduled appointment on ${date_appointment}','<p>Dear ${firstName} ${lastName},</p>\r\n<p>&nbsp;</p>\r\n<p>Your appointment request on ${date_appointment} ${time_appointment} has been registered (reference number:<strong> ${reference}</strong>) and will be validated by our services as soon as possible.</p>\r\n<p>If you wish to cancel your appointment, please click on the following link:</p>\r\n<p><a title=\"Cancel appointment\" href=\"${url_cancel}\">Cancel appointment</a></p>\r\n<p>&nbsp;</p>\r\n<p>Best regards,</p>\r\n<p>The Lutece Team</p>','','',103,0,0,'',0),(112,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>En raison de l\'indisponibilit&eacute; de nos agents, votre rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Veuillez nous excuser pour la g&egrave;ne ocasion&eacute;e.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,1,0,'',0),(110,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>A votre demande, votre rendez-vous a bien &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,1,0,'',0),(121,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Votre rendez-vous du ${date_appointment} a bien √©t√© annul√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>A votre demande, votre rendez-vous du ${date_appointment} &agrave; ${time_appointment} avec nos services a bien &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,1,0,'',0),(148,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Votre rendez-vous du ${date_appointment} a √©t√© valid√©','<p>Bonjour ${firstName} ${lastName},</p>\r\n<p>&nbsp;</p>\r\n<p>votre demande de rendez-vous du ${date_appointment} &agrave; ${time_appointment} avec la reference <strong>${reference}</strong> a &eacute;t&eacute; valid&eacute;.</p>\r\n<p>En cas d\'indisponibilit&eacute;, vous pouvez annuler le rendez-vous en suivante le lien suivant :</p>\r\n<p><a title=\"Annuler le rendez-vous\" href=\"${url_cancel}\">Annuler le rendez-vous</a></p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>l\'&eacute;quipe Lut&egrave;ce.</p>','','',106,1,1,'',0),(157,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>A votre demande, votre rendez-vous a bien &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,1,0,'',0),(160,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Annulation de votre rendez-vous du ${date_appointment}','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>En raison de l\'indisponibilit&eacute; de nos agents, votre rendez-vous du ${date_appointment} &agrave; ${time_appointment} a &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Veuillez nous excuser pour la g&egrave;ne ocasion&eacute;e.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce</p>','','',0,1,0,'',0),(164,'L\'√©quipe Lut√®ce','no-reply@mydomain.com','Votre rendez-vous du ${date_appointment} a bien √©t√© annul√©','<p>Bonjour,</p>\r\n<p>&nbsp;</p>\r\n<p>A votre demande, votre rendez-vous du ${date_appointment} &agrave; ${time_appointment} avec nos services a bien &eacute;t&eacute; annul&eacute;.</p>\r\n<p>&nbsp;</p>\r\n<p>Cordialement,</p>\r\n<p>&nbsp;</p>\r\n<p>L\'&eacute;quipe Lut&egrave;ce.</p>','','',0,1,0,'',0);
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

-- Dump completed on 2018-08-14 11:22:38
