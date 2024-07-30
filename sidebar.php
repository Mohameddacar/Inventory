 <!-- Main Sidebar Container -->
 <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.php" class="brand-link">
      <img src="dist/img/jus.JPG" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Jazeera University</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/invent.png" class="" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Inventory System</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="index.php" class="nav-link active">
            <i class="fas fa-home"></i>
              <p>
                Home
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-pen"></i>
              <p>
                Registrations
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="customer.php" class="nav-link">
                  <i class="fas fa-users"></i>
                  <p>Customer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="supplier.php" class="nav-link">
                <i class="fas fa-truck"></i>
                  <p>Suppliers</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="products.php" class="nav-link">
                <i class="fas fa-shopping-cart"></i>            
                  <p>Products</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="categories.php" class="nav-link">
                <i class="fas fa-tags"></i>
                  <p>Categories</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="fas fa-dollar-sign"></i>
              <p>
                Finance
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="purchase.php" class="nav-link">
                <i class="fas fa-shopping-cart"></i>
                  <p>Purchase_Orders</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sells.php" class="nav-link">
                <i class="fas fa-list"></i>
                  <p>Sells_Orders</p>
                </a>
              </li>
              <li class="nav-item">             
</ul>
          </li>
          
          <li class="nav-item">
            <a href="#" class="nav-link">
            <i class="fas fa-file-alt"></i>
              <p>
                Reports
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="customer_report.php" class="nav-link">
                <i class="fas fa-users"></i>
                  <p>Customer_Reports</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="supplier_report.php" class="nav-link">
                <i class="fas fa-truck"></i>
                  <p>Supplier_Reports</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="prod_reports.php" class="nav-link">
                <i class="fas fa-shopping-cart"></i>  
                  <p>Product Reports</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Categories_Report.php" class="nav-link">
                <i class="fas fa-tags"></i>
                  <p>Categories_Reports</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Purchase_report.php" class="nav-link">
                <i class="fas fa-shopping-cart"></i>
                  <p>Purchase_Reports</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="sells_report.php" class="nav-link">
                <i class="fas fa-list"></i>
                  <p>Sells_Reports</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="users.php" class="nav-link">
              <i class="nav-icon far fa-user"></i>
              <p>
                Users                
              </p>
            </a>
          </li>
          <li class="nav-header">LogOut</li>
          <li class="nav-item">
            <a href="login.php" class="nav-link">
            <i class="fas fa-sign-out-alt"></i>
              <p>
                LogOut                
              </p>
            </a>
          </li>
         
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
