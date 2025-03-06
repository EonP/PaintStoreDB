-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO COMP421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    BEFORE the ddls to drop the parent tables (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.

DROP TABLE ONLINE;

DROP TABLE INSTORE;

DROP TABLE CONTAINS_PURCHASE;

DROP TABLE PURCHASE;

DROP TABLE CUSTOMER;

DROP TABLE HAS_IN_STOCK;

DROP TABLE TOOL;

DROP TABLE PAINT;

DROP TABLE PRODUCT;

DROP TABLE MANUFACTURER;

DROP TABLE EMPLOYEE;

DROP TABLE STORE;


