<?php
	include "config.php";

	$username = $_GET['username'];

    $sql = "SELECT * FROM demo_edu_ira_users where username = '".$username."'";
	$result = $connect->query($sql);
	$response = array();
	if($result->num_rows > 0){
		while ($row = $result->fetch_assoc()) {
			array_push($response, $row);
		}
	}
	$connect->close();
	header('Content_Type: application/json');
	echo json_encode($response);


 ?>