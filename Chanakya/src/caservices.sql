-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.51b-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for caservices
CREATE DATABASE IF NOT EXISTS `caservices` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `caservices`;


-- Dumping structure for table caservices.appointment
CREATE TABLE IF NOT EXISTS `appointment` (
  `APPOINTMENT_ID` varchar(255) NOT NULL,
  `APPOINTMENT_DATE` varchar(255) default NULL,
  `ENTITY_ID` varchar(255) default NULL,
  `ENTITY_TYPE` varchar(255) default NULL,
  `VISITOR_NAME` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `MOBILE_NUMBER` varchar(255) default NULL,
  `REASON` varchar(255) default NULL,
  `START_TIME` varchar(255) default NULL,
  `END_TIME` varchar(255) default NULL,
  `STATUS` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`APPOINTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.appointment: ~0 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;


-- Dumping structure for table caservices.c3p0-test-table
CREATE TABLE IF NOT EXISTS `c3p0-test-table` (
  `a` char(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.c3p0-test-table: ~0 rows (approximately)
/*!40000 ALTER TABLE `c3p0-test-table` DISABLE KEYS */;
/*!40000 ALTER TABLE `c3p0-test-table` ENABLE KEYS */;


-- Dumping structure for table caservices.ca_address
CREATE TABLE IF NOT EXISTS `ca_address` (
  `CA_ADDRESS_ID` varchar(255) NOT NULL,
  `CA_ID` varchar(255) default NULL,
  `HOUSE_NO` varchar(255) default NULL,
  `AREA` varchar(255) default NULL,
  `STREET_DETAIL` varchar(255) default NULL,
  `LANDMARK` varchar(255) default NULL,
  `PINCODE` varchar(255) default NULL,
  `CITY` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `COUNTRY` varchar(255) default NULL,
  `LATITUDE` varchar(255) default NULL,
  `LONGITUDE` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`CA_ADDRESS_ID`),
  KEY `FK78B98F32968E31A` (`CA_ID`),
  CONSTRAINT `FK78B98F32968E31A` FOREIGN KEY (`CA_ID`) REFERENCES `ca_info` (`CA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.ca_address: ~1 rows (approximately)
/*!40000 ALTER TABLE `ca_address` DISABLE KEYS */;
INSERT INTO `ca_address` (`CA_ADDRESS_ID`, `CA_ID`, `HOUSE_NO`, `AREA`, `STREET_DETAIL`, `LANDMARK`, `PINCODE`, `CITY`, `STATE`, `COUNTRY`, `LATITUDE`, `LONGITUDE`, `CREATED_BY`, `MODIFIED_BY`, `CREATED_TS`, `MODIFIED_TS`) VALUES
	('4028abdd506a340601506a36848e0002', '4028abdd506a340601506a3684140001', '12', 'Marathahalli', '6th Cross', 'Marathahalli Bridge', '560037', 'Bangalore', 'Karnataka', 'India', NULL, NULL, NULL, 'er.mohdwasi@gmail.com', '2015-10-15 12:06:08', '2015-10-15 12:06:08');
/*!40000 ALTER TABLE `ca_address` ENABLE KEYS */;


-- Dumping structure for table caservices.ca_company
CREATE TABLE IF NOT EXISTS `ca_company` (
  `CA_ID` varchar(255) NOT NULL,
  `COMPANY_ID` varchar(255) NOT NULL,
  PRIMARY KEY  (`CA_ID`,`COMPANY_ID`),
  KEY `FK849B397C3C999288` (`COMPANY_ID`),
  KEY `FK849B397C2968E31A` (`CA_ID`),
  CONSTRAINT `FK849B397C2968E31A` FOREIGN KEY (`CA_ID`) REFERENCES `ca_info` (`CA_ID`),
  CONSTRAINT `FK849B397C3C999288` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.ca_company: ~0 rows (approximately)
/*!40000 ALTER TABLE `ca_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_company` ENABLE KEYS */;


-- Dumping structure for table caservices.ca_expertise
CREATE TABLE IF NOT EXISTS `ca_expertise` (
  `EXPERTISE_ID` varchar(255) NOT NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `EXPERTISE_NAME` varchar(255) default NULL,
  `STATUS` smallint(6) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`EXPERTISE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.ca_expertise: ~0 rows (approximately)
/*!40000 ALTER TABLE `ca_expertise` DISABLE KEYS */;
/*!40000 ALTER TABLE `ca_expertise` ENABLE KEYS */;


-- Dumping structure for table caservices.ca_info
CREATE TABLE IF NOT EXISTS `ca_info` (
  `CA_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `MOBILE` varchar(255) default NULL,
  `PHONE` varchar(255) default NULL,
  `SERVICE_NUMBER` varchar(255) default NULL,
  `DATE_OF_BIRTH` varchar(255) default NULL,
  `GENDER` varchar(255) default NULL,
  `PROFILE_PIC_PATH` varchar(255) default NULL,
  `TYPE` varchar(255) default NULL,
  `REFFERED_BY` varchar(255) default NULL,
  `STATUS` varchar(50) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`CA_ID`),
  UNIQUE KEY `EMAIL_ID` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.ca_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `ca_info` DISABLE KEYS */;
INSERT INTO `ca_info` (`CA_ID`, `NAME`, `EMAIL_ID`, `MOBILE`, `PHONE`, `SERVICE_NUMBER`, `DATE_OF_BIRTH`, `GENDER`, `PROFILE_PIC_PATH`, `TYPE`, `REFFERED_BY`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('4028abdd506a340601506a3684140001', 'Mohd Wasi', 'er.mohdwasi@gmail.com', '7878798765', NULL, 'c7d950b7a82c3b51c7dbf4d6834d69e1', '03-Oct-1997', 'NA', 'caImage?Desert.jpg', 'ROLE_CA_FIRM', 'Wasi', 'Verified', NULL, '2015-10-15 12:06:08', 'er.mohdwasi@gmail.com', '2015-10-15 12:06:08');
/*!40000 ALTER TABLE `ca_info` ENABLE KEYS */;


-- Dumping structure for table caservices.company
CREATE TABLE IF NOT EXISTS `company` (
  `COMPANY_ID` varchar(255) NOT NULL,
  `NAME` varchar(50) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `COMPANY_TYPE` varchar(20) default NULL,
  `STATUS` varchar(20) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `CREATED_TS` timestamp NULL default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `MODIFIED_TS` timestamp NULL default NULL,
  PRIMARY KEY  (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.company: ~0 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


-- Dumping structure for table caservices.cws_address
CREATE TABLE IF NOT EXISTS `cws_address` (
  `CWS_ADDRESS_ID` varchar(255) NOT NULL,
  `AREA` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `CITY` varchar(255) default NULL,
  `COUNTRY` varchar(255) default NULL,
  `HOUSE_NO` varchar(255) default NULL,
  `LANDMARK` varchar(255) default NULL,
  `LATITUDE` varchar(255) default NULL,
  `LONGITUDE` varchar(255) default NULL,
  `PINCODE` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `STREET_DETAIL` varchar(255) default NULL,
  `CWS_ID` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`CWS_ADDRESS_ID`),
  KEY `FK81F305F42CBC3C96` (`CWS_ID`),
  CONSTRAINT `FK81F305F42CBC3C96` FOREIGN KEY (`CWS_ID`) REFERENCES `cws_info` (`CWS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.cws_address: ~0 rows (approximately)
/*!40000 ALTER TABLE `cws_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `cws_address` ENABLE KEYS */;


-- Dumping structure for table caservices.cws_info
CREATE TABLE IF NOT EXISTS `cws_info` (
  `CWS_ID` varchar(255) NOT NULL,
  `DATE_OF_COMMENCEMENT` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `MOBILE` varchar(255) default NULL,
  `NAME` varchar(255) default NULL,
  `PHONE` varchar(255) default NULL,
  `PROFILE_PIC_PATH` varchar(255) default NULL,
  `REFFERED_BY` varchar(255) default NULL,
  `STATUS` smallint(6) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`CWS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.cws_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `cws_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `cws_info` ENABLE KEYS */;


-- Dumping structure for table caservices.daily_meeting_slot
CREATE TABLE IF NOT EXISTS `daily_meeting_slot` (
  `DAILY_MEETING_SLOT_ID` bigint(20) NOT NULL auto_increment,
  `MASTER_MEETING_SLOT_ID` bigint(20) NOT NULL,
  `ENTITY_ID` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `SERVICE_DATE` date NOT NULL,
  `START_TIME` time NOT NULL,
  `END_TIME` time NOT NULL,
  `STATUS` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`DAILY_MEETING_SLOT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.daily_meeting_slot: ~40 rows (approximately)
/*!40000 ALTER TABLE `daily_meeting_slot` DISABLE KEYS */;
INSERT INTO `daily_meeting_slot` (`DAILY_MEETING_SLOT_ID`, `MASTER_MEETING_SLOT_ID`, `ENTITY_ID`, `ENTITY_TYPE`, `SERVICE_DATE`, `START_TIME`, `END_TIME`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	(1, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-01', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(2, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-02', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(3, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-03', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(4, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-04', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(5, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-05', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(6, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-06', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(7, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-07', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(8, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-08', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(9, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-09', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(10, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-10', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(11, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-11', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(12, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-12', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(13, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-13', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(14, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-14', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(15, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-15', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(16, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-16', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(17, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-17', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(18, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-18', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(19, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-19', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(20, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-20', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(21, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-21', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(22, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-22', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(23, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-23', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(24, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-24', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(25, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-25', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(26, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-26', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(27, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-27', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(28, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-28', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(29, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-29', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(30, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-30', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(31, 1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-31', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:16'),
	(32, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-08', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:01', 'asad@gmail.com', '2015-10-16 16:09:01'),
	(33, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-09', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:01', 'asad@gmail.com', '2015-10-16 16:09:01'),
	(34, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-10', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02'),
	(35, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-11', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02'),
	(36, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-12', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02'),
	(37, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-13', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02'),
	(38, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-14', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02'),
	(39, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-15', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02'),
	(40, 2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-16', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:02', 'asad@gmail.com', '2015-10-16 16:09:02');
/*!40000 ALTER TABLE `daily_meeting_slot` ENABLE KEYS */;


-- Dumping structure for table caservices.document
CREATE TABLE IF NOT EXISTS `document` (
  `DOCUMENT_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) default NULL,
  `STRUCTURE` varchar(255) default NULL,
  `YEAR` int(11) default NULL,
  `ENTITY_ID` varchar(255) default NULL,
  `ENTITY_TYPE` varchar(50) default NULL,
  `FILING_PURPOSE` varchar(50) default NULL,
  `FILE_TYPE` varchar(500) default NULL,
  `FILE_EXTENSION` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`DOCUMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.document: ~0 rows (approximately)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


-- Dumping structure for table caservices.expertise_ca
CREATE TABLE IF NOT EXISTS `expertise_ca` (
  `CA_ID` varchar(255) NOT NULL,
  `EXPERTISE_ID` varchar(255) NOT NULL,
  PRIMARY KEY  (`CA_ID`,`EXPERTISE_ID`),
  KEY `FKB1D4496C2968E31A` (`CA_ID`),
  KEY `FKB1D4496C5BED304A` (`EXPERTISE_ID`),
  CONSTRAINT `FKB1D4496C2968E31A` FOREIGN KEY (`CA_ID`) REFERENCES `ca_info` (`CA_ID`),
  CONSTRAINT `FKB1D4496C5BED304A` FOREIGN KEY (`EXPERTISE_ID`) REFERENCES `ca_expertise` (`EXPERTISE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.expertise_ca: ~0 rows (approximately)
/*!40000 ALTER TABLE `expertise_ca` DISABLE KEYS */;
/*!40000 ALTER TABLE `expertise_ca` ENABLE KEYS */;


-- Dumping structure for table caservices.filing_purpose
CREATE TABLE IF NOT EXISTS `filing_purpose` (
  `FILING_PURPOSE_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`FILING_PURPOSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.filing_purpose: ~3 rows (approximately)
/*!40000 ALTER TABLE `filing_purpose` DISABLE KEYS */;
INSERT INTO `filing_purpose` (`FILING_PURPOSE_ID`, `NAME`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('402881844fac5e73014fac613f440001', 'Ye ter tax', 'er.mohdwasi@gmail.com', '2015-09-08 15:24:58', 'er.mohdwasi@gmail.com', '2015-09-08 15:24:58'),
	('hjgljgklj', 'Income Tax', NULL, NULL, NULL, NULL),
	('kjglkhkjhlk', 'Sale Tax', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `filing_purpose` ENABLE KEYS */;


-- Dumping structure for procedure caservices.insert_daily_meeting_slot
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_daily_meeting_slot`(MODIFIEDBY varchar(30),CAID varchar(40),SERVICEDATE date,STARTTIME varchar(10),
ENDTIME varchar(10), inputSTATUS varchar(10),MASTERMEETINGSLOTID bigint)
BEGIN
 insert into daily_meeting_slot (MODIFIED_BY,CA_ID,SERVICE_DATE,START_TIME,END_TIME,STATUS,MASTER_MEETING_SLOT_ID)
values(MODIFIEDBY,CAID,SERVICEDATE,STARTTIME,ENDTIME,inputSTATUS,MASTERMEETINGSLOTID);
END//
DELIMITER ;


-- Dumping structure for table caservices.lawyer_address
CREATE TABLE IF NOT EXISTS `lawyer_address` (
  `LAWYER_ADDRESS_ID` varchar(255) NOT NULL,
  `AREA` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `CITY` varchar(255) default NULL,
  `COUNTRY` varchar(255) default NULL,
  `HOUSE_NO` varchar(255) default NULL,
  `LANDMARK` varchar(255) default NULL,
  `LATITUDE` varchar(255) default NULL,
  `LONGITUDE` varchar(255) default NULL,
  `PINCODE` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `STREET_DETAIL` varchar(255) default NULL,
  `LAWYER_ID` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`LAWYER_ADDRESS_ID`),
  KEY `FKC6A7B49982C3FD5A` (`LAWYER_ID`),
  CONSTRAINT `FKC6A7B49982C3FD5A` FOREIGN KEY (`LAWYER_ID`) REFERENCES `lawyer_info` (`LAWYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.lawyer_address: ~1 rows (approximately)
/*!40000 ALTER TABLE `lawyer_address` DISABLE KEYS */;
INSERT INTO `lawyer_address` (`LAWYER_ADDRESS_ID`, `AREA`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `CITY`, `COUNTRY`, `HOUSE_NO`, `LANDMARK`, `LATITUDE`, `LONGITUDE`, `PINCODE`, `STATE`, `STREET_DETAIL`, `LAWYER_ID`, `CREATED_BY`) VALUES
	('99d99897506a3b8a01506a4c141d0003', 'hgfk', '2015-10-15 12:29:41', 'asad@gmail.com', '2015-10-15 12:29:41', 'HJGFLHJ', 'gfhg', '12', 'jhgfjhf', NULL, NULL, '6548', 'glhghjg', 'khgl', '99d99897506a3b8a01506a4c13a20002', NULL);
/*!40000 ALTER TABLE `lawyer_address` ENABLE KEYS */;


-- Dumping structure for table caservices.lawyer_info
CREATE TABLE IF NOT EXISTS `lawyer_info` (
  `LAWYER_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `MOBILE` varchar(255) default NULL,
  `PHONE` varchar(255) default NULL,
  `SERVICE_NUMBER` varchar(255) default NULL,
  `DATE_OF_BIRTH` varchar(255) default NULL,
  `PROFILE_PIC_PATH` varchar(255) default NULL,
  `GENDER` varchar(255) default NULL,
  `TYPE` varchar(255) default NULL,
  `REFFERED_BY` varchar(255) default NULL,
  `STATUS` smallint(6) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`LAWYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.lawyer_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `lawyer_info` DISABLE KEYS */;
INSERT INTO `lawyer_info` (`LAWYER_ID`, `NAME`, `EMAIL_ID`, `MOBILE`, `PHONE`, `SERVICE_NUMBER`, `DATE_OF_BIRTH`, `PROFILE_PIC_PATH`, `GENDER`, `TYPE`, `REFFERED_BY`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('99d99897506a3b8a01506a4c13a20002', 'Mohd Asad', 'asad@gmail.com', '8987678987', NULL, 'a6779d22274d2d0f9ef5bbc40c81e60d', '11-Oct-1997', '/image/Penguins.jpg', 'NA', 'ROLE_LAWYER_FIRM', 'tfkhjg', 0, NULL, '2015-10-15 12:29:41', 'asad@gmail.com', '2015-10-15 12:29:41');
/*!40000 ALTER TABLE `lawyer_info` ENABLE KEYS */;


-- Dumping structure for table caservices.master_meeting_slot
CREATE TABLE IF NOT EXISTS `master_meeting_slot` (
  `MASTER_MEETING_SLOT_ID` bigint(20) NOT NULL auto_increment,
  `ENTITY_ID` varchar(255) NOT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `START_TIME` time NOT NULL,
  `END_TIME` time NOT NULL,
  `STATUS` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`MASTER_MEETING_SLOT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.master_meeting_slot: ~2 rows (approximately)
/*!40000 ALTER TABLE `master_meeting_slot` DISABLE KEYS */;
INSERT INTO `master_meeting_slot` (`MASTER_MEETING_SLOT_ID`, `ENTITY_ID`, `ENTITY_TYPE`, `START_DATE`, `END_DATE`, `START_TIME`, `END_TIME`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	(1, '4028abdd506a340601506a3684140001', 'ROLE_CA_FIRM', '2015-10-01', '2015-10-31', '16:05:00', '16:40:00', 'Available', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15', 'er.mohdwasi@gmail.com', '2015-10-16 16:08:15'),
	(2, '99d99897506a3b8a01506a4c13a20002', 'ROLE_LAWYER_FIRM', '2015-10-08', '2015-10-16', '16:15:00', '16:45:00', 'Available', 'asad@gmail.com', '2015-10-16 16:09:01', 'asad@gmail.com', '2015-10-16 16:09:01');
/*!40000 ALTER TABLE `master_meeting_slot` ENABLE KEYS */;


-- Dumping structure for table caservices.our_expense
CREATE TABLE IF NOT EXISTS `our_expense` (
  `EXPENSE_ID` bigint(20) NOT NULL auto_increment,
  `EXPENSE_DATE` date default NULL,
  `USER` varchar(50) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `CAUSE` varchar(1000) NOT NULL,
  `CREDIT_AMOUNT` int(11) NOT NULL,
  `DEBIT_AMOUNT` int(11) NOT NULL,
  `PATH` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`EXPENSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.our_expense: ~30 rows (approximately)
/*!40000 ALTER TABLE `our_expense` DISABLE KEYS */;
INSERT INTO `our_expense` (`EXPENSE_ID`, `EXPENSE_DATE`, `USER`, `TYPE`, `CAUSE`, `CREDIT_AMOUNT`, `DEBIT_AMOUNT`, `PATH`, `CREATED_BY`, `MODIFIED_BY`, `CREATED_TS`, `MODIFIED_TS`) VALUES
	(1, '2015-04-01', 'NMD Associates', 'Debit', '2u Technologies registration on mca', 0, 24000, 'drive/expense/april/2u_Technology_registration.pdf', NULL, NULL, '2015-09-08 17:16:10', '2015-09-08 17:16:10'),
	(2, '2015-04-01', 'Wasi', 'Credit', 'Company Investment', 17100, 0, NULL, NULL, NULL, '2015-09-08 17:27:44', '2015-09-08 17:27:44'),
	(3, '2015-04-01', 'Danish', 'Credit', 'Company Investment', 24600, 0, NULL, NULL, NULL, '2015-09-08 17:27:44', '2015-09-08 17:27:44'),
	(4, '2015-04-01', 'Vinod', 'Credit', 'Company Investment', 11500, 0, NULL, NULL, NULL, '2015-09-08 17:27:44', '2015-09-08 17:27:44'),
	(5, '2015-04-01', 'Itech Smart', 'Bill', 'Server cost of Feb & March', 0, 4000, NULL, NULL, NULL, '2015-09-08 17:34:02', '2015-09-08 17:34:02'),
	(6, '2015-04-01', 'Itech Smart', 'Bill', 'Server cost of April', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:34:02', '2015-09-08 17:34:02'),
	(7, '2015-04-01', 'Priyansh', 'Salary', 'Salary of March', 0, 5000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(8, '2015-05-01', 'Wasi', 'Salary', 'Salary of April', 0, 14000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(9, '2015-05-01', 'Priyansh', 'Salary', 'Salary of May', 0, 5000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(10, '2015-05-01', 'Danish', 'Credit', 'Company Investment', 11800, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(12, '2015-05-01', 'Wasi', 'Credit', 'Company Investment', 5610, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(13, '2015-05-01', 'Itech Smart', 'Bill', 'Server Cost of May', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(14, '2015-05-01', 'Company', 'Bill', 'Bought Fagnum.com from Godaddy', 0, 610, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(15, '2015-06-01', 'Wasi', 'Salary', 'Salary of May', 0, 14000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(16, '2015-06-01', 'Itech Smart', 'Bill', 'Server cost of June', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(17, '2015-06-01', 'Danish', 'Credit', 'Company Investment', 2000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(19, '2015-07-01', 'Danish', 'Credit', 'Company Investment', 9000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(20, '2015-07-01', 'Itech Smart', 'Bill', 'Server cost of July', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(21, '2015-07-01', 'Company', 'Credit', 'Aisha Hospital paid us in August', 40000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(22, '2015-07-01', 'Wasi', 'Debit', 'Salary of June', 0, 20000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(23, '2015-07-01', 'Vinod', 'Debit', 'Loan', 0, 7000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(24, '2015-08-01', 'Wasi', 'Debit', 'Salary of July', 0, 20000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(25, '2015-09-01', 'Wasi', 'Credit', 'Company Restructure for Wasi', 3000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(26, '2015-09-01', 'Company', 'Credit', 'Aisha Hospital paid us in September', 40000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(27, '2015-09-01', 'NMD Associates', 'Debit', 'Company Restructure for Danish', 0, 3700, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(28, '2015-09-01', 'Wasi', 'Debit', 'Salary of August', 0, 20000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(29, '2015-09-01', 'Itech Smart', 'Debit', 'Server cost of August & September', 0, 4000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(30, '2015-09-01', 'NMD Associates', 'Debit', 'Company Restructure for Wasi', 0, 3000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(31, '2015-10-01', 'Company', 'Credit', 'Aisha Hospital paid us in October', 40000, 0, NULL, NULL, NULL, '2015-10-08 17:35:34', '2015-10-08 17:35:34'),
	(32, '2015-10-01', 'Wasi', 'Debit', 'Salary of September', 0, 20000, NULL, NULL, NULL, '2015-10-08 17:35:34', '2015-10-08 17:35:34');
/*!40000 ALTER TABLE `our_expense` ENABLE KEYS */;


-- Dumping structure for table caservices.role
CREATE TABLE IF NOT EXISTS `role` (
  `ROLE_ID` int(11) NOT NULL auto_increment,
  `ROLE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.role: ~0 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for procedure caservices.SLOT_PROC
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SLOT_PROC`(IN `entityId` VARCHAR(255), IN `entityType` VARCHAR(50), IN `serviceDate` DATE, IN `endDate` DATE, IN `startTime` TIME, IN `endTime` TIME, IN `emailId` VARCHAR(50), IN `status` VARCHAR(50), IN `masterMeetingSlotId` BIGINT)
BEGIN
DECLARE date DATE;
SET date = serviceDate;
SET endDate = DATE_ADD(endDate,INTERVAL 1 DAY);
WHILE date < endDate DO
	INSERT INTO `DAILY_MEETING_SLOT`(ENTITY_ID,ENTITY_TYPE,SERVICE_DATE,START_TIME,END_TIME,STATUS,
					 CREATED_BY,CREATED_TS,MODIFIED_BY,MODIFIED_TS,MASTER_MEETING_SLOT_ID)
	VALUES(entityId,entityType,date,startTime,endTime,status,emailId,CURRENT_TIMESTAMP(),emailId,
	CURRENT_TIMESTAMP(),masterMeetingSlotId);
	SET date = DATE_ADD(date,INTERVAL 1 DAY);
END WHILE;
END//
DELIMITER ;


-- Dumping structure for table caservices.student_address
CREATE TABLE IF NOT EXISTS `student_address` (
  `STUDENT_ADDRESS_ID` varchar(255) NOT NULL,
  `AREA` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `CITY` varchar(255) default NULL,
  `COUNTRY` varchar(255) default NULL,
  `HOUSE_NO` varchar(255) default NULL,
  `LANDMARK` varchar(255) default NULL,
  `LATITUDE` varchar(255) default NULL,
  `LONGITUDE` varchar(255) default NULL,
  `PINCODE` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `STREET_DETAIL` varchar(255) default NULL,
  `STUDENT_ID` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`STUDENT_ADDRESS_ID`),
  KEY `FK250691B0DF2A6E16` (`STUDENT_ID`),
  CONSTRAINT `FK250691B0DF2A6E16` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student_info` (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.student_address: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_address` ENABLE KEYS */;


-- Dumping structure for table caservices.student_info
CREATE TABLE IF NOT EXISTS `student_info` (
  `STUDENT_ID` varchar(255) NOT NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `DATE_OF_BIRTH` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `GENDER` varchar(255) default NULL,
  `MOBILE` varchar(255) default NULL,
  `NAME` varchar(255) default NULL,
  `PHONE` varchar(255) default NULL,
  `PROFILE_PIC_PATH` varchar(255) default NULL,
  `REFFERED_BY` varchar(255) default NULL,
  `STATUS` smallint(6) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.student_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;


-- Dumping structure for table caservices.sub_task
CREATE TABLE IF NOT EXISTS `sub_task` (
  `SUB_TASK_ID` varchar(255) NOT NULL,
  `TITLE` varchar(50) default NULL,
  `NAME` varchar(50) default NULL,
  `DATE` date default NULL,
  `PRICE` float default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`SUB_TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.sub_task: ~0 rows (approximately)
/*!40000 ALTER TABLE `sub_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_task` ENABLE KEYS */;


-- Dumping structure for table caservices.user
CREATE TABLE IF NOT EXISTS `user` (
  `USER_ID` varchar(255) NOT NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `PASSWORD` varchar(255) default NULL,
  `USER_TYPE` varchar(255) default NULL,
  `STATUS` varchar(50) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`USER_ID`),
  UNIQUE KEY `EMAIL_ID` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`USER_ID`, `EMAIL_ID`, `PASSWORD`, `USER_TYPE`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('4028abdc50700dd701507012dec20001', 'kay@gmail.com', '7e676e9e663beb40fd133f5ee24487c2', 'ROLE_ENDUSER', '1', NULL, '2015-10-16 15:24:56', 'kay@gmail.com', '2015-10-16 15:24:56'),
	('4028abdd506a340601506a3685da0003', 'er.mohdwasi@gmail.com', '7e676e9e663beb40fd133f5ee24487c2', 'ROLE_CA_FIRM', '1', NULL, '2015-10-15 12:06:08', 'er.mohdwasi@gmail.com', '2015-10-15 12:06:08'),
	('99d99897506a3b8a01506a4c14730004', 'asad@gmail.com', '7e676e9e663beb40fd133f5ee24487c2', 'ROLE_LAWYER_FIRM', '1', NULL, '2015-10-15 12:29:41', 'asad@gmail.com', '2015-10-15 12:29:41');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table caservices.user_ca
CREATE TABLE IF NOT EXISTS `user_ca` (
  `USER_ID` varchar(255) NOT NULL,
  `CA_ID` varchar(255) NOT NULL,
  PRIMARY KEY  (`USER_ID`,`CA_ID`),
  KEY `FK2206F1522968E31A` (`CA_ID`),
  KEY `FK2206F152DF9782AC` (`USER_ID`),
  CONSTRAINT `FK2206F1522968E31A` FOREIGN KEY (`CA_ID`) REFERENCES `ca_info` (`CA_ID`),
  CONSTRAINT `FK2206F152DF9782AC` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.user_ca: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_ca` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ca` ENABLE KEYS */;


-- Dumping structure for table caservices.user_company
CREATE TABLE IF NOT EXISTS `user_company` (
  `USER_ID` varchar(255) NOT NULL,
  `COMPANY_ID` varchar(255) NOT NULL,
  PRIMARY KEY  (`USER_ID`,`COMPANY_ID`),
  KEY `FK19DB57E93C999288` (`COMPANY_ID`),
  KEY `FK19DB57E9DF9782AC` (`USER_ID`),
  CONSTRAINT `FK19DB57E93C999288` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`),
  CONSTRAINT `FK19DB57E9DF9782AC` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.user_company: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company` ENABLE KEYS */;


-- Dumping structure for table caservices.work_task
CREATE TABLE IF NOT EXISTS `work_task` (
  `WORK_TASK_ID` varchar(255) NOT NULL,
  `TITLE` varchar(50) default NULL,
  `NAME` varchar(50) default NULL,
  `ENTITY_ID` varchar(255) default NULL,
  `ENTITY_NAME` varchar(50) default NULL,
  `DATE` date default NULL,
  `PRICE` float default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `MODIFIED_TS` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.work_task: ~0 rows (approximately)
/*!40000 ALTER TABLE `work_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_task` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
