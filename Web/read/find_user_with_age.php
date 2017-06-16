<?php

// Connection parameters
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../SemiFinal.html">Go Back</a><br>';

// Getting the input parameter (age):
$age = $_REQUEST['age'];
if ($age <= 0 )
{
	exit("Invalid Age<br>");
}

$query = "SELECT username, email FROM USER WHERE user_age = $age";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));


print "The following users are <b>$age</b> years old";

// Printing user attributes in HTML
print '<ul>';
while ($tuple = mysqli_fetch_row($result)) {
print '<li> Username: '.$tuple[0];
print '<li> Email: '.$tuple[1];
print '<hr>';
}
print '</ul>';
// Free result
mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?>
