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
    ssn	INT NOT NULL,
    address VARCHAR(50)
);

CREATE TABLE Region_Manager (
    rID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    region VARCHAR(2)	NOT NULL,
    CONSTRAINT Region_Manager_fk_Employee
    FOREIGN KEY (rID)
    REFERENCES Employee (ID)
);

CREATE TABLE Manager (
    mID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dealership_address VARCHAR(50)	NOT NULL,
    CONSTRAINT Manager_fk_Employee
    FOREIGN KEY (mID)
    REFERENCES Employee (ID)
    
);


CREATE TABLE Sales_person (
    sID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dealership_address VARCHAR(50)	NOT NULL,
    date_hired	DATE	NOT NULL,
    driver_license_number	INT	NOT NULL,
    
    CONSTRAINT Sales_person_fk_Employee
    FOREIGN KEY (sID)
    REFERENCES Employee (ID)
    

);

CREATE TABLE Vehicle(
	vID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    vType VARCHAR(15) NOT NULL,
    problems VARCHAR(20),
	date_of_purchase	DATE	NOT NULL
);

CREATE TABLE Auto_mechanic(
	aID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dealership_address VARCHAR(50)	NOT NULL,
    date_hired	DATE	NOT NULL,
    ID_vehicle_assigned	INT NOT NULL,
    
    CONSTRAINT Auto_mechanic_fk_Employee
    FOREIGN KEY (aID)
    REFERENCES Employee (ID),
    
	CONSTRAINT Auto_mechanic_fk_Vehical
    FOREIGN KEY (ID_vehicle_assigned)
    REFERENCES Vehicle (vID)
);


CREATE TABLE Car(
	cID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
	manufacture_state	VARCHAR(2)	NOT NULL,
	technician_assigned	INT NOT NULL,
    CONSTRAINT Car_fk_Vehicle
    FOREIGN KEY (cID)
    REFERENCES vehicle (vID),
    
    CONSTRAINT Car_fk_Auto_mechanic
    FOREIGN KEY (technician_assigned)
    REFERENCES Auto_mechanic (aID)
    
);

CREATE TABLE Truck(
	tID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
	manufacture_state	VARCHAR(2)	NOT NULL,
    technician_assigned	INT NOT NULL ,
    
    CONSTRAINT Truck_fk_Vehicle
    FOREIGN KEY (tID)
    REFERENCES vehicle (vID),
    
	CONSTRAINT Truck_fk_Auto_mechanic
    FOREIGN KEY (technician_assigned)
    REFERENCES Auto_mechanic (aID)
    
);

CREATE TABLE Customer(
	customer_ID	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    vehicle_ID	INT NOT NULL ,
    CONSTRAINT Customer_fk_Vehicle
    FOREIGN KEY (vehicle_ID)
    REFERENCES vehicle (vID)
);