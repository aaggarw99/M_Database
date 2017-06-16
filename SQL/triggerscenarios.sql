-- Trigger 1: prevents updating an age that's 5 years older than the previous one

-- Before doing any trigger at all, this is pbeblioill's current status
SELECT username, user_age
FROM USER
WHERE username = 'pbeblioill';

-- Trying to change the age of pbeblioill to 70, which is more than 5 higher than his real age, 62.
UPDATE USER
SET user_age = 70
WHERE username = 'pbeblioill';

-- His age remains the same since the trigger activated and did not update his age to 70
SELECT username, user_age
FROM USER
WHERE username = 'pbeblioill';

-- Trying to change the age of pbeblioill to 63, which is within 5 years of his current age, 62.
UPDATE USER
SET user_age = 63
WHERE username = 'pbeblioill';

-- Shows his age has changed to 63
SELECT username, user_age
FROM USER
WHERE username = "pbeblioill";


-- Trigger 2: ensures valid years are updated into the instrument table

-- Before doing any trigger at all, this is jdznwxqzux (instrument_name) year created
SELECT instrument_name, year_created
FROM INSTRUMENT
WHERE instrument_name = "jdznwxqzux";

-- Trying to change the year to -5
UPDATE INSTRUMENT
SET year_created = -5
WHERE instrument_name = "jdznwxqzux";

-- Showing that it'll become -1 since I entered an invalid number
SELECT instrument_name, year_created
FROM INSTRUMENT
WHERE instrument_name = "jdznwxqzux";

-- Now try to change the year to 1700
UPDATE INSTRUMENT
SET year_created = 1700
WHERE instrument_name = "jdznwxqzux";

-- It should now update to 1700
SELECT instrument_name, year_created
FROM INSTRUMENT
WHERE instrument_name = "jdznwxqzux";

-- TRIGGER 3: store all inserted users into a table UNDER_AGE who are under 21

-- Before doing anything, let's look at UNDER_AGE
SELECT *
FROM UNDER_AGE;

-- Let's try to insert a user who's under age
INSERT INTO USER VALUES(10001,'pbioill','lhfcffrofl','nycqijuzkb','vorkajzwno','owhwleemak',35,16,'onuynzkdvx','qkcqwtpdwb','quyisihcqb');

-- To see this was stored in UNDER_AGE
SELECT username, age
FROM UNDER_AGE
WHERE username = "pbioill";

-- Let's try and add a user who is over 21 to USER
INSERT INTO USER VALUES(10002,'pbdfasdfl','lhfcffrofl','nycqijuzkb','vorkajzwno','owhwleemak',35,25,'onuynzkdvx','qkcqwtpdwb','quyisihcqb');

-- To see this person wasn't stored, let's look at UNDER_AGE
SELECT username, age
FROM UNDER_AGE
WHERE username = "pbdfasdfl";

-- Total amount of values in Under age
SELECT COUNT(*)
FROM UNDER_AGE;
