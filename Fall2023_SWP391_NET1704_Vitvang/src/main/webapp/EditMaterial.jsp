<%-- 
    Document   : EditMaterial
    Created on : Oct 13, 2023, 12:44:26 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProductDetail.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Edit Material</title>
     </head>
     <body>
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="ListMaterial" value="${requestScope.CAGE_MATERIAL}"></c:set>
          <c:set var="materialPrice" value="${requestScope.MATERIAL_PRICE}"></c:set>
          <c:set var="materialnotuse" value="${requestScope.MATERIAL_NOT_USE}"></c:set>
          <c:set var="materialwilladd" value="${requestScope.MATERIAL_WILL_ADD}"></c:set>

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
          <section class="dashboard2">
               <table class="tablesorter-custom">
                    <br>
                    <h1>Material</h1>
                    <!--               <form action="MainController">
                                        <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                                        <button type="submit" value="EditMaterial" name="btAction">Modify</button>
                                   </form>-->
                    <thead>
                         <tr class="search">
                              <td> <input type="search" data-column="0" placeholder="No."></td>
                              <!--<td> <input type="search" data-column="1" placeholder="CageID"></td>-->
                              <!--<td> <input type="search" data-column="2" placeholder="MaterialID"></td>-->
                              <td> <input type="search" data-column="3" placeholder="Name"></td>
                              <td> <input type="search" data-column="4" placeholder="Origin"></td>
                              <!--<td> <input type="search" data-column="5" placeholder="Need/Cage"></td>-->
                              <td> <input type="search" data-column="6" placeholder="Price/Unit"></td>
                              <td> <input type="search" data-column="7" placeholder="Unit"></td>
                         </tr>
                         <tr>
                              <th>No.</th>
                              <!--<th>Cage ID</th>-->
                              <th>Material ID</th>
                              <th>Name </th>
                              <th>Quantity </th>
                              <th>Origin</th>
                              <th>Price/Unit</th>
                              <th>Unit</th>
                              <th>      </th>
                         </tr>
                         </tbody>
                    </thead>
                    <tbody>
                         <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                         <form action="MainController" ">
                              <tr>
                                   <td>
                                        ${counter.count}
                                   </td>
                                   <!--                                   <td>
                                   ${dto.getCageID()}
                              </td>-->
                                   <td>
                                        ${dto.getMaterialID()}
                                        <input type="hidden" name="txtMaterialID" value="${dto.getMaterialID()}" />
                                   </td>
                                   <td>
                                        ${dto.getName()} 
                                   </td>
                                   <td>
                                        <input type="text" name="txtQuantity" value="${dto.getQuantityNeed()}" min="0" max="100" />
                                   </td>
                                   <td>
                                        ${dto.getOrigin()}
                                   </td>
                                   <td>
                                        ${dto.getPrice()}
                                   </td>
                                   <td>
                                        ${dto.getUnit()}
                                   </td>
                                   <td>
                                        <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                        <button type="submit" value="UpdateMaterialofCage" name="btAction">
                                             Update
                                        </button>
                                        <button type="submit" value="DeleteMaterialofCage" name="btAction">
                                             Delete
                                        </button>
                                   </td>
                              </tr>
                         </form>
                    </c:forEach>
                    </tbody>
                    total material = ${materialPrice}
               </table>
               <form action="MainController">
                    add more marterial in build
                    <select onchange="this.form.submit()" name="slMateriaID">
                         <option selected>Open this select menu</option>
                         <c:forEach var="dto" items="${materialnotuse}">
                              <option value="${dto.getMaterialID()}">${dto.getName()}</option>
                         </c:forEach>
                         <input type="hidden" name="btAction" value="EditMaterial" />
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                    </select>
               </form>
               <c:if test="${not empty materialwilladd}">
                    <form action="MainController">
                         <table border="1">
                              <thead>
                                   <tr>
                                        <th>MaterialID</th>
                                        <th>Name</th>
                                        <th>Origin</th>
                                        <th>Price</th>
                                        <th>Unit</th>
                                        <th>Quantity Add</th>
                                        <th>   </th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td>
                                             ${materialwilladd.getMaterialID()}
                                             <input type="hidden" name="txtMaterialID" value="${materialwilladd.getMaterialID()}" />
                                        </td>
                                        <td>${materialwilladd.getName()}</td>
                                        <td>${materialwilladd.getOrigin()}</td>
                                        <td>${materialwilladd.getPrice()}</td>
                                        <td>${materialwilladd.getUnit()}</td>
                                        <td>
                                             <input type="number" name="txtQuantity" value="" min="1" max="100"/>
                                        </td>
                                        <td>
                                             <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                                             <button type="submit" name="btAction" value="AddMaterialToCage">
                                                  +
                                             </button>
                                        </td>
                                   </tr>
                              </tbody>
                         </table>
                    </form>
               </c:if>
          </section>
     </body>
</html>
