<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../SemiFinal.html">Go Back</a><br>';

$query = "";
if ($_GET['avg_dropdown'] == "user") {
        $query = "SELECT ROUND(AVG(user_age)) FROM USER";
	print "The average age of users was ";
}else if ($_GET['avg_dropdown'] == "instrument") {
        $query = "SELECT ROUND(AVG(year_created)) FROM INSTRUMENT";
	print "The average year created for an instrument was ";
}else if ($_GET['avg_dropdown'] == "fav_artist") {
        $query = "SELECT ROUND(AVG(fav_artist_age)) FROM FAVORITE_ARTIST";
	print "The average age for favorite artists was ";
}else {
        exit("You didn't select a value!");
}
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));
while ($tuple = mysqli_fetch_row($result)) {
        print '<b> '.$tuple[0].' </b>';
}
// Free result

mysqli_free_result($result);

?>
