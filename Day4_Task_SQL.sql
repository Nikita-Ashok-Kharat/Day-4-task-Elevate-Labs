use hostel;

select * from hostel;
select * from room;
select * from mess;

-- Added some more rows in the 'room' table
insert into room 
values(6,4,"Ground",3),(7,4,"First",3),
(8,4,"Second",3),(9,4,"Ground",4),(10,4,"Ground",4);

/*
 1.Apply aggregate functions on numeric columns
 */
 
 -- SUM 
 -- Retrieve total capacity across all hostels
SELECT SUM(capacity) AS total_capacity FROM hostel;
-- Retrieve total capacity across all girls hostels 
SELECT SUM(capacity) AS total_capacity FROM hostel WHERE hostel_TYPE = 'Girls';

-- COUNT
-- Display total number of rooms in all hostels 
SELECT COUNT(*) AS total_rooms FROM room;
-- Display total number of rooms in G1 hostel
SELECT COUNT(*) AS total_rooms FROM room WHERE hostel_id = 1;

-- AVG
-- Retrieve Average room capacity 
SELECT AVG(capacity) AS avg_room_capacity FROM hostel;
-- Retrieve type wise Average room capacity
SELECT AVG(capacity) AS avg_room_capacity FROM hostel GROUP BY hostel_TYPE;

-- MIN
-- Retrieve Minimum mess cost
SELECT MIN(cost) AS min_mess_cost FROM mess;

-- MAX 
-- Retrieve Maximum mess cost
SELECT MAX(cost) AS max_mess_cost FROM mess;

/*
 2.Use GROUP BY to categorize
 */
 
 -- Retrieve the list of all types of mess
 select mess_type from mess group by mess_type; 
 
-- Retrieve the total no. of rooms present in all girls and boys hostels
SELECT  hostel_type, SUM(no_of_rooms) AS total_rooms 
FROM hostel 
GROUP BY hostel_type;

/*
 3.Filter groups using HAVING
 */
 
-- Retrieve THE Mess types with average cost above 3000
SELECT mess_type, AVG(cost) AS avg_cost
FROM mess
GROUP BY mess_type
HAVING AVG(cost) > 3000;

-- Retrieve THE Mess types with average cost between 1000 to 2500
SELECT mess_type, AVG(cost) AS avg_cost
FROM mess
GROUP BY mess_type
HAVING AVG(cost) BETWEEN 1000 AND 2500;











