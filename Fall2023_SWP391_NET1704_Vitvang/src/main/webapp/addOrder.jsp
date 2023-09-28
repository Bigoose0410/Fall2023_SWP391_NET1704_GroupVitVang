<%-- 
    Document   : addOrder
    Created on : Sep 21, 2023, 3:27:32 PM
    Author     : Admin
--%>

<%@page import="Resigtration.RegistrationInsertError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="t" %>
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
    <!-- <h2>Them thong tin san pham</h2> -->

    <main>
      
      <h2>Them thong tin san pham</h2>
      <div class="main-content">
           <form action="MainController">
                <ul>
          <li>OrderID</li>
          <li>
               <input type="text" class="form-control" placeholder="OrderID" name="txtOrderID" value="<%=request.getParameter("txtOrderID")%>" />
          </li>
          <t:set var="errors" value="${requestScope.INSERTERROR}"></t:set>
            <t:if test="${not empty errors.orderIdErr}">
                <font color ="red">
                ${errors.orderIdErr}
                </font>
            </t:if>
            <br>
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
            <input type="date" class="form-control" placeholder="StartDate" name="txtStartDate" />
          </li>
           <t:if test="${not empty errors.startDateErr}">
                <font color ="red">
                ${errors.startDateErr}
                </font>
            </t:if>
            <br>
        </ul>

        <ul>
          <li>Price</li>
          <li>
            <input type="text" class="form-control" placeholder="Price" name="txtPrice" />
          </li>
        </ul>

        <ul>
          <li>StatusProcess</li>
          <li>
            <input type="text" class="form-control" placeholder="StatusProcess" name="txtProcess" />
          </li>
          
        </ul>
        <ul>
          <li>EndDate</li>
          <li>
            <input type="date" class="form-control" name="txtEndDate" />
              <t:if test="${not empty errors.endDateErr}">
                <font color ="red">
                ${errors.endDateErr}
                </font>
            </t:if>
            <br>
          </li>
        </ul>
        <ul>
          <li>CustomerID</li>
          <li>
            <input type="text" class="form-control" placeholder="CustomerID" name="txtCustomerID" />
          </li>
        </ul>
      </div>
      <div class="text-right">

          <button class="submit-button" name="btAction" value="Add">Submit</button>
        
      </div>
           </form>>
        
     
    </main>
  </div>
  <div class="footer">
    <footer>
      <p>&copy; VitVang 2023</p>
    </footer>
  </div>
</body>

</html>
