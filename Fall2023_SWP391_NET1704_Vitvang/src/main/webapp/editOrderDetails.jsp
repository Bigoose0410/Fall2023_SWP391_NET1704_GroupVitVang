<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

     <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>historyOrder</title>
          <link rel="stylesheet" href="css\editOrderDetails.css" />
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
          <script src="notiSubmitOrder.js" defer></script>
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

               <main>
                  <h2>Điều chỉnh sản phẩm</h2>
                  
      <div class="main-content">
        <ul>
          <li>OrderID</li>
          <li>
            <input type="text" class="form-control" placeholder="OrderID" />
          </li>
        </ul>
        <ul>
          <li>CageID </li>
          <li>
            <select name="longchim" style="
                      float: left;
                      padding: 10px;
                      ">
              <option value="0">Chọn lồng chim</option>
              <option value="1">Long chim A</option>
              <option disabled value="2">Long chim B</option>
              <option disabled value="3">Long chim C</option>
            </select>
            <input type="text" class="form-text" placeholder="Quantity..." style="
                    width: 50px;
                    margin-left:30px;
                    ">
            <select name="longchim" style="
                                  float: left;
                                  padding: 10px;
                                  ">
              <option value="0">Chọn lồng chim</option>
              <option disabled value="1">Long chim A</option>
              <option value="2">Long chim B</option>
              <option disabled value="3">Long chim C</option>
            </select>
            <input type="text" class="form-text" placeholder="Quantity..." style="
                                width: 50px;
                                margin-left:30px;
                                ">
            <select name="longchim" style="
                                  float: left;
                                  padding: 10px;
                                  ">
              <option value="0">Chọn lồng chim</option>
              <option disabled value="1">Long chim A</option>
              <option disabled value="2">Long chim B</option>
              <option value="3">Long chim C</option>
            </select>
            <input type="text" class="form-text" placeholder="Quantity..." style="
                                width: 50px;
                                margin-left:30px;
                                ">
          </li>
        </ul>
        <ul>
          <li>StartDate</li>
          <li>
            <input type="date" class="form-control" placeholder="StartDate" />
          </li>
        </ul>

        <ul>
          <li>Price</li>
          <li>
            <input type="text" class="form-control" placeholder="Price" />
          </li>
        </ul>

        <ul>
          <li>StatusProcess</li>
          <li>
            <input type="text" class="form-control" placeholder="StatusProcess" />
          </li>
        </ul>
        <ul>
          <li>EndDate</li>
          <li>
            <input type="date" class="form-control" placeholder="StaffID" />
          </li>
        </ul>
        <ul>
          <li>CustomerID</li>
          <li>
            <input type="text" class="form-control" placeholder="CustomerID" />
          </li>
        </ul>
      </div>
   <ul class="notifications"></ul>
    <div class="buttons">
      <button class="btn" id="success">Success</button>
      <script src="notiSubmitOrder.js" defer></script>
      
    
     
    </main>
  </div>
  <div class="footer">
    <footer>
      <p>&copy; VitVang 2023</p>
    </footer>
  </div>
</body>

              