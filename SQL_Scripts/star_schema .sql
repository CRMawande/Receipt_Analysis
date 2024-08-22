CREATE DATABASE  IF NOT EXISTS `starschema_receipt` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `starschema_receipt`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: starschema_receipt
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
-- Table structure for table `cashierdimension`
--

DROP TABLE IF EXISTS `cashierdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashierdimension` (
  `CashierID` int NOT NULL AUTO_INCREMENT,
  `CashierName` varchar(255) NOT NULL,
  PRIMARY KEY (`CashierID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datedimension`
--

DROP TABLE IF EXISTS `datedimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datedimension` (
  `DateID` int NOT NULL AUTO_INCREMENT,
  `Timestamp` datetime NOT NULL,
  PRIMARY KEY (`DateID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discountdimension`
--

DROP TABLE IF EXISTS `discountdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discountdimension` (
  `DiscountID` int NOT NULL AUTO_INCREMENT,
  `DiscountDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locationdimension`
--

DROP TABLE IF EXISTS `locationdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationdimension` (
  `LocationID` int NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(255) NOT NULL,
  `StorePhoneNumber` varchar(20) DEFAULT NULL,
  `StoreWebsite` varchar(255) DEFAULT NULL,
  `CustomerCareLine` varchar(20) DEFAULT NULL,
  `StoreVATNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentdimension`
--

DROP TABLE IF EXISTS `paymentdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentdimension` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `performancesummary`
--

DROP TABLE IF EXISTS `performancesummary`;
/*!50001 DROP VIEW IF EXISTS `performancesummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `performancesummary` AS SELECT 
 1 AS `TotalSalesAmountZAR`,
 1 AS `TotalDiscountGivenZAR`,
 1 AS `TotalPointsEarnedZAR`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productdimension`
--

DROP TABLE IF EXISTS `productdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdimension` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `ProductType` varchar(255) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salesfact`
--

DROP TABLE IF EXISTS `salesfact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesfact` (
  `SalesID` int NOT NULL AUTO_INCREMENT,
  `DateID` int NOT NULL,
  `ProductID` int NOT NULL,
  `CashierID` int NOT NULL,
  `PaymentID` int NOT NULL,
  `LocationID` int NOT NULL,
  `DiscountID` int DEFAULT NULL,
  `SmartShopperID` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `UnitPricePaidZAR` decimal(10,2) NOT NULL,
  `TotalPriceZAR` decimal(10,2) NOT NULL,
  `PricePaidZAR` decimal(10,2) NOT NULL,
  `PointsEarnedZAR` decimal(10,2) NOT NULL,
  `VATAmountZAR` decimal(10,2) NOT NULL,
  `DiscountAmountZAR` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SalesID`),
  KEY `DateID` (`DateID`),
  KEY `ProductID` (`ProductID`),
  KEY `CashierID` (`CashierID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `LocationID` (`LocationID`),
  KEY `DiscountID` (`DiscountID`),
  KEY `SmartShopperID` (`SmartShopperID`),
  CONSTRAINT `salesfact_ibfk_1` FOREIGN KEY (`DateID`) REFERENCES `datedimension` (`DateID`),
  CONSTRAINT `salesfact_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `productdimension` (`ProductID`),
  CONSTRAINT `salesfact_ibfk_3` FOREIGN KEY (`CashierID`) REFERENCES `cashierdimension` (`CashierID`),
  CONSTRAINT `salesfact_ibfk_4` FOREIGN KEY (`PaymentID`) REFERENCES `paymentdimension` (`PaymentID`),
  CONSTRAINT `salesfact_ibfk_5` FOREIGN KEY (`LocationID`) REFERENCES `locationdimension` (`LocationID`),
  CONSTRAINT `salesfact_ibfk_6` FOREIGN KEY (`DiscountID`) REFERENCES `discountdimension` (`DiscountID`),
  CONSTRAINT `salesfact_ibfk_7` FOREIGN KEY (`SmartShopperID`) REFERENCES `smartshopperdimension` (`SmartShopperID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smartshopperdimension`
--

DROP TABLE IF EXISTS `smartshopperdimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartshopperdimension` (
  `SmartShopperID` int NOT NULL AUTO_INCREMENT,
  `CardNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`SmartShopperID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `smartshopperpointsanalysis`
--

DROP TABLE IF EXISTS `smartshopperpointsanalysis`;
/*!50001 DROP VIEW IF EXISTS `smartshopperpointsanalysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `smartshopperpointsanalysis` AS SELECT 
 1 AS `SmartShopperID`,
 1 AS `TotalTransactions`,
 1 AS `TotalSalesAmountZAR`,
 1 AS `TotalPointsEarnedZAR`,
 1 AS `PointsEarnedPercentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vatsummary`
--

DROP TABLE IF EXISTS `vatsummary`;
/*!50001 DROP VIEW IF EXISTS `vatsummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vatsummary` AS SELECT 
 1 AS `ProductName`,
 1 AS `TotalQuantitySold`,
 1 AS `TotalSalesAmountZAR`,
 1 AS `TotalVATCollectedZAR`,
 1 AS `VATPercentageOfTotalSales`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `performancesummary`
--

/*!50001 DROP VIEW IF EXISTS `performancesummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `performancesummary` AS select sum(`sf`.`PricePaidZAR`) AS `TotalSalesAmountZAR`,sum(`sf`.`DiscountAmountZAR`) AS `TotalDiscountGivenZAR`,sum(`sf`.`PointsEarnedZAR`) AS `TotalPointsEarnedZAR` from `salesfact` `sf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smartshopperpointsanalysis`
--

/*!50001 DROP VIEW IF EXISTS `smartshopperpointsanalysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smartshopperpointsanalysis` AS select `s`.`SmartShopperID` AS `SmartShopperID`,count(`sf`.`SalesID`) AS `TotalTransactions`,sum(`sf`.`PricePaidZAR`) AS `TotalSalesAmountZAR`,sum(`sf`.`PointsEarnedZAR`) AS `TotalPointsEarnedZAR`,((sum(`sf`.`PointsEarnedZAR`) / sum(`sf`.`TotalPriceZAR`)) * 100) AS `PointsEarnedPercentage` from (`salesfact` `sf` join `smartshopperdimension` `s` on((`sf`.`SmartShopperID` = `s`.`SmartShopperID`))) group by `s`.`SmartShopperID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vatsummary`
--

/*!50001 DROP VIEW IF EXISTS `vatsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vatsummary` AS select `p`.`ProductName` AS `ProductName`,sum(`sf`.`Quantity`) AS `TotalQuantitySold`,sum(`sf`.`PricePaidZAR`) AS `TotalSalesAmountZAR`,sum(`sf`.`VATAmountZAR`) AS `TotalVATCollectedZAR`,((sum(`sf`.`VATAmountZAR`) / sum(`sf`.`TotalPriceZAR`)) * 100) AS `VATPercentageOfTotalSales` from (`salesfact` `sf` join `productdimension` `p` on((`sf`.`ProductID` = `p`.`ProductID`))) group by `p`.`ProductName` */;
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

-- Dump completed on 2024-08-22 20:13:56
