<?php

 $host = "localhost";
 $user="root";
 $pwd="";
$db="system_inventory";

$conn = mysqli_connect($host,$user,$pwd,$db);

if(! $conn)
{
  echo "<h1>Erro DB Connection !</h1>" ;  
}
else{
   // echo "<h1> DB Connection Successfully  !</h1>" ;  
}


?>