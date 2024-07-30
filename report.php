<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table style="border: 1px solid black; width: 80%; margin: auto;">
      
        <tbody>
               <?php
                  include('cls_con.php');
                  $q =mysqli_query($conn,"select * from std") or die(mysqli_error($conn));
                      while($row=mysqli_fetch_array($q))
                      {

                        echo "<tr>";
                                  echo "<td>  {$row['id']}</td>";
                                  echo "<td>  {$row['name']}</td>";
                                  echo "<td>  {$row['phone']}</td>";
                                  echo "<td>  {$row['dept']}</td>";
                                       
                        echo "</tr>";

                      }

                      ?>

        </tbody>
    </table>
</body>
</html>