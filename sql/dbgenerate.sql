-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.44


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema hoytstaff
--

CREATE DATABASE IF NOT EXISTS hoytstaff;
USE hoytstaff;

--
-- Definition of table `hoytstaff`.`person`
--

DROP TABLE IF EXISTS `hoytstaff`.`person`;
CREATE TABLE  `hoytstaff`.`person` (
  `personID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) DEFAULT NULL,
  `lastName` varchar(64) DEFAULT NULL,
  `blog` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoytstaff`.`person`
--

/*!40000 ALTER TABLE `person` DISABLE KEYS */;
LOCK TABLES `person` WRITE;
INSERT INTO `hoytstaff`.`person` VALUES  (1,'Kevin','Hoyt','http://blog.kevinhoyt.com/','krhoyt','Denver, USA'),
 (2,'Ryan','Stewart','http://blog.digitalbackcountry.com/','ryanstewart','Seattle, USA'),
 (3,'Terry','Ryan','http://terrenceryan.com/blog','tpryan','Philadelphia, USA'),
 (4,'Renaun ','Erickson','http://renaun.com/blog/','renaun','Las Vegas, USA'),
 (5,'Paul','Trani ','http://www.paultrani.com/','paultrani','Denver, USA'),
 (6,'Mark','Doherty','http://www.flashmobileblog.com/','markadoherty','Brighton, England'),
 (7,'Mihai','Corlan','http://www.corlan.org/','mcorlan','Bucharest, Romania');
UNLOCK TABLES;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
