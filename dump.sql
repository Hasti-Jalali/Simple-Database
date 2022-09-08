-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: DBProject
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Dumping events for database 'DBProject'
--

--
-- Dumping routines for database 'DBProject'
--
/*!50003 DROP FUNCTION IF EXISTS `FNC_CHECK_BLOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_CHECK_BLOCK`(
v_BLOCKED INT,
v_BLOCKER INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE CHECKS INT;
    CASE WHEN EXISTS(SELECT * FROM BLOCK WHERE BLOCKED_USER_ID = v_BLOCKED
        AND BLOCKER_USER_ID = v_BLOCKER)
        THEN SET CHECKS = 1;
        ELSE SET CHECKS = 0;
    END CASE;
    RETURN CHECKS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_CHECK_FOLLOW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_CHECK_FOLLOW`(v_FOLLOWING INT,
v_FOLLOWER INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE CHECKS INT;
    CASE WHEN EXISTS(SELECT * FROM FOLLOW WHERE FOLLOWER_USER_ID = v_FOLLOWER
        AND FOLLOWING_USER_ID = v_FOLLOWING)
        THEN SET CHECKS = 1;
        ELSE SET CHECKS = 0;
    END CASE;
    RETURN CHECKS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_CHECK_PASSWORD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_CHECK_PASSWORD`(v_USERNAME VARCHAR(20),
v_PASSWORD INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE CHECKS INT;
    CASE WHEN EXISTS(SELECT * FROM USER WHERE USERNAME = v_USERNAME
        AND PASSWORD = SHA1(v_PASSWORD))
        THEN SET CHECKS = 1;
        ELSE SET CHECKS = 0;
    END CASE;
    RETURN CHECKS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_HASHTAG_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_HASHTAG_EXISTS`(V_CONTENT VARCHAR(6)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE IS_EXISTS INT;
    CASE WHEN EXISTS(SELECT * FROM HASHTAG WHERE CONTENT = V_CONTENT)
        THEN SET IS_EXISTS = 1;
        ELSE SET IS_EXISTS = 0;
    END CASE;
    RETURN IS_EXISTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_LAST_ENTER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_LAST_ENTER`() RETURNS int
    DETERMINISTIC
BEGIN
    RETURN (SELECT USER_ID FROM ENTRIES
    ORDER BY ENTRY_DATE DESC LIMIT 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_LAST_HASHTAG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_LAST_HASHTAG`() RETURNS int
    DETERMINISTIC
BEGIN
    RETURN (SELECT HASHTAG_ID FROM HASHTAG
    ORDER BY HASHTAG_ID DESC LIMIT 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_LIKE_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_LIKE_EXISTS`(V_AVA_ID INT, V_USER_ID INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE IS_EXISTS INT;
    CASE WHEN EXISTS(SELECT * FROM LIKEING
        WHERE LIKER_USER_ID = V_USER_ID AND LIKED_AVA_ID = V_AVA_ID)
        THEN SET IS_EXISTS = 1;
        ELSE SET IS_EXISTS = 0;
    END CASE;
    RETURN IS_EXISTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FNC_USER_EXISTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_USER_EXISTS`(V_USERNAME VARCHAR(20)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE IS_EXISTS INT;
    CASE WHEN EXISTS(SELECT * FROM USER WHERE USERNAME = V_USERNAME)
        THEN SET IS_EXISTS = 1;
        ELSE SET IS_EXISTS = 0;
    END CASE;
    RETURN IS_EXISTS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_AVAs_SPECIFIC_HASHTAG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_AVAs_SPECIFIC_HASHTAG`(
v_HASHTAG VARCHAR(6)
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(EXISTS(SELECT * FROM HASHTAG WHERE CONTENT = v_HASHTAG)) THEN
        SELECT U.USERNAME, A.CONTENT, A.POSTAGE_DATE FROM AVA_HASHTAG AH
        INNER JOIN AVA A ON A.AVA_ID = AH.AVA_ID
        INNER JOIN USER U ON U.USER_ID = A.USER_ID
        INNER JOIN HASHTAG H ON H.HASHTAG_ID = AH.HASHTAG_ID
        WHERE H.CONTENT = v_HASHTAG AND
        U.USER_ID NOT IN (SELECT BLOCKER_USER_ID FROM BLOCK
        WHERE BLOCKED_USER_ID = v_USER_ID)
        ORDER BY A.POSTAGE_DATE DESC;
    ELSE
        SELECT 'THIS HASHTAG DOES NOT EXIST!' AS ERROR;
    END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_AVA_LIKES_USERNAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_AVA_LIKES_USERNAME`(
v_AVA_ID INT
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    SELECT U1.USERNAME FROM USER U1
    WHERE U1.USER_ID IN (
    SELECT L.LIKER_USER_ID FROM LIKEING L
    INNER JOIN AVA A ON L.LIKED_AVA_ID = A.AVA_ID
    WHERE A.AVA_ID = v_AVA_ID
    AND v_USER_ID NOT IN (SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID = A.USER_ID))
    AND U1.USER_ID NOT IN (SELECT BLOCKER_USER_ID FROM BLOCK WHERE
    BLOCKED_USER_ID = v_USER_ID);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_AVA_LIKE_NUMBER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_AVA_LIKE_NUMBER`(
v_AVA_ID INT
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(EXISTS(SELECT * FROM AVA WHERE AVA_ID = v_AVA_ID)) THEN
        SELECT COUNT(*) FROM LIKEING L
        INNER JOIN AVA A ON L.LIKED_AVA_ID = A.AVA_ID
        WHERE A.AVA_ID = v_AVA_ID
        AND v_USER_ID NOT IN (SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID = A.USER_ID);
    ELSE
        SELECT 'THIS AVA DOES NOT EXIST!' AS ERROR;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_BEST_AVAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_BEST_AVAS`()
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();

    SELECT COUNT(*) LIKES,A.AVA_ID FROM AVA A
    INNER JOIN LIKEING L ON L.LIKED_AVA_ID = A.AVA_ID
    WHERE v_USER_ID NOT IN (SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID = A.USER_ID)
    GROUP BY A.AVA_ID
    UNION
    SELECT 0 LIKES,A.AVA_ID FROM AVA A
    INNER JOIN LIKEING L ON A.AVA_ID NOT IN (SELECT LIKED_AVA_ID FROM LIKEING)
    WHERE v_USER_ID NOT IN (SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID = A.USER_ID)
    GROUP BY A.AVA_ID
    ORDER BY LIKES DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_BLOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_BLOCK`(
    v_BLOCKED_USERNAME VARCHAR(20)
)
BEGIN
    DECLARE v_BLOCKER_ID INT;
    DECLARE v_BLOCKED_ID INT;
    IF(FNC_USER_EXISTS(v_BLOCKED_USERNAME) = 1) THEN
        SET v_BLOCKER_ID = FNC_LAST_ENTER();
        SET v_BLOCKED_ID = (SELECT USER_ID FROM USER WHERE
            USERNAME = v_BLOCKED_USERNAME);
        IF(FNC_CHECK_BLOCK(v_BLOCKED_ID,v_BLOCKER_ID) = 0) THEN
            INSERT INTO BLOCK (BLOCKER_USER_ID, BLOCKED_USER_ID)
            VALUE (v_BLOCKER_ID,v_BLOCKED_ID);
            SELECT 'BLOCKED SUCCESSFULLY!' AS MESSAGE;
        ELSE
            SELECT 'YOU HAVE ALREADY BLOCKED THIS USER!' AS ERROR;
        END IF;
    ELSE
        SELECT 'THIS USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_COMMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_COMMENT`(
v_AVA_ID INT,
v_COMMENT_CONTENT VARCHAR(256)
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(EXISTS(SELECT * FROM AVA WHERE AVA_ID = v_AVA_ID)) THEN
        INSERT INTO AVA (CONTENT, USER_ID, PARENT_AVA_ID)
            SELECT v_COMMENT_CONTENT, v_USER_ID, A.AVA_ID
            FROM  AVA A
            WHERE A.AVA_ID = v_AVA_ID
            AND v_USER_ID NOT IN (
            SELECT B.BLOCKED_USER_ID FROM BLOCK B
            WHERE B.BLOCKER_USER_ID = A.USER_ID
            ) ;
        SELECT 'COMMENTED SUCCESSFULLY!' AS MESSAGE;
    ELSE
        SELECT 'THIS AVA DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_CREATE_AVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_CREATE_AVA`(
v_AVA_CONTENT VARCHAR(256)
)
BEGIN
    DECLARE v_USERNAME VARCHAR(20);
    SET v_USERNAME = (SELECT USERNAME FROM USER WHERE
        USER_ID = FNC_LAST_ENTER());
    INSERT INTO AVA (CONTENT, USER_ID)
    SELECT v_AVA_CONTENT, U.USER_ID FROM USER U
    WHERE U.USERNAME = v_USERNAME;
    commit ;
    SELECT CONCAT('AVA SUCCESSFULLY CREATED BY ', v_USERNAME, '!') AS MESSAGE;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_CREATE_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_CREATE_USER`(
    v_FNAME VARCHAR(20),
    v_LNAME VARCHAR(20),
    v_USERNAME VARCHAR(20),
    v_PASSWORD VARCHAR(20),
    v_BIRTH_DATE varchar(10), -- like 2001-01-25
    v_BIO VARCHAR(64)
)
BEGIN
    if(FNC_USER_EXISTS(v_USERNAME) = 0) THEN
        INSERT INTO USER(FNAME, LNAME, USERNAME, PASSWORD, BIRTH_DATE, BIO, REG_DATE)
        value (v_FNAME,v_LNAME, v_USERNAME, sha1(v_PASSWORD),TIMESTAMP(v_BIRTH_DATE) ,v_BIO, NULL);
        SELECT 'SUCCESSFULLY CREATED!' AS MESSAGE;
    ELSE
        SELECT 'THIS USERNAME EXISTS' AS ERROR;
    END IF;
    commit ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_FOLLOW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_FOLLOW`(
    v_FOLLOWING_USERNAME VARCHAR(20)
)
BEGIN

    DECLARE v_FOLLOWER_ID INT;
    DECLARE v_FOLLOWING_ID INT;
    IF(FNC_USER_EXISTS(v_FOLLOWING_USERNAME) = 1) THEN
        SET v_FOLLOWER_ID = FNC_LAST_ENTER();
        SET v_FOLLOWING_ID = (SELECT USER_ID FROM USER WHERE
            USERNAME = v_FOLLOWING_USERNAME);
        IF(FNC_CHECK_FOLLOW(v_FOLLOWING_ID,v_FOLLOWER_ID) = 0) THEN
            INSERT INTO FOLLOW (FOLLOWER_USER_ID, FOLLOWING_USER_ID)
            VALUE(v_FOLLOWER_ID,v_FOLLOWING_ID);
            SELECT 'FOLLOWED SUCCESSFULLY!' AS MESSAGE;
        ELSE
            SELECT 'YOU HAVE ALREADY FOLLOWED THIS USER!' AS ERROR;
        END IF;
    ELSE
        SELECT 'THIS USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_FOLLOWING_AVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_FOLLOWING_AVA`()
BEGIN
    DECLARE v_FOLLOWER_ID INT;
    SET v_FOLLOWER_ID = FNC_LAST_ENTER();
    SELECT U.USERNAME FOLLOWING , A.CONTENT AVA , A.POSTAGE_DATE FROM AVA A
    INNER JOIN FOLLOW F
    ON A.USER_ID = F.FOLLOWING_USER_ID
    INNER JOIN USER U ON
    A.USER_ID = U.USER_ID
    WHERE F.FOLLOWER_USER_ID = v_FOLLOWER_ID
    AND A.PARENT_AVA_ID IS NULL
    AND F.FOLLOWER_USER_ID NOT IN
    (SELECT BLOCKED_USER_ID FROM BLOCK B WHERE A.USER_ID = B.BLOCKER_USER_ID)
    ORDER BY A.POSTAGE_DATE DESC;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_GET_COMMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_GET_COMMENT`(
v_AVA_ID INT
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(EXISTS(SELECT * FROM AVA WHERE AVA_ID = v_AVA_ID)) THEN
        SELECT A.CONTENT, U.USERNAME, A.POSTAGE_DATE FROM AVA A
        INNER JOIN USER U ON U.USER_ID = A.USER_ID
        WHERE A.PARENT_AVA_ID = v_AVA_ID
        AND not EXISTS (SELECT USER_ID FROM USER
        WHERE USER_ID = v_USER_ID AND USER_ID IN
        (SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID IN
        (SELECT USER_ID FROM AVA WHERE AVA_ID = v_AVA_ID)))
        AND A.USER_ID NOT IN (SELECT BLOCKER_USER_ID FROM BLOCK WHERE
        BLOCKED_USER_ID = v_USER_ID);
    ELSE
        SELECT 'THIS AVA DOES NOT EXIST!' AS ERROR;
    END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_GET_MESSAGES_OF_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_GET_MESSAGES_OF_USER`(
v_TRANSMITTER_USERNAME VARCHAR(20)
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(FNC_USER_EXISTS(v_TRANSMITTER_USERNAME) = 1) THEN
        SELECT
        CASE WHEN IS_AVA = TRUE THEN CONCAT('AVA IS : ' ,(SELECT CONTENT FROM AVA A WHERE M.AVA_ID = A.AVA_ID))
            WHEN IS_AVA = FALSE THEN TEXT
            END AS MESSAGE_CONTENT_OR_AVA_CONTENT, POSTAGE_DATE
        FROM MESSAGE M
        INNER JOIN USER U1 ON U1.USER_ID = TRANSMITTER_USER_ID
        WHERE U1.USERNAME = v_TRANSMITTER_USERNAME AND
               RECIPIENT_USER_ID = v_USER_ID AND
        CASE WHEN IS_AVA THEN v_USER_ID NOT IN (SELECT BLOCKED_USER_ID FROM BLOCK WHERE
            BLOCKER_USER_ID IN (SELECT USER_ID FROM AVA A WHERE A.AVA_ID = M.AVA_ID))
            ELSE TRUE
        END;
    ELSE
        SELECT 'TRANSMITTER USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_GET_PERSONAL_AVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_GET_PERSONAL_AVA`(
)
BEGIN
    DECLARE v_USERNAME VARCHAR(20);
    SET v_USERNAME = (SELECT USERNAME FROM USER WHERE
        USER_ID = FNC_LAST_ENTER());
    SELECT U.USERNAME, A.CONTENT, A.POSTAGE_DATE FROM AVA A
    INNER JOIN USER U ON U.USER_ID = A.USER_ID
    WHERE U.USERNAME = v_USERNAME
    ORDER BY A.POSTAGE_DATE DESC;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_GET_TRANSMITTER_MESSAGE_USERNAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_GET_TRANSMITTER_MESSAGE_USERNAME`()
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();

    SELECT U.USERNAME , MAX(POSTAGE_DATE) AS POSTAGE_DATE
    FROM MESSAGE M
    INNER JOIN USER U ON U.USER_ID = M.TRANSMITTER_USER_ID
    WHERE RECIPIENT_USER_ID = v_USER_ID AND
    CASE WHEN IS_AVA THEN RECIPIENT_USER_ID NOT IN (SELECT BLOCKED_USER_ID FROM BLOCK WHERE
    BLOCKER_USER_ID IN (SELECT USER_ID FROM AVA A WHERE A.AVA_ID = M.AVA_ID))
    ELSE TRUE
    END
    GROUP BY U.USERNAME
    ORDER BY POSTAGE_DATE DESC;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_LIKE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_LIKE`(
v_AVA_ID INT
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(EXISTS(SELECT * FROM AVA WHERE AVA_ID = v_AVA_ID)) THEN
        IF(FNC_LIKE_EXISTS(v_AVA_ID,v_USER_ID) = 0) THEN
            INSERT INTO LIKEING (LIKER_USER_ID, LIKED_AVA_ID)
            SELECT v_USER_ID, A.AVA_ID FROM AVA A
            WHERE A.AVA_ID = v_AVA_ID
            AND v_USER_ID NOT IN (
            SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID = A.USER_ID);
            SELECT 'LIKED SUCCESSFULLY!' AS MESSAGE;
        ELSE
            SELECT 'YOU HAVE ALREADY LIKED THIS AVA!' AS ERROR;
        END IF;
    ELSE
        SELECT 'THIS AVA DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_LOG_IN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_LOG_IN`(
v_USERNAME VARCHAR(20),
v_PASSWORD VARCHAR(20)
)
BEGIN
    IF(FNC_USER_EXISTS(v_USERNAME) = 1) THEN
        IF(FNC_CHECK_PASSWORD(v_USERNAME,v_PASSWORD)) THEN
            INSERT INTO ENTRIES (`USER_ID`)
            SELECT USER_ID FROM USER U
            WHERE U.USERNAME = v_USERNAME AND U.PASSWORD = SHA1(v_PASSWORD);
            SELECT 'SUCCESSFULLY LOGIN!' AS MESSAGE;
        ELSE
            SELECT 'WRONG PASSWORD!' AS ERROR;
        END IF;
    ELSE
        SELECT 'THIS USERNAME DOES NOT EXIST' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_LOG_INS_CHECK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_LOG_INS_CHECK`(
v_USERNAME VARCHAR(20)
)
BEGIN
    IF(FNC_USER_EXISTS(v_USERNAME) = 1) THEN
        SELECT U.USERNAME , ENTRY_DATE FROM ENTRIES E
        INNER JOIN USER U ON U.USER_ID = E.USER_ID
        WHERE U.USERNAME = v_USERNAME
    ORDER BY ENTRY_DATE DESC;
    ELSE
        SELECT 'THIS USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_SEND_MESSAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_SEND_MESSAGE`(
v_IS_AVA BOOL,
v_RECIPIENT_USERNAME VARCHAR(20),
v_AVA_ID INT,
v_TEXT VARCHAR(256)
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    IF(v_IS_AVA AND NOT(EXISTS(SELECT * FROM AVA WHERE AVA_ID = v_AVA_ID))) THEN
        SELECT 'THIS AVA DOES NOT EXIST!' AS ERROR;
    end if;
    IF(FNC_USER_EXISTS(v_RECIPIENT_USERNAME) = 1) THEN
        INSERT INTO MESSAGE (IS_AVA, TRANSMITTER_USER_ID, RECIPIENT_USER_ID, AVA_ID, TEXT)
        SELECT v_IS_AVA, v_USER_ID, U.USER_ID, IF(v_IS_AVA,v_AVA_ID,NULL) , IF(v_IS_AVA, NULL, v_TEXT)
        FROM  USER U
        WHERE U.USERNAME = v_RECIPIENT_USERNAME
        AND
        CASE
            WHEN v_IS_AVA = TRUE THEN v_USER_ID NOT IN(
                SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID IN (
                SELECT USER_ID FROM AVA WHERE AVA_ID = v_AVA_ID))
            ELSE TRUE
        END
        AND v_USER_ID NOT IN (
        SELECT BLOCKED_USER_ID FROM BLOCK WHERE BLOCKER_USER_ID = U.USER_ID);

        SELECT 'MESSAGE SENT SUCCESSFULLY!' AS MESSAGE;
    ELSE
        SELECT 'RECIPIENT USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_SPECIFIC_USER_AVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_SPECIFIC_USER_AVA`(
v_SOME_USERNAME VARCHAR(20)
)
BEGIN
    DECLARE v_USER_ID INT;
    SET v_USER_ID = FNC_LAST_ENTER();
    SELECT U.USERNAME, A.CONTENT, A.POSTAGE_DATE FROM AVA A
    INNER JOIN USER U ON
    U.USER_ID = A.USER_ID
    WHERE U.USERNAME = v_SOME_USERNAME
    AND A.USER_ID NOT IN (
    SELECT BLOCKER_USER_ID FROM BLOCK B
    WHERE B.BLOCKED_USER_ID = v_USER_ID
    )
    AND A.PARENT_AVA_ID IS NULL
    ORDER BY A.POSTAGE_DATE DESC;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_UNBLOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_UNBLOCK`(
    v_BLOCKED_USERNAME VARCHAR(20)
)
BEGIN
    DECLARE v_BLOCKER_ID INT;
    DECLARE v_BLOCKED_ID INT;
    IF(FNC_USER_EXISTS(v_BLOCKED_USERNAME) = 1) THEN
    SET v_BLOCKER_ID = FNC_LAST_ENTER();
    SET v_BLOCKED_ID = (SELECT USER_ID FROM USER WHERE
        USERNAME = v_BLOCKED_USERNAME);
    IF(FNC_CHECK_BLOCK(v_BLOCKED_ID,v_BLOCKER_ID) = 1) THEN
        DELETE FROM BLOCK B
        WHERE B.BLOCKER_USER_ID = v_BLOCKER_ID AND
              B.BLOCKED_USER_ID = v_BLOCKED_ID;
        SELECT 'UNBLOCKED SUCCESSFULLY!' AS MESSAGE;
    ELSE
        SELECT 'YOU HAVEN\'T BLOCKED THIS USER!' AS ERROR;
    END IF;
    ELSE
        SELECT 'THIS USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_UNFOLLOW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PRC_UNFOLLOW`(
    v_FOLLOWING_USERNAME VARCHAR(20)
)
BEGIN
    DECLARE v_FOLLOWER_ID INT;
    DECLARE v_FOLLOWING_ID INT;
    IF(FNC_USER_EXISTS(v_FOLLOWING_USERNAME) = 1) THEN
        SET v_FOLLOWER_ID = FNC_LAST_ENTER();
        SET v_FOLLOWING_ID = (SELECT USER_ID FROM USER WHERE
            USERNAME = v_FOLLOWING_USERNAME);
        IF(FNC_CHECK_FOLLOW(v_FOLLOWING_ID,v_FOLLOWER_ID) = 1) THEN
            DELETE FROM FOLLOW F
            WHERE F.FOLLOWING_USER_ID = v_FOLLOWING_ID AND
                  F.FOLLOWER_USER_ID = v_FOLLOWER_ID;
            SELECT 'UNFOLLOWED SUCCESSFULLY!' AS MESSAGE;
        ELSE
            SELECT 'YOU HAVEN\'T FOLLOWED THIS USER!' AS ERROR;
        END IF;
    ELSE
        SELECT 'THIS USERNAME DOES NOT EXIST!' AS ERROR;
    END IF;
    commit ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-16 18:52:31
