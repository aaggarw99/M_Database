DROP PROCEDURE IF EXISTS addUserToUserTable;
DELIMITER |
CREATE PROCEDURE addUserToUserTable(
	IN addId INT,
	IN addUsername VARCHAR(64),
	IN addFirst VARCHAR(64),
	IN addLast VARCHAR(64),
	IN addEmail VARCHAR(64),
	IN addPass VARCHAR(64),
	IN addHours INT,
	IN addAge INT,
	IN addCity VARCHAR(64),
	IN addState VARCHAR(64),
	IN addCountry VARCHAR(64)
)
BEGIN
	INSERT INTO USER VALUES(addId, addUsername, addFirst, addLast, addEmail, addPass, addHours, addAge, addCity, addState, addCountry);
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS updateCityStateCountry;
DELIMITER |
CREATE PROCEDURE updateCityStateCountry(
	IN id INT,
	IN upCity VARCHAR(64),
	IN upState VARCHAR(64),
	IN upCountry VARCHAR(64)
)
BEGIN
	UPDATE USER
	SET city = upCity, state = upState, country = upCountry
	WHERE user_id = id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS removeUser;
DELIMITER |
CREATE PROCEDURE removeUser(
	IN id INT
)
BEGIN
	DELETE FROM USER
	WHERE user_id = id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS updatePassword;
DELIMITER |
CREATE PROCEDURE updatePassword(
	IN id INT,
	IN pass VARCHAR(64),
	IN confirm_pass VARCHAR(64)
)
BEGIN
IF(pass = confirm_pass)
THEN
UPDATE USER
SET password = pass
WHERE user_id = id;
END IF;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS updateHours;
DELIMITER |
CREATE PROCEDURE updateHours(
	IN id INT,
	IN hours INT
)
BEGIN
	UPDATE USER
	SET hours_weekly = hours
	WHERE user_id = id;
END |
DELIMITER ;

DROP PROCEDURE IF EXISTS changeYearCreated;
DELIMITER |
CREATE PROCEDURE changeYearCreated(
	IN id INT,
	IN year INT
)
BEGIN
	UPDATE INSTRUMENT
	SET year_created = year
	WHERE instrument_id = id;
END |
DELIMITER ;
