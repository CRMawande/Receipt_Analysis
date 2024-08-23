-- ==================================================
-- Database Setup for Star Schema
-- ==================================================

-- Create the Star Schema Database
CREATE DATABASE StarSchema_Receipt;
USE StarSchema_Receipt;

-- ==================================================
-- Dimension Tables
-- ==================================================

-- Time Dimension Table
CREATE TABLE TimeDimension (
    TimeID INT AUTO_INCREMENT PRIMARY KEY,
    Timestamp DATETIME NOT NULL
);

-- Product Dimension Table
CREATE TABLE ProductDimension (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    ProductType VARCHAR(255) NOT NULL
);

-- Location Dimension Table
CREATE TABLE LocationDimension (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    StoreName VARCHAR(255) NOT NULL,
    StorePhoneNumber VARCHAR(20),
    StoreWebsite VARCHAR(255),
    CustomerCareLine VARCHAR(20),
    StoreVATNumber VARCHAR(20)
);

-- ==================================================
-- Fact Table
-- ==================================================

CREATE TABLE ReceiptPositionFact (
    ReceiptPositionID INT AUTO_INCREMENT PRIMARY KEY,
    TimeID INT NOT NULL,
    ProductID INT NOT NULL,
    LocationID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPricePaidZAR DECIMAL(10, 2) NOT NULL,
    TotalPriceZAR DECIMAL(10, 2) NOT NULL,
    PricePaidZAR DECIMAL(10, 2) NOT NULL,
    PointsEarnedZAR DECIMAL(10, 2) NOT NULL,
    VATAmountZAR DECIMAL(10, 2) NOT NULL,
    DiscountAmountZAR DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (TimeID) REFERENCES TimeDimension(TimeID),
    FOREIGN KEY (ProductID) REFERENCES ProductDimension(ProductID),
    FOREIGN KEY (LocationID) REFERENCES LocationDimension(LocationID)
);

-- ==================================================
-- Inserting Data into Dimension Tables
-- ==================================================

-- Insert Time Data
INSERT INTO TimeDimension (Timestamp) VALUES
('2024-06-01 12:00:00');

-- Insert Product Data
INSERT INTO ProductDimension (ProductName, ProductType) VALUES
('A/SUPER W/W BRWN BRD LOW GI', 'Bread'),
('FULL CREAM MILK 2L', 'Dairy'),
('NO NAME CHOCCHIP BISCUITS 50', 'Snacks'),
('WEET-BIX 900g', 'Cereal'),
('COCA-COLA PLASTIC 2L', 'Beverage'),
('BLK C/CLASSIC B WORS', 'Meat'),
('SHOULDER BACON 200GR', 'Meat'),
('BACK BACON RINDLESS 200g', 'Meat'),
('REG F/S AROMA INDULGENC500ml', 'Beverage'),
('PNP F/C TEEN TITANS YOG 6EA', 'Dairy'),
('BRICK 500g', 'Butter'),
('R/ON BLACK&WHITE POWER 50ml', 'Personal Care'),
('CARRIER BAG 24L', 'Packaging');

-- Insert Location Data
INSERT INTO LocationDimension (StoreName, StorePhoneNumber, StoreWebsite, CustomerCareLine, StoreVATNumber) VALUES
('PnP QualiSave Nkomo Mall', '012 003 2849', 'www.picknpay.co.za', '0860 30 30 30', '4090105588');

-- ==================================================
-- Inserting Data into the Fact Table
-- ==================================================

-- Adjusted Variables
SET @timeID = 1; -- Adjust as needed
SET @locationID = (SELECT LocationID FROM LocationDimension WHERE StoreName = 'PnP QualiSave Nkomo Mall');

-- BRICK 500g
SET @discountAmountBRICK = 20.98;
SET @totalPriceBRICK = 65.98;
SET @pricePaidBRICK = @totalPriceBRICK - @discountAmountBRICK;
SET @pointsEarnedBRICK = (@pricePaidBRICK / 2) / 100;
SET @vatAmountBRICK = (@pricePaidBRICK * 0.15)/1.15;
SET @unitPricePaidBRICK = @pricePaidBRICK / 2;

-- R/ON BLACK&WHITE POWER 50ml
SET @discountAmountR_ON = 8.00;
SET @totalPriceR_ON = 34.99;
SET @pricePaidR_ON = @totalPriceR_ON - @discountAmountR_ON;
SET @pointsEarnedR_ON = (@pricePaidR_ON / 2) / 100;
SET @vatAmountR_ON = (@pricePaidR_ON * 0.15)/1.15;
SET @unitPricePaidR_ON = @pricePaidR_ON / 1;

-- Full Insert Statements for ReceiptPositionFact
INSERT INTO ReceiptPositionFact (TimeID, ProductID, LocationID, Quantity, UnitPricePaidZAR, TotalPriceZAR, PricePaidZAR, PointsEarnedZAR, VATAmountZAR, DiscountAmountZAR) VALUES
-- Product: A/SUPER W/W BRWN BRD LOW GI
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'A/SUPER W/W BRWN BRD LOW GI'), 
 @locationID, 1, 23.99, 23.99, 23.99, (23.99 / 2) / 100, 0.00, 0.00),

-- Product: FULL CREAM MILK 2L
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'FULL CREAM MILK 2L'), 
 @locationID, 1, 29.99, 29.99, 29.99, (29.99 / 2) / 100, 0.00, 0.00),

-- Product: NO NAME CHOCCHIP BISCUITS 50
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'NO NAME CHOCCHIP BISCUITS 50'), 
 @locationID, 1, 29.99, 29.99, 29.99, (29.99 / 2) / 100, (29.99 * 0.15)/1.15, 0.00),

-- Product: WEET-BIX 900g
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'WEET-BIX 900g'), 
 @locationID, 2, 52.99, 105.98, 105.98, (105.98 / 2) / 100, (105.98 * 0.15)/1.15, 0.00),

-- Product: COCA-COLA PLASTIC 2L
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'COCA-COLA PLASTIC 2L'), 
 @locationID, 1, 21.99, 21.99, 21.99, (21.99 / 2) / 100, (21.99 * 0.15)/1.15, 0.00),

-- Product: BLK C/CLASSIC B WORS
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'BLK C/CLASSIC B WORS'), 
 @locationID, 1, 142.11, 142.11, 142.11, (142.11 / 2) / 100, (142.11 * 0.15)/1.15, 0.00),

-- Product: SHOULDER BACON 200GR
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'SHOULDER BACON 200GR'), 
 @locationID, 1, 25.99, 25.99, 25.99, (25.99 / 2) / 100, (25.99 * 0.15)/1.15, 0.00),

-- Product: BACK BACON RINDLESS 200g
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'BACK BACON RINDLESS 200g'), 
 @locationID, 1, 47.99, 47.99, 47.99, (47.99 / 2) / 100, (47.99 * 0.15)/1.15, 0.00),

-- Product: REG F/S AROMA INDULGENC500ml
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'REG F/S AROMA INDULGENC500ml'), 
 @locationID, 1, 27.99, 27.99, 27.99, (27.99 / 2) / 100, (27.99 * 0.15)/1.15, 0.00),

-- Product: PNP F/C TEEN TITANS YOG 6EA
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'PNP F/C TEEN TITANS YOG 6EA'), 
 @locationID, 1, 21.99, 21.99, 21.99, (21.99 / 2) / 100, (21.99 * 0.15)/1.15, 0.00),

-- Product: BRICK 500g
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'BRICK 500g'), 
 @locationID, 2, @unitPricePaidBRICK, @totalPriceBRICK, @pricePaidBRICK, @pointsEarnedBRICK, @vatAmountBRICK, @discountAmountBRICK),

-- Product: R/ON BLACK&WHITE POWER 50ml
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'R/ON BLACK&WHITE POWER 50ml'), 
 @locationID, 1, @unitPricePaidR_ON, @totalPriceR_ON, @pricePaidR_ON, @pointsEarnedR_ON, @vatAmountR_ON, @discountAmountR_ON),

-- Product: CARRIER BAG 24L
(@timeID, (SELECT ProductID FROM ProductDimension WHERE ProductName = 'CARRIER BAG 24L'), 
 @locationID, 1, 1.00, 1.00, 1.00, (1.00 / 2) / 100, (1.00 * 0.15)/1.15, 0.00);
