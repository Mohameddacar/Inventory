
<?php

include("header.php");
include("sidebar.php");
include("navbar.php");
include("scripts.php");
//include("conn.php");
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
         <!-- Main content -->
            <div class="row">
                <div class="col-sm-12">
                     <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">User Registrations</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="ins_up_del/user_reg.php" method="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Users_id</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" placeholder="Enter user_id">
                  </div>
                  <div class="form-group">
                    <label>User_name</label>
                    <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Enter user_name">
                  </div>
                  <div class="form-group">
                    <label>email</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
                  </div>
                  <div class="form-group">
                    <label>role</label>
                    <input type="text" class="form-control" id="role" name="role" placeholder="Enter role">
                  </div>                                                
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" id="save" name="save">Save</button>,
                  <button type="submit" class="btn btn-info" id="update" name="update">Update</button>,
                  <button type="submit" class="btn btn-danger" id="delete" name="delete">Delete</button>,
                </div>
              </form>
            </div>
            <!-- /.card -->

                </div>
            </div>

           
        <!-- /.content -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>


<?php

include("footer.php");

?>
<script src="customer.js"></script>