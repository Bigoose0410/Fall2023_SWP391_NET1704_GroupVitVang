<%-- 
    Document   : processs
    Created on : Oct 7, 2023, 11:32:39 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProductPocess.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <!--<script src="index.js"></script>-->

          <title>Production Process</title>
     </head>

     <body>
          <nav>

               <div class="logo-name"style="
                    display: block;">
                    <div class="logo-image">
                         <a href="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
                    <div class="menu-items">
                         <ul class="nav-links">
                              <!--                              <li ><a href="#">
                                                                      <i class="uil uil-estate"></i>
                                                                      <span class="link-name">Dahsboard</span>
                                                                 </a></li>-->
                              <li ><a href="MainController?btAction=Order">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Customers">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Customers</span>
                                   </a></li>
                              <li ><a href="${productionList}">
                                        <i class="uil uil-grin"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>
                              <li > <a href="#">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Reports</span>
                                   </a></li>
                              <li ><a href="#">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
                                   </a></li>
                              <li > <a href="#">
                                        <i class="uil uil-archive-alt"></i>
                                        <span class="link-name">Inventory</span>
                                   </a></li>
                         </ul>

                         <ul class="logout-mode">
                              <li><a href="${logout_query}">
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
          <section class="dashboard1">
               <div id="processing-form">
                    <!--Processing-->
                    <h1>Processing</h1>

                    <form>
                         <c:set var="result" value="${requestScope.PROCESS_RESULT}"></c:set>
                         <%--<c:if test="${empty searchValue}">--%>
                         <c:if test="${not empty result}">
                              <table class="tablesorter-custom1">
                                   <thead>
                                        <tr class="search2">
                                             <td></td>
                                             <td> <input type="search" data-column="1" placeholder="CustomerID">CS003</td>
                                             <td> <input type="search" data-column="2" placeholder="OrderID">OD001</td>
                                             <td> <input type="search" data-column="3" placeholder="CageID">CG001</td>
                                             <td> <input type="search" data-column="4" placeholder="ProcessID"></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                             <th>No.</th>
                                             <th>CustomerID</th>
                                             <th>OrderID</th>
                                             <th>CageID</th>
                                             <th>ProcessID</th>
                                             <th>Process Name</th>
                                             <th>Date time Start</th>
                                             <th>Date time End</th>
                                             <th>Quantity</th>
                                             <th>Number Of Employee</th>
                                             <th>OrderDetailStatus</th>
                                             <th>Status</th>
                                             <th>Update</th>
                                             <!--<th>Delete</th>-->
                                        </tr>
                                   </thead>
                                   <c:forEach var="dto" items="${result}" varStatus="counter">
                                        <c:if test="${dto.getOrderDetailStatus().equals('Processing')}">
                                             <tbody>
                                             <form action="MainController"> 

                                                  <tr>
                                                       <td>${counter.count}</td>

                                                       <td>
                                                            <a href="MainController?btAction=Customers" style="text-decoration: none; color: black;">${dto.getUserID()}</a>
                                                       </td>
                                                       <td>
                                                            ${dto.getOrderID()}
                                                            <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                       </td>

                                                       <td>
                                                            ${dto.getCageID()}
                                                            <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                       </td>

                                                       <td>
                                                            ${dto.getProcessID()}
                                                            <input type="hidden" name="txtProcessID" value="${dto.getProcessID()}" />
                                                       </td>

                                                       <td>${dto.getProcessName()}</td>

                                                       <td>${dto.getStartDate()}</td>

                                                       <td>${dto.getEndDate()}</td>

                                                       <td>${dto.getQuantity()}</td>

                                                       <td>
                                                            ${dto.getNumberOfEmployee()}
                                                            <input type="hidden" name="txtNumberOfEmployee" placeholder="New Quantity" min="1" value="${dto.getNumberOfEmployee()}" />
                                                       </td>
                                                       <td>${dto.getOrderDetailStatus()}</td>                                                  
                                                       <td>
                                                            <select name="txtStatus">    
                                                                 <option>${dto.getStatus()}</option>
                                                                 <option value="Processing">Processing</option>
                                                                 <option value="not yet">not yet</option>
                                                                 <option value="Done">Done</option>
                                                            </select>
                                                       </td>
                                                       <td><button class="fa fa-pencil-square" type="submit" value="UpdateStatusProcess" name="btAction"></button></td>
                                                  </tr>

                                             </form>
                                             </tbody>
                                        </c:if>
                                   </c:forEach>
                              </table>
                         </c:if>
                         <c:if test="${empty result}">
                              <p>Yours order is not in processing!!!</p>
                         </c:if>
                    </form>
               </div>
          </section>

          <script src="js/ProductProcess.js"></script>
     </body>
</html>