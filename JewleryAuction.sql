-- DROP JEWELRY_AUCTION database if it exists
DROP DATABASE IF EXISTS JEWELRY_AUCTION;

-- Create JEWELRY_AUCTION database
CREATE SCHEMA IF NOT EXISTS JEWELRY_AUCTION;

-- Select JEWELRY_AUCTION database
USE JEWELRY_AUCTION;

-- Create ADDRESS table
CREATE TABLE ADDRESS (
    AddressID INT NOT NULL AUTO_INCREMENT,
    No_ VARCHAR(10) NOT NULL,
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    PRIMARY KEY (AddressID)
);

-- Create USER table
CREATE TABLE USER (
    UserID INT NOT NULL AUTO_INCREMENT,
    Name_ VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password_ VARCHAR(255) NOT NULL,
    AddressID INT NOT NULL,
    Bid_History TEXT, -- From the Buyer sub entity
    Sell_History TEXT, -- From the Seller sub entity
    Rating FLOAT CHECK (Rating BETWEEN 0.0 AND 5.0),
    PRIMARY KEY (UserID),
    FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID)
);

-- Create JEWELRY table
CREATE TABLE JEWELRY (
    JewelryID INT NOT NULL AUTO_INCREMENT,
    Material VARCHAR(25) NOT NULL,
    Condition_ VARCHAR(25) NOT NULL CHECK (Condition_ IN ('Brand New', 'Like New', 'Used')),
    Description_ VARCHAR(800) NOT NULL,
    Brand VARCHAR(255) NOT NULL,
    Color VARCHAR(50) NOT NULL CHECK (Color IN ('Gold', 'White', 'Silver', 'Other')),
    JewelryType VARCHAR(50) NOT NULL CHECK (JewelryType IN ('Necklace', 'Earring', 'Watch', 'Ring')),
    Chain_length FLOAT, -- Applicable for Necklaces
    Clasp_type VARCHAR(50), -- Applicable for Necklaces
    Style VARCHAR(15), -- Applicable for Earrings
    Pair_count INT, -- Applicable for Earrings
    Face_size FLOAT, -- Applicable for Watches
    Movement_type VARCHAR(50), -- Applicable for Watches
    PRIMARY KEY (JewelryID)
);

-- Create AUCTION table
CREATE TABLE AUCTION (
    Auction_num INT NOT NULL AUTO_INCREMENT,
    JewelryID INT NOT NULL,
    UserID INT NOT NULL,
    PRIMARY KEY (Auction_num),
    FOREIGN KEY (JewelryID) REFERENCES JEWELRY(JewelryID),
    FOREIGN KEY (UserID) REFERENCES USER(UserID)
);

-- Create BID table
CREATE TABLE BID (
    Bid_num INT NOT NULL AUTO_INCREMENT,
    Auction_num INT NOT NULL,
    BuyerID INT NOT NULL,
    Offer FLOAT NOT NULL CHECK (Offer > 0),
    Time_ DATETIME NOT NULL,
    PRIMARY KEY (Bid_num),
    FOREIGN KEY (Auction_num) REFERENCES AUCTION(Auction_num),
    FOREIGN KEY (BuyerID) REFERENCES USER(UserID)
);

-- Insert data into ADDRESS table
INSERT INTO ADDRESS (AddressID, No_, Street, City, State, Country) VALUES
(101, '27', 'S Broadway Ave', 'Yonkers', 'NY', 'US'),
(102, '13', 'Elm St', 'Yonkers', 'NY', 'US'),
(103, '40', 'New Main St', 'Yonkers', 'NY', 'US'),
(104, '160', 'Voss Ave', 'Yonkers', 'NY', 'US'),
(105, '9', 'Caryl Ave', 'Yonkers', 'NY', 'US'),
(106, '122', 'Lake Ave', 'Yonkers', 'NY', 'US'),
(107, '30', 'Caroline Ave', 'Yonkers', 'NY', 'US'),
(108, '15', 'Main St', 'Yonkers', 'NY', 'US'),
(109, '200', 'N Broadway Ave', 'Yonkers', 'NY', 'US'),
(110, '1', 'Executive Blvd', 'Yonkers', 'NY', 'US');

-- Insert data into USER table
INSERT INTO USER (UserID, Name_, Email, Password_, AddressID, Bid_History, Sell_History, Rating) VALUES
(1, 'Bad Bunny', 'BBemail@myhunter.cuny.edu', 'passwordFOO123', 101, 'Bid on Auction 1 - $500 on 2024-07-15', NULL, NULL),
(2, 'Willie Colon', 'WCemail@myhunter.cuny.edu', 'passwordFOO234', 102, 'Bid on Auction 2 - $2700 on 2021-12-30', 'Sold Necklace at Auction 5 for $600 on 2024-07-20', 5.0),
(3, 'Marc Anthony', 'MAemail@myhunter.cuny.edu', 'passwordFOO456', 104, 'Bid on Auction 3 - $350 on 2024-08-01; Bid on Auction 4 - $450 on 2024-08-10', 'Sold Ring at Auction 4 for $700 on 2024-08-20', 4.8),
(4, 'Daddy Yankee', 'DYemail@myhunter.cuny.edu', 'passwordFOO345', 103, 'Bid on Auction 4 - Diamond Earrings for $1200 on 2024-08-05; Bid on Auction 8 - Gold Watch for $700 on 2016-08-08', 'Sale at Auction 4 - Diamond Earrings for $1200 on 2024-08-05; Sale at Auction 8 - Gold Watch for $700 on 2016-08-08', 4.6),
(5, 'Héctor Lavoe', 'HLemail@myhunter.cuny.edu', 'passwordFOO567', 105, 'Bid on Auction 5 - $300 on 2024-07-25', NULL, 3.9),
(6, 'Marc Anthony', 'MAemail2@myhunter.cuny.edu', 'passwordFOO678', 106, 'Bid on Auction 6 - $400 on 2024-07-30; Bid on Auction 7 - $550 on 2024-08-10', 'Sold Watch at Auction 7 for $800 on 2024-08-15', 4.7),
(7, 'Rubén Blades', 'RBemail@myhunter.cuny.edu', 'passwordFOO789', 107, 'Bid on Auction 8 - $250 on 2024-08-02', 'Sold Necklace at Auction 9 for $650 on 2024-08-12', 4.5),
(8, 'Residente', 'REemail@myhunter.cuny.edu', 'passwordFOO890', 108, 'Bid on Auction 9 - $600 on 2024-08-03', NULL, 4.2),
(9, 'Ismael Rivera', 'IRemail@myhunter.cuny.edu', 'passwordFOO901', 109, 'Bid on Auction 10 - $700 on 2024-08-08; Bid on Auction 11 - $800 on 2024-08-12', 'Sold Earrings at Auction 12 for $900 on 2024-08-18', 4.9),
(10, 'Rauw Aljandro', 'RAemail@myhunter.cuny.edu', 'passwordFOO012', 110, 'Bid on Auction 12 - $200 on 2024-08-04', 'Sold Ring at Auction 13 for $550 on 2024-08-14', 4.6);

-- Insert data into JEWELRY table
INSERT INTO JEWELRY (JewelryID, Material, Condition_, Description_, Brand, Color, JewelryType, Chain_length, Clasp_type, Style, Pair_count, Face_size, Movement_type) VALUES
(1, 'Gold', 'Brand New', 'Elegant 24k Gold Necklace', 'Tiffany', 'Gold', 'Necklace', 18.0, 6.0, NULL, NULL, NULL, NULL),
(2, 'Silver', 'Like New', 'Vintage Silver Earrings', 'Cartier', 'Silver', 'Earring', NULL, NULL, 'Hoop', 2, NULL, NULL),
(3, 'Platinum', 'Used', 'Classic Platinum Watch', 'Rolex', 'White', 'Watch', NULL, NULL, NULL, NULL, 40.0, 'Automatic'),
(4, 'Gold', 'Brand New', 'Stylish Gold Ring', 'Bulgari', 'Gold', 'Ring', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Silver', 'Like New', 'Modern Silver Necklace', 'Chanel', 'Silver', 'Necklace', 20.0, 5.0, NULL, NULL, NULL, NULL),
(6, 'Rose Gold', 'Used', 'Rose Gold Hoop Earrings', 'Gucci', 'Gold', 'Earring', NULL, NULL, 'Hoop', 2, NULL, NULL),
(7, 'White Gold', 'Brand New', 'Elegant White Gold Necklace', 'Harry Winston', 'White', 'Necklace', 22.0, 4.0, NULL, NULL, NULL, NULL),
(8, 'Gold', 'Used', 'Gold Watch with Date Function', 'Omega', 'Gold', 'Watch', NULL, NULL, NULL, NULL, 42.0, 'Quartz'),
(9, 'Silver', 'Brand New', 'Silver Pendant Necklace', 'Pandora', 'Silver', 'Necklace', 16.0, 7.0, NULL, NULL, NULL, NULL),
(10, 'Rose Gold', 'Like New', 'Rose Gold Stud Earrings', 'Chanel', 'Gold', 'Earring', NULL, NULL, 'Stud', 2, NULL, NULL);

-- Insert data into AUCTION table
INSERT INTO AUCTION (Auction_num, JewelryID, UserID) VALUES
(1, 1, 2),  -- Willie Colon auctioned the Gold Necklace
(2, 2, 3),  -- Marc Anthony auctioned the Silver Earrings
(3, 3, 4),  -- Daddy Yankee auctioned the Platinum Watch
(4, 4, 6),  -- Marc Anthony (2nd time) auctioned the Gold Ring
(5, 5, 7),  -- Rubén Blades auctioned the Silver Necklace
(6, 6, 9),  -- Ismael Rivera auctioned the Rose Gold Earrings
(7, 7, 4),  -- Daddy Yankee auctioned the White Gold Necklace
(8, 8, 9),  -- Ismael Rivera auctioned the Gold Watch
(9, 9, 10), -- Rauw Aljandro auctioned the Silver Pendant Necklace
(10, 10, 5);-- Héctor Lavoe auctioned the Rose Gold Stud Earrings

-- Insert data into BID table
INSERT INTO BID (Bid_num, Auction_num, BuyerID, Offer, Time_) VALUES
(1, 1, 1, 500, '2024-07-15 10:00:00'),  -- Bad Bunny bid $500 on Auction 1 (
(2, 2, 5, 2700, '2021-12-30 14:30:00'), -- Héctor Lavoe bid $2700 on Auction 2 (
(3, 3, 8, 350, '2024-08-01 09:00:00'),  -- Residente  bid $350 on Auction 3 
(4, 4, 6, 450, '2024-08-10 16:45:00'),  -- Marc Anthony bid $450 on Auction 4 
(5, 5, 7, 300, '2024-07-25 11:20:00'),  -- Rubén Blades  bid $300 on Auction 5 (
(6, 6, 1, 400, '2024-07-30 13:50:00'),  -- Bad Bunny bid $400 on Auction 6 (
(7, 7, 2, 550, '2024-08-10 12:10:00'),  -- Willie Colon bid $550 on Auction 7 
(8, 8, 4, 700, '2024-08-08 15:30:00'),  -- Daddy Yankee  bid $700 on Auction 8 
(9, 9, 3, 600, '2024-08-03 17:55:00'),  -- Marc Anthony bid $600 on Auction 9 (
(10, 10, 10, 200, '2024-08-04 08:40:00');-- Rauw Aljandro bid $200 on Auction 10 


-- Verification section

SELECT * FROM ADDRESS;

SELECT * FROM USER;

SELECT * FROM JEWELRY;

SELECT * FROM AUCTION;

SELECT * FROM BID;


-- Test Join Section

SELECT 
    BID.Bid_num,
    USER.Name_ AS BuyerName,
    JEWELRY.Description_ AS JewelryDescription,
    BID.Offer AS BidAmount,
    BID.Time_ AS BidTime
FROM 
    BID
JOIN 
    AUCTION ON BID.Auction_num = AUCTION.Auction_num
JOIN 
    USER ON BID.BuyerID = USER.UserID
JOIN 
    JEWELRY ON AUCTION.JewelryID = JEWELRY.JewelryID
ORDER BY 
    BID.Bid_num;

