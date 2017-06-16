-- Adds Dr.Dre to artist relation
INSERT INTO ARTIST VALUES("Dr. Dre", "Still D.R.E", 52);

-- Adds Snoop Dog to favorite artist relation
INSERT INTO FAVORITE_ARTIST VALUES("Snoop Dog", "Young, Wild & Free", 45);

-- Removes David Guetta from Artist relation
DELETE FROM ARTIST
WHERE artist_name = "David Guetta";

-- Removes the favorite artist who's most popular track is True Colors
DELETE FROM FAVORITE_ARTIST
WHERE fav_artist_most_popular_track = "True Colors";

-- For every use with the age 18, set their hours_weekly to 30
UPDATE USER
SET hours_weekly = 30
WHERE user_age = 18;

-- For the daw named garageband, change all its attribute values
UPDATE DAW
SET runs_on_mac = true, runs_on_windows = false, runs_on_else = false
WHERE daw_name = "garageband";

