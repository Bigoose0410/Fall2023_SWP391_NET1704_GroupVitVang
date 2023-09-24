<%-- 
    Document   : showSearch
    Created on : Sep 22, 2023, 2:14:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Navbar Example</title>
  <link rel="stylesheet" href="css\historyOrder.css" />
</head>

<body>
  <header>
    <nav class="navbar">
      <div class="content-navebar">
        <img
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLEcpRsJfs-3m4K2TdEZM3NQzjQB_fcNoJdQ&usqp=CAU" />
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

    <div class="table-content">
      <table>
        <tr>
          <th>#</th>
          <th>OrderID</th>
          <th>CageID</th>
          <th>StartDate</th>
          <th>EndDate</th>
          <th>StatusProgress</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Update</th>
        </tr>
        <tr>
          <td>5</td>
          <td>78</td>
          <td>9</td>
          <td>10</td>
          <td>11</td>
          <td>15</td>
          <td>12</td>
          <td>12</td>
          <td><a href="#">Edit</a></td>
        </tr>
        <tr>
          <td>6</td>
          <td>78</td>
          <td>8</td>
          <td>10</td>
          <td>11</td>
          <td>15</td>
          <td>12</td>
          <td>12</td>
          <td><a href="#">Edit</a></td>
        </tr>

      </table>
    </div>
    <main>
      <div class="main-Info">
        <div class="search-container">
          <input type="text" class="form-control" placeholder="SearchOrder..." />
          <button class="search-button">Search</button>
        </div>
        <div class="text-right">
          <button class="add-button">Add Order</button>
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