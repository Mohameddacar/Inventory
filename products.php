
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
                <h3 class="card-title">Student Registrations</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="ins_up_del/prod_reg.php" method="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Product_id</label>
                    <input type="text" class="form-control" id="prod_id" name="prod_id" placeholder="Enter prod_id">
                  </div>
                  <div class="form-group">
                    <label>Prod_name</label>
                    <input type="text" class="form-control" id="prod_name" name="prod_name" placeholder="Enter Prod_name">
                  </div>
                  <div class="form-group">
                    <label>description</label>
                    <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
                  </div>
                  <div class="form-group">
                    <label>price</label>
                    <input type="text" class="form-control" id="price" name="price" placeholder="Enter Price">
                  </div>                
                  <div class="form-group">
                    <label>Category_id</label>
                    <select name="cat_id" id="cat_id" class="form-control">
                        <option value="cat_id">Select Categories</option>                   
                    <?php
                // Include the fillCombo function and fetch customer data
                include 'functions.php';
                $query = "SELECT cat_id, cat_name FROM categories";
                fillCombo($conn, $query, 'cat_id', 'cat_name');
                ?>
                </select>
                  </div>
                                  
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" id="save" name="save">Save</button>
                  <button type="submit" class="btn btn-info" id="update" name="update">Update</button>
                  <button type="submit" class="btn btn-danger" id="delete" name="delete">Delete</button>
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

<script>
        function validateForm() {
            var prod_name = document.getElementById("prod_name").value;
            var description = document.getElementById("description").value;
            var price = document.getElementById("price").value;
            var cat_id = document.getElementById("cat_id").value;

            if (prod_name === "" || description === "" || price === "" || cat_id === "") {
                alert("Please fill in all required fields.");
                return false;
            }
            return true;
        }
    </script>