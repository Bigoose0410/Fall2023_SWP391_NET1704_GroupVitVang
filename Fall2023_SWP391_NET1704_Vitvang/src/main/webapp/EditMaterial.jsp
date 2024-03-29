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
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}"/>
               <c:param value="Log Out" name="btAction"/>
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction"/>
          </c:url>
          <c:url var="DesignPage" value="MainController">
               <c:param value="EditDesign" name="btAction"/>
               <c:param value="${param.txtCageID}" name="txtCageID"/>
               <c:param value="${param.txtCageName}" name="txtCageName"/>
          </c:url>
          <c:set var="ListMaterial" value="${requestScope.CAGE_MATERIAL}"></c:set>
          <c:set var="materialPrice" value="${requestScope.MATERIAL_PRICE}"></c:set>
          <c:set var="materialnotuse" value="${requestScope.MATERIAL_NOT_USE}"></c:set>
          <c:set var="materialwilladd" value="${requestScope.MATERIAL_WILL_ADD}"></c:set>

               <nav>

                    <div class="logo-name"style="
                         display: block;">
                         <div class="logo-image">
                              <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
                    <div class="menu-items">
                         <ul class="nav-links">
                         
                              <li ><a href="MainController?btAction=search">
                                        <i class="uil uil-bill"></i>
                                        <span class="link-name">Order</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Customers">
                                        <i class="uil uil-user"></i>
                                        <span class="link-name">Customers</span>
                                   </a></li>
                              <li ><a href="${productionList}">
                                        <i class="uil uil-clipboard-alt"></i>
                                        <span class="link-name">Production</span>
                                   </a></li>
                              <li ><a href="MainController?btAction=Production process">
                                        <i class="uil uil-chart-line"></i>
                                        <span class="link-name">Production process</span>
                                   </a></li>
                             
                              <li ><a href="MainController?btAction=View All Material">
                                        <i class="uil uil-screw"></i>
                                        <span class="link-name">Material</span>
                                   </a></li>
                           
                         </ul>
                         <ul class="logout-mode">
                              <li><a href="${logout_query}">
                                        <i class="uil uil-signout"></i>
                                        <span class="link-name" >Logout</span>
                                   </a></li>
                         </ul>
                    </div>
          </nav>

          <section class="dashboard">
               <h1>Material</h1>
               <div class="table-container">
                    <h3>${param.txtCageName}</h3>
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>MaterialID</th>
                                   <th>Name / Unit</th>
                                   <th>Quantity</th>
                                   <th>Origin</th>
                                   <!--<th>Price/Unit</th>-->
                                   <th>Edit</th>
                              </tr>
                         </thead>

                         <tbody>
                              <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                              <div action="MainController">
                                  <form action="MainController" method="POST">
                                        <tr>
                                             <td>
                                                  ${counter.count}
                                             </td>

                                             <td>
                                                  ${dto.getMaterialID()}
                                                  <input type="hidden" name="txtMaterialID" value="${dto.getMaterialID()}" />
                                             </td>

                                             <td class="td3" style="text-align: left; display: flex; justify-content: center">
                                                  ${dto.getName()} / ${dto.getUnit()}
                                             </td>
                                             <td>
                                                  <div class="input-container">
                                                       <input placeholder="Quantity" class="input-field" type="number" oninput="this.value = Math.abs(this.value)"
                                                              name="txtQuantity" value="${dto.getQuantityNeed()}" min="0" max="100">
                                                       <span class="input-highlight"></span>
                                                  </div>
                                             </td>

                                             <td>
                                                  ${dto.getOrigin()}
                                             </td>
                                             <%--
                                             <td>
                                                  ${dto.getPrice()}
                                             </td>
                                             --%>


                                             <td class="edit_button">
                                                  <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                  <div class="update_button">
                                                       <button type="submit" value="UpdateMaterialofCage" name="btAction">
                                                            <i class="fa fa-pencil-square"></i>
                                                       </button>
                                                  </div>
                                                  <div class="separator">/</div>
                                                  <div class="delete_button">
                                                       <button type="submit" value="DeleteMaterialofCage" name="btAction">
                                                            <i class="fa fa-trash"></i>
                                                       </button>
                                                  </div>
                                             </td>
                                        </tr>
                                   </form>
                              </div>
                         </c:forEach>
                         </tbody>
                    </table>
               </div>

                    <form action="MainController" method="POST">
                    <strong>Add More Marterial: </strong>
                    <select onchange="this.form.submit()" name="slMateriaID">
                         <option selected>Open this select menu</option>
                         <c:forEach var="dto" items="${materialnotuse}">
                              <option value="${dto.getMaterialID()}" >${dto.getName()}</option>
                         </c:forEach>
                         <input type="hidden" name="btAction" value="EditMaterial" />
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
                    </select>
               </form>

               <c:if test="${not empty materialwilladd}">
                    <div class="material_form1">
                         <form action="MainController" method="POST">
                              <table class="material_form">
                                   <h2><span>Add</span> Material</h2>
                                   <tr>
                                        <td>
                                             <label for="MaterialID_name">MaterialID :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtMaterialID" 
                                                         value="${materialwilladd.getMaterialID()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Name">Name :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtName" 
                                                         value="${materialwilladd.getName()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Origin_name">Origin :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtOrigin" 
                                                         value="${materialwilladd.getOrigin()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                   </tr>

                                   <tr>
                                        <td>
                                             <label for="Price_name">Price :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtPrice" 
                                                         value="${materialwilladd.getPrice()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Unit_name">Unit :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="text" name="txtUnit" 
                                                         value="${materialwilladd.getUnit()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Quantity_name">Quantity :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="number" oninput="this.value = Math.abs(this.value)"
                                                         name="txtQuantity" value="0" min="0" max="100">

                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                   </tr>
                              </table>
                              <input type="hidden" name="txtCageID" value="${param.txtCageID}"/>
                              <button class="submit_button" type="submit" name="btAction" value="AddMaterialToCage">Add</button>

                         </form>
                    </div>
               </c:if>
               <div class="button_2">
                    <a href="${DesignPage}"><button class="next_button"><i class="fas fa-arrow-right"></i></button></a>
               </div>
          </section>
     </body>
</html>
