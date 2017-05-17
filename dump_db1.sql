-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db1
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Table structure for table `myTable`
--

DROP TABLE IF EXISTS `myTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myTable`
--

LOCK TABLES `myTable` WRITE;
/*!40000 ALTER TABLE `myTable` DISABLE KEYS */;
INSERT INTO `myTable` VALUES (1,'Jack','(037) 38686911','Jul 9, 2016','Mus Proin Vel Foundation'),(2,'Cairo','(0883) 13242084','Jul 12, 2017','Volutpat PC'),(3,'Finn','(07719) 0472688','Jun 10, 2016','Tincidunt Consulting'),(4,'Ian','(0886) 67477777','Jan 27, 2018','Aliquam LLC'),(5,'Hunter','(09505) 3682514','Sep 29, 2017','Ad Litora Torquent Limited'),(6,'Davis','(040) 16281714','Feb 7, 2018','Eleifend Nunc Corporation'),(7,'Zachery','(035547) 965290','Mar 13, 2018','Nisl Elementum Institute'),(8,'Barry','(031465) 392771','Aug 22, 2016','Gravida Sagittis Duis Limited'),(9,'Blaze','(0880) 42729507','Jul 2, 2016','Leo Elementum Ltd'),(10,'Garrison','(0336) 78805619','Nov 25, 2016','Quis Turpis Vitae Inc.'),(11,'Logan','(036544) 165003','Oct 6, 2017','Dictum Sapien Limited'),(12,'Fuller','(038874) 162586','Jul 20, 2017','At Egestas A LLP'),(13,'Benedict','(0159) 89015713','Feb 12, 2017','Vitae Posuere Company'),(14,'Cyrus','(0752) 02140098','Aug 15, 2017','Arcu Vestibulum Company'),(15,'Lev','(01032) 2849174','Apr 11, 2018','Cum LLC'),(16,'Stewart','(08421) 4833543','Mar 20, 2017','Integer Aliquam Adipiscing Industries'),(17,'Jameson','(037926) 760989','Mar 31, 2018','Aenean Egestas Hendrerit Institute'),(18,'Louis','(0317) 85537429','Oct 24, 2016','Ut Tincidunt Orci Inc.'),(19,'Talon','(010) 18876910','Oct 2, 2016','Dapibus Ligula Incorporated'),(20,'Emery','(055) 30867907','Oct 7, 2016','Et Nunc Quisque Limited'),(21,'Solomon','(0253) 47023276','Feb 14, 2017','Sem Pellentesque Associates'),(22,'Colt','(002) 18666691','Jan 2, 2017','Faucibus Orci Limited'),(23,'Igor','(06832) 9799111','Dec 2, 2017','Sed Leo Industries'),(24,'Clarke','(037071) 923219','Sep 4, 2016','Bibendum Ullamcorper Duis Consulting'),(25,'Walker','(035791) 313420','Nov 23, 2017','Consequat Lectus Institute'),(26,'Arthur','(086) 10591055','Mar 23, 2018','Maecenas Iaculis Aliquet Industries'),(27,'Rahim','(02946) 7119267','Jun 15, 2017','Enim Consulting'),(28,'Allen','(0640) 58947189','Jan 30, 2017','Nonummy Ipsum Associates'),(29,'Colby','(0866) 31711616','Aug 14, 2017','Faucibus Orci PC'),(30,'Raja','(034251) 372227','Feb 16, 2017','Auctor PC'),(31,'Julian','(06841) 4056178','May 21, 2016','Accumsan Laoreet Ipsum Limited'),(32,'Ira','(0582) 08821436','Aug 27, 2017','Nisl Arcu Foundation'),(33,'Alvin','(09620) 0766457','Feb 27, 2018','Nec Metus Corp.'),(34,'Amal','(035106) 015399','Dec 6, 2017','Risus At Fringilla Institute'),(35,'Samson','(044) 59864697','Mar 21, 2017','Ligula Aliquam Erat Institute'),(36,'Hashim','(0972) 31507414','Jan 17, 2018','Est Arcu Industries'),(37,'Orson','(06680) 2195349','Jul 31, 2016','Ligula Nullam Foundation'),(38,'Reece','(010) 44773607','Jan 21, 2018','Rutrum Incorporated'),(39,'Len','(06965) 9276149','Apr 18, 2017','Eu Arcu Morbi Limited'),(40,'Scott','(0822) 52760130','Jun 23, 2016','Enim Diam Vel Limited'),(41,'Kennan','(0206) 57023045','Jul 30, 2016','In Cursus Et Corporation'),(42,'Murphy','(09311) 4860894','May 11, 2017','Taciti Sociosqu Ad Corporation'),(43,'Francis','(047) 11025905','Feb 18, 2017','Scelerisque Scelerisque Dui Consulting'),(44,'Clarke','(0162) 94085954','Apr 11, 2018','Rutrum Eu Institute'),(45,'Jelani','(06150) 5282697','Jul 31, 2017','Proin Ultrices Duis LLC'),(46,'Lawrence','(079) 43201611','Feb 17, 2017','Vel Ltd'),(47,'Abraham','(055) 60350190','May 28, 2016','Ultricies Adipiscing Enim Associates'),(48,'Garrison','(037) 15776803','Jan 6, 2018','Lorem Ipsum Dolor Industries'),(49,'Chancellor','(06403) 8791680','Sep 20, 2017','Elit Etiam Incorporated'),(50,'Kareem','(0657) 97079060','Sep 4, 2017','Elit Erat LLP'),(51,'Eagan','(0661) 16110376','Sep 12, 2017','Diam Dictum Sapien Incorporated'),(52,'Vaughan','(0452) 35541716','May 9, 2017','Fames Ac Turpis LLC'),(53,'Randall','(030178) 119253','Jan 20, 2018','Dapibus Gravida Ltd'),(54,'Melvin','(060) 22567189','Nov 6, 2016','Donec Consulting'),(55,'Lamar','(031734) 879952','Jan 21, 2018','Lectus Cum Industries'),(56,'Len','(083) 95187183','Jun 21, 2016','Sapien Nunc Pulvinar Institute'),(57,'Bert','(0661) 40434874','May 2, 2017','Ultricies Ornare PC'),(58,'Octavius','(035262) 808977','Dec 10, 2016','Nunc Quis Arcu Inc.'),(59,'Colby','(036952) 100675','May 14, 2018','Tellus LLC'),(60,'Evan','(08979) 7327114','Apr 10, 2018','Sollicitudin Industries'),(61,'Austin','(047) 47328773','Jul 24, 2016','Neque Non Corporation'),(62,'Jared','(037958) 703347','Oct 22, 2017','Erat Sed Incorporated'),(63,'Lucian','(0023) 27306093','Feb 20, 2018','Pretium Aliquet Limited'),(64,'Rooney','(005) 15480153','Dec 4, 2017','Integer Inc.'),(65,'Craig','(08256) 7770405','Oct 14, 2017','Aliquam Vulputate LLP'),(66,'Tanner','(088) 19881124','Jun 21, 2017','Sed Nunc Est Industries'),(67,'Barry','(04982) 7439431','Oct 26, 2016','Aliquet Proin Ltd'),(68,'Ray','(075) 68227969','Dec 9, 2017','Ultrices Corporation'),(69,'Timon','(05101) 0686842','Dec 21, 2016','Aliquam Eu Ltd'),(70,'Porter','(01408) 1802375','Aug 6, 2017','Vitae Orci Ltd'),(71,'Quinn','(0806) 64674414','Mar 29, 2017','Libero Integer In Company'),(72,'Carson','(09412) 3299568','Jun 22, 2016','Ac Corp.'),(73,'Abel','(00497) 7610002','Oct 2, 2016','Eu Limited'),(74,'Hedley','(036826) 767448','Dec 8, 2016','Aliquet Nec Imperdiet Company'),(75,'Dustin','(051) 69986929','Oct 13, 2017','Elementum Corp.'),(76,'Basil','(074) 76091068','Jan 3, 2018','Inceptos Hymenaeos Mauris PC'),(77,'Aristotle','(039672) 048184','Aug 11, 2017','Integer In Corporation'),(78,'Tate','(031082) 948953','Jul 24, 2016','Suspendisse Dui Fusce Foundation'),(79,'Ashton','(0812) 12824689','Jul 24, 2017','Vel Turpis Corp.'),(80,'Lucian','(0562) 89900221','Feb 4, 2017','Vivamus Nisi Ltd'),(81,'Kennedy','(038372) 892551','Jan 20, 2018','Eu Neque Pellentesque Inc.'),(82,'Tanek','(020) 15110555','Jan 17, 2017','Eget Volutpat Industries'),(83,'Timothy','(032) 80445156','Apr 27, 2018','Auctor PC'),(84,'Eaton','(0014) 95451571','Nov 10, 2017','Nibh Sit Amet Foundation'),(85,'Malcolm','(031146) 719431','Jun 13, 2016','In Lorem Foundation'),(86,'Rashad','(01672) 4976713','Mar 18, 2017','Cras Ltd'),(87,'Elijah','(037266) 246536','Aug 17, 2016','Eu PC'),(88,'Quinn','(0004) 88648893','Apr 11, 2018','Urna Incorporated'),(89,'Gary','(0560) 59717456','Jun 9, 2017','Malesuada Consulting'),(90,'Peter','(0496) 58721332','Nov 19, 2016','Lacus Nulla Corporation'),(91,'Davis','(0538) 12208109','Sep 8, 2017','Pellentesque LLP'),(92,'Kaseem','(069) 30169372','Jan 14, 2018','Neque Nullam Nisl Inc.'),(93,'Joel','(057) 96903314','Sep 24, 2016','Euismod Et Associates'),(94,'Aristotle','(0405) 96318609','Dec 17, 2016','Risus Donec Egestas Foundation'),(95,'Yardley','(0081) 87756106','Mar 2, 2017','Consectetuer LLC'),(96,'Kibo','(0885) 09989917','Feb 22, 2018','Lobortis Class Aptent Consulting'),(97,'Lars','(00918) 3482387','Apr 24, 2017','Elit Erat Vitae Institute'),(98,'Ulysses','(04445) 1994414','Feb 21, 2017','Nec Tellus PC'),(99,'Chester','(040) 14349009','Nov 10, 2017','Eu Foundation'),(100,'Daquan','(0924) 06152403','Apr 15, 2017','Feugiat Lorem Ltd');
/*!40000 ALTER TABLE `myTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-17 18:45:53
