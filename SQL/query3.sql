-- Find all users who share a common age with a favorite artist and have "ash" in their username and count how many times they appear
SELECT U.username, COUNT(*)
FROM USER U
INNER JOIN FAVORITE_ARTIST F
ON U.user_age = F.fav_artist_age
WHERE U.username LIKE "%ash%"
GROUP BY U.username;

-- For the artists that have the same id as a user, check if their name starts with "as", then find the amount of times an artist is returned along with their age (where age >= 27)
SELECT COUNT(F.fav_artist_name), F.fav_artist_age
FROM FAVORITE_ARTIST F
RIGHT OUTER JOIN USER U
ON F.fav_artist_id = U.user_id
WHERE F.fav_artist_name LIKE 'as%'
GROUP BY F.fav_artist_age
HAVING F.fav_artist_age >= 27;

-- Select the usernames and instrument names where the instrument id and user id are equal: year created > 1600, user age > 20, inventor name starts with an "a", instrument is electronic, and hours weekly < 10
SELECT F.username, I.instrument_name
FROM INSTRUMENT I
INNER JOIN USER F
ON I.instrument_id = F.user_id
WHERE I.year_created > 1600
AND F.user_age > 20
AND I.inventor LIKE "a%"
AND I.isElectronic = true
AND F.hours_weekly < 10;

-- Count the amount users who have db in their name
SELECT COUNT(*)
FROM USER U
WHERE U.username LIKE "%db%";

-- Find all the users who play an instrument
SELECT U.username
FROM USER U
INNER JOIN PLAYS P 
ON U.username = P.username;
