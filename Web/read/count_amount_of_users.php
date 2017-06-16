<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../SemiFinal.html">Go Back</a><br>';

$query = "SELECT COUNT(*) FROM USER";
$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

print "There are";

while ($tuple = mysqli_fetch_row($result)) {
        print '<b> '.$tuple[0].' </b>';
}
print "users in the database";
// Free result

mysqli_free_result($result);
// Closing connection
mysqli_close($dbcon);
?>
