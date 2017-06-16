-- Procedure 1: add Ashwin to User Table

CALL addUserToUserTable(15000, "aaggarw", "Ashwin", "Aggarwal", "aaggarw99@gmail.com", "asdf123", 15, 17, "Chicago", "Illinois", "United States");

-- Show that I'm added
SELECT *
FROM USER
WHERE username = "aaggarw";

-- Procedure 2: Update my location
-- Before moving location
SELECT city, state, country
FROM USER
WHERE username = "aaggarw";

-- Calling Procedure
CALL updateCityStateCountry(15000, "San Francisco", "California", "United States");

-- Showing my update to DB
SELECT city, state, country
FROM USER
WHERE username = "aaggarw";

-- Procedure 3: updateHours
-- Before changing
SELECT hours_weekly
FROM USER
WHERE username = "aaggarw";

-- Calling procedure
CALL updateHours(15000, 42);

-- After changing
SELECT hours_weekly
FROM USER
WHERE username = "aaggarw";

-- Procedure 4: updatePassword
-- Before changing
SELECT password
FROM USER
WHERE username = "aaggarw";

-- Calling procedure
CALL updatePassword(15000, "actualPassword", "actualPassword");

-- After call
SELECT password
FROM USER
WHERE username = "aaggarw";

-- PROCEDURE 5: removeUser
-- Before deleting, show I'm still in DB
SELECT *
FROM USER
WHERE user_id = 15000;

-- Call remove
CALL removeUser(15000);

-- After deleting, I won't show up in DB
SELECT *
FROM USER
WHERE user_id = 15000;

-- PROCEDURE 6: change year created of an instrument
-- Information about instrument with id 1 before changing
SELECT year_created
FROM INSTRUMENT
WHERE instrument_id = 1;

-- Call Procedure
CALL changeYearCreated(1, 2005);

-- After changing, show that same instrument
SELECT year_created
FROM INSTRUMENT
WHERE instrument_id = 1;
