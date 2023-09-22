<%-- 
    Document   : addOrder
    Created on : Sep 21, 2023, 3:27:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Order</title>
    <link rel="stylesheet" href="css\addOrder.css" />
    </head>
   <body>
    <header>
      <nav class="navbar">
        <div class="content-navebar">
          <img
            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLEcpRsJfs-3m4K2TdEZM3NQzjQB_fcNoJdQ&usqp=CAU"
          />
          <h1 class="logo">VitVang</h1>
          <ul class="nav-links">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </div>
      </nav>
    </header>
    <div class="container">
      <aside>
        <ul class="nav-links">
          <li><a href="#">Dashboard</a></li>
          <li><a href="#">Orders</a></li>
          <li><a href="#">Customers</a></li>
          <li><a href="#">Production process</a></li>
          <li><a href="#">Reports</a></li>
          <li><a href="#">Material</a></li>
          <li><a href="#">Inventory</a></li>
        </ul>
      </aside>
      <!-- <h2>Them thong tin san pham</h2> -->

      <main>
<!--        <div class="main-Info">
          <div class="search-container">
            <input
              type="text"
              class="form-control"
              placeholder="SearchOrder..."
            />
            <button class="search-button">Search</button>
          </div>
          <div class="text-right">
            <button class="add-button">Add</button>
          </div>
        </div>-->
        <h2>Them thong tin san pham</h2>
        <div class="main-content">
          <ul>
            <li>OrderID</li>
            <li>
              <input type="text" class="form-control" placeholder="OrderID" />
            </li>
          </ul>
          <ul>
            <li>StartDate</li>
            <li>
              <input type="date" class="form-control" placeholder="StartDate" />
            </li>
          </ul>
          <ul>
            <li>Quantity</li>
            <li>
              <input type="text" class="form-control" placeholder="Quantity" />
            </li>
          </ul>
          <ul>
            <li>Price</li>
            <li>
              <input type="text" class="form-control" placeholder="Price" />
            </li>
          </ul>
          <ul>
            <li>Delivery</li>
            <li>
              <input type="text" class="form-control" placeholder="Delivery" />
            </li>
          </ul>
          <ul>
            <li>Address</li>
            <li>
              <input type="text" class="form-control" placeholder="Address" />
            </li>
          </ul>
          <ul>
            <li>StatusProcess</li>
            <li>
              <input
                type="text"
                class="form-control"
                placeholder="StatusProcess"
              />
            </li>
          </ul>
          <ul>
            <li>StaffID</li>
            <li>
              <input type="text" class="form-control" placeholder="StaffID" />
            </li>
          </ul>
          <ul>
            <li>CustomerID</li>
            <li>
              <input
                type="text"
                class="form-control"
                placeholder="CustomerID"
              />
            </li>
          </ul>
        </div>
        <div class="text-right">
          <button class="submit-button">Submit</button>
        </div>
      </main>
    </div>
    <div class="footer">
      <footer>
        <p>&copy; VitVang 2023</p>
      </footer>
    </div>
  </body>
</html>
