# DatabaseMNGMNT
# Online Jewelry Auction System

## Project Overview
This project implements a database management system for an online jewelry auction platform. It allows users to bid on, auction, and sell various types of jewelry through an online interface.

## Features
- User management (buyers and sellers)
- Jewelry catalog (necklaces, earrings, watches, rings)
- Auction system
- Bidding functionality
- Address management for users

## Database Schema

![relationalSchemeMapping](https://github.com/user-attachments/assets/6bfc2631-0c15-4123-9397-c6c3cc6ddb7b)

### Tables
1. USER
2. ADDRESS
3. JEWELRY
4. AUCTION
5. BID

### Entity Relationship Diagram
![enhancedEntityRelationship](https://github.com/user-attachments/assets/692b0288-4ce3-48de-9e6e-727016645e76)


## Technologies Used
- MySQL
- SQL

## Setup and Installation
1. Ensure you have MySQL installed on your system.
2. Clone this repository:
   ```
   git clone https://github.com/your-username/jewelry-auction-system.git
   ```
3. Navigate to the project directory:
   ```
   cd jewelry-auction-system
   ```
4. Run the SQL scripts to set up the database and tables:
   ```
   mysql -u your_username -p < setup_database.sql
   ```

## Usage
After setting up the database, you can:
- Insert sample data using the provided INSERT statements
- Run queries to test the relationships between tables
- Modify or expand the schema as needed for additional functionality

## Sample Queries
Here's an example of a join query that retrieves bid information along with buyer and jewelry details:

```sql
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
```

## Future Enhancements
- Implement a web-based front-end interface
- Add authentication and authorization
- Integrate a payment system
- Implement real-time bidding notifications

## Contributors
- Kenneth Guillont

## License
[Include your chosen license here]
