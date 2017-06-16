<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database) or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../../final.html">Go Back</a><br>';

$id = $_POST["id"];
$name = $_POST["name"];
$elec = $_POST["elec"];
$inventor = $_POST["inventor"];
$year = $_POST["year"];

if ($year < 0) {
	exit("Please enter a year over 0 B.C.E");
}
if ($id < 0) {
	exit("Please enter an ID over 0");
}

$sql = "INSERT INTO INSTRUMENT VALUES($id, '$name',";
if ($elec == 1) {
	$sql = $sql."true, '$inventor', $year)";
}else if ($elec == 2) {
	$sql = $sql."false, '$inventor', $year)";
}else {
	exit("Select a button!");
}

if ($dbcon->query($sql) === TRUE) {
    echo "New instrument successfully registered";
} else {
    echo "Error: " . $sql . "<br>" . $dbcon->error;
}

// Closing connection
mysqli_close($dbcon);

?>
