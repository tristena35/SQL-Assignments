/*
This table something is composed of Varibles:
-SquareFt
-HighTemp
-LowTemp
-AverageTemp
-AverageHumidity
-MovieTheatreAvailable

The primary key is the: Location
*/
DROP TABLE IF EXISTS cs85_assignment2_aquapark_aquarium;
CREATE TABLE cs85_assignment2_aquapark_aquarium(
SquareFt INT,
HighTemp DECIMAL(3,2), 
LowTemp DECIMAL(3,2),
AverageTemp DECIMAL(3,2),
AverageHumidity DECIMAL(3,2),
MovieTheatreAvailable BOOLEAN,
--The location must correspond to the tanks
Location VARCHAR(45),
--Each marine belongs to exactly one aquarium
marine_specialist_id INT, 
PRIMARY KEY(Location)
);

/*
This table something is composed of Varibles:
-SquareFt
-Description
-IsCompletelySubmerged
-maring_life

The primary key is the: Location
*/

DROP TABLE IF EXISTS cs85_assignment2_aquapark_tank;
CREATE TABLE cs85_assignment2_aquapark_tank(
SquareFt INT,
--This location matches to aquarium location
Location VARCHAR(45),
Description VARCHAR(45),
IsCompletelySubmerged BOOLEAN,
marine_life VARCHAR(45),
PRIMARY KEY(Location)
);

/*
This table something is composed of Varibles:
-Name
-Classification
-Age
-Health
-feed_type

The primary key is the: Classification
*/
DROP TABLE IF EXISTS cs85_assignment2_aquapark_marine_life;
CREATE TABLE cs85_assignment2_aquapark_marine_life(
Name VARCHAR(45),
Classification VARCHAR(45) PRIMARY KEY,
Age INT,
Health VARCHAR(45),
--Each marine life eat different things
feed_type VARCHAR(45)
);

/*
This table something is composed of Varibles:
-Name
-Calories
-Location
-Quantity

The primary key is the: Name
*/
DROP TABLE IF EXISTS cs85_assignment2_aquapark_feed_type;
CREATE TABLE cs85_assignment2_aquapark_feed_type(
--The name variable must match the marine_life feed_type
Name VARCHAR(45) PRIMARY KEY,
Calories INT,
Location VARCHAR(45),
Quantity INT,
--Surrogate Key
UNIQUE(Name,Location)
);

/*
This table something is composed of Varibles:
-FirstName
-LastName
-Salary
-Speciality
-marine_specialty

The primary key is the: marine_specialist_id
*/
DROP TABLE IF EXISTS cs85_assignment2_aquapark_marine_specialist;
CREATE TABLE cs85_assignment2_aquapark_marine_specialist(
FirstName VARCHAR(45),
LastName VARCHAR(45),
Salary DECIMAL(10,2),
Specialty VARCHAR(45),
--The specialist can have the same speciality but separated by there id
marine_specialist_id INT AUTO_INCREMENT PRIMARY KEY
);

/*
This table something is composed of Varibles:
-marine_life
-marine_specialist
-Date
-Description
-performers

The primary key is the: marine_specialist
*/
DROP TABLE IF EXISTS cs85_assignment2_aquapark_show;
CREATE TABLE cs85_assignment2_aquapark_show(
--Exactly One Marine Life
marine_life VARCHAR(45) PRIMARY KEY,
--Exactly One Marine Specialist
marine_specialist VARCHAR(45) PRIMARY KEY,
Date DATE,
Description VARCHAR(45),
performers VARCHAR(45)
);