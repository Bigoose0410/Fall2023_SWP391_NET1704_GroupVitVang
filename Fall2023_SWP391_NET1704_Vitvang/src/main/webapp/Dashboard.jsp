<%-- 
    Document   : DashBoard
    Created on : Nov 3, 2023, 12:32:46 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
     <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width,initial-scale=1.0">
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
          <!-- Montserrat Font -->
          <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <!-- Material Icons -->
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
          <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

          <!-- Custom CSS -->
          <link rel="stylesheet" href="css/Dashboard.css">
          <link rel="stylesheet" href="css/AdminManageAccount.css">

          <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script> 
          <title>Dashboard page</title>
          <style>
               .nav-links li{
                    padding: 20px 0;
               }
               .nav-links {
                    flex: 2 4 auto; /* chiếm khoảng trống còn lại */
                    display: flex;
                    flex-direction: column;
                    /*justify-content: space-between;*/
               }
               .menu-items li a .link-name{
                    font-size: 18px;
                    font-weight: 400;
                    color: black;
                    transition: var(--tran-05);
               }
               nav .logo-image img {
                    width: 40px;
                    object-fit: cover;
                    border-radius: 50%;
                    margin-left: 35%;
               }
               nav .logo-image {
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    min-width: 45px;
               }
               nav .logo-name .logo_name {
                    font-size: 25px;
                    font-weight: 600;
                    /* color: var(--text-color); */
                    /* margin-right: 30px; */
                    background-color: transparent;
                    border: none;
                    transition: var(--tran-05);
                    justify-content: center;
                    padding-left: 20px;
               }
               .menu-items .logout-mode{
                    padding-bottom: 100px;
                    border-top: 1px solid var(--border-color);
               }
               nav{
                    background-color: var(--box1-color);
               }
          </style>  
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <div class="grid-container">

               <!-- Header -->

               <!-- End Header -->

               <!-- Sidebar -->
               <nav>

                    <div class="logo-name" style="
                         display: block;">
                         <div class="logo-image">
                              <a src="HomePage.html"><img src="img/admin.png" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                         </div>

                         <div class="menu-items">
                              <ul class="nav-links">
                                   <li><a href="MainController?btAction=Dashboard">
                                             <i class="uil uil-estate"></i>
                                             <span class="link-name">Dashboard</span>
                                        </a></li>

                                   <li><a href="AdminHomePage.jsp">
                                             <i class="uil uil-bill"></i>
                                             <span class="link-name">Home</span>
                                        </a></li>

                                   <li><a href="MainController?btAction=Manage Account">
                                             <i class="uil uil-grin"></i>
                                             <span class="link-name">Manage Account</span>
                                        </a></li>

                                   <ul class="logout-mode">
                                        <li><a href="${logout_query}">
                                                  <i class="uil uil-signout"></i>
                                                  <span class="link-name" >Logout</span>
                                             </a></li>


                                   </ul>
                              </ul>
                         </div>

               </nav>

               <c:set var="quantity_neworder" value="${requestScope.NEWORDER_QUANTITY}" />
               <c:set var="quantity_processingorder" value="${requestScope.PROCESSINGORDER_QUANTITY}" />
               <c:set var="quantity_doneorder" value="${requestScope.DONEORDER_QUANTITY}" />
               <c:set var="quantity_cage" value="${requestScope.CAGE_QUANTITY}" />
               <c:set var="count_cage" value="${requestScope.COUNT_CAGE}" />
               <!-- Main -->
               <main class="main-container">
                    <div class="main-title">
                         <h2 style="color: black; font-size: 30px;"><span class="material-symbols-outlined">
                                   dashboard_customize
                              </span> DASHBOARD</h2>
                    </div>
                   <form action="MainController" method="POST">
                         <div class="main-cards">

                              <div class="card">
                                   <div class="card-inner">
                                        <h3>Current Bird Cage</h3>
                                        <!--<span class="material-icons-outlined">inventory_2</span>-->
                                        <!--<span class="material-icons-outlined">inventory_2</span>-->
                                        <iconify-icon icon="fe:cage" style="color: white;" width="35" height="35"></iconify-icon>
                                   </div>
                                   <h1>${quantity_cage}</h1>
                              </div>

                              <div class="card">
                                   <div class="card-inner">
                                        <h3>New Order</h3>
                                        <!--<span class="material-icons-outlined">category</span>-->
                                        <!--<span class="material-icons-outlined">category</span>-->
                                        <span class="material-symbols-outlined">orders</span>
                                   </div>
                                   <h1>${quantity_neworder}</h1>
                              </div>

                              <div class="card">
                                   <div class="card-inner">
                                        <h3>Processing Order</h3>
                                        <!--<span class="material-icons-outlined">groups</span>-->
                                        <!--<span class="material-icons-outlined">groups</span>-->
                                        <span class="material-symbols-outlined">manufacturing</span>
                                   </div>
                                   <h1>${quantity_processingorder}</h1>
                              </div>

                              <div class="card">
                                   <div class="card-inner">
                                        <h3>Done Order</h3>
                                        <!--                                        <span class="material-symbols-outlined">
                                                                                     autorenew
                                                                                </span>-->
                                        <!--                                        <span class="material-symbols-outlined">
                                                                                     autorenew
                                                                                </span>-->
                                        <span class="material-symbols-outlined">done_all</span>
                                   </div>
                                   <h1>${quantity_doneorder}</h1>
                              </div>

                         </div>
                    </form>
                    <!-- Chart -->
                    <div class="charts">

                         <div class="charts-card">
                              <h2 class="chart-title">Top Cage </h2>
                              <div id="bar-chart"></div>
                         </div>

                         <!--                         <div class="charts-card">
                                                       <h2 class="chart-title">Order and Sales Orders</h2>
                                                       <div id="area-chart"></div>
                                                  </div>-->

                    </div>
               </main>
               <!-- End Main -->

          </div>

          <!-- Scripts -->
          <!-- ApexCharts -->
          <script src="js/DarkMode.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
          <!-- Custom JS -->
          <!--<script src="js/Dashboard.js"></script>-->
          <script>
               const barChartOptions = {
               series: [
               {
               data: [
               <c:forEach var="dto" items="${count_cage}" varStatus="loop">
                    ${dto.getCageQuantity()},
               </c:forEach>
               ],
                       //                              data: [300, 200, 100],
                       name: 'Products',
               },
               ],
                       chart: {
                       type: 'bar',
                               background: 'transparent',
                               height: 350,
                               toolbar: {
                               show: false,
                               },
                       },
                       colors: ["#2962ff", "#d50000", "#2e7d32", "#FF9900", "#550000", "#111111", "#FFCC99", "#663399"],
                       plotOptions: {
                       bar: {
                       distributed: true,
                               borderRadius: 4,
                               horizontal: false,
                               columnWidth: '40%',
                       },
                       },
                       dataLabels: {
                       enabled: false,
                       },
                       fill: {
                       opacity: 1,
                       },
                       grid: {
                       borderColor: '#55596e',
                               yaxis: {
                               lines: {
                               show: true,
                               },
                               },
                               xaxis: {
                               lines: {
                               show: true,
                               },
                               },
                       },
                       legend: {
                       labels: {
                       colors: '#f5f7ff',
                       },
                               show: true,
                               position: 'top',
                       },
                       stroke: {
                       colors: ['transparent'],
                               show: true,
                               width: 2,
                       },
                       tooltip: {
                       shared: true,
                               intersect: false,
                               theme: 'dark',
                       },
                       xaxis: {
                       categories: [
               <c:forEach var="dto" items="${count_cage}" varStatus="loop">
                       '${dto.getName()}',
               </c:forEach>
                       ],
                               title: {
                               style: {
                               color: 'black',
                               },
                               },
                               axisBorder: {
                               show: true,
                                       color: '#55596e',
                               },
                               axisTicks: {
                               show: true,
                                       color: '#55596e',
                               },
                               labels: {
                               style: {
                               colors: '#f5f7ff',
                               },
                               },
                       },
                       yaxis: {
                       title: {
                       text: 'Count',
                               style: {
                               color: '#f5f7ff',
                               },
                       },
                               axisBorder: {
                               color: '#55596e',
                                       show: true,
                               },
                               axisTicks: {
                               color: '#55596e',
                                       show: true,
                               },
                               labels: {
                               style: {
                               colors: '#f5f7ff',
                               },
                               },
                       },
               };
               const barChart = new ApexCharts(
                       document.querySelector('#bar-chart'),
                       barChartOptions
                       );
               barChart.render();
               // AREA CHART
               const areaChartOptions = {
               series: [
               {
               name: 'Số Lượng Orders',
                       data: [31, 40, 28, 51, 42, 109, 100],
               },
               {
               name: 'Đã Bán Orders',
                       data: [11, 32, 45, 32, 34, 52, 41],
               },
               ],
                       chart: {
                       type: 'area',
                               background: 'transparent',
                               height: 350,
                               stacked: false,
                               toolbar: {
                               show: false,
                               },
                       },
                       colors: ['#00ab57', '#d50000'],
                       labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                       dataLabels: {
                       enabled: false,
                       },
                       fill: {
                       gradient: {
                       opacityFrom: 0.4,
                               opacityTo: 0.1,
                               shadeIntensity: 1,
                               stops: [0, 100],
                               type: 'vertical',
                       },
                               type: 'gradient',
                       },
                       grid: {
                       borderColor: '#55596e',
                               yaxis: {
                               lines: {
                               show: true,
                               },
                               },
                               xaxis: {
                               lines: {
                               show: true,
                               },
                               },
                       },
                       legend: {
                       labels: {
                       colors: '#f5f7ff',
                       },
                               show: true,
                               position: 'top',
                       },
                       markers: {
                       size: 6,
                               strokeColors: '#1b2635',
                               strokeWidth: 3,
                       },
                       stroke: {
                       curve: 'smooth',
                       },
                       xaxis: {
                       axisBorder: {
                       color: '#55596e',
                               show: true,
                       },
                               axisTicks: {
                               color: '#55596e',
                                       show: true,
                               },
                               labels: {
                               offsetY: 5,
                                       style: {
                                       colors: '#f5f7ff',
                                       },
                               },
                       },
                       yaxis: [
                       {
                       title: {
                       text: 'Purchase Orders',
                               style: {
                               color: '#f5f7ff',
                               },
                       },
                               labels: {
                               style: {
                               colors: ['#f5f7ff'],
                               },
                               },
                       },
                       {
                       opposite: true,
                               title: {
                               text: 'Sales Orders',
                                       style: {
                                       color: '#f5f7ff',
                                       },
                               },
                               labels: {
                               style: {
                               colors: ['#f5f7ff'],
                               },
                               },
                       },
                       ],
                       tooltip: {
                       shared: true,
                               intersect: false,
                               theme: 'dark',
                       },
               };
               const areaChart = new ApexCharts(
                       document.querySelector('#area-chart'),
                       areaChartOptions
                       );
               areaChart.render();
          </script>

     </body>
</html>