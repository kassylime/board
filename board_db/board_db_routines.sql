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
-- Temporary view structure for view `rlist`
--

DROP TABLE IF EXISTS `rlist`;
/*!50001 DROP VIEW IF EXISTS `rlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rlist` AS SELECT 
 1 AS `R_BNUM`,
 1 AS `R_NUM`,
 1 AS `R_CONTENTS`,
 1 AS `R_DATE`,
 1 AS `R_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `minfo`
--

DROP TABLE IF EXISTS `minfo`;
/*!50001 DROP VIEW IF EXISTS `minfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `minfo` AS SELECT 
 1 AS `M_ID`,
 1 AS `M_NAME`,
 1 AS `M_POINT`,
 1 AS `G_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `blist`
--

DROP TABLE IF EXISTS `blist`;
/*!50001 DROP VIEW IF EXISTS `blist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `blist` AS SELECT 
 1 AS `B_NUM`,
 1 AS `B_TITLE`,
 1 AS `B_CONTENTS`,
 1 AS `B_ID`,
 1 AS `M_NAME`,
 1 AS `B_DATE`,
 1 AS `B_VIEWS`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `rlist`
--

/*!50001 DROP VIEW IF EXISTS `rlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`buser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `rlist` AS select `reply`.`R_BNUM` AS `R_BNUM`,`reply`.`R_NUM` AS `R_NUM`,`reply`.`R_CONTENTS` AS `R_CONTENTS`,`reply`.`R_DATE` AS `R_DATE`,`reply`.`R_ID` AS `R_ID` from `reply` order by `reply`.`R_DATE` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `minfo`
--

/*!50001 DROP VIEW IF EXISTS `minfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`buser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `minfo` AS select `m`.`M_ID` AS `M_ID`,`m`.`M_NAME` AS `M_NAME`,`m`.`M_POINT` AS `M_POINT`,`g`.`G_NAME` AS `G_NAME` from (`member` `m` join `grade` `g` on((`m`.`M_POINT` between `g`.`G_LOWPOINT` and `g`.`G_HIGHPOINT`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `blist`
--

/*!50001 DROP VIEW IF EXISTS `blist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`buser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `blist` AS select `b`.`B_NUM` AS `B_NUM`,`b`.`B_TITLE` AS `B_TITLE`,`b`.`B_CONTENTS` AS `B_CONTENTS`,`b`.`B_ID` AS `B_ID`,`m`.`M_NAME` AS `M_NAME`,`b`.`B_DATE` AS `B_DATE`,`b`.`B_VIEWS` AS `B_VIEWS` from (`board` `b` join `member` `m` on((`b`.`B_ID` = `m`.`M_ID`))) order by `b`.`B_DATE` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 15:08:12
