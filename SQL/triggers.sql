-- 1: If someone tries to change the age of a user, revert the age back to its previous age if they try and change it to any value greater than 5 years.
DROP TRIGGER IF EXISTS UserAgeChange;
DELIMITER |
CREATE TRIGGER UserAgeChange 
BEFORE UPDATE ON USER
FOR EACH ROW
	BEGIN 
	IF(NEW.user_age > OLD.user_age + 5)
	THEN
	SET NEW.user_age = OLD.user_age;
	END IF;
	END; |
DELIMITER ;
		 
-- 2: Ensures updates to the instrument year of origin don't make the value negative or greater than current year
DROP TRIGGER IF EXISTS CheckYearOfOriginInstrument;
DELIMITER |
CREATE TRIGGER CheckYearOfOriginInstrument
BEFORE UPDATE ON INSTRUMENT
FOR EACH ROW
	BEGIN
		IF(NEW.year_created < 0 OR NEW.year_created > 2017)
		THEN
		SET NEW.year_created = -1;
		END IF;
	END; |
DELIMITER ;

DROP TABLE IF EXISTS UNDER_AGE;
CREATE TABLE UNDER_AGE (username VARCHAR(64) PRIMARY KEY, age INT);

-- 3: This trigger will store all users who are inserted and are under the age of 21 into a new table, UNDER_AGE. It'll also keep track of the sum of users.
DROP TRIGGER IF EXISTS FindUnderAgeUsers;
DELIMITER |
CREATE TRIGGER FindUnderAgeUsers
AFTER INSERT ON USER
FOR EACH ROW
	BEGIN
		DECLARE x INT;
		IF(NEW.user_age < 21)
		THEN
		SET x = (SELECT SUM(user_age) FROM USER WHERE user_age < 21);
		INSERT INTO UNDER_AGE VALUES(NEW.username, NEW.user_age);
		END IF;
	END; |
DELIMITER ;

