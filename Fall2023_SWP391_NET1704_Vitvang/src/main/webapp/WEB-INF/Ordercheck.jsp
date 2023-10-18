<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/ordercheck.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    

    <title>Admin Dashboard Panel</title>
</head>
<body>
    <nav>
       
        <div class="logo-name">
            <div class="logo-image">
                 <img src="img/a.jpg" alt="">
            </div>

           
            <button  class="logo_name"  value="man" name="btAction" ><span></span>Customer </button>
<!--            <button  class="logo_name"  value="man" name="btAction" ><span></span>Admin</button>-->
<!--            <button  class="logo_name"  value="man" name="btAction" ><span></span>Staff</button>-->
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                
             
                <li><a href="MainController?btAction=Order">
                    <i class="uil uil-bill"></i>
                    <span class="link-name">Order</span>
                </a></li>
                
               
               
               
               
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
            </ul>
            
        </div>
      
    </nav>
<section>
    <div class="progress-dates">
  <div class="start-date">Ngày bắt đầu: 01/01/2023</div>

  <div class="end-date">Ngày Bắt Đầu: 31/01/2023</div>  
</div>
    <div class="stepper-container">
       
  <div class="stepper-wrapper">
      <div class="stepper-item completed">
        <div class="step-counter">1</div>
        <div class="step-name">First</div>
      </div>
      <div class="stepper-item completed">
        <div class="step-counter">2</div>
        <div class="step-name">Second</div>
      </div>
      <div class="stepper-item active">
        <div class="step-counter">3</div>
        <div class="step-name">Third</div>
      </div>
      <div class="stepper-item">
        <div class="step-counter">4</div>
        <div class="step-name">Forth</div>
      </div>
      
    </div>
 
</div>
<div class="progress-dates">
  <div class="start-date">Ngày bắt đầu: 01/01/2023</div>

  <div class="end-date">Ngày Bắt Đầu: 31/01/2023</div> 
</div>
    <div class="stepper-container">
       
  <div class="stepper-wrapper">
      <div class="stepper-item completed">
        <div class="step-counter">1</div>
        <div class="step-name">First</div>
      </div>
      <div class="stepper-item completed">
        <div class="step-counter">2</div>
        <div class="step-name">Second</div>
      </div>
      <div class="stepper-item active">
        <div class="step-counter">3</div>
        <div class="step-name">Third</div>
      </div>
      <div class="stepper-item">
        <div class="step-counter">4</div>
        <div class="step-name">Forth</div>
      </div>
      <div class="stepper-item">
        <div class="step-counter">5</div>
        <div class="step-name">Forth</div>
      </div>
    </div>
 
</div>
<div class="progress-dates">
  <div class="start-date"></div>

  <div class="end-date">Ngày Bắt Đầu: 31/01/2023</div> 
</div>
    <div class="stepper-container">
       
  <div class="stepper-wrapper">
      <div class="stepper-item completed">
        <div class="step-counter">1</div>
        <div class="step-name">First</div>
      </div>
      <div class="stepper-item completed">
        <div class="step-counter">2</div>
        <div class="step-name">Second</div>
      </div>
      <div class="stepper-item active">
        <div class="step-counter">3</div>
        <div class="step-name">Third</div>
      </div>
      <div class="stepper-item">
        <div class="step-counter">4</div>
        <div class="step-name">Forth</div>
      </div>
      <div class="stepper-item">
        <div class="step-counter">5</div>
        <div class="step-name">Five</div>
      </div>
      <div class="stepper-item">
        <div class="step-counter">6</div>
        <div class="step-name">Six</div>
      </div>
    </div>
 
</div>  

</section>


     <script src="order.js"></script>
</body>
</html>