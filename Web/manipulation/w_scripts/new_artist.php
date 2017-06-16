<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database) or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../../final.html">Go Back</a><br>';

$name = $_POST["name"];
$track = $_POST["track"];
$age = $_POST["age"];

if ($age < 0) {
	exit("Please enter a valid age");
}

$sql = "INSERT INTO ARTIST VALUES('$name', '$track', $age)";
if ($dbcon->query($sql) === TRUE) {
    echo "New artist successfully made";
} else {
    echo "Error: " . $sql . "<br>" . $dbcon->error;
}

// Closing connection
mysqli_close($dbcon);

?>

