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
----------------------------------------------------------------------------------------------------

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
INSERT INTO Vehicle(vID, vType, problems, date_of_purchase)
VALUES (1, 'car', 'fasteners stuck', curdate() + interval rand()*883 day),
       (2, 'truck', 'musical horn broken', curdate() + interval rand()*883 day),
       (3, 'car', 'bullet holes', curdate() + interval rand()*883 day),
       (4, 'car', 'engine failure', curdate() + interval rand()*883 day),
       (5, 'car', 'mirror broken', curdate() + interval rand()*883 day);
	----------------------------------------------------------------------------------------------------
INSERT INTO Auto_mechanic(aID, dealership_address, date_hired, ID_vehicle_assigned)
VALUES (1, '219 West 47th Street', curdate() + interval rand()*883 day, 1),
       (2, '10880 Malibu Point', curdate() + interval rand()*883 day, 2),
       (3, '219 West 47th Street', curdate() + interval rand()*883 day, 3),
       (4, '219 West 47th Street', curdate() + interval rand()*883 day, 3),
       (5, '219 West 47th Street', curdate() + interval rand()*883 day, 3);
 ----------------------------------------------------------------------------------------------------      
INSERT INTO Manager(mID, dealership_address)
VALUES (7, '219 West 47th Street'),
       (8, '10880 Malibu Point'),
       (9, '10880 Malibu Point'),
       (10, '601 Buena Vista Avenue West'),
       (5, '219 West 47th Street');

----------------------------------------------------------------------------------------------------
INSERT INTO Sales_person(sID, dealership_address, date_hired, driver_license_number)
VALUES (4, '219 West 47th Street', curdate() + interval rand()*883 day, 66743015),
       (5, '219 West 47th Street', curdate() + interval rand()*883 day, 88541878),
       (9, '10880 Malibu Point', curdate() + interval rand()*883 day, 12566370),
       (10, '10880 Malibu Point', curdate() + interval rand()*883 day, 37673031),
       (7, '219 West 47th Street', curdate() + interval rand()*883 day, 37673031);
    ----------------------------------------------------------------------------------------------------   

INSERT INTO Car(cID, brands, models, manufacture_state, technician_assigned)
VALUES (1, 'Ford', 'Explorer', 'NY', 1),
       (3, 'Chevrolet', 'Tahoe', 'NY', 3),
       (4, 'Honda', 'Tahoe', 'NY', 3),
       (5, 'toyota', 'Tahoe', 'NY', 2);
       ----------------------------------------------------------------------------------------------------

INSERT INTO Truck(tID, brands, models, manufacture_state, technician_assigned)
VALUES (2, 'Ford', 'Ecoline', 'CA', 1),
		(3, 'Honda', 'civic', 'CA', 2),
        (4, 'Honda', 'CR-V', 'TN', 3),
        (5, 'Ford', 'HR-V', 'CA', 2),
        (1, 'toyoa', 'corrola', 'TX', 2);
----------------------------------------------------------------------------------------------------

INSERT INTO Customer(customer_ID, first_name, last_name, vehicle_ID)
VALUES (1, 'Richard', 'Reed', 1),
       (2, 'Scott', 'Lang', 2),
       (3, 'Nate', 'smith', 3),
       (4, 'john', 'smith', 3),
       (5, 'jake', 'wilson', 3),
       (6, 'Nicholas', 'johnson', 3),
       (7, 'jim', 'johnson', 3);

----------------------------------------------------------------------------------------------------

INSERT INTO Region_Manager(rID, region)
VALUES (6, 'MA'),
		(7,'TX'),
        (8,'WA'),
        (9,'GA'),
        (10,'TN');
 
