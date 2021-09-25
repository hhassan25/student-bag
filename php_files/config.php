<?php

	$username="hadidb2";//change username 
	$password="h@d!20.20"; //change password
	$host="mysql.hadi.yallaproductionz.com";
	$db_name="hadidb"; //change databasename
	

	$connect=mysqli_connect($host,$username,$password,$db_name);
	

	if(!$connect)
	{
		echo json_encode("Connection Failed");
	}
	
	
	?>