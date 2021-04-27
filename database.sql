/********************************************************
* This script creates the database named dealership
*********************************************************/
 
DROP DATABASE IF EXISTS dealership;
CREATE DATABASE dealership;
USE dealership;


CREATE TABLE Employee (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary_anual INT NOT NULL,
    date_of_birth DATE NOT NULL,
    ssn INT NOT NULL,
    address VARCHAR(50)
);


CREATE TABLE Region_Manager (
    rID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    region VARCHAR(2) NOT NULL,
    CONSTRAINT Region_Manager_fk_Employee FOREIGN KEY (rID)
        REFERENCES Employee (ID)
);
        

CREATE TABLE Manager (
    mID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dealership_address VARCHAR(50) NOT NULL,
    CONSTRAINT Manager_fk_Employee FOREIGN KEY (mID)
        REFERENCES Employee (ID)
);




CREATE TABLE Sales_person (
    sID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dealership_address VARCHAR(50) NOT NULL,
    date_hired DATE NOT NULL,
    driver_license_number INT NOT NULL,
    CONSTRAINT Sales_person_fk_Employee FOREIGN KEY (sID)
        REFERENCES Employee (ID)
);



CREATE TABLE Vehicle (
    vID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    vType VARCHAR(15) NOT NULL,
    problems VARCHAR(20),
    date_of_purchase DATE NOT NULL
);




CREATE TABLE Auto_mechanic (
    aID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dealership_address VARCHAR(50) NOT NULL,
    date_hired DATE NOT NULL,
    ID_vehicle_assigned INT NOT NULL,
    CONSTRAINT Auto_mechanic_fk_Employee FOREIGN KEY (aID)
        REFERENCES Employee (ID),
    CONSTRAINT Auto_mechanic_fk_Vehical FOREIGN KEY (ID_vehicle_assigned)
        REFERENCES Vehicle (vID)
);



CREATE TABLE Car (
    cID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
    manufacture_state VARCHAR(2) NOT NULL,
    technician_assigned INT NOT NULL,
    CONSTRAINT Car_fk_Vehicle FOREIGN KEY (cID)
        REFERENCES vehicle (vID),
    CONSTRAINT Car_fk_Auto_mechanic FOREIGN KEY (technician_assigned)
        REFERENCES Auto_mechanic (aID)
);

       
CREATE TABLE Truck (
    tID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
    manufacture_state VARCHAR(2) NOT NULL,
    technician_assigned INT NOT NULL,
    CONSTRAINT Truck_fk_Vehicle FOREIGN KEY (tID)
        REFERENCES vehicle (vID),
    CONSTRAINT Truck_fk_Auto_mechanic FOREIGN KEY (technician_assigned)
        REFERENCES Auto_mechanic (aID)
);

        

CREATE TABLE Customer (
    customer_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    vehicle_ID INT NOT NULL,
    CONSTRAINT Customer_fk_Vehicle FOREIGN KEY (vehicle_ID)
        REFERENCES vehicle (vID)
);


INSERT INTO Employee(ID, first_name, last_name, salary_anual, date_of_birth, ssn, address)
VALUES (1, 'Peter', 'Parker', 100000, curdate() + interval rand()*883 day, 31415926, '20 Ingram Street'),
       (2, 'Johnny', 'Storm', 120000, curdate()+ interval rand()*883 day, 27182818, '300 Madison Avenue'),
       (3, 'Scott', 'Summers', 60000, curdate()+ interval rand()*883 day, 66236070, '1407 Graymalkin Lane'),
       (4, 'James', 'Barnes', 150000, curdate()+ interval rand()*883 day, 16180339, '1 Wakanda Way'),
       (5, 'Natalia', 'Romanova', 150000, curdate()+ interval rand()*883 day, 60221407, '219 West 47th Street'),
       (6, 'Stephen', 'Strange', 180000, curdate()+ interval rand()*883 day, 29979245, '177A Bleecker Street'),
       (7, 'Steven', 'Rogers', 50000, curdate()+ interval rand()*883 day, 16021766, '219 West 47th Street'),
       (8, 'Anthony', 'Stark', 1000000, curdate()+ interval rand()*883 day, 91009383, '10880 Malibu Point'),
       (9, 'Virginia', 'Potts', 200000, curdate()+ interval rand()*883 day, 16772621, '10880 Malibu Point'),
       (10, 'Janet', 'van Dyne', 140000, curdate()+ interval rand()*883 day, 16747927, '601 Buena Vista Avenue West');

----------------------------------------------------------------------------------------------------

INSERT INTO Region_Manager(rID, region)
VALUES (6, 'MA'),
		(7,'TX'),
        (8,'WA'),
        (9,'GA'),
        (10,'TN');
 
 ----------------------------------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
UPDATE Employee 
SET first_name = 'nathan'
WHERE ID = 1;
----------------------------------------------------------------------------------------------------

DELETE FROM Employee 
WHERE ID = 10;
  
----------------------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
UPDATE Region_Manager 
SET region = 'MI'
WHERE rID = 8;
----------------------------------------------------------------------------------------------------

DELETE FROM Region_Manager 
WHERE
    rID = 7;
----------------------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
UPDATE Auto_mechanic 
SET dealership_address = '601 Buena Vista Avenue West'
WHERE dealership_address = '10880 Malibu Point' AND aID = 5;
----------------------------------------------------------------------------------------------------

DELETE FROM Auto_mechanic 
WHERE aID = 5;
----------------------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
UPDATE Car 
SET technician_assigned = 3
WHERE technician_assigned = 1;
----------------------------------------------------------------------------------------------------

DELETE FROM Car 
WHERE cID = 5;
----------------------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
UPDATE Truck 
SET technician_assigned = 3
WHERE technician_assigned = 1;
----------------------------------------------------------------------------------------------------

DELETE FROM Truck 
WHERE tID = 5;
----------------------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
UPDATE Customer 
SET first_name = 'Nathan'
WHERE customer_ID = 1;
----------------------------------------------------------------------------------------------------

DELETE FROM Customer 
WHERE customer_ID = 7;