-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: board_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `M_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `M_PWD` varchar(100) NOT NULL,
  `M_NAME` varchar(10) NOT NULL,
  `M_BIRTH` date NOT NULL,
  `M_ADDR` varchar(50) NOT NULL,
  `M_PHONE` varchar(13) NOT NULL,
  `M_POINT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('cocoa','$2a$10$kRnLGW5QTYDfGs5rVVw.N.bWCOpEAWIrmn200Ddq.7ielvrL3I1zW','규아름','2010-04-05','서울시 은평구','010-8453-1234',0),('gray','$2a$10$dedEHI6U8LDsiEAX03XKkOshHF4hH9d9s/aUIstwoisuny2XEaY3.','이유나','2014-05-31','서울시 은평구','010-1111-1111',0),('green','$2a$10$vTkIQforZPgzrAbRbQ5QnuBTNT2TBSkSEfXxcXiVHbjAV.Gz/zwPa','김초록','2011-05-05','제주시 용암면','010-1442-1485',0),('hena','$2a$10$zea.ceb0.6Q98fy/0u7ZvOLw7dxww5fvc0VIQguMDrQyH5OPDh5.q','강윤아','2011-05-16','서울시 강서구','010-4125-4135',0),('lemon','$2a$10$F8U8XjCktb6nokYx.3NtxebZo.zzsqSPi2tN0omMBIY8dnQGUK7Je','주민유','2008-12-25','서울시 종로구','010-4517-4568',100),('orage','$2a$10$ystsla4dhktss6.IDDwKbO35VDVYGTTHOCL126JkhLZngzoJZEfoW','지수인','2000-10-03','경남 창원시','010-1428-8475',2),('park','1111','박종일','1990-10-07','인천남동구','010-1111-2222',20),('test','1111','손님','1990-12-31','서울 강남','010-2222-3333',0),('webapp','$2a$10$yryo0JL3EBhXFFC8UxSz2udLVwvH59oWNU3.0bKiIGegCrRX0AYp6','진성아','2010-06-24','인천시 부평구','010-9145-7524',0),('yellow','$2a$10$yW3KOm/vRGIiQstkfrdHX.SEFeM7L1oj7X0X.EumzscQx2ROiFMbG','규민아','2013-04-03','경기도 안산시','010-4987-7856',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 15:08:11
