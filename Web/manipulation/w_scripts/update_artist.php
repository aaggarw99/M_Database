<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../../final.html">Go Back</a><br>';

$name = $_POST["name"];
$track = $_POST["track"];
$age = $_POST["age"];

if ($age < 0) {
	exit("Please enter a valid age");
}

$sql = "UPDATE ARTIST SET artist_name='$name'";
if (!empty($track)) {
        $sql = $sql.",most_popular_track = '$track' ";
}
if (!empty($age)) {
        $sql = $sql.",artist_age= $age ";
}
$sql = $sql." WHERE artist_name = '$name'";

if ($dbcon->query($sql) === TRUE) {
    echo "Update Successful!";
} else {
    echo "Error: " . $sql . "<br>" . $dbcon->error;
}

// Closing connection
mysqli_close($dbcon);

?>
