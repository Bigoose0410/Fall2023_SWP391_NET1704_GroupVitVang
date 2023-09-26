<html lang="en">
     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/addOrder_1.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


          <title>Admin Dashboard Panel</title>
     </head>
     <body>
          <nav>

               <div class="logo-name">
                    <div class="logo-image">
                         <img src="img/OIP.jpg" alt="">
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


                    <div class="top"> <div class="search-box">
                              <i class="uil uil-search"></i>
                              <input type="text" placeholder="Search here...">
                              <!--                 <button class="add-btn" > <a href="orderAdd.jsp">ADD</a></button>-->
                         </div>

                    </div>
                    <div class="add-order-form"> 
                         <main>
                              <h1>ADD ORDER</h1>
                             
                                                            </br>

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
                              <div class="form-group">
                                   <label for="orderId">OrderID</label>
                                   <input type="text" id="orderId">
                              </div>

                              <div class="form-group">  
                                   <label for="customerId">CustomerID</label>
                                   <input type="text" id="customerId">
                              </div>

                              <div class="form-group">
                                   <label for="startDate">StartDate</label> 
                                   <input type="date" id="startDate">
                              </div>

                              <div class="form-group">
                                   <label for="endDate">EndDate</label>
                                   <input type="date" id="endDate">
                              </div>

                              <div class="form-group"> <label>Cage</label> 
                                   <div class="cages"> <div> <input type="checkbox" id="cage1"> 
                                             <label for="cage1">#</label>


                                             <input type="number" id="qty1" >
                                        </div>

                                        <div>    
                                             <input type="checkbox" id="cage2">
                                             <label for="cage2">#</label>

                                             <input type="number" id="qty2">
                                        </div>

                                        <div>
                                             <input type="checkbox" id="cage3">
                                             <label for="cage3">#</label>

                                             <input type="number" id="qty3">
                                        </div>
                                   </div> </div>



                              <div class="form-group">
                                   <button type="submit">Submit</button> 
                              </div>
                         </main> </div>
