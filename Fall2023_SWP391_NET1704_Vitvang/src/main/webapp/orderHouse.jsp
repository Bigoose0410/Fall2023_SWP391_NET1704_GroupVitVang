<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/homePage.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    

    <title>Admin Dashboard Panel</title>
</head>
<body>
    <nav>
       
        <div class="logo-name">
            <div class="logo-image">
               <img src="images/logo.png" alt="">
            </div>

            <span class="logo_name">Manager</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Home Page</span>
                </a></li>
                <li><a href="order.jsp">
                    <i class="uil uil-bill"></i>>
                    <span class="link-name">Order</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-grin"></i>
                    <span class="link-name">Customers</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-chart-line"></i>
                    <span class="link-name">Production process</span>
                </a></li>
                <li><a href="#">
                   <i class="uil uil-clipboard-alt"></i>
                    <span class="link-name">Reports</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-screw"></i>
                    <span class="link-name">Material</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-archive-alt"></i>
                    <span class="link-name">Inventory</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="index.html">
                    <i class="uil uil-signout"></i>
                    <span class="link-name" >Logout</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
      
    </nav>

    <section class="dashboard">
        <div class="top">
           

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
                 <button class="add-btn" > <a href="orderAdd.jsp">ADD</a></button>
            </div>
            
            </div>
            
            <img src="images/profile.jpg" alt="">
       

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-github"></i>
                    <span class="text">Total detailss</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-invoice"></i>
                        <span class="text">T?ng ??n H�ng</span>
                        <span class="number">4000</span>
                    </div>
                    <div class="box box2">
                       <i class="uil uil-analysis"></i>
                        <span class="text">?ang Th?c hi?n</span>
                        <span class="number">3000</span>
                    </div>
                    <div class="box box3">
                         <i class="uil uil-truck-loading"></i>
                        <span class="text">?ang V?n Chuy?n</span>
                        <span class="number">300    </span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Order</span>
                </div>

                <div class="activity-data">
                    <div class="data names">
                        <span class="data-title">OrderID</span>
                        <span class="data-list">O001</span>
                        <span class="data-list">O002</span>
                        <span class="data-list">o003</span>
                        <span class="data-list">0004</span>
                        <span class="data-list">0005</span>
                        <span class="data-list">0006</span>
                        <span class="data-list">0007</span>
                    </div>
                    <div class="data email">
                        <span class="data-title">CustomerID</span>
                        <span class="data-list">aba</span>
                        <span class="data-list">aba</span>
                        <span class="data-list">aba</span>
                        <span class="data-list">aba</span>
                        <span class="data-list">aba</span>
                        <span class="data-list">aba</span>
                        <span class="data-list">aba</span>
                    </div>
                    <div class="data joined">
                        <span class="data-title">StartDate</span>
                        <span class="data-list">2023-02-12</span>
                        <span class="data-list">2023-02-12</span>
                        <span class="data-list">2023-02-13</span>
                        <span class="data-list">2023-02-13</span>
                        <span class="data-list">2023-02-14</span>
                        <span class="data-list">2023-02-14</span>
                        <span class="data-list">2023-02-15</span>
                    </div>
                     <div class="data joined">
                        <span class="data-title">EndDate</span>
                        <span class="data-list">2023-02-12</span>
                        <span class="data-list">2023-02-12</span>
                        <span class="data-list">2023-02-13</span>
                        <span class="data-list">2023-02-13</span>
                        <span class="data-list">2023-02-14</span>
                        <span class="data-list">2023-02-14</span>
                        <span class="data-list">2023-02-15</span>
                    </div>
                    <div class="data type">
                        <span class="data-title">CageID</span>
                        <span class="data-list">1</span>
                        <span class="data-list">2</span>
                        <span class="data-list">3</span>
                        <span class="data-list">5</span>
                        <span class="data-list">3</span>
                        <span class="data-list">3</span>
                        <span class="data-list">1,</span>
                    </div>
                    <div class="data status">
                        <span class="data-title">Status</span>
                        <span class="data-list">Moving</span>
                        <span class="data-list">Moving</span>
                        <span class="data-list">Moving</span>
                        <span class="data-list">Moving</span>
                        <span class="data-list">Moving</span>
                        <span class="data-list">Moving</span>
                        <span class="data-list">Moving</span>
                    </div>
                </div>
            
        
    </section>

     <script src="js/homePage.js"></script>
</body>
</html>