CREATE TABLE employee_territories(
                               employeeID  INTEGER,
                               territoryID INTEGER not null
                               );
CREATE TABLE orders(
                         orderID        INT PRIMARY KEY,
                         customerID     CHAR(5),
                         employeeID     INTEGER,
                         orderDate      date,
                         requiredDate   date,
                         shippedDate    VARCHAR(255),
                         shipVia        INTEGER,
                         freight        FLOAT,
                         shipName       VARCHAR(255),
                         shipAddress    VARCHAR(255),
                         shipCity       VARCHAR(255),
                         shipRegion     VARCHAR(255),
                         shipPostalCode VARCHAR(255),
                         shipCountry    VARCHAR(255)
                        );
CREATE TABLE employees(
                              employeeID      INT PRIMARY KEY,
                              lastName        VARCHAR(255),
                              firstName       VARCHAR(255) ,
                              title           VARCHAR(255),
                              titleOfCourtesy VARCHAR(255),
                              birthDate       DATE,
                              hireDate        DATE,
                              address         VARCHAR(255),
                              city            VARCHAR(255),
                              region          VARCHAR(255),
                              postalCode      VARCHAR(255),
                              country         VARCHAR(255),
                              homePhone       VARCHAR(255),
                              extension       INTEGER,
                              photo           TEXT,
                              notes           TEXT,
                              reportsTo       TEXT,
                              photoPath       TEXT
                              );
CREATE TABLE regions(
                          regionID          INT PRIMARY KEY,
                          regionDescription VARCHAR(255)
                         );
CREATE TABLE categories(
                            categoryID   INTEGER,
                            categoryName VARCHAR(255),
                            description  VARCHAR(255),
                            picture      TEXT
                           );
CREATE TABLE order_details(
                                orderID   INTEGER,
                                productID INTEGER,
                                unitPrice FLOAT,
                                quantity  INTEGER,
                                discount  FLOAT
                                );

CREATE TABLE suppliers(
                             supplierID   INTEGER,
                             companyName  VARCHAR(255),
                             contactName  VARCHAR(255),
                             contactTitle VARCHAR(255),
                             address      VARCHAR(255),
                             city         VARCHAR(255),
                             region       VARCHAR(255),
                             postalCode   VARCHAR(255),
                             country      VARCHAR(255),
                             phone        VARCHAR(255),
                             fax          VARCHAR(255),
                             homePage     VARCHAR(255)
                            );
CREATE TABLE shippers(
                            shipperID   INTEGER,
                            companyName VARCHAR(255),
                            phone       VARCHAR(255)
                           );
CREATE TABLE products(
                            productID       INTEGER,
                            productName     VARCHAR(255),
                            supplierID      INTEGER,
                            categoryID      INTEGER,
                            quantityPerUnit VARCHAR(255),
                            unitPrice       FLOAT,
                            unitsInStock    INTEGER,
                            unitsOnOrder    INTEGER,
                            reorderLevel    INTEGER,
                            discontinued    INTEGER
                           );

CREATE TABLE customers(
                             customerID   VARCHAR(5),
                             companyName  VARCHAR(255),
                             contactName  VARCHAR(255),
                             contactTitle VARCHAR(255),
                             address      VARCHAR(255),
                             city         VARCHAR(255),
                             region       VARCHAR(255),
                             postalCode   VARCHAR(255),
                             country      VARCHAR(255),
                             phone        VARCHAR(255),
                             fax          VARCHAR(255)
                            );
​
CREATE TABLE territories(
                               territoryID          INTEGER,
                               territoryDescription VARCHAR(255),
                               regionID             INTEGER
                              );
​
\copy employee_territories FROM '[Path_to_file]/employee_territories.csv' WITH  DELIMITER ',' CSV HEADER;
\copy orders FROM '[Path_to_file]/orders.csv' WITH  DELIMITER ',' CSV HEADER;
\copy employees FROM '[Path_to_file]/employees.csv' WITH  DELIMITER ',' CSV HEADER;
\copy regions FROM '[Path_to_file]/regions.csv' WITH  DELIMITER ',' CSV HEADER;
\copy order_details FROM '[Path_to_file]/order_details.csv' WITH  DELIMITER ',' CSV HEADER;
\copy shippers FROM '[Path_to_file]/shippers.csv' WITH  DELIMITER ',' CSV HEADER;
\copy products FROM '[Path_to_file]/products.csv' WITH  DELIMITER ',' CSV HEADER;
\copy suppliers FROM '[Path_to_file]/suppliers.csv' WITH  DELIMITER ',' CSV HEADER;
\copy customers FROM '[Path_to_file]/customers.csv' WITH  DELIMITER ',' CSV HEADER;
\copy territories FROM '[Path_to_file]/territories.csv' WITH  DELIMITER ',' CSV HEADER;
\copy categories FROM '[Path_to_file]/territories.csv' WITH  DELIMITER ',' CSV HEADER;
