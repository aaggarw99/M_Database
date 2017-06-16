DROP VIEW IF EXISTS view1;
-- creates a view that returns a user's state and first name where their password is password and live in the United States
CREATE VIEW view1 AS (SELECT state, user_first_name FROM USER WHERE password = "password" AND country = "United States");

-- finds the users who are from a state that starts with an L
SELECT user_first_name, state
FROM view1
WHERE state LIKE 'L%';

-- returns the hours weekly of every user in view1
SELECT U.hours_weekly
FROM view1 V, USER U
WHERE V.user_first_name = U.user_first_name;

DROP VIEW IF EXISTS view2;
-- creates a query that returns the instruments that are not classical
CREATE VIEW view2 AS (SELECT I.instrument_name FROM INSTRUMENT I, BELONGS B WHERE I.instrument_name = B.instrument_name AND B.genre_name != "Classical");

-- finds the usernames of the people who play the instruments returned in view2
SELECT P.username 
FROM view2 V, PLAYS P
WHERE V.instrument_name = P.instrument_name;

-- finds the user's first name and state where they play an instrument in view2
SELECT U.user_first_name, U.state
FROM view2 V, PLAYS P, USER U
WHERE V.instrument_name = P.instrument_name
AND P.username = U.username;

