SELECT * FROM typing02_driver WHERE driver_id=2;
DELETE FROM typing02_driver WHERE driver_id=1;
SELECT * FROM typing02_driver WHERE driver_id=2;
SELECT * FROM typing02_trip WHERE driver_id=2;
DELETE FROM typing02_trip WHERE driver_id=2;
SELECT * FROM typing02_trip WHERE date_start="2017-03-14" OR date_end="2017-03-14";
DELETE FROM typing02_trip WHERE date_start="2017-03-14" OR date_end="2017-03-14";
SELECT * FROM typing02_trip WHERE date_start="2017-03-14" OR date_end="2017-03-14";
SELECT * FROM typing02_truck;
DELETE FROM typing02_truck WHERE (truck_id) NOT IN 
(SELECT truck_id FROM typing02_trip);
SELECT * FROM typing02_truck;
DELETE FROM typing02_landmark;
SELECT * FROM typing02_landmark;
DESCRIBE typing02_landmark;
SELECT * FROM typing02_landmark;
CREATE TABLE typing02_landmark(
    landmark_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    city VARCHAR(58)
);

INSERT INTO typing02_landmark(name,latitude,longitude) VALUE ('Queens College',40.7381,-73.8219);
SELECT * FROM typing02_landmark;
DROP TABLE typing02_landmark;
DESCRIBE typing02_landmark;
INSERT INTO typing02_landmark(name,latitude,longitude) VALUE ('Queens College',40.7381,-73.8219);
SELECT * FROM typing02_landmark;
CREATE TABLE typing02_landmark(
    landmark_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    city VARCHAR(58)
);

SELECT * FROM typing02_driver WHERE driver_id=1;
UPDATE typing02_driver SET fname = "William" WHERE driver_id=1;
SELECT * FROM typing02_driver WHERE driver_id=1;
SELECT * FROM typing02_trip WHERE date_end ="2017-11-05";
UPDATE typing02_trip SET date_start ="2017-11-01" WHERE date_end = "2017-11-05";
SELECT * FROM typing02_trip WHERE date_end ="2017-11-05";
SELECT * FROM typing02_landmark WHERE name="Taj Mahal";
UPDATE typing02_landmark SET latitude = 28.0050, longitude = 77.9510 WHERE name="Taj Mahal";
SELECT * FROM typing02_landmark WHERE name="Taj Mahal";
SELECT * FROM typing02_landmark WHERE name = "Uluru";
UPDATE typing02_landmark SET name="Ayers Rock" WHERE name="Uluru";
SELECT * FROM typing02_landmark WHERE name = "Ayers Rock";
SELECT * FROM typing02_driver WHERE driver_id=12;
UPDATE typing02_driver SET driver_id=13 WHERE driver_id=12;
SELECT * FROM typing02_driver WHERE driver_id=13;
SELECT * FROM typing02_trip WHERE driver_id = 13;
SELECT * FROM typing02_trip WHERE driver_id = 12
UPDATE typing02_trip SET driver_id=13 WHERE driver_id=12;
UPDATE typing02_driver SET driver_id=1 WHERE driver_id=11;
UPDATE typing02_landmark SET name="King Tut's Tomb", latitude = 25.740222, longitude=32.601333;
SELECT * FROM typing02_landmark;