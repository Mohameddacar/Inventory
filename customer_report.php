
<?php
session_start();
include("header.php");
include("sidebar.php");
include("navbar.php");
include("scripts.php");

?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Customer_Id</th>
                    <th>Customer_Name</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Email</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                //  session_start();
                  include('conn.php');
                  $q =mysqli_query($conn,"select * from customers") or die(mysqli_error($conn));
                      while($row=mysqli_fetch_array($q))
                      {

                        echo "<tr>";
                                  echo "<td>  {$row['customer_id']}</td>";
                                  echo "<td>  {$row['customer_name']}</td>";
                                  echo "<td>  {$row['phone']}</td>";
                                  echo "<td>  {$row['address']}</td>";
                                  echo "<td>  {$row['email']}</td>";                                
                                       
                        echo "</tr>";

                      }

                      ?>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
    </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>


<?php

include("footer.php");

?>