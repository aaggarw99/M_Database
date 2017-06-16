<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../../final.html">Go Back</a><br>';

$id = $_POST["id"];

$username = $_POST["username"];
$first = $_POST["first"];
$last = $_POST["last"];
$email = $_POST["email"];
$password = $_POST["password"];
$hours = $_POST["hours"];
$age = $_POST["age"];
$city = $_POST["city"];
$state = $_POST["state"];
$country = $_POST["country"];

if ($id < 0) {
	exit("Please enter an ID over 0");
}
if ($age < 0) {
	exit("Please enter a valid age");
}
if ($hours < 0) {
	exit("Please enter a positive number");
}

$sql = "CALL addUserToUserTable($id, '$username', '$first', '$last', '$email', '$password', $hours, $age, '$city', '$state', '$country')";

if ($dbcon->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $dbcon->error;
}

// Closing connection
mysqli_close($dbcon);

?>
