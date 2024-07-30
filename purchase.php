
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
              <form action="ins_up_del/purchase_reg.php" method="post">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">purch_order_id</label>
                    <input type="text" class="form-control" id="purch_order_id" name="purch_order_id" placeholder="Enter purch_order_id">
                  </div>
                  <div class="form-group">
                    <label>order_date</label>
                    <input type="date" class="form-control" id="order_date" name="order_date" placeholder="Enter order_date">
                  </div>
                  <div class="form-group">
                    <label>status</label>
                    <input type="text" class="form-control" id="status" name="status" placeholder="Enter status">
                  </div>
                  <div class="form-group">
                    <label>quantity</label>
                    <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity">
                  </div>
                  <div class="form-group">
                    <label>unit_price</label>
                    <input type="text" class="form-control" id="unit_price" name="unit_price" placeholder="Enter unit_price">
                  </div>
                  <div class="form-group">
                    <label>customer_id</label>
                    <select name="customer_id" id="customer_id" class="form-control">
                        <option value="customer_id">Select Customers</option>                   
                        <?php
                        // Include the fillCombo function and fetch customer data
                        include 'functions.php';
                        $query = "SELECT customer_id, customer_name FROM customers";
                        fillCombo($conn, $query, 'customer_id', 'customer_name');
                        ?>
                    </select>
                   </div>
                  <div class="form-group">
                    <label for="User_id">user_id</label>
                    <select name="user_id" id="user_id" class="form-control">
                        <option value="user_id">Select Users</option>
                        <?php
                        // Include the fillCombo function and fetch customer data
                        // include 'functions.php';
                        $query = "SELECT user_id, user_name FROM users";
                        fillCombo($conn, $query, 'user_id', 'user_name');
                        ?>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="prod_id">prod_id</label>
                    <select name="prod_id" id="prod_id" class="form-control">
                        <option value="prod_id">Select Products</option>
                        <?php
                        // Include the fillCombo function and fetch customer data
                        // include 'functions.php';
                        $query = "SELECT prod_id, prod_name FROM products";
                        fillCombo($conn, $query, 'prod_id', 'prod_name');
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
    function validatePurchaseForm() {
        var orderDate = document.getElementById("order_date").value;
        var status = document.getElementById("status").value;
        var quantity = document.getElementById("quantity").value;
        var unitPrice = document.getElementById("unit_price").value;
        var supplierId = document.getElementById("customer_id").value;
        var userId = document.getElementById("user_id").value;

        if (orderDate === "" || status === "" || quantity === "" || unitPrice === "" || supplierId === "" || userId === "") {
            alert("Please fill in all required fields.");
            return false;
        }
        return true;
    }
</script>
