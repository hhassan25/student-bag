<?php 
	include "config.php";

	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql = "SELECT username, password FROM demo_edu_ira_users WHERE username = '".$username."' AND password = '".$password."'";


	$result = mysqli_query($connect,$sql);
	$count = mysqli_num_rows($result);

	

	
	if ($count == 1 ) {
	     echo json_encode("login");
	}

	else if($username == "" || $password == ""){
		echo json_encode("filldata");
	}
	
	else{
		echo json_encode("error");
	}

	
 ?>