<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database) or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../../final.html">Go Back</a><br>';

$name = $_POST["name"];

$sql = "DELETE FROM INSTRUMENT WHERE instrument_name = '$name'";

if ($dbcon->query($sql) === TRUE) {
    echo "You deleted $name from the database!";
} else {
	echo "That instrument doesn't exist!";
}

// Closing connection
mysqli_close($dbcon);

?>

