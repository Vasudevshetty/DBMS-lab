use sailors;

-- Q1: Find the colors of boats reserved by Albert
SELECT "Finding the colors of boats reserved by Albert" AS Description;
SELECT DISTINCT B.color
FROM Boat B
JOIN reserves R ON B.bid = R.bid
JOIN Sailors S ON R.sid = S.sid
WHERE S.sname = "Albert";

-- Q2: Find all sailor IDs of sailors who have a rating of at least 8 or reserved boat 103
SELECT "Finding all sailor IDs with rating >= 8 OR who reserved boat 103" AS Description;
SELECT DISTINCT S.sid
FROM Sailors S
LEFT JOIN reserves R ON S.sid = R.sid
WHERE S.rating >= 8 OR R.bid = 103;

-- Q3: Find the names of sailors who have not reserved a boat whose name contains "storm", ordered alphabetically
SELECT "Finding sailors who have NOT reserved a boat with 'storm' in its name" AS Description;
SELECT DISTINCT S.sname
FROM Sailors S
WHERE S.sid NOT IN (
    SELECT R.sid
    FROM reserves R
    JOIN Boat B ON R.bid = B.bid
    WHERE B.bname LIKE "%storm%"
)
ORDER BY S.sname ASC;

-- Q4: Find the names of sailors who have reserved all boats
SELECT "Finding sailors who have reserved all boats" AS Description;
SELECT S.sname
FROM Sailors S
WHERE NOT EXISTS (
    SELECT B.bid
    FROM Boat B
    WHERE NOT EXISTS (
        SELECT R.sid
        FROM reserves R
        WHERE R.bid = B.bid AND R.sid = S.sid
    )
);

-- Q5: Find the name and age of the oldest sailor
SELECT "Finding the oldest sailor's name and age" AS Description;
SELECT sname, age 
FROM Sailors 
WHERE age = (SELECT MAX(age) FROM Sailors);

-- Q6: Find boats reserved by at least 2 sailors aged 40+ and their average age
SELECT "Finding boats reserved by at least 2 sailors aged 40+ with their average age" AS Description;
SELECT R.bid, AVG(S.age) AS average_age
FROM reserves R
JOIN Sailors S ON R.sid = S.sid
WHERE S.age >= 40
GROUP BY R.bid
HAVING COUNT(DISTINCT R.sid) >= 2;

-- Q7: Create a view that shows the names and colors of boats reserved by sailors with rating 5
SELECT "Creating a view for boats reserved by sailors with rating 5" AS Description;
CREATE OR REPLACE VIEW ReservedBoatsWithRatedSailor AS
SELECT DISTINCT B.bname, B.color
FROM Boat B
JOIN reserves R ON B.bid = R.bid
JOIN Sailors S ON R.sid = S.sid
WHERE S.rating = 5;

-- View Data
SELECT "Showing boats reserved by sailors with rating 5" AS Description;
SELECT * FROM ReservedBoatsWithRatedSailor;

-- Q8: Create a trigger to prevent deletion of boats with active reservations
SELECT "Creating a trigger to prevent deletion of boats with active reservations" AS Description;
DELIMITER //
CREATE TRIGGER PreventDeleteBoat
BEFORE DELETE ON Boat
FOR EACH ROW
BEGIN
    DECLARE res_cnt INT;
    SELECT COUNT(*) INTO res_cnt FROM reserves WHERE bid = OLD.bid;
    IF res_cnt > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CANNOT DELETE. BOAT HAS ACTIVE RESERVATIONS.';
    END IF;
END;
//
DELIMITER ;

-- Test: Attempt to delete a boat (will fail if there are active reservations)
SELECT "Attempting to delete a boat with reservations (should fail)" AS Description;
DELETE FROM Boat WHERE bid = 103;
