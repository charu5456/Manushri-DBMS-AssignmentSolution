create Database `TravelOnTheGo`;
use `TravelOnTheGo`;

CREATE TABLE `PASSENGER` (
    `Passenger_name` VARCHAR(25) PRIMARY KEY,
    `Category` VARCHAR(10),
    `Gender` VARCHAR(6),
    `Boarding_City` VARCHAR(20),
    `Destination_City` VARCHAR(20),
    `Distance` INT NOT NULL,
    `Bus_Type` VARCHAR(10)
);


INSERT INTO `PASSENGER` VALUES("Sejal", "AC", 'F', "Bengaluru", "Chennai", 350, "Sleeper");
INSERT INTO `PASSENGER` VALUES("Anmol", "Non-AC", 'M', "Mumbai", "Hyderabad", 700, "Sitting");
INSERT INTO `PASSENGER` VALUES("Pallavi", "AC", 'F', "Panaji", "Bengaluru", 600, "Sleeper");
INSERT INTO `PASSENGER` VALUES("Khusboo", "AC", 'F', "Chennai", "Mumbai", 1500, "Sleeper");
INSERT INTO `PASSENGER` VALUES("Udit", "Non-AC", 'M', "Trivandrum", "Panaji", 1000, "Sleeper");
INSERT INTO `PASSENGER` VALUES("Ankur", "AC", 'M', "Nagpur", "Hyderabad", 500, "Sitting");
INSERT INTO `PASSENGER` VALUES("Hemant", "Non-AC", 'M', "Panaji", "Mumbai", 700, "Sleeper");
INSERT INTO `PASSENGER` VALUES("Manish", "Non-AC", 'M', "Hyderabad", "Bengaluru", 500, "Sitting");
INSERT INTO `PASSENGER` VALUES("Piyush", "AC", 'M', "Pune", "Nagpur", 700, "Sitting");

CREATE TABLE `PRICE` (
    `Bus_Type` VARCHAR(20),
    `Distance` INT NOT NULL,
    `Price` INT NOT NULL
);

INSERT INTO `PRICE` VALUES("Sleeper", 350, 770);
INSERT INTO `PRICE` VALUES("Sleeper", 500, 1100);
INSERT INTO `PRICE` VALUES("Sleeper", 600, 1320);
INSERT INTO `PRICE` VALUES("Sleeper", 700, 1540);
INSERT INTO `PRICE` VALUES("Sleeper", 1000, 2200);
INSERT INTO `PRICE` VALUES("Sleeper", 1200, 2640);
INSERT INTO `PRICE` VALUES("Sleeper", 350, 434);
INSERT INTO `PRICE` VALUES("Sleeper", 500, 620);
INSERT INTO `PRICE` VALUES("Sleeper", 500, 620);
INSERT INTO `PRICE` VALUES("Sleeper", 600, 744);
INSERT INTO `PRICE` VALUES("Sleeper", 700, 868);
INSERT INTO `PRICE` VALUES("Sleeper", 1000, 1240);
INSERT INTO `PRICE` VALUES("Sleeper", 1200, 1488);
INSERT INTO `PRICE` VALUES("Sleeper", 1500, 1860);

/* Write queries for the following: */

/* 3) How many females and how many male passengers travelled for a minimum distance of 
600 KM s? */

SELECT 
    Gender, COUNT(Gender)
FROM
    Passenger
WHERE
    Distance >= 600
GROUP BY Gender; 

#4) Find the minimum ticket price for Sleeper Bus. 

SELECT 
    MIN(Price)
FROM
    PRICE
WHERE
    Bus_Type = 'Sleeper';
    
#5) Select passenger names whose names start with character 'S'

SELECT 
    Passenger_name
FROM
    PASSENGER
WHERE
    Passenger_name LIKE 'S%';
    
/* 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
Destination City, Bus_Type, Price in the output */

SELECT 
    PASSENGER.Passenger_name,
    PASSENGER.Boarding_City,
    PASSENGER.Destination_City,
    PRICE.Bus_Type,
    PRICE.Price
FROM
    PASSENGER,
    PRICE
WHERE
    PASSENGER.Distance
        AND PASSENGER.Bus_type = Price.Bus_Type;
        
/* 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a 
distance of 1000 KM s  */

SELECT 
    Passenger_name, Price
FROM
    PASSENGER,
    PRICE
WHERE
    PASSENGER.Bus_Type = 'Sitting'
        AND PASSENGER.Distance = 1000; 

/* 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
Panaji? */

SELECT 
    Distance, Bus_type, Price
FROM
    PRICE
    WHERE
    Distance = (SELECT 
            Distance
        FROM
            PASSENGER
        WHERE
            Passenger_name = 'Pallavi');

/* 9) List the distances from the "Passenger" table which are unique (non-repeated 
distances) in descending order */

SELECT 
    Distance
FROM
    Passenger
ORDER BY Distance DESC;

/* 10) Display the passenger name and percentage of distance travelled by that passenger 
from the total distance travelled by all passengers without using user variables */

SELECT 
    Passenger_name,
    (Distance / (SELECT 
            SUM(Distance)
        FROM
            PASSENGER) * 100) percentage
FROM
    PASSENGER;
 
/* 11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise */

SELECT 
    Distance,
    Price,
    CASE
        WHEN Price > 1000 THEN 'Expensive'
        WHEN Price > 500 THEN 'Average Cost'
        ELSE 'Cheap'
    END AS Verdict
FROM
    PRICE;

