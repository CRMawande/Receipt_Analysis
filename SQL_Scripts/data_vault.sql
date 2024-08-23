-- ==================================================
-- Database Setup for Data Vault
-- ==================================================

-- Create the Data Vault Database
CREATE DATABASE DataVault_Receipt;
USE DataVault_Receipt;

-- ==================================================
-- Hubs
-- ==================================================

-- Hub_Product: Stores unique product identifiers
CREATE TABLE Hub_Product (
    ProductKey INT AUTO_INCREMENT PRIMARY KEY,
    ProductID VARCHAR(255) NOT NULL, -- Natural Key (e.g., Product Name)
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255)
);

-- Hub_Time: Stores unique time identifiers
CREATE TABLE Hub_Time (
    TimeKey INT AUTO_INCREMENT PRIMARY KEY,
    DateID DATE NOT NULL, -- Natural Key (e.g., YYYY-MM-DD)
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255)
);

-- Hub_Location: Stores unique location identifiers
CREATE TABLE Hub_Location (
    LocationKey INT AUTO_INCREMENT PRIMARY KEY,
    StoreName VARCHAR(255) NOT NULL, -- Natural Key (e.g., Store Name)
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255)
);

-- ==================================================
-- Links
-- ==================================================

-- Link_ReceiptPosition: Connects the product, time, and location Hubs with the transactional fact
CREATE TABLE Link_ReceiptPosition (
    ReceiptPositionKey INT AUTO_INCREMENT PRIMARY KEY,
    ProductKey INT NOT NULL,
    TimeKey INT NOT NULL,
    LocationKey INT NOT NULL,
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255),
    FOREIGN KEY (ProductKey) REFERENCES Hub_Product(ProductKey),
    FOREIGN KEY (TimeKey) REFERENCES Hub_Time(TimeKey),
    FOREIGN KEY (LocationKey) REFERENCES Hub_Location(LocationKey)
);

-- ==================================================
-- Satellites
-- ==================================================

-- Sat_Product: Stores descriptive attributes for products
CREATE TABLE Sat_Product (
    ProductKey INT NOT NULL,
    ProductName VARCHAR(255),
    ProductType VARCHAR(255),
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255),
    FOREIGN KEY (ProductKey) REFERENCES Hub_Product(ProductKey)
);

-- Sat_Time: Stores descriptive attributes for time
CREATE TABLE Sat_Time (
    TimeKey INT NOT NULL,
    Timestamp DATETIME,
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255),
    FOREIGN KEY (TimeKey) REFERENCES Hub_Time(TimeKey)
);

-- Sat_Location: Stores descriptive attributes for location
CREATE TABLE Sat_Location (
    LocationKey INT NOT NULL,
    StorePhoneNumber VARCHAR(20),
    StoreWebsite VARCHAR(255),
    CustomerCareLine VARCHAR(20),
    StoreVATNumber VARCHAR(20),
    LoadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RecordSource VARCHAR(255),
    FOREIGN KEY (LocationKey) REFERENCES Hub_Location(LocationKey)
);

-- ==================================================
-- Inserting Data
-- ==================================================

-- Insert into Hub_Product
INSERT INTO Hub_Product (ProductID, RecordSource) VALUES
('A/SUPER W/W BRWN BRD LOW GI', 'Receipt Data'),
('FULL CREAM MILK 2L', 'Receipt Data'),
('NO NAME CHOCCHIP BISCUITS 50', 'Receipt Data'),
('WEET-BIX 900g', 'Receipt Data'),
('COCA-COLA PLASTIC 2L', 'Receipt Data'),
('BLK C/CLASSIC B WORS', 'Receipt Data'),
('SHOULDER BACON 200GR', 'Receipt Data'),
('BACK BACON RINDLESS 200g', 'Receipt Data'),
('REG F/S AROMA INDULGENC500ml', 'Receipt Data'),
('PNP F/C TEEN TITANS YOG 6EA', 'Receipt Data'),
('BRICK 500g', 'Receipt Data'),
('R/ON BLACK&WHITE POWER 50ml', 'Receipt Data'),
('CARRIER BAG 24L', 'Receipt Data');

-- Insert into Hub_Time
INSERT INTO Hub_Time (DateID, RecordSource) VALUES
('2024-06-01', 'Receipt Data');

-- Insert into Hub_Location
INSERT INTO Hub_Location (StoreName, RecordSource) VALUES
('PnP QualiSave Nkomo Mall', 'Receipt Data');

-- Insert into Link_ReceiptPosition
INSERT INTO Link_ReceiptPosition (ProductKey, TimeKey, LocationKey, RecordSource) VALUES
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'A/SUPER W/W BRWN BRD LOW GI'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'FULL CREAM MILK 2L'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'NO NAME CHOCCHIP BISCUITS 50'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'WEET-BIX 900g'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'COCA-COLA PLASTIC 2L'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'BLK C/CLASSIC B WORS'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'SHOULDER BACON 200GR'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'BACK BACON RINDLESS 200g'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'REG F/S AROMA INDULGENC500ml'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'PNP F/C TEEN TITANS YOG 6EA'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'BRICK 500g'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'R/ON BLACK&WHITE POWER 50ml'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'CARRIER BAG 24L'),
 (SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'),
 (SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 'Receipt Data');

-- Insert into Sat_Product
INSERT INTO Sat_Product (ProductKey, ProductName, ProductType, RecordSource) VALUES
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'A/SUPER W/W BRWN BRD LOW GI'),
 'A/SUPER W/W BRWN BRD LOW GI', 'Bread', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'FULL CREAM MILK 2L'),
 'FULL CREAM MILK 2L', 'Dairy', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'NO NAME CHOCCHIP BISCUITS 50'),
 'NO NAME CHOCCHIP BISCUITS 50', 'Snacks', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'WEET-BIX 900g'),
 'WEET-BIX 900g', 'Cereal', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'COCA-COLA PLASTIC 2L'),
 'COCA-COLA PLASTIC 2L', 'Beverage', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'BLK C/CLASSIC B WORS'),
 'BLK C/CLASSIC B WORS', 'Meat', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'SHOULDER BACON 200GR'),
 'SHOULDER BACON 200GR', 'Meat', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'BACK BACON RINDLESS 200g'),
 'BACK BACON RINDLESS 200g', 'Meat', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'REG F/S AROMA INDULGENC500ml'),
 'REG F/S AROMA INDULGENC500ml', 'Beverage', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'PNP F/C TEEN TITANS YOG 6EA'),
 'PNP F/C TEEN TITANS YOG 6EA', 'Dairy', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'BRICK 500g'),
 'BRICK 500g', 'Bread', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'R/ON BLACK&WHITE POWER 50ml'),
 'R/ON BLACK&WHITE POWER 50ml', 'Health & Beauty', 'Receipt Data'),
((SELECT ProductKey FROM Hub_Product WHERE ProductID = 'CARRIER BAG 24L'),
 'CARRIER BAG 24L', 'Packaging', 'Receipt Data');

-- Insert into Sat_Time
INSERT INTO Sat_Time (TimeKey, Timestamp, RecordSource) VALUES
((SELECT TimeKey FROM Hub_Time WHERE DateID = '2024-06-01'), '2024-06-01 12:00:00', 'Receipt Data');

-- Insert into Sat_Location
INSERT INTO Sat_Location (LocationKey, StorePhoneNumber, StoreWebsite, CustomerCareLine, StoreVATNumber, RecordSource) VALUES
((SELECT LocationKey FROM Hub_Location WHERE StoreName = 'PnP QualiSave Nkomo Mall'),
 '012 003 2849', 'www.picknpay.co.za', '0860 30 30 30', '4090105588', 'Receipt Data');
