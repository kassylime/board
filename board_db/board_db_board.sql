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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `B_NUM` int NOT NULL AUTO_INCREMENT,
  `B_TITLE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `B_CONTENTS` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `B_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `B_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `B_VIEWS` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`B_NUM`),
  KEY `FK_B_ID` (`B_ID`),
  CONSTRAINT `FK_B_ID` FOREIGN KEY (`B_ID`) REFERENCES `member` (`M_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'게시글1','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',10),(2,'게시글2','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',20),(3,'게시글3','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',30),(4,'게시글4','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',5),(5,'게시글5','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(6,'게시글6','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',12),(7,'게시글7','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',15),(8,'게시글8','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(9,'게시글9','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(10,'게시글10','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(11,'게시글11','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(12,'게시글12','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(13,'게시글13','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(14,'게시글14','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(15,'게시글15','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(16,'게시글16','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(17,'게시글17','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(18,'게시글18','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(19,'게시글19','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(20,'게시글20','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(21,'게시글21','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(22,'게시글22','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(23,'게시글23','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(24,'게시글24','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(25,'게시글25','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(26,'게시글26','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(27,'게시글27','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(28,'게시글28','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(29,'게시글29','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(30,'게시글30','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(31,'게시글31','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(32,'게시글32','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(33,'게시글33','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(34,'게시글34','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(35,'게시글35','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(36,'게시글36','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(37,'게시글37','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(38,'게시글38','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(39,'게시글39','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(40,'게시글40','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(41,'게시글41','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(42,'게시글42','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(43,'게시글43','무궁화꽃이 피었습니다.','park','2023-05-17 09:16:03',0),(44,'게시글44','무궁화꽃이 피었습니다.','test','2023-05-17 09:16:03',0),(47,'강아지를 찾습니다.','강아지를 찾습니다. \r\n찾으시면 000 - 0000 - 0000로 연락주세요.','orage','2023-05-22 16:38:01',0),(56,'연습하기','5월 24일 연습\r\n다운로드, 댓글 입력, 게시글 삭제','lemon','2023-05-24 17:40:41',0),(57,'연습00 000','게시글 삭제000 3333','lemon','2023-05-24 17:40:51',0),(58,'연습2','게시글 삭제2','lemon','2023-05-24 17:41:04',0),(62,'게시글','ㅇㄹㅇ','lemon','2023-05-24 17:53:46',0),(73,'테스트2','테스트','lemon','2023-05-25 13:03:34',0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
