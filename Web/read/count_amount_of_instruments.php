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
if ($_GET['year'] == 1) {
	$query = "SELECT COUNT(*) FROM INSTRUMENT WHERE year_created > 1700 AND year_created < 1800";
}else if ($_GET['year'] == 2) {
	$query = "SELECT COUNT(*) FROM INSTRUMENT WHERE year_created > 1800 AND year_created < 1900";
}else if ($_GET['year'] == 3) {
	$query = "SELECT COUNT(*) FROM INSTRUMENT WHERE year_created > 1900 AND year_created < 2000";
}else {
	exit("You didn't select a value!");
}
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));


print "There were";

while ($tuple = mysqli_fetch_row($result)) {
        print '<b> '.$tuple[0].' </b>';
}
print "instruments created in the selected time frame";
// Free result

mysqli_free_result($result);
// Closing connection
mysqli_close($dbcon);

?>
