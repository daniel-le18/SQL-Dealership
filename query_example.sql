SET GLOBAL log_output = 'TABLE';      SET GLOBAL general_log = 'ON';
use dealership;

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
WHERE rID = 7;
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
WHERE rID = 7;
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
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of employees' FROM Employee;
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of mechanics'
FROM Employee
JOIN Auto_mechanic ON Employee.ID = Auto_mechanic.aID;
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of managers'
FROM Employee
JOIN Manager ON Employee.ID = Manager.mID;
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of sale persons'
FROM Employee
JOIN Sales_person ON Employee.ID = Sales_person.sID;
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of customers'
FROM Customer;
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of region manager/manager'
FROM Manager
RIGHT JOIN Region_Manager ON Manager.mID = Region_Manager.rID;
----------------------------------------------------------------------------------------------------
SELECT COUNT(*) AS 'number of vehicles'
FROM Vehicle;

SELECT COUNT(*) AS 'NUMBER OF CARS'
FROM Car;

SELECT COUNT(*) AS 'NUMBER OF TRUCKS'
FROM Truck;

SELECT COUNT(*) AS 'NUMBER OF MANAGERS'
FROM Manager;

SELECT COUNT(*) AS 'REPAiRING'
FROM Repairing;
-----------------------------------------------------------------------------------------------------
# Query all the truck/car the auto mechanics are working on 
SELECT 
    Vehicle.vID,
    Vehicle.vType,
    Auto_mechanic.aID,
    Employee.first_name,
    Employee.last_name
FROM
    Vehicle
        INNER JOIN
    Auto_mechanic ON Vehicle.vID = Auto_mechanic.ID_vehicle_assigned
        INNER JOIN
    Employee ON Employee.ID = Auto_mechanic.aID;
 ---------------------------------------------------------------------------------------------------------
# Show the cost of All the employees annually 
SELECT ID, salary_anual FROM Employee;
---------------------------------------------------------------------------------------------------------
# Show the vehicles that had been repaired the most 
SELECT 
    brands, Vehicle_Count.repairs
FROM
    (SELECT 
        brands, Car.cID AS 'id'
    FROM
        Car UNION ALL (SELECT 
        brands, Truck.tID AS 'id'
    FROM
        Truck)) brands,
    (SELECT 
        Vehicle.vID, COUNT(*) AS 'repairs'
    FROM
        Vehicle, Auto_mechanic
    WHERE
        Vehicle.vID = Auto_mechanic.ID_vehicle_assigned
    GROUP BY Vehicle.vID) Vehicle_Count
WHERE
    brands.id = Vehicle_Count.vID
ORDER BY Vehicle_Count.repairs DESC;
---------------------------------------------------------------------------------------------------------
# show the mechanic id along with the vehicles he is working on vID and service time 
SELECT 
    vID,   
    aID,
    vType, date_started, date_ended
FROM
    Repairing R
         JOIN
    Employee E ON R.aID = E.ID 
         JOIN
	Vehicle V ON R.cID = V.vID;

select * from mysql.general_log;
   
   
	