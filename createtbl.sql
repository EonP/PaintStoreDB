-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO COMP421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables have already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE STORE
(
    s_id         INTEGER NOT NULL,
    s_address    VARCHAR(50) NOT NULL,
    phone_number CHAR(10),
    manager_id   INTEGER NOT NULL UNIQUE,
    PRIMARY KEY(s_id)
);

CREATE TABLE EMPLOYEE
(
    e_id   INTEGER NOT NULL,
    e_name VARCHAR(50),
    s_id   INTEGER,
    PRIMARY KEY(e_id),
    FOREIGN KEY(s_id) REFERENCES STORE(s_id)
);

-- Add STORE constraint after EMPLOYEE table is created
ALTER TABLE STORE
ADD CONSTRAINT FK_store_manager FOREIGN KEY(manager_id) REFERENCES EMPLOYEE(e_id);

CREATE TABLE MANUFACTURER
(
    m_id   INTEGER NOT NULL,
    m_name VARCHAR(50),
    PRIMARY KEY(m_id)
);

CREATE TABLE PRODUCT
(
    p_id                 INTEGER NOT NULL,
    p_name               VARCHAR(50) NOT NULL,
    unit_price           DECIMAL(5, 2) NOT NULL,
    description          VARCHAR(200),
    discount_pourcentage INTEGER,
    m_id                 INTEGER NOT NULL,
    PRIMARY KEY(p_id),
    FOREIGN KEY(m_id) REFERENCES MANUFACTURER(m_id)
);

CREATE TABLE PAINT
(
    p_id  INTEGER NOT NULL,
    base  VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(p_id),
    FOREIGN KEY(p_id) REFERENCES PRODUCT(p_id)
);

CREATE TABLE TOOL
(
    p_id INTEGER NOT NULL,
    type VARCHAR(50),
    PRIMARY KEY(p_id),
    FOREIGN KEY(p_id) REFERENCES PRODUCT(p_id)
);

CREATE TABLE HAS_IN_STOCK
(
    p_id     INTEGER NOT NULL,
    s_id     INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK(quantity >= 0),
    PRIMARY KEY(p_id, s_id),
    FOREIGN KEY(p_id) REFERENCES PRODUCT(p_id),
    FOREIGN KEY(s_id) REFERENCES STORE(s_id)
);

CREATE TABLE CUSTOMER
(
    email     VARCHAR(50) NOT NULL,
    c_name    VARCHAR(50),
    c_address VARCHAR(50) NOT NULL,
    PRIMARY KEY(email)
);

CREATE TABLE PURCHASE
(
    p_id     INTEGER NOT NULL,
    amount   DECIMAL(5, 2) NOT NULL,
    p_date   DATE NOT NULL,
    p_time   TIME NOT NULL,
    PRIMARY KEY(p_id)
);

CREATE TABLE CONTAINS_PURCHASE
(
    purchase_id INTEGER NOT NULL,
    product_id  INTEGER NOT NULL,
    quantity    INTEGER NOT NULL CHECK(quantity >= 0),
    PRIMARY KEY(purchase_id, product_id),
    FOREIGN KEY(purchase_id) REFERENCES PURCHASE(p_id),
    FOREIGN KEY(product_id) REFERENCES PRODUCT(p_id)
);

CREATE TABLE INSTORE
(
    p_id INTEGER NOT NULL,
    e_id INTEGER NOT NULL,
    PRIMARY KEY(p_id),
    FOREIGN KEY(p_id) REFERENCES PURCHASE(p_id),
    FOREIGN KEY(e_id) REFERENCES EMPLOYEE(e_id)
);

CREATE TABLE ONLINE
(
    p_id   INTEGER NOT NULL,
    rating INTEGER CHECK(rating >= 0 AND rating <= 5 OR rating IS NULL),
    delivery_fee DECIMAL(5, 2) NOT NULL,
    email  VARCHAR(50) NOT NULL,
    PRIMARY KEY(p_id),
    FOREIGN KEY(p_id) REFERENCES PURCHASE(p_id),
    FOREIGN KEY(email) REFERENCES CUSTOMER(email)
);
