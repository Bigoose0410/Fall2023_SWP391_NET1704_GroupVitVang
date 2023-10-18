<%-- 
    Document   : ProductDetail
    Created on : Oct 10, 2023, 1:45:06 PM
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
          <title>BCPM</title>
     </head>
     <body>
          <!-- log out link -->
          <c:url var="logout_query" value="MainController">
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:set var="ListMaterial" value="${requestScope.CAGE_MATERIAL}"></c:set>
          <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
          <c:set var="materialPrice" value="${requestScope.MATERIAL_PRICE}"></c:set>
          <c:set var="processPrice" value="${requestScope.PROCESS_PRICE}"></c:set>
               <nav>

                    <div class="logo-name">
                         <div class="logo-image">
                              <img src="images/logo.png" alt="">
                         </div>

                         <span class="logo_name">${sessionScope.USER.getName()}</span>
               </div>

               <div class="menu-items">
                    <ul class="nav-links">
                         <li><a href="#">
                                   <i class="uil uil-estate"></i>
                                   <span class="link-name">Dahsboard</span>
                              </a></li>
                         <li><a href="MainController?btAction=Order">
                                   <i class="uil uil-bill"></i>
                                   <span class="link-name">Order</span>
                              </a></li>
                         <li><a href="#">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li><a href="${productionList}">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Production</span>
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
               <h1> Cage</h1>
               <table  class="tablesorter-custom">
                    <thead>
                         <tr>
                              <th>CageID</th>
                              <th>Name</th>
                              <th>Price</th>
                              <th>Origin</th>
                              <th>Description</th>
                         </tr>
                    </thead>
                    <tbody>
                         <tr>
                              <td>
                                   ${param.txtCageID}
                              </td>
                              <td>
                                   ${param.txtCageName}
                              </td>
                              <td>
                                   ${materialPrice + processPrice + 3000}
                              </td>
                              <td>
                                   ${param.txtOrigin}
                              </td>
                              <td>
                                   ${param.txtDescription}
                              </td>
                         </tr>
                         <p>Total Price =  Material price + Process Price + profit(3000) </p>
               </table>
               <br><!-- comment -->             
               <table class="tablesorter-custom">
                    <br>
                    <h1>Material</h1>
                    <form action="MainController">
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                         <button type="submit" value="EditMaterial" name="btAction">Modify</button>
                    </form>
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
                              <!--<th>Material ID</th>-->
                              <th>Name</th>
                              <th>Origin</th>
                              <!--<th>Need/Cage</th>-->
                              <th>Price/Unit</th>
                              <th>Unit</th>
                         </tr>
                         </tbody>
                    </thead>
                    <tbody>
                         <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                              <tr>
                                   <td>
                                        ${counter.count}
                                   </td>
                                   <!--                                   <td>
                                   ${dto.getCageID()}
                              </td>-->
                                   <!--                                   <td>
                                   ${dto.getMaterialID()}
                              </td>-->
                                   <td>
                                        ${dto.getName()} - ${dto.getQuantityNeed()} 
                                   </td>
                                   <td>
                                        ${dto.getOrigin()}
                                   </td>
                                   <!--                                   <td>
                                   ${dto.getQuantityNeed()}
                              </td>-->
                                   <td>
                                        ${dto.getPrice()}
                                   </td>
                                   <td>
                                        ${dto.getUnit()}
                                   </td>
                              </tr>
                         </c:forEach>
                    </tbody>
                    total material = ${materialPrice}
               </table>
          </section>
          <section class="dashboard2">
               <div id="processing-form">

                    <h1>Design Process</h1>
                    <form action="MainController">
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                         <button type="submit" value="EditDesign" name="btAction">Modify</button>
                    </form>
                    <div id="process-form">
                         <table class="tablesorter-custom2">
                              <thead>
                                   <tr>
                                        <th>No.</th>
                                        <th>Phrase</th>
                                        <!--<th>CageID</th>-->
                                        <th>Time Process</th>
                                        <th>Description</th>
                                        <th>NumberOfEmployee</th>
                                        <!--<th>CompletionCage</th>-->
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:forEach var="dto" items="${Design}" varStatus="counter">
                                        <tr>
                                             <td>
                                                  ${counter.count}
                                             </td>
                                             <td>
                                                  ${dto.getPhrase()}
                                             </td>
                                             <!--                                             <td>
                                             ${dto.getCageID()}
                                        </td>-->
                                             <td>
                                                  ${dto.getTimeProcess()}
                                             </td>
                                             <td>
                                                  ${dto.getDescription()}
                                             </td>
                                             <td>
                                                  ${dto.getNumberOfEmployee()}
                                             </td>
                                             <!--                                             <td>
                                             ${dto.getNumCompletionCage()}
                                        </td>-->
                                        </tr>
                                   </c:forEach>
                                   total material = ${processPrice}
                              </tbody>
                         </table>
                    </div>
               </div>
          </section>
          <script src="js/darkMode.js"></script>
          <script src="js/Material.js"></script>
     </body>
</html>
