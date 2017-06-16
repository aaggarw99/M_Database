-- Searches for artists who have a name with a space in it and their most popular track is two words
SELECT artist_name, artist_age
FROM ARTIST
WHERE artist_name LIKE "% %" AND most_popular_track LIKE "% %";



SELECT instrument_name
FROM INSTRUMENT
WHERE (year_created BETWEEN 1500 AND 2000) AND (inventor LIKE '% %') AND (inventor LIKE 'J%');

SELECT isElectronic
FROM INSTRUMENT
WHERE (year_created IS NULL) AND (inventor IS NULL);

SELECT genre_name
FROM GENRE
WHERE (region_of_origin LIKE '% %') AND (genre_name LIKE '% %') AND (genre_name LIKE '_i%');

SELECT user_first_name
FROM USER
WHERE (city LIKE '%s') AND (username LIKE '%123') AND (user_age > 30) AND (email LIKE '%yahoo.com');

SELECT fav_artist_name
FROM FAVORITE_ARTIST
WHERE fav_artist_most_popular_track LIKE "% %'% %" AND fav_artist_name LIKE '_el%';

SELECT DAW.daw_name, ARTIST.artist_name
FROM DAW
INNER JOIN ARTIST
ON (DAW.runs_on_mac=true) AND (ARTIST.artist_name LIKE '% %') AND (DAW.daw_name LIKE '%pro%');

SELECT INSTRUMENT.instrument_name, FAVORITE_ARTIST.fav_artist_name
FROM INSTRUMENT
INNER JOIN FAVORITE_ARTIST
ON (INSTRUMENT.isElectronic=true) AND (FAVORITE_ARTIST.fav_artist_name = 'Jack U');

SELECT GENRE.genre_name, GENRE.region_of_origin
FROM GENRE
INNER JOIN USER
ON (GENRE.region_of_origin LIKE '%United%') AND ((USER.state='Illinois') OR (USER.state='California'));

SELECT USER.user_first_name, ARTIST.artist_name,USER.user_age
FROM USER
LEFT JOIN ARTIST
ON (USER.user_age=ARTIST.artist_age);
