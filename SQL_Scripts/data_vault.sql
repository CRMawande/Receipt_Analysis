CREATE DATABASE  IF NOT EXISTS `datavault_receipt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `datavault_receipt`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datavault_receipt
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cashierhub`
--

DROP TABLE IF EXISTS `cashierhub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashierhub` (
  `CashierID` int NOT NULL AUTO_INCREMENT,
  `CashierKey` varchar(255) NOT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`CashierID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashiersat`
--

DROP TABLE IF EXISTS `cashiersat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashiersat` (
  `CashierID` int NOT NULL,
  `CashierName` varchar(255) NOT NULL,
  `LoadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`CashierID`,`LoadDate`),
  CONSTRAINT `cashiersat_ibfk_1` FOREIGN KEY (`CashierID`) REFERENCES `cashierhub` (`CashierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discounthub`
--

DROP TABLE IF EXISTS `discounthub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounthub` (
  `DiscountID` int NOT NULL AUTO_INCREMENT,
  `DiscountKey` varchar(255) NOT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `discountimpact`
--

DROP TABLE IF EXISTS `discountimpact`;
/*!50001 DROP VIEW IF EXISTS `discountimpact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `discountimpact` AS SELECT 
 1 AS `DiscountDescription`,
 1 AS `TotalTransactions`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `discountsat`
--

DROP TABLE IF EXISTS `discountsat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountsat` (
  `DiscountID` int NOT NULL,
  `DiscountDescription` varchar(255) NOT NULL,
  `LoadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`DiscountID`,`LoadDate`),
  CONSTRAINT `discountsat_ibfk_1` FOREIGN KEY (`DiscountID`) REFERENCES `discounthub` (`DiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locationhub`
--

DROP TABLE IF EXISTS `locationhub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationhub` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `LocationKey` varchar(255) NOT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locationsat`
--

DROP TABLE IF EXISTS `locationsat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationsat` (
  `LocationID` int NOT NULL,
  `StoreName` varchar(255) NOT NULL,
  `StorePhoneNumber` varchar(20) DEFAULT NULL,
  `StoreWebsite` varchar(255) DEFAULT NULL,
  `CustomerCareLine` varchar(20) DEFAULT NULL,
  `StoreVATNumber` varchar(20) DEFAULT NULL,
  `LoadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`LocationID`,`LoadDate`),
  CONSTRAINT `locationsat_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `locationhub` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymenthub`
--

DROP TABLE IF EXISTS `paymenthub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenthub` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `PaymentKey` varchar(255) NOT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentsat`
--

DROP TABLE IF EXISTS `paymentsat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentsat` (
  `PaymentID` int NOT NULL,
  `PaymentType` varchar(255) NOT NULL,
  `LoadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`,`LoadDate`),
  CONSTRAINT `paymentsat_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `paymenthub` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producthub`
--

DROP TABLE IF EXISTS `producthub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producthub` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductKey` varchar(255) NOT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `productsalessummary`
--

DROP TABLE IF EXISTS `productsalessummary`;
/*!50001 DROP VIEW IF EXISTS `productsalessummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productsalessummary` AS SELECT 
 1 AS `ProductName`,
 1 AS `ProductType`,
 1 AS `TotalTransactions`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productsat`
--

DROP TABLE IF EXISTS `productsat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsat` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `ProductType` varchar(255) NOT NULL,
  `LoadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`ProductID`,`LoadDate`),
  CONSTRAINT `productsat_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `producthub` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saleslink`
--

DROP TABLE IF EXISTS `saleslink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saleslink` (
  `SalesID` int NOT NULL AUTO_INCREMENT,
  `DateID` int NOT NULL,
  `ProductID` int NOT NULL,
  `CashierID` int NOT NULL,
  `PaymentID` int NOT NULL,
  `LocationID` int NOT NULL,
  `DiscountID` int DEFAULT NULL,
  `SmartShopperID` int DEFAULT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`SalesID`),
  KEY `ProductID` (`ProductID`),
  KEY `CashierID` (`CashierID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `LocationID` (`LocationID`),
  KEY `DiscountID` (`DiscountID`),
  KEY `SmartShopperID` (`SmartShopperID`),
  CONSTRAINT `saleslink_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `producthub` (`ProductID`),
  CONSTRAINT `saleslink_ibfk_2` FOREIGN KEY (`CashierID`) REFERENCES `cashierhub` (`CashierID`),
  CONSTRAINT `saleslink_ibfk_3` FOREIGN KEY (`PaymentID`) REFERENCES `paymenthub` (`PaymentID`),
  CONSTRAINT `saleslink_ibfk_4` FOREIGN KEY (`LocationID`) REFERENCES `locationhub` (`LocationID`),
  CONSTRAINT `saleslink_ibfk_5` FOREIGN KEY (`DiscountID`) REFERENCES `discounthub` (`DiscountID`),
  CONSTRAINT `saleslink_ibfk_6` FOREIGN KEY (`SmartShopperID`) REFERENCES `smartshopperhub` (`SmartShopperID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smartshopperhub`
--

DROP TABLE IF EXISTS `smartshopperhub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartshopperhub` (
  `SmartShopperID` int NOT NULL AUTO_INCREMENT,
  `SmartShopperKey` varchar(255) NOT NULL,
  `LoadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`SmartShopperID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `smartshopperpointssummary`
--

DROP TABLE IF EXISTS `smartshopperpointssummary`;
/*!50001 DROP VIEW IF EXISTS `smartshopperpointssummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `smartshopperpointssummary` AS SELECT 
 1 AS `CardNumber`,
 1 AS `TotalTransactions`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `smartshoppersat`
--

DROP TABLE IF EXISTS `smartshoppersat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartshoppersat` (
  `SmartShopperID` int NOT NULL,
  `CardNumber` varchar(20) NOT NULL,
  `LoadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordSource` varchar(255) NOT NULL,
  PRIMARY KEY (`SmartShopperID`,`LoadDate`),
  CONSTRAINT `smartshoppersat_ibfk_1` FOREIGN KEY (`SmartShopperID`) REFERENCES `smartshopperhub` (`SmartShopperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `discountimpact`
--

/*!50001 DROP VIEW IF EXISTS `discountimpact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `discountimpact` AS select `ds`.`DiscountDescription` AS `DiscountDescription`,count(`sl`.`SalesID`) AS `TotalTransactions` from (`saleslink` `sl` join `discountsat` `ds` on((`sl`.`DiscountID` = `ds`.`DiscountID`))) group by `ds`.`DiscountDescription` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productsalessummary`
--

/*!50001 DROP VIEW IF EXISTS `productsalessummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productsalessummary` AS select `ps`.`ProductName` AS `ProductName`,`ps`.`ProductType` AS `ProductType`,count(`sl`.`SalesID`) AS `TotalTransactions` from (`saleslink` `sl` join `productsat` `ps` on((`sl`.`ProductID` = `ps`.`ProductID`))) group by `ps`.`ProductName`,`ps`.`ProductType` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smartshopperpointssummary`
--

/*!50001 DROP VIEW IF EXISTS `smartshopperpointssummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smartshopperpointssummary` AS select `ss`.`CardNumber` AS `CardNumber`,count(`sl`.`SalesID`) AS `TotalTransactions` from (`saleslink` `sl` join `smartshoppersat` `ss` on((`sl`.`SmartShopperID` = `ss`.`SmartShopperID`))) group by `ss`.`CardNumber` */;
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

-- Dump completed on 2024-08-22 20:27:59
