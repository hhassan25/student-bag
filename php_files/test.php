<?php 
	include "config.php";

	$username = $GET['username'];
	$password = $_POST['password'];
    $value = "";

	$sql = "SELECT username FROM demo_edu_ira_users WHERE username = '".$username."'";


	$result = mysqli_query($connect,$sql);
	$count = mysqli_num_rows($result);
    if ($value = mysqli_query($connect, $sql)) {
        // Fetch one and one row
        while ($row = mysqli_fetch_row($value)) {
          printf ($row[0], $row[1]);
        }
        mysqli_free_result($value);
      }

        if ($count == 1 && $value == "one") {
            echo json_encode("login to one");
        }
        
        else if ($count == 1 && $value == "two") {
            echo json_encode("login to two");
        }

        else if ($count == 1 && $value == "three") {
            echo json_encode("login to three");
        }

       
        
        else{
            echo json_encode("error");
        }
      
      mysqli_close($connect);

    
	

	
	

	
 ?>