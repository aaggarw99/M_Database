-- Sums all the ages of users who are 15+
SELECT SUM(U.user_age) SumOfUserAges
FROM USER U
WHERE U.user_age > 15;

-- Find the average year created of instruments that aren't electronic
SELECT ROUND(AVG(I.year_created)) AvgYearCreated
FROM INSTRUMENT I
WHERE I.isElectronic = false;

-- Find the difference in average ages between favorite artists and artists
SELECT ROUND(AVG(FA.fav_artist_age)) - ROUND(AVG(A.artist_age)) ChangeInAge
FROM ARTIST A, FAVORITE_ARTIST FA
WHERE A.artist_age > 10
AND FA.fav_artist_age > 10
AND A.artist_name != FA.fav_artist_name;

-- Count the amount of Users from the United States who have more than 5 available hours weekly

SELECT COUNT(*) AmountOfAmerican5HourPlus
FROM USER
WHERE hours_weekly > 5
AND country = "United States";

-- Find the amount of users who both like Kanye West

SELECT COUNT(*) AmountOfKanyeLikers
FROM LIKES A, LIKES B
WHERE A.artist_name = "Kanye West"
AND B.artist_name = "Kanye West"
AND A.username != B.username;
