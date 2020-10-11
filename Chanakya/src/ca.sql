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
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `CA_ID` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `END_TIME` varchar(255) default NULL,
  `MOBILE_NUMBER` varchar(255) default NULL,
  `REASON` varchar(255) default NULL,
  `START_TIME` varchar(255) default NULL,
  `STATUS` varchar(255) default NULL,
  `VISITOR_NAME` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`APPOINTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.appointment: ~2 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` (`APPOINTMENT_ID`, `APPOINTMENT_DATE`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `CA_ID`, `EMAIL_ID`, `END_TIME`, `MOBILE_NUMBER`, `REASON`, `START_TIME`, `STATUS`, `VISITOR_NAME`, `CREATED_BY`) VALUES
	('402881834fa207ec014fa2acee8d0002', '11-Sep-2015', '2015-09-06 18:11:26', 'er.mohdwasi@gmail.com', '2015-09-06 18:11:26', 'ff8080814f4b7f17014f4c29ae220001', 'er.mohdwasi@gmail.com', 'NA', '8867861530', 'ksdfj;l', 'NA', 'Placed', 'Mohd Wasi', NULL),
	('402881834fa207ec014fa2b47c440003', '11-Sep-2015', '2015-09-06 18:19:41', 'er.mohdwasi@gmail.com', '2015-09-06 18:19:41', 'ff8080814f4b7f17014f4c29ae220001', 'er.mohdwasi@gmail.com', 'NA', '87987', 'jl', 'NA', 'Placed', 'l', NULL);
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
  `CA_ID` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`CA_ADDRESS_ID`),
  KEY `FK78B98F32968E31A` (`CA_ID`),
  CONSTRAINT `FK78B98F32968E31A` FOREIGN KEY (`CA_ID`) REFERENCES `ca_info` (`CA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.ca_address: ~1 rows (approximately)
/*!40000 ALTER TABLE `ca_address` DISABLE KEYS */;
INSERT INTO `ca_address` (`CA_ADDRESS_ID`, `AREA`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `CITY`, `COUNTRY`, `HOUSE_NO`, `LANDMARK`, `LATITUDE`, `LONGITUDE`, `PINCODE`, `STATE`, `STREET_DETAIL`, `CA_ID`, `CREATED_BY`) VALUES
	('ff8080814f4b7f17014f4c29ae8e0002', 'Jamia', '2015-08-20 23:00:44', 'er.sjdfklds@gmail.com', '2015-08-20 23:00:44', 'Bfkdjk', 'kjkl', '67k', 'Jamia', NULL, NULL, '670057', 'aksdjl', 'Jamia', 'ff8080814f4b7f17014f4c29ae220001', NULL);
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

-- Dumping data for table caservices.ca_company: ~3 rows (approximately)
/*!40000 ALTER TABLE `ca_company` DISABLE KEYS */;
INSERT INTO `ca_company` (`CA_ID`, `COMPANY_ID`) VALUES
	('ff8080814f4b7f17014f4c29ae220001', '402881854f9bcc00014f9bcc03340003'),
	('ff8080814f4b7f17014f4c29ae220001', '402881854f9c55ae014f9c5b59f30001'),
	('ff8080814f4b7f17014f4c29ae220001', 'ff8080814f8ea769014f8ea76d400002');
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
  `DATE_OF_BIRTH` varchar(255) default NULL,
  `EMAIL_ID` varchar(255) default NULL,
  `GENDER` varchar(255) default NULL,
  `MOBILE` varchar(255) default NULL,
  `NAME` varchar(255) default NULL,
  `PHONE` varchar(255) default NULL,
  `PROFILE_PIC_PATH` varchar(255) default NULL,
  `REFFERED_BY` varchar(255) default NULL,
  `SERVICE_NUMBER` varchar(255) default NULL,
  `STATUS` varchar(50) default NULL,
  `TYPE` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`CA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.ca_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `ca_info` DISABLE KEYS */;
INSERT INTO `ca_info` (`CA_ID`, `DATE_OF_BIRTH`, `EMAIL_ID`, `GENDER`, `MOBILE`, `NAME`, `PHONE`, `PROFILE_PIC_PATH`, `REFFERED_BY`, `SERVICE_NUMBER`, `STATUS`, `TYPE`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('ff8080814f4b7f17014f4c29ae220001', '13-Aug-2015', 'er.mohdwasi@gmail.com', 'NA', '8867861530', 'Mohd Wasi', NULL, '/image/10337752_668321336570551_5786696023272932549_n.jpg', 'kjlkj', '191915490f0ac95715ff6197604cce95', 'Verified', 'ROLE_FIRM', NULL, '2015-08-20 23:00:44', 'er.sjdfklds@gmail.com', '2015-08-20 23:00:44');
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

-- Dumping data for table caservices.company: ~3 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`COMPANY_ID`, `NAME`, `EMAIL_ID`, `COMPANY_TYPE`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('402881854f9bcc00014f9bcc03340003', '2u Tech', '2utech@gmail.com', 'Private', '1', NULL, NULL, NULL, NULL),
	('402881854f9c55ae014f9c5b59f30001', 'jhgjy', 'hk@gmail.com', 'Private Limited', '1', 'er.mohdwasi@gmail.com', '2015-09-05 12:44:36', 'er.mohdwasi@gmail.com', '2015-09-05 12:44:36'),
	('ff8080814f8ea769014f8ea76d400002', '2u Tech', '2utech@gmail.com', 'Private', '1', NULL, NULL, NULL, NULL);
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

-- Dumping data for table caservices.cws_address: ~1 rows (approximately)
/*!40000 ALTER TABLE `cws_address` DISABLE KEYS */;
INSERT INTO `cws_address` (`CWS_ADDRESS_ID`, `AREA`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `CITY`, `COUNTRY`, `HOUSE_NO`, `LANDMARK`, `LATITUDE`, `LONGITUDE`, `PINCODE`, `STATE`, `STREET_DETAIL`, `CWS_ID`, `CREATED_BY`) VALUES
	('ff8080814f4c54ed014f4c55cf8c0002', 'lkjlkj', '2015-08-20 23:48:56', 'erkjlk@gmail.com', '2015-08-20 23:48:56', 'bang', 'India', '234j', 'jami', NULL, NULL, '890078', 'kjlkjl', 'jamia', 'ff8080814f4c54ed014f4c55cef30001', NULL);
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

-- Dumping data for table caservices.cws_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `cws_info` DISABLE KEYS */;
INSERT INTO `cws_info` (`CWS_ID`, `DATE_OF_COMMENCEMENT`, `EMAIL_ID`, `MOBILE`, `NAME`, `PHONE`, `PROFILE_PIC_PATH`, `REFFERED_BY`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('ff8080814f4c54ed014f4c55cef30001', '06-Aug-2015', 'erkjlk@gmail.com', '897987987987', 'mohd wasi', NULL, '/image/10337752_668321336570551_5786696023272932549_n.jpg', 'jnljlkj', 0, NULL, '2015-08-20 23:48:56', 'erkjlk@gmail.com', '2015-08-20 23:48:56');
/*!40000 ALTER TABLE `cws_info` ENABLE KEYS */;


-- Dumping structure for table caservices.daily_meeting_slot
CREATE TABLE IF NOT EXISTS `daily_meeting_slot` (
  `DAILY_MEETING_SLOT_ID` bigint(20) NOT NULL auto_increment,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `CA_ID` varchar(255) default NULL,
  `END_TIME` time default NULL,
  `MASTER_MEETING_SLOT_ID` bigint(20) default NULL,
  `SERVICE_DATE` date default NULL,
  `START_TIME` time default NULL,
  `STATUS` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`DAILY_MEETING_SLOT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.daily_meeting_slot: ~0 rows (approximately)
/*!40000 ALTER TABLE `daily_meeting_slot` DISABLE KEYS */;
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

-- Dumping data for table caservices.document: ~6 rows (approximately)
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` (`DOCUMENT_ID`, `NAME`, `STRUCTURE`, `YEAR`, `ENTITY_ID`, `ENTITY_TYPE`, `FILING_PURPOSE`, `FILE_TYPE`, `FILE_EXTENSION`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('402881824fa83d9b014fa84025850001', 'wsi.jpg', '/opt/tomcat7/dms/402881854f9c55ae014f9c5b5a470002/2015/hjgljgklj', 2015, '402881854f9c55ae014f9c5b5a470002', 'USER', 'hjgljgklj', 'image/jpeg', 'jpg', 'er.mohdwasi@gmail.com', '2015-09-07 20:10:20', 'er.mohdwasi@gmail.com', '2015-09-07 20:10:20'),
	('402881834fa36e57014fa37191c00003', '10337752_668321336570551_5786696023272932549_n.jpg', '/opt/tomcat7/dms/ff8080814f8ea769014f8ea76d400002/2015/hjgljgklj', 2015, 'ff8080814f8ea769014f8ea76d400002', 'COMPANY', 'hjgljgklj', 'image/jpeg', 'jpg', 'er.mohdwasi@gmail.com', '2015-09-06 21:46:13', 'er.mohdwasi@gmail.com', '2015-09-06 21:46:13'),
	('402881834fa36e57014fa39810e00004', '10337752_668321336570551_5786696023272932549_n.jpg', '/opt/tomcat7/dms/ff8080814f8ea769014f8ea76d400002/2015/hjgljgklj', 2015, 'ff8080814f8ea769014f8ea76d400002', 'COMPANY', 'hjgljgklj', 'image/jpeg', 'jpg', 'er.mohdwasi@gmail.com', '2015-09-06 22:28:16', 'er.mohdwasi@gmail.com', '2015-09-06 22:28:16'),
	('402881834fa36e57014fa3a2ad870005', 'hjk.txt', '/opt/tomcat7/dms/ff8080814f8ea769014f8ea76d400002/2015/hjgljgklj', 2015, 'ff8080814f8ea769014f8ea76d400002', 'COMPANY', 'hjgljgklj', 'text/plain', 'txt', 'er.mohdwasi@gmail.com', '2015-09-06 22:39:51', 'er.mohdwasi@gmail.com', '2015-09-06 22:39:51'),
	('f975f30e4fa70452014fa709806b0003', 'Chrysanthemum.jpg', '/opt/tomcat7/dms/402881854f9bdaa8014f9bea09d00005/2015/kjglkhkjhlk', 2015, '402881854f9bdaa8014f9bea09d00005', 'USER', 'kjglkhkjhlk', 'image/jpeg', 'jpg', 'er.mohdwasi@gmail.com', '2015-09-07 14:31:01', 'er.mohdwasi@gmail.com', '2015-09-07 14:31:01'),
	('f975f30e4fa70452014fa70b88820004', 'Lighthouse.jpg', '/opt/tomcat7/dms/402881854f9c55ae014f9c5b5a470002/2015/hjgljgklj', 2015, '402881854f9c55ae014f9c5b5a470002', 'USER', 'hjgljgklj', 'image/jpeg', 'jpg', 'er.mohdwasi@gmail.com', '2015-09-07 14:33:15', 'er.mohdwasi@gmail.com', '2015-09-07 14:33:15');
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
	('ff8080814f4c2ddc014f4c2fe32f0002', 'jamia', '2015-08-20 23:07:30', 'erkjlk@gmail.com', '2015-08-20 23:07:30', 'bang', 'india', '234j', 'jami', NULL, NULL, '890078', 'kar', 'jamia', 'ff8080814f4c2ddc014f4c2fe2ae0001', NULL);
/*!40000 ALTER TABLE `lawyer_address` ENABLE KEYS */;


-- Dumping structure for table caservices.lawyer_info
CREATE TABLE IF NOT EXISTS `lawyer_info` (
  `LAWYER_ID` varchar(255) NOT NULL,
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
  `SERVICE_NUMBER` varchar(255) default NULL,
  `STATUS` smallint(6) default NULL,
  `TYPE` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`LAWYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.lawyer_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `lawyer_info` DISABLE KEYS */;
INSERT INTO `lawyer_info` (`LAWYER_ID`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `DATE_OF_BIRTH`, `EMAIL_ID`, `GENDER`, `MOBILE`, `NAME`, `PHONE`, `PROFILE_PIC_PATH`, `REFFERED_BY`, `SERVICE_NUMBER`, `STATUS`, `TYPE`, `CREATED_BY`) VALUES
	('ff8080814f4c2ddc014f4c2fe2ae0001', '2015-08-20 23:07:30', 'erkjlk@gmail.com', '2015-08-20 23:07:30', '13-Aug-2015', 'erkjlk@gmail.com', 'NA', '8867861530', 'Mohd Wasi', NULL, '/image/10337752_668321336570551_5786696023272932549_n.jpg', 'mohd asi', 'ba95d98df81bbf7db8390d769f994edc', 0, 'ROLE_LAWYER', NULL);
/*!40000 ALTER TABLE `lawyer_info` ENABLE KEYS */;


-- Dumping structure for table caservices.master_meeting_slot
CREATE TABLE IF NOT EXISTS `master_meeting_slot` (
  `MASTER_MEETING_SLOT_ID` bigint(20) NOT NULL auto_increment,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  `CA_ID` varchar(255) default NULL,
  `END_DATE` date default NULL,
  `END_TIME` time default NULL,
  `START_DATE` date default NULL,
  `START_TIME` time default NULL,
  `STATUS` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  PRIMARY KEY  (`MASTER_MEETING_SLOT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.master_meeting_slot: ~0 rows (approximately)
/*!40000 ALTER TABLE `master_meeting_slot` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.our_expense: ~22 rows (approximately)
/*!40000 ALTER TABLE `our_expense` DISABLE KEYS */;
INSERT INTO `our_expense` (`EXPENSE_ID`, `EXPENSE_DATE`, `USER`, `TYPE`, `CAUSE`, `CREDIT_AMOUNT`, `DEBIT_AMOUNT`, `PATH`, `CREATED_BY`, `MODIFIED_BY`, `CREATED_TS`, `MODIFIED_TS`) VALUES
	(1, '2015-04-01', 'Company', 'Debit', '2u Technologies registration on mca', 0, 24000, 'drive/expense/april/2u_Technology_registration.pdf', NULL, NULL, '2015-09-08 17:16:10', '2015-09-08 17:16:10'),
	(2, '2015-04-01', 'Wasi', 'Credit', 'Company Investment', 17100, 0, NULL, NULL, NULL, '2015-09-08 17:27:44', '2015-09-08 17:27:44'),
	(3, '2015-04-01', 'Danish', 'Credit', 'Company Investment', 24600, 0, NULL, NULL, NULL, '2015-09-08 17:27:44', '2015-09-08 17:27:44'),
	(4, '2015-04-01', 'Vinod', 'Credit', 'Company Investment', 11500, 0, NULL, NULL, NULL, '2015-09-08 17:27:44', '2015-09-08 17:27:44'),
	(5, '2015-04-01', 'Itech Smart', 'Bill', 'Server cost of Feb & March', 0, 4000, NULL, NULL, NULL, '2015-09-08 17:34:02', '2015-09-08 17:34:02'),
	(6, '2015-04-01', 'Itech Smart', 'Bill', 'Server cost of April', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:34:02', '2015-09-08 17:34:02'),
	(7, '2015-04-01', 'Priyansh', 'Salary', 'Salary of march', 0, 5000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(8, '2015-05-01', 'Wasi', 'Salary', 'Salary of april', 0, 14000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(9, '2015-05-01', 'Priyansh', 'Salary', 'Salary of may', 0, 5000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(10, '2015-05-01', 'Danish', 'Credit', 'Company Investment', 11800, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(12, '2015-05-01', 'Wasi', 'Credit', 'Company Investment', 5610, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(13, '2015-05-01', 'Itech Smart', 'Bill', 'Server Cost of May', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(14, '2015-05-01', 'Company', 'Bill', 'Bought Fagnum.com from Godaddy', 0, 610, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(15, '2015-06-01', 'Wasi', 'Salary', 'Salary of may', 0, 14000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(16, '2015-06-01', 'Itech Smart', 'Bill', 'Server cost of june', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(17, '2015-06-01', 'Danish', 'Credit', 'Company Investment', 2000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(19, '2015-07-01', 'Danish', 'Credit', 'Company Investment', 9000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(20, '2015-07-01', 'Itech Smart', 'Bill', 'Server cost of july', 0, 2000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(21, '2015-07-01', 'Company', 'Credit', 'Aisha Hospital paid us', 40000, 0, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(22, '2015-07-01', 'Wasi', 'Debit', 'Salary of june', 0, 20000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(23, '2015-07-01', 'Vinod', 'Debit', 'Loan', 0, 7000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34'),
	(24, '2015-08-01', 'Wasi', 'Debit', 'Salary', 0, 20000, NULL, NULL, NULL, '2015-09-08 17:35:34', '2015-09-08 17:35:34');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SLOT_PROC`(IN `caId` VARCHAR(255), IN `serviceDate` DATE, IN `endDate` DATE, IN `startTime` TIME, IN `endTime` TIME, IN `emailId` VARCHAR(50), IN `status` VARCHAR(50), IN `masterMeetingSlotId` BIGINT)
BEGIN
DECLARE date DATE;
SET date = serviceDate;
SET endDate = DATE_ADD(endDate,INTERVAL 1 DAY);
WHILE date < endDate DO
	INSERT INTO `DAILY_MEETING_SLOT`(CA_ID,SERVICE_DATE,START_TIME,END_TIME,STATUS,
					 CREATED_TS,MODIFIED_BY,MODIFIED_TS,MASTER_MEETING_SLOT_ID)
	VALUES(caId,date,startTime,endTime,status,CURRENT_TIMESTAMP(),emailId,CURRENT_TIMESTAMP(),masterMeetingSlotId);
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

-- Dumping data for table caservices.student_address: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_address` DISABLE KEYS */;
INSERT INTO `student_address` (`STUDENT_ADDRESS_ID`, `AREA`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `CITY`, `COUNTRY`, `HOUSE_NO`, `LANDMARK`, `LATITUDE`, `LONGITUDE`, `PINCODE`, `STATE`, `STREET_DETAIL`, `STUDENT_ID`, `CREATED_BY`) VALUES
	('ff8080814f4c54ed014f4c56a9ef0004', 'kjlkjl', '2015-08-20 23:49:52', 'erkjlk@gmail.com', '2015-08-20 23:49:52', 'bang', 'India', '234j', 'jami', NULL, NULL, '890078', 'kjlkj', 'jamia', 'ff8080814f4c54ed014f4c56a9870003', NULL),
	('ff8080814f4c58d1014f4c59a7d30002', 'jhljlk', '2015-08-20 23:53:07', 'erkjlk@gmail.com', '2015-08-20 23:53:07', 'bang', 'jk', '234j', 'jami', NULL, NULL, '890078', 'jhlkjh', 'jamia', 'ff8080814f4c58d1014f4c59a7200001', NULL);
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

-- Dumping data for table caservices.student_info: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
INSERT INTO `student_info` (`STUDENT_ID`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`, `DATE_OF_BIRTH`, `EMAIL_ID`, `GENDER`, `MOBILE`, `NAME`, `PHONE`, `PROFILE_PIC_PATH`, `REFFERED_BY`, `STATUS`, `CREATED_BY`) VALUES
	('ff8080814f4c54ed014f4c56a9870003', '2015-08-20 23:49:52', 'erkjlk@gmail.com', '2015-08-20 23:49:52', '21-Aug-2015', 'erkjlk@gmail.com', 'NA', '98098098098098', 'kjlkj', NULL, '/image/10337752_668321336570551_5786696023272932549_n.jpg', 'kjlkjlk', 0, NULL),
	('ff8080814f4c58d1014f4c59a7200001', '2015-08-20 23:53:07', 'erkjlk@gmail.com', '2015-08-20 23:53:07', '07-Aug-2015', 'erkjlk@gmail.com', 'NA', '98798798798798', 'kjlkj', NULL, '/image/10337752_668321336570551_5786696023272932549_n.jpg', 'jkhlkjhj', 0, NULL);
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
  `STATUS` smallint(6) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_TS` datetime default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `MODIFIED_TS` datetime default NULL,
  PRIMARY KEY  (`USER_ID`),
  UNIQUE KEY `EMAIL_ID` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table caservices.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`USER_ID`, `EMAIL_ID`, `PASSWORD`, `USER_TYPE`, `STATUS`, `CREATED_BY`, `CREATED_TS`, `MODIFIED_BY`, `MODIFIED_TS`) VALUES
	('402881854f9bdaa8014f9be27a480001', 'mohd@gmail.com', '533a7de111ee3af214eee5e09e3fa1bc', 'ROLE_ENDUSER', 0, 'er.mohdwasi@gmail.com', '2015-09-05 10:32:35', 'er.mohdwasi@gmail.com', '2015-09-05 10:32:35'),
	('402881854f9bdaa8014f9bea09d00005', 'danish@gmail.com', '7e676e9e663beb40fd133f5ee24487c2', 'ROLE_ENDUSER', 1, 'er.mohdwasi@gmail.com', '2015-09-05 10:40:44', 'er.mohdwasi@gmail.com', '2015-09-05 10:40:44'),
	('402881854f9c55ae014f9c5b5a470002', 'mnxlk@gmail.com', 'fa12a7143c24200577be53e74c33f9f6', 'ROLE_ENDUSER', 0, 'er.mohdwasi@gmail.com', '2015-09-05 12:44:36', 'er.mohdwasi@gmail.com', '2015-09-05 12:44:36'),
	('4028abdd4f7ad8e6014f7ada15b30001', 'wasi@gmail.com', '93ec3bccd20f1403374ea7636b10f56d', 'ROLE_ENDUSER', 0, 'er.mohdwasi@gmail.com', '2015-08-30 00:35:56', 'er.mohdwasi@gmail.com', '2015-08-30 00:35:56'),
	('ff8080814f4b7f17014f4c29afc60003', 'er.mohdwasi@gmail.com', '7e676e9e663beb40fd133f5ee24487c2', 'ROLE_FIRM', 1, NULL, '2015-08-20 23:00:44', 'er.sjdfklds@gmail.com', '2015-08-20 23:00:44');
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

-- Dumping data for table caservices.user_ca: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_ca` DISABLE KEYS */;
INSERT INTO `user_ca` (`USER_ID`, `CA_ID`) VALUES
	('402881854f9bdaa8014f9bea09d00005', 'ff8080814f4b7f17014f4c29ae220001'),
	('402881854f9c55ae014f9c5b5a470002', 'ff8080814f4b7f17014f4c29ae220001');
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

-- Dumping data for table caservices.user_company: ~1 rows (approximately)
/*!40000 ALTER TABLE `user_company` DISABLE KEYS */;
INSERT INTO `user_company` (`USER_ID`, `COMPANY_ID`) VALUES
	('402881854f9c55ae014f9c5b5a470002', '402881854f9c55ae014f9c5b59f30001');
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
