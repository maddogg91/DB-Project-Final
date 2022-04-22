--  Celebrating Milestones Database


DROP DATABASE IF EXISTS inventory;
CREATE DATABASE IF NOT EXISTS inventory;
USE inventory;

DROP TABLE IF EXISTS tables,
                     invtbl,
                     chairs,
                     invchairs, 
                     canopy,
					 invcanopy,
					 stock,
					 inventory,
					 orders,
					 customers,
					 registration,
					 locations,
					 staff,
					 roles;



CREATE TABLE tables (
    tableId      INT             NOT NULL,
    tableName  VARCHAR(50)     NOT NULL,
    tableDesc   VARCHAR(250)     NOT NULL,
    PRIMARY KEY (tableId)
);

CREATE TABLE stock (
    stockId      INT             NOT NULL,
    quantityOnHand  INT     NOT NULL,
    quantityRented   INT     NOT NULL,
    quantityTotal     INT  NOT NULL,    
    PRIMARY KEY (stockId)
);

CREATE TABLE chairs (
    chairId      INT             NOT NULL,
    chairName  VARCHAR(50)     NOT NULL,
    chairDesc   VARCHAR(250)     NOT NULL,
    PRIMARY KEY (chairId)
);

CREATE TABLE canopy (
    canopyId      INT             NOT NULL,
    canopyName  VARCHAR(50)     NOT NULL,
    canopyDesc   VARCHAR(250)     NOT NULL,
    PRIMARY KEY (canopyId)
);
CREATE TABLE locations (
    locationId      INT             NOT NULL,
    locationName  VARCHAR(30)     NOT NULL,
    city   VARCHAR(30)     NOT NULL,
    state VARCHAR(2)      NOT NULL,    
    PRIMARY KEY (locationId)
);

CREATE TABLE inventory (

   inventoryId      INT             NOT NULL,
    inventoryType  ENUM ('Online', 'Instore')     NOT NULL,
    locationId   INT     NOT NULL,   
	FOREIGN KEY (locationId)  REFERENCES locations (locationId)    ON DELETE CASCADE,
    PRIMARY KEY (inventoryId)
);


CREATE TABLE roles (
    roleId      INT             NOT NULL,
    level  ENUM('1','2','3')     NOT NULL, 
    PRIMARY KEY (roleId)
);


CREATE TABLE registration (
    userId      INT             NOT NULL,
    password  VARCHAR(16)     NOT NULL, 
    PRIMARY KEY (userId)
);

CREATE TABLE customers (
    customerId      INT             NOT NULL,
    customerFname  VARCHAR(30)     NOT NULL,
    customerLname   VARCHAR(30)     NOT NULL,
    userId     INT  NOT NULL,    
	FOREIGN KEY (userId)  REFERENCES registration (userId)    ON DELETE CASCADE,
    PRIMARY KEY (customerId)
);

CREATE TABLE staff (
    empId      INT             NOT NULL,
    empFname  VARCHAR(30)     NOT NULL,
    empLname   VARCHAR(30)     NOT NULL,
	locationId INT NOT NULL,
	roleId INT NOT NULL,
    userId     INT  NOT NULL,    
	FOREIGN KEY (userId)  REFERENCES registration (userId)    ON DELETE CASCADE,
	FOREIGN KEY (locationId)  REFERENCES locations (locationId)    ON DELETE CASCADE,
	FOREIGN KEY (roleId)  REFERENCES roles (roleId)    ON DELETE CASCADE,
    PRIMARY KEY (empId)
);

CREATE TABLE orders (
    orderId      INT             NOT NULL,
    orderInfo  VARCHAR(40)     NOT NULL,
    locationId   INT     NOT NULL,
    customerId     INT  NOT NULL,   
	FOREIGN KEY (locationId)  REFERENCES locations (locationId)    ON DELETE CASCADE,
	FOREIGN KEY (customerId)  REFERENCES customers (customerId)    ON DELETE CASCADE,
    PRIMARY KEY (orderId)
);


CREATE TABLE invtbl (
    tableId      INT             NOT NULL,
    inventoryTableId  INT     NOT NULL,
    stockId   INT     NOT NULL,
    inventoryId     INT  NOT NULL,    
	FOREIGN KEY (tableId)  REFERENCES tables (tableId)    ON DELETE CASCADE,
	FOREIGN KEY (stockId)  REFERENCES stock (stockId)    ON DELETE CASCADE,
	FOREIGN KEY (inventoryId)  REFERENCES inventory (inventoryId)    ON DELETE CASCADE,
    PRIMARY KEY (inventoryTableId)
	 
);

CREATE TABLE invchairs (
    chairId      INT             NOT NULL,
    inventoryChairId  INT     NOT NULL,
    stockId   INT     NOT NULL,
    inventoryId     INT  NOT NULL,
	FOREIGN KEY (chairId)  REFERENCES chairs (chairId)    ON DELETE CASCADE,
	FOREIGN KEY (stockId)  REFERENCES stock (stockId)    ON DELETE CASCADE,
	FOREIGN KEY (inventoryId)  REFERENCES inventory (inventoryId)    ON DELETE CASCADE,    
    PRIMARY KEY (inventoryChairId)
);

CREATE TABLE invcanopy (
    canopyId      INT             NOT NULL,
    inventoryCanopyId  INT     NOT NULL,
    stockId   INT     NOT NULL,
    inventoryId     INT  NOT NULL,    
	FOREIGN KEY (canopyId)  REFERENCES canopy (canopyId)    ON DELETE CASCADE,
	FOREIGN KEY (stockId)  REFERENCES stock (stockId)    ON DELETE CASCADE,
	FOREIGN KEY (inventoryId)  REFERENCES inventory (inventoryId)    ON DELETE CASCADE,
    PRIMARY KEY (inventoryCanopyId)
);