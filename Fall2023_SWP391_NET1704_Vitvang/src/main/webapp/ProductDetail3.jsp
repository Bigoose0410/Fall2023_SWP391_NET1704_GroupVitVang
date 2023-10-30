<%-- 
    Document   : ProductDetail3
    Created on : Oct 27, 2023, 9:38:28 PM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>

          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProductDetail3.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>ProductDetail</title>
     </head>

     <body>
          <!-- log out link -->
     <c:url var="logout_query" value="MainController">
          <c:param name="cookiekey" value="${sessionScope.USER.getName()}" />
          <c:param value="Log Out" name="btAction" />
     </c:url>
     <c:url var="productionList" value="MainController">
          <c:param value="SearchCage" name="btAction" />
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
                              <span class="link-name">Logout</span>
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
          <!--Form CageID-->
          <div class="section">
               <div class="info">
                    <img src="https://i.pinimg.com/564x/21/d3/dd/21d3ddfd618b42fe42ea96c69ff34892.jpg" alt="Cage Image">
                    <div class="info-details">
                         <div class="info-item">CageID: <span>CG001</span></div>
                         <div class="info-item">Name: <span>long tang vuong</span></div>
                         <div class="info-item">Price: <span>2000</span></div>
                         <div class="info-item">Origin: <span>VN</span></div>
                         <div class="info-item">Description: <span>Long vuong chao mao</span></div>
                         <div class="info-item">
                              Material: <span> Tre, Cửa, Móc,...</span></br>
                              <button class="toggle-button">
                                   <i class="fa fa-plus"></i>
                              </button>
                         </div>
                         <div class="info-item">
                              Step:</br>
                              <button class="toggle-button1">
                                   <i class="fa fa-plus"></i>
                              </button>
                         </div>
                    </div>
               </div>
          </div>

          <div class="material_table" style="display: none;">
               <div class="header-row">
                    <h1>Material</h1>
                    <form action="MainController">
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                         <button type="submit" value="EditMaterial" name="btAction"><i
                                   class="fa fa-pencil-square"></i></button>
                    </form>
               </div>
               <!--Material table-->
               <div class="table-container">
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>Name</th>
                                   <th>Origin</th>
                                   <th>Price/Unit</th>
                                   <th>Unit</th>
                              </tr>
                         </thead>

                         <tbody>
                         <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                              <tr>
                                   <td>
                                        ${counter.count}
                                   </td>

                                   <td>
                                        ${dto.getName()} - ${dto.getQuantityNeed()}
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
                              </tr>

                              <tr>
                                   <td>
                                        ${counter.count}
                                   </td>

                                   <td>
                                        ${dto.getName()} - ${dto.getQuantityNeed()}
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
                              </tr>
                         </c:forEach>
                         </tbody>
                    </table>
               </div>
          </div>

          <div class="process_table" style="display: none;">
               <div class="header-row">
                    <h1>Design Process</h1>
                    <form action="MainController">
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                         <button type="submit" value="EditDesign" name="btAction"><i
                                   class="fa fa-pencil-square"></i></button>
                    </form>
               </div>
               <!--Design Process table-->
               <div class="table-container1">
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>Phrase</th>
                                   <th>Time Process</th>
                                   <th>Description</th>
                                   <th>NumberOfEmployee</th>
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

                                   <td>
                                        ${dto.getTimeProcess()}
                                   </td>

                                   <td>
                                        ${dto.getDescription()}
                                   </td>

                                   <td>
                                        ${dto.getNumberOfEmployee()}
                                   </td>
                              </tr>

                              <tr>
                                   <td>
                                        ${counter.count}
                                   </td>

                                   <td>
                                        ${dto.getPhrase()}
                                   </td>

                                   <td>
                                        ${dto.getTimeProcess()}
                                   </td>

                                   <td>
                                        ${dto.getDescription()}
                                   </td>

                                   <td>
                                        ${dto.getNumberOfEmployee()}
                                   </td>
                              </tr>
                         </c:forEach>
                         </tbody>
                    </table>
               </div>
          </div>
     </section>
     <script src="js/darkMode.js"></script>
     <script src="js/ProductDetail.js"></script>
</body>

</html>