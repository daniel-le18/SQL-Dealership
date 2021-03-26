/********************************************************
* This script creates the database named dealership
*********************************************************/
DROP DATABASE IF EXISTS dealership;
CREATE DATABASE dealership;
USE dealership;

CREATE TABLE Employee (
    ID INT(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    ssn	INT(9) NOT NULL,
    address VARCHAR(50)
);

CREATE TABLE Region_Manager (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    region VARCHAR(2)	NOT NULL
);

CREATE TABLE Manager (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    dealership_address VARCHAR(50)	NOT NULL
);


CREATE TABLE Sales_person (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    dealership_address VARCHAR(50)	NOT NULL,
    date_hired	DATE	NOT NULL,
    driver_license_number	INT(8)	NOT NULL
);

CREATE TABLE Auto_mechanic(
	ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    dealership_address VARCHAR(50)	NOT NULL,
    date_hired	DATE	NOT NULL,
    ID_vehicle_assigned	INT(4)	NOT NULL
);

CREATE TABLE vehicle(
	vID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    vType VARCHAR(15) NOT NULL,
    problems VARCHAR(20),
	date_of_purchase	DATE	NOT NULL
);

CREATE TABLE car(
	vID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
	manufacture_state	VARCHAR(2)	NOT NULL,
	technician_assigned	INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE truck(
	vID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    brands VARCHAR(15) NOT NULL,
    models VARCHAR(15) NOT NULL,
	manufacture_state	VARCHAR(2)	NOT NULL,
    technician_assigned	INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE Customer(
	customer_ID	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    vehicle_ID	INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
);