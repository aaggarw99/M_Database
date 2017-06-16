<?php
$host = 'mpcs53001.cs.uchicago.edu';
$username = 'ashwina';
$password = 'db';
$database = $username.'DB';

// Attempting to connect
$dbcon = mysqli_connect($host, $username, $password, $database)
   or die('Could not connect: ' . mysqli_connect_error());
print 'Connected successfully!<br> <a href="../SemiFinal.html">Go Back</a><br>';



$query = "";
if ($_GET['elec'] == 1) {
        $query = "SELECT COUNT(*) FROM INSTRUMENT WHERE isElectronic=true";
	print "Daws available: ";
}else if ($_GET['elec'] == 2) {
        $query = "SELECT COUNT(*) FROM INSTRUMENT I WHERE I.isElectronic=false";
	print "Daws unavailable: ";
}else {
	exit("You didn't select a button!");
}

$result = mysqli_query($dbcon, $query)
  or die('Query failed: ' . mysqli_error($dbcon));

echo "Record Successfully Made";

mysqli_free_result($result);

// Closing connection
mysqli_close($dbcon);
?>
