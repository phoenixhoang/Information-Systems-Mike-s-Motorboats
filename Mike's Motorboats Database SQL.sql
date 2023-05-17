/*Drops Tables - If you wish to drop the tables, uncomment the next block*/

/*DROP TABLE MM_Rental;
DROP TABLE MM_Maintenance;
DROP TABLE MM_Boat;
DROP TABLE NonMM_Orderline;
DROP TABLE NonMM_Order;
DROP TABLE NonMM_ManufPart;
DROP TABLE NonMM_Manufacturer;
DROP TABLE MM_BoatCode;
DROP TABLE NonMM_Customer;
DROP TABLE NonMM_Part;
DROP TABLE NonMM_Dealer;*/

/*Mike's Motorboat Table Creations*/

/*NonMM_Dealer Table Creation - Phoenix*/
CREATE TABLE NonMM_Dealer
(
DealerID            NUMBER(8)           PRIMARY KEY,
DealerName          VARCHAR2(30)        NOT NULL,
DealerAddress       VARCHAR(100)        NOT NULL,
DealerPostCode      VARCHAR2(8)         NOT NULL,
DealerTel           NUMBER(15)          NOT NULL
);

/*NonMM_Part Table Creation - Phoenix*/
CREATE TABLE NonMM_Part
(
PartID                  NUMBER(8)           PRIMARY KEY,
PartName                VARCHAR2(50),
PartCost                NUMBER(6, 2)        CONSTRAINT PartCost             NOT NULL
);

/*NonMM_Customer Table Creation - Syed*/
CREATE TABLE NonMM_Customer
(
CustomerID          NUMBER(5)           PRIMARY KEY,
CustomerFirstName   VARCHAR2(30),
CustomerLastName    VARCHAR2(30)        NOT NULL,
CustomerAddress     VARCHAR2(100)       NOT NULL,
CustomerPostCode    VARCHAR2(8)         NOT NULL,
CustomerTel         NUMBER(11)          NOT NULL
);

/*MM_BoatCode Table Creation - Phoenix*/
CREATE TABLE MM_BoatCode
(
ClassSizeCode           NUMBER(3)           CONSTRAINT ClassSizeCode_PK     PRIMARY KEY,
RentRateHalfDay         NUMBER (6, 2)       NOT NULL,
RentRateFullDay         NUMBER(6, 2)        NOT NULL
);

/*NonMM_Manufacturer  Table Creation - Ilia*/
CREATE TABLE NonMM_Manufacturer
(
ManufID                 NUMBER (5)          PRIMARY KEY,
ManufacturerName        VARCHAR2 (30)       CONSTRAINT ManufacturerName             NOT NULL,
ManufacturerAddress     VARCHAR2 (100)       CONSTRAINT ManufacturerAddress          NOT NULL,
ManufacturerPostCode    VARCHAR2 (8),
ManufacturerTel         NUMBER (11)         CONSTRAINT ManufacturerTel              NOT NULL
);

/* NonMM_ManufPart Table Creations - Ilia*/
CREATE TABLE NonMM_ManufPart
(
ManufID                 NUMBER (5),          CONSTRAINT ManufID_PK_FK                     FOREIGN KEY (ManufID) REFERENCES NonMM_Manufacturer (ManufID),
PartID                  NUMBER (8),          CONSTRAINT PartID_PK_FK                      FOREIGN KEY (PartID) REFERENCES NonMM_Part (PartID)
);

/*NonMM_Order Table Creation - Emily*/
CREATE TABLE NonMM_Order
(
OrderID                 NUMBER(5)           PRIMARY KEY,
OrderDate               DATE,
OrderSubtotal           NUMBER(6, 2),
VAT                     NUMBER(3)           CONSTRAINT VAT                  NOT NULL,
OrderTotal              NUMBER(6,2),
ManufID                 NUMBER(5),           CONSTRAINT ManufID_FK           FOREIGN KEY (ManufID) REFERENCES NonMM_Manufacturer (ManufID)
);

/*NonMM_OredrLine Table Creation - Emily*/
CREATE TABLE NonMM_OrderLine
(
PartID                  NUMBER(8),           CONSTRAINT PartID_Order_PK_FK         FOREIGN KEY(PartID) REFERENCES NonMM_Part (PartID), 
OrderID                 NUMBER(8),           CONSTRAINT OrderID_PK_FK        FOREIGN KEY(OrderID) REFERENCES NonMM_Order (OrderID),
Quantity                NUMBER(4),
LineCost                NUMBER(6, 2)
);

/*MM_Boat Table Creation - Phoenix*/
CREATE TABLE MM_Boat
(
BoatID              NUMBER(5)           CONSTRAINT BoatID_PK            PRIMARY KEY,
BoatPurchaseDate    DATE                NOT NULL,
BoatPurchasePrice   NUMBER (8, 2)       NOT NULL,
BoatSellDate        DATE,
BoatSellPrice       NUMBER(8, 2),
ManufID             NUMBER(5),           CONSTRAINT Manuf_Boat_FK             FOREIGN KEY(ManufID) REFERENCES NonMM_Manufacturer(ManufID),
DealerID            NUMBER(8),           CONSTRAINT Dealer_Boat_FK            FOREIGN KEY(DealerID) REFERENCES NonMM_Dealer (DealerID),
ClassSizeCode       NUMBER(3),           CONSTRAINT BoatCode_Boat_FK          FOREIGN KEY(ClassSizeCode) REFERENCES MM_BoatCode (ClassSizeCode)
);

/*Table Creations - Ilia*/
CREATE TABLE MM_Maintenance
(
MaintenanceID                 NUMBER(5)           PRIMARY KEY,
MaintFaultDetail        VARCHAR2 (140)      CONSTRAINT MaintFaultDetail    NOT NULL,
MaintFaultDate          DATE                CONSTRAINT MaintDaultDate      NOT NULL,
MaintActionTaken        VARCHAR2 (140),
MaintActionDate         DATE,
PartID                  NUMBER(5),           CONSTRAINT PartID_Maintenance_PK_FK        FOREIGN KEY(PartID) REFERENCES NonMM_Part (PartID),
BoatID                  NUMBER(5),           CONSTRAINT BoatID_FK                       FOREIGN KEY(BoatID) REFERENCES MM_Boat(BoatID)
);

/*MM_Rental Table Creation - Syed*/
CREATE TABLE MM_Rental
(
RentalID            NUMBER(5)           PRIMARY KEY,
RentDate            DATE                NOT NULL,
RentTimeOut         VARCHAR2(5),
RentDueBack         VARCHAR2(5),
RentTimeActual      VARCHAR2(5),
RentAmountPaid      NUMBER(6, 2),
BoatID              NUMBER(5),           CONSTRAINT BoatID_Rental_FK        FOREIGN KEY(BoatID) REFERENCES MM_Boat(BoatID),
CustomerID          NUMBER(5),           CONSTRAINT CustomerID_Rental_FK    FOREIGN KEY(CustomerID) REFERENCES NonMM_Customer (CustomerID),
ClassSizeCode       NUMBER(3),           CONSTRAINT ClassSizeCode_Rental_FK FOREIGN KEY(ClassSizeCode) REFERENCES MM_BoatCode (ClassSizeCode)
);

/*Inserting Values for NonMM_Dealer - Phoenix*/
INSERT INTO NonMM_Dealer (DealerID,	DealerName,	DealerAddress, DealerPostCode, DealerTel)
VALUES (86544693, 'Super Boats Ltd.', '28 Super Road, Blackpool, United Kingdom', 'BL3 8HU', 01234567890);
INSERT INTO NonMM_Dealer (DealerID,	DealerName,	DealerAddress, DealerPostCode, DealerTel)
VALUES (99678633, 'Fast Boats Ltd.',	'65 Faster Road, London, United Kingdom', 'LN5 17MA', 09876543210);
INSERT INTO NonMM_Dealer (DealerID,	DealerName,	DealerAddress, DealerPostCode, DealerTel)
VALUES (23445564, 'Speedy Boats Ltd.',	'43 Speedy Lane, Newcastle, United Kingdom', 'NW7 8FP', 05678901234);
INSERT INTO NonMM_Dealer (DealerID,	DealerName,	DealerAddress, DealerPostCode, DealerTel)
VALUES (54556753, 'Rower Boats Ltd.',	'119 Rower Lane Liverpool, United Kingdom', 'L18 9GC', 01234543210);
INSERT INTO NonMM_Dealer (DealerID,	DealerName,	DealerAddress, DealerPostCode, DealerTel)
VALUES (54555453, 'Booster Boats Ltd.', '43 Boost Road Liverpool, United Kingdom', 'L14 3TU', 01246546234);

/*Inserting Values for NonMM_Part - Emily*/
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (12345678, 'Hull Parts', 100);
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (12345671, 'Propeller', 100);
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (52345672, 'Engine Battery', 30);
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (12345673, 'Bilge Pump Parts', 250);
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (12345674, 'Plunger', 25);
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (42345677, 'Fuse Parts', 50);
INSERT INTO NonMM_Part (PartID, PartName, PartCost)
VALUES (72345679, 'Resurface Paint', 50);

 /*Inserting Values for NonMM_Customer - Syed*/
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (09456,	'Bella', 'Dawson', '42 Emerson Road, Sheffield, United Kingdom', 'S9 18KT', 07733884499);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (15468,	'Yasmin', 'Holland', '34 Ross Lane, Manchester, United Kingdom', 'M15 7OP', 07734652347);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (52629,	'Alex', 'Robbin', '75 Broomfield Avenue, London, United Kingdom', 'L5 8MR', 07737128466);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (46847,	'Eddie', 'Stewart', '28 Neville Road, Glasgow, United Kingdom', 'G18 10ZK', 07856342433);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (12135,	'Eve', 'Silva', '25 Monks Street, Bristol, United Kingdom', 'B43 5JM', 07325346456);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (53457,	'Christopher', 'Thompson', '19 Newport Lane, Sheffield, United Kingdom', 'S23 17AC', 07894233786);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (87624,	'Tom', 'Clarke', '3 Holgate Lane, Cardiff, United Kingdom', 'C3 43HF', 07243534123);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (87873,	'Lily', 'Sanders', '16 Crescent Street, Oxford, United Kingdom', 'O21 3WT', 07653465576);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (23483,	'Henry', 'Fields', '87 Whitby Street, Leicester, United Kingdom', 'L6 8VD', 07654867535);
INSERT INTO NonMM_Customer(CustomerID, CustomerFirstName, CustomerLastName, CustomerAddress, CustomerPostCode, CustomerTel)
VALUES (32736,	'Susan', 'Williams', '5 Northern Way, Nottingham, United Kingdom', 'N19 4DJ', 07654598678);

/*Inserting Values for MM_BoatCode - Phoenix*/		
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (011, 1500, 2500);
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (012, 2000,	3000);
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (013, 2500,	3500);
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (014, 3000,	4500);
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (021, 3000,	4500);
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (022, 4000,	7500);
INSERT INTO MM_BoatCode (ClassSizeCode, RentRateHalfDay, RentRateFullDay)
VALUES (031, 5000,	7000);

/*Inserting Values for NonMM_Manufacturer - Ilia*/
INSERT INTO NonMM_Manufacturer (ManufID, ManufacturerName, ManufacturerAddress, ManufacturerPostCode, ManufacturerTel)
VALUES (75634, 'Nokio Ltd.', '39 Berry Street London, United Kingdom', 'M1 2AR', 07719123412);
INSERT INTO NonMM_Manufacturer (ManufID, ManufacturerName, ManufacturerAddress, ManufacturerPostCode, ManufacturerTel)
VALUES (65468, 'Speeda Ltd.', '29 Oxford Street, Bristol, United Kingdom', 'B15 4QD', 07719654321);
INSERT INTO NonMM_Manufacturer (ManufID, ManufacturerName, ManufacturerAddress, ManufacturerPostCode, ManufacturerTel)
VALUES (23435, 'BoatLSD Ltd.', '4 City Road, Edinburgh, United Kingdom', 'E4 5LM', 07719123456);
INSERT INTO NonMM_Manufacturer (ManufID, ManufacturerName, ManufacturerAddress, ManufacturerPostCode, ManufacturerTel)
VALUES (34567, 'Rowing Ltd.', '19 Low Road, Leicester, United Kingdom', 'L33 6DM', 07717554322);
INSERT INTO NonMM_Manufacturer (ManufID, ManufacturerName, ManufacturerAddress, ManufacturerPostCode, ManufacturerTel)
VALUES (34655, 'Quicker Boats Ltd.', '18 Quick Lane, Belfast, United Kingdom', 'B11 5FL', 07717432465);

/*Inserting Values for NonMM_ManufPart - Ilia*/
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (75634, 12345678);
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (65468, 12345671);
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (23435, 52345672);
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (75634, 12345673);
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (65468, 12345674);
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (34567, 42345677);
INSERT INTO NonMM_ManufPart (ManufID, PartID)
VALUES (34655, 72345679);

/*Inserting Values for NonMM_Order - Emily*/
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (86679, '03-JAN-18', 100, 20, 120, 75634);
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (75464, '16-MAY-18', 200, 20, 240, 65468);
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (65493, '22-JUN-18', 150, 20, 180, 23435);
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (87447, '11-SEP-19', 500, 20, 600, 75634);
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (63456, '30-DEC-19', 25, 20, 360, 65468);
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (76577, '26-JAN-20', 250, 20, 300, 34567);
INSERT INTO NonMM_Order (OrderID, OrderDate, OrderSubtotal, VAT, OrderTotal, ManufID)
VALUES (32150, '28-FEB-20', 100, 20, 480, 34655);

/*Inserting Values for NonMM_OrderLine – Emily*/
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (12345678, 86679, 1, 100);
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (12345671, 75464, 2, 200);
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (52345672, 65493, 5, 150);
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (12345673, 87447, 2, 500);
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (12345674, 63456, 1, 25);
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (42345677, 76577, 5, 250);
INSERT INTO NonMM_OrderLine (PartID, OrderID, Quantity, LineCost)
VALUES (72345679, 32150, 2, 100);

/*Inserting Values for MM_Boat - Phoenix*/
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (01342, '10-JAN-08', 120000, '20-JAN-18', 15000, 75634, 86544693, 012);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (02654, '12-FEB-08', 270000, '15-FEB-18', 53000, 65468,	99678633, 014);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (06742, '22-JUN-09', 210000, '23-JUN-19', 51000, 23435, 23445564, 031);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (13756, '02-SEP-09', 180000, '11-SEP-19', 23000, 75634,	54556753, 022);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (14563, '17-DEC-09', 130000, '20-DEC-19', 17000, 65468,	54556753, 013);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (54355, '16-JUN-10', 110000, NULL, NULL, 34567,	NULL, 011);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (43244, '13-JUL-11', 150000, NULL, NULL, 65468,	NULL, 022);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (63453, '21-JAN-14', 270000, NULL, NULL, 34655,	NULL, 031);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (65468, '28-NOV-16', 135000, NULL, NULL, 23435,	NULL, 014);
INSERT INTO MM_Boat (BoatID, BoatPurchaseDate, BoatPurchasePrice, BoatSellDate, BoatSellPrice, ManufID, DealerID, ClassSizeCode)
VALUES (87675, '03-SEP-17', 170000, NULL, NULL, 75634,	NULL, 013);

/*Inserting Values for MM_Maintenance - Ilia*/
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (75638,	'Broken hull', '01-JAN-18', 'Broken hull Repaired',	'07-JAN-18', 63453);
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (65469,	'Broken propeller', '15-MAY-18', 'Broken propeller Replaced', '21-MAY-18', 43244);
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (23439,	'Engine not starting up', '20-JUN-18', 'Battery replaced',	'25-JUN-18', 54355);
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (78679,	'Bilge pumps not responding', '09-SEP-19', 'Repaired', '10-OCT-19', 63453);
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (65449,	'Clogged pump', '27-DEC-19', 'Repaired', '10-JAN-20', 65468);
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (56459,	'Blown fuses', '25-JAN-20',	'Repaired', '30-JAN-20', 43244);
INSERT INTO MM_Maintenance (MaintenanceID, MaintFaultDetail, MaintFaultDate, MaintActionTaken, MaintActionDate, BoatID)
VALUES (76558,	'Resurfacing the deck', '20-FEB-20', 'Repaired', '25-FEB-20', 54355);

/*Inserting Values for NonMM_Rental - Syed*/
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (15122, '12-DEC-17', '10:00', '22:00', '10:00', 2500, 54355, 09456, 011);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (65646, '05-JUN-18', '09:00', '15:00', '09:30', 4000, 43244, 15468, 022);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (35356, '18-AUG-18', '12:00', '18:00', '12:30', 7000, 63453, 52629, 031);		
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (25986, '15-OCT-18', '12:30', '18:30', '01:00', 7000, 63453, 46847, 031);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (21317, '13-JAN-18', '11:00', '17:00', '11:30', 3000, 65468, 12135, 014);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (87672, '21-JAN-18', '09:30', '15:30', '09:30', 1500, 54355, 53457, 011);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (08793, '27-JUL-19', '11:30', '17:30', '12:00', 4000, 43244, 87624, 022);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (90452, '03-NOV-19', '10:00', '22:00', '10:00', 2500, 54355, 87873, 011);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (02442, '02-NOV-19', '10:30', '16:30', '11:00', 3500, 87675, 23483, 013);
INSERT INTO MM_Rental (RentalID, RentDate, RentTimeOut,	RentDueBack, RentTimeActual, RentAmountPaid, BoatID, CustomerID, ClassSizeCode)
VALUES (96363, '15-DEC-19', '12:00', '18:00', '12:30', 3000, 65468, 32736, 014);

/*Query 1 - Phoenix*/
SELECT BoatID, BoatPurchasePrice, CEIL(MONTHS_BETWEEN(SYSDATE, BoatPurchaseDate)) "Months Since Purchase"
FROM MM_Boat
ORDER BY BoatID;

/*Query 2 - Phoenix*/
SELECT BoatID, RentalID, RentDate
FROM MM_Boat
NATURAL JOIN MM_Rental;

/*Query 1 - Syed*/
SELECT RentalID, CustomerID, RentAmountPaid
FROM MM_Rental
WHERE RentAmountPaid <= 3000;

/*Query 2 - Syed*/
SELECT RentalID, CustomerID, BoatID, ClassSizeCode
FROM MM_Rental
WHERE RentDate<'12/FEB/20' AND RentDate>'12/Jan/19';

/*Query 1 – Ilia*/
SELECT MaintFaultDate, MaintFaultDetail, BoatID
FROM MM_Maintenance
WHERE MaintFaultDate < '01-FEB-19' AND MaintActionDate IS NOT NULL;
/*Query 2 - Ilia*/
SELECT BoatID, ManufacturerName, ManufacturerTel
FROM MM_Maintenance
NATURAL JOIN NonMM_Manufacturer
WHERE MaintFaultDetail LIKE '%Engine%' AND MaintActionDate IS NOT NULL;

/*MM Update Order Totals – Emily Queries*/
UPDATE NonMM_Order
SET OrderTotal = OrderSubTotal * ((VAT / 100) + 1);

UPDATE NonMM_OrderLine NEW
SET LineCost = (SELECT OrderTotal
FROM NonMM_Order OLD
WHERE OLD.OrderID = NEW.OrderID)*Quantity;

/*MM Accounts – Emily Queries*/
SELECT SUM(RentAmountPaid) AS "Income", 
       SUM(LineCost) AS "Costs",
       SUM(RentAmountPaid-LineCost) AS "Revenue"
FROM NonMM_OrderLine, MM_Rental;

/*Select all data from databases*/
SELECT * FROM MM_Boat;
SELECT * FROM NonMM_Dealer;
SELECT * FROM MM_BoatCode;
SELECT * FROM MM_Rental;
SELECT * FROM NonMM_Customer;
SELECT * FROM MM_Maintenance;
SELECT * FROM NonMM_Manufacturer;
SELECT * FROM NonMM_ManufPart; 
SELECT * FROM NonMM_Order;
SELECT * FROM NonMM_OrderLine; 
SELECT * FROM NonMM_Part;

