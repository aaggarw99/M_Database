<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../SemiFinal.html">Go Back</a><br>';

$query = "SELECT daw_name FROM DAW WHERE 1=1 ";
if ($_GET['mac'] == "check") {
	$query = $query . "AND runs_on_mac = true";
}else if ($_GET['window'] == "check") {
	$query = $query . "AND runs_on_windows = true";
}else if ($_GET['other'] == "check") {
	$query = $query . "AND runs_on_other = true";
}else {
        exit("You didn't select a checkbox!");
}
$query = $query . ";";

$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

print "Daws that meet your requirements:<br>";
print "<ul>";
while ($tuple = mysqli_fetch_row($result)) {
	print '<li><b> '.$tuple[0].' </b>';
}
print "</ul>";
// Free result

mysqli_free_result($result);
// Closing connection
mysqli_close($dbcon);
?>
