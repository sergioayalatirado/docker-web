
<?php
$mysqli = new mysqli("db", "root", "12345", "bdd_urgencias");
if ($mysqli->connect_errno) {
   echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
echo $mysqli->host_info . "\n";

$mysqli = new mysqli("db", "root", "12345", "bdd_urgencias");
if ($mysqli->connect_errno) {
   echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

echo $mysqli->host_info . "\n";
?>