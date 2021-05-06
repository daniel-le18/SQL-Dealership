/********************************************************
* This script creates the database named dealership
*********************************************************/
 SET GLOBAL log_output = 'TABLE';      SET GLOBAL general_log = 'ON';
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

CREATE TABLE Repairing (
	aID INT,
    cID INT,
    date_started DATE NOT NULL,
    date_ended DATE, 
    PRIMARY KEY (aID, cID),
	CONSTRAINT Repairing_fk_Employee FOREIGN KEY (aID)
		 REFERENCES Employee (ID),
	CONSTRAINT Repairing_fk_Vehicle FOREIGN KEY (cID)
		REFERENCES Vehicle(vID)
);

CREATE TABLE Car (
    cID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
    manufacture_state VARCHAR(2) NOT NULL,
    technician_assigned INT NOT NULL,
    CONSTRAINT Car_fk_Vehicle FOREIGN KEY (cID)
        REFERENCES Vehicle (vID),
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
        REFERENCES Vehicle (vID),
    CONSTRAINT Truck_fk_Auto_mechanic FOREIGN KEY (technician_assigned)
        REFERENCES Auto_mechanic (aID)
);

CREATE TABLE Customer (
    customer_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    vehicle_ID INT NOT NULL,
    CONSTRAINT Customer_fk_Vehicle FOREIGN KEY (vehicle_ID)
        REFERENCES Vehicle (vID)
);

/*INSERTS*/
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (1, 'Conrade', 'Rattray', 100821, curdate()+ interval rand()*883 day, 31, '730 Green Crossing');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (2, 'Annalee', 'Perell', 72263, curdate()+ interval rand()*883 day, 58, '582 Forest Run Park');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (3, 'Tristan', 'Grigori', 52136, curdate()+ interval rand()*883 day, 77, '532 Fisk Parkway');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (4, 'Quentin', 'Booty', 59151, curdate()+ interval rand()*883 day, 85, '476 Pepper Wood Alley');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (5, 'Emanuele', 'Wennam', 85641, curdate()+ interval rand()*883 day, 20, '4 Cambridge Point');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (6, 'Astrix', 'Sickamore', 128394, curdate()+ interval rand()*883 day, 34, '697 Chinook Lane');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (7, 'Marlene', 'Gingle', 68506, curdate()+ interval rand()*883 day, 7, '08847 Cascade Terrace');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (8, 'Dre', 'Munn', 118648, curdate()+ interval rand()*883 day, 64, '5299 Haas Hill');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (9, 'Lacey', 'Trounce', 67558, curdate()+ interval rand()*883 day, 98, '207 4th Place');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (10, 'Rani', 'Darrell', 83369, curdate()+ interval rand()*883 day, 50, '09 Mcguire Alley');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (11, 'Silvan', 'Kordes', 142039, curdate()+ interval rand()*883 day, 71, '8824 Stuart Court');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (12, 'Faustina', 'Sheal', 137779, curdate()+ interval rand()*883 day, 74, '24 Debs Plaza');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (13, 'Idell', 'Steggals', 108946, curdate()+ interval rand()*883 day, 24, '4740 Loftsgordon Terrace');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (14, 'Essy', 'Beckwith', 146305, curdate()+ interval rand()*883 day, 43, '8662 Merchant Hill');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (15, 'Filide', 'Feehan', 135150, curdate()+ interval rand()*883 day, 84, '931 Bultman Way');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (16, 'Vilma', 'Walden', 54572, curdate()+ interval rand()*883 day, 14, '44816 Little Fleur Plaza');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (17, 'Laura', 'Glasscoe', 59889, curdate()+ interval rand()*883 day, 89, '16451 Bartillon Court');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (18, 'Andi', 'Sonnenschein', 88794, curdate()+ interval rand()*883 day, 17, '8 Kennedy Circle');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (19, 'Dunc', 'McConway', 80708, curdate()+ interval rand()*883 day, 88, '97966 Prentice Hill');
insert into Employee (ID, first_name, last_name, salary_anual, date_of_birth, ssn, address) values (20, 'Kerby', 'McInally', 105595, curdate()+ interval rand()*883 day, 98, '38585 Oriole Circle');


insert into Region_Manager (rID, region) values (2, 'VM');
insert into Region_Manager (rID, region) values (3, 'NU');
insert into Region_Manager (rID, region) values (4, 'ZU');
insert into Region_Manager (rID, region) values (5, 'FK');


insert into Manager (mID, dealership_address) values (1, '9147 Mosinee Trail');


insert into Sales_person (sID, dealership_address, date_hired, driver_license_number) values (6, '368 Acker Junction', curdate()+ interval rand()*883 day, 965);
insert into Sales_person (sID, dealership_address, date_hired, driver_license_number) values (7, '82 Dunning Street', curdate()+ interval rand()*883 day, 501);
insert into Sales_person (sID, dealership_address, date_hired, driver_license_number) values (8, '2 Haas Avenue', curdate()+ interval rand()*883 day, 969);
insert into Sales_person (sID, dealership_address, date_hired, driver_license_number) values (9, '4 Nelson Crossing', curdate()+ interval rand()*883 day, 883);
insert into Sales_person (sID, dealership_address, date_hired, driver_license_number) values (10, '4306 Schurz Junction', curdate()+ interval rand()*883 day, 860);

insert into Vehicle (vID, vType, problems, date_of_purchase) values (1, 'truck', 'vitae quam', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (2, 'truck', 'accumsan odio', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (3, 'truck', null, curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (4, 'truck', 'vulputate ut', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (5, 'car', 'hac habitasse', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (6, 'car', null, curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (7, 'truck', 'montes nascetur', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (8, 'car', 'vel lectus', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (9, 'truck', 'turpis adipiscing', curdate()+ interval rand()*883 day);
insert into Vehicle (vID, vType, problems, date_of_purchase) values (10, 'car', 'carpet is burnt', curdate()+ interval rand()*883 day);


insert into Auto_mechanic (aID, dealership_address, date_hired, ID_vehicle_assigned) values (11, '18077 Blackbird Lane', curdate()+ interval rand()*883 day, 8);
insert into Auto_mechanic (aID, dealership_address, date_hired, ID_vehicle_assigned) values (12, '5835 Prairie Rose Street', curdate()+ interval rand()*883 day, 1);
insert into Auto_mechanic (aID, dealership_address, date_hired, ID_vehicle_assigned) values (13, '3 Buena Vista Terrace', curdate()+ interval rand()*883 day, 3);
insert into Auto_mechanic (aID, dealership_address, date_hired, ID_vehicle_assigned) values (14, '1 Prairie Rose Junction', curdate()+ interval rand()*883 day, 10);
insert into Auto_mechanic (aID, dealership_address, date_hired, ID_vehicle_assigned) values (15, '9 Twin Pines Circle', curdate()+ interval rand()*883 day, 8);

insert into Repairing(aID, cID, date_started, date_ended)
values (11, 1, "2021-05-01", "2021-05-02"),
(11, 2, "2021-05-02", "2021-03-05"),
(11,3, "2021-05-03", "2021-05-04"),
(12, 4, "2021-05-01", "2021-05-02"),
(12, 5, "2021-05-02", "2021-05-03"),
(13, 6, "2021-05-02", "2021-05-03"),
(13,7,"2021-05-04", "2021-05-05"),
(14,8,"2021-01-05", "2021-03-05"),
(15, 9,"2021-05-01", "2021-05-02");


insert into Car (cID, brands , models, manufacture_state, technician_assigned) values (5, 'Lexus', 'ES', 'NY', 14);
insert into Car (cID, brands , models, manufacture_state, technician_assigned) values (6, 'Ford', 'Escape', 'MN', 13);
insert into Car (cID, brands , models, manufacture_state, technician_assigned) values (8, 'Isuzu', 'Ascender', 'OH', 15);
insert into Car (cID, brands , models, manufacture_state, technician_assigned) values (10, 'Mazda', 'Mazda6', 'GA', 12);


insert into Truck (tID, brands , models, manufacture_state, technician_assigned) values (1, 'Dodge', 'Ram 3500', 'KY', 15);
insert into Truck (tID, brands , models, manufacture_state, technician_assigned) values (4, 'Chevrolet', 'Camaro', 'MD', 14);
insert into Truck (tID, brands , models, manufacture_state, technician_assigned) values (2, 'Chevrolet', 'Express 3500', 'FL', 13);
insert into Truck (tID, brands , models, manufacture_state, technician_assigned) values (3, 'Saab', '900', 'NY', 13);
insert into Truck (tID, brands , models, manufacture_state, technician_assigned) values (9, 'Acura', 'NSX', 'SC', 11);

select * from mysql.general_log;