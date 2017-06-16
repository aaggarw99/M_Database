-- Find all favorite artists and artists with the same age that aren't the same person
SELECT DISTINCT A.artist_name Artist, F.fav_artist_name FavoriteArtist
FROM ARTIST A, FAVORITE_ARTIST F
WHERE A.artist_age = F.fav_artist_age
AND A.artist_name != F.fav_artist_age;

-- Find all users who love the same artist
SELECT A.username User1, B.username User2, A.fav_artist_name SharedFavArtist
FROM LOVES A, LOVES B
WHERE A.fav_artist_name = B.fav_artist_name
AND A.username != B.username; 

-- Select all the instruments that are electronic and the daws that run on windows and macs 
SELECT DISTINCT D.daw_name Daw, I.instrument_name Instrument
FROM DAW D, INSTRUMENT I
WHERE D.runs_on_mac = true
AND D.runs_on_windows = true
AND I.isElectronic = true;

-- Select all artists who are older than an instrument

SELECT A.artist_name OLDER_THAN, I.instrument_name THIS_INSTRUMENT
FROM ARTIST A, INSTRUMENT I
WHERE A.artist_age > 2017 - I.year_created;

-- Find all artists who have the same age as the user "aaggarw99"

SELECT A.artist_age SameAgeNumber, A.artist_name ArtistName
FROM ARTIST A
WHERE A.artist_age = (SELECT U.user_age
			FROM  USER U
			WHERE U.username = "aaggarw99");

-- Find all users who are from Australia and return the genres that share the same country

SELECT G.genre_name GenreName, G.region_of_origin Origination
FROM GENRE G
WHERE G.region_of_origin = (SELECT U.country
			FROM USER U
			WHERE U.country = "Australia");
