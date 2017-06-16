<?php

$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../SemiFinal.html">Go Back</a><br>';

// Getting the input parameter (user):
$hours = $_REQUEST['hours'];
if ($hours < 0 )
{
        exit("Please enter a valid number<br>");
}

$country = $_REQUEST['country'];
if (is_int($country) == true) {
	exit("Please enter a string<br>");
}
$query = "";
$query = "SELECT username, user_first_name FROM USER WHERE country = '$country' AND hours_weekly = $hours";

$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));


print "The following users are from $country and work $hours hours weekly<br>";
// Printing user attributes in HTML
while ($tuple = mysqli_fetch_row($result)) {
	print '<li> Username: '.$tuple[0].', First Name: '.$tuple[1];
	print '<hr>';
}
print '</ul>';
// Free result
mysqli_free_result($result);
// Closing connection
mysqli_close($dbcon);
?>
