<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../../final.html">Go Back</a><br>';

$username = $_POST["username"];
$city = $_POST["city"];
$state = $_POST["state"];
$country = $_POST["country"];

$sql = "UPDATE USER SET username='$username'";
if (!empty($city)) {
	$sql = $sql.",city = '$city' ";
}
if (!empty($state)) {
	$sql = $sql.",state = '$state' ";
}
if (!empty($country)) {
	$sql = $sql.",country = '$country' ";
}
$sql = $sql . "WHERE username = '$username'";


if ($dbcon->query($sql) === TRUE) {
    echo "Update Successful!";
} else {
    echo "Error: " . $sql . "<br>" . $dbcon->error;
}

// Closing connection
mysqli_close($dbcon);

?>
