-- Find two artists with the same name using INNER JOIN
SELECT artist_name
FROM FAVORITE_ARTIST
INNER JOIN ARTIST
ON artist_name = fav_artist_name
AND artist_age > 3;

-- Count the amount of instruments that are not electronic and that are played by users
SELECT COUNT(*)
FROM PLAYS
NATURAL JOIN INSTRUMENT
WHERE isElectronic = false;

-- Find all instruments that are classical
SELECT DISTINCT I.instrument_name
FROM INSTRUMENT I
INNER JOIN BELONGS B 
ON I.instrument_name = B.instrument_name
WHERE B.genre_name = "Classical";

-- Find the users who play an instrument that starts with a p and return their state and country
SELECT DISTINCT U.state, U.country
FROM USER U
LEFT OUTER JOIN PLAYS P
ON U.username = P.username
WHERE P.instrument_name LIKE 'p%';

-- Return the number of times an artist who has a space in their name and are also loved by users that also share the same age (the artist must also be older than 27 for the aggregation to occur)
SELECT COUNT(F.fav_artist_name), F.fav_artist_age
FROM FAVORITE_ARTIST F
RIGHT OUTER JOIN LOVES L
ON F.fav_artist_name = L.fav_artist_name
WHERE L.fav_artist_name LIKE '% %'
GROUP BY F.fav_artist_age
HAVING F.fav_artist_age >= 27;

-- Find all Users who like artists that have a space in their name and also where the users are older than 15
SELECT U.username, U.user_age, L.artist_name
FROM USER U
INNER JOIN LIKES L USING(username)
WHERE L.artist_name LIKE '% %'
AND U.user_age > 15;

-- Find the daws that run on macs but not on windows and how many times they appear
SELECT D.daw_name, COUNT(D.daw_name)
FROM DAW D
LEFT OUTER JOIN USES U USING(daw_name)
WHERE D.runs_on_mac = true
AND D.runs_on_windows = false
GROUP BY daw_name;

-- Find the average age of users who play piano or tuba
SELECT ROUND(AVG(U.user_age))
FROM USER U
LEFT OUTER JOIN PLAYS P USING(username)
WHERE P.instrument_name = "piano"
OR P.instrument_name = "tuba";

-- Find the sum of the ages of users who do not use the password "password" while also liking an artist who has a space in their name
SELECT SUM(U.user_age)
FROM USER U
NATURAL JOIN LIKES L
WHERE U.password != "password"
AND L.artist_name LIKE '% %';

-- Find the amount of users who play an instrument that's not the piano and also have more than 5 hours available weekly
SELECT COUNT(*)
FROM USER U
INNER JOIN PLAYS P USING(username)
WHERE U.hours_weekly > 5
AND P.instrument_name != "piano";
