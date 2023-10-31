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
          <link rel="stylesheet" href="css/EditMaterial.css">

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

          <section class="dashboard">
               <h1>Material</h1>
               <div class="table-container">
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>MaterialID</th>
                                   <th>Name</th>
                                   <th>Quantity</th>
                                   <th>Origin</th>
                                   <th>Price/Unit</th>
                                   <th>Unit</th>
                                   <th>Edit</th>
                              </tr>
                         </thead>

                         <tbody>
                              <c:forEach var="dto" items="" varStatus="counter">
                              <div action="MainController">
                                   <tr>
                                        <td></td>

                                        <td>
                                             <input type="hidden" name="txtMaterialID" value="" />
                                        </td>

                                        <td></td>

                                        <td>
                                             <div class="input-container">
                                                  <input placeholder="Quantity" class="input-field" type="number" value="" min="0"
                                                         max="100" name="txtQuantity" value="">
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td></td>

                                        <td></td>

                                        <td></td>

                                        <td class="edit_button">
                                             <div class="update_button">
                                                  <button type="submit" value="updateDesign" name="btAction">
                                                       <i class="fa fa-pencil-square"></i>
                                                  </button>
                                             </div>
                                             <div class="separator">/</div>
                                             <div class="delete_button">
                                                  <button type="submit" value="deleteDesign" name="btAction">
                                                       <i class="fa fa-trash"></i>
                                                  </button>
                                             </div>
                                        </td>
                                   </tr>
                              </div>
                         </c:forEach>
                         </tbody>
                    </table>
               </div>

               <form action="MainController">
                    <strong>Add More Marterial: </strong>
                    <select onchange="this.form.submit()" name="slMateriaID">
                         <option selected>Open this select menu</option>
                         <c:forEach var="dto" items="">
                              <option value="$"></option>
                         </c:forEach>
                         <input type="hidden" name="btAction" value="EditMaterial" />
                         <input type="hidden" name="txtCageID" value="" />
                    </select>
               </form>

               <c:if test="">
                    <div class="material_form1">
                         <form action="MainController">
                              <table class="material_form">
                                   <h2><span>Add</span> Material</h2>
                                   <tr>
                                        <td>
                                             <label for="MaterialID_name">MaterialID :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" value="" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Name">Name :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" value="" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Origin_name">Origin :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" value="" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                   </tr>

                                   <tr>
                                        <td>
                                             <label for="Price_name">Price :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" value="" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Unit_name">Unit :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" value="" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Quantity_name">Quantity :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="number" name="txtNumberOfEmployee" value="" min="0"
                                                         max="10">
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                   </tr>
                              </table>
                              <button class="submit_button" type="submit">Submit</button>
                         </form>
                    </div>

               </c:if>
               <div class="button_2">
                    <a href="EditDesign.html"><button class="next_button"><i class="fas fa-arrow-right"></i></button></a>
               </div>
          </section>
     </body>
</html>
