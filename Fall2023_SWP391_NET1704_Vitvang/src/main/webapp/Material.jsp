<%-- 
    Document   : Material
    Created on : Nov 3, 2023, 12:36:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/Material_2.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>Material</title>
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
               <c:param name="cookiekey" value="${sessionScope.USER.getName()}" />
               <c:param value="Log Out" name="btAction" />
          </c:url>
          <c:url var="productionList" value="MainController">
               <c:param value="SearchCage" name="btAction" />
          </c:url>
          <c:set var="materialPrice" value="${requestScope.MATERIAL_PRICE}"></c:set>
          <c:set var="materialnotuse" value="${requestScope.MATERIAL_NOT_USE}"></c:set>
          <c:set var="materialwilladd" value="${requestScope.MATERIAL_WILL_ADD}"></c:set>
          <c:set var="ListMaterial" value="${requestScope.SHOW_MATERIAL}"></c:set>

               <nav>

                    <div class="logo-name" style="display: block;">
                         <div class="logo-image">
                              <a href="HomePage.html"><img src="img/staff.png" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
               </div>
               <div class="menu-items">
                    <ul class="nav-links">
                         <li ><a href="MainController?btAction=Search">
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
          <h1>Material</h1>
          <div class="table-container">
               <table>
                    <thead>
                         <tr>
                              <th>No.</th>
                              <th>MaterialID</th>
                              <th>Name / Unit</th>
                              <th>Origin</th>
                              <th>Price</th>
                              <th>Quantity</th>
                              <th>Edit</th>
                         </tr>
                    </thead>

                    <tbody>
                         <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                              <tr>
                                   <td>
                                        ${counter.count}
                                   </td>

                                   <td>
                                        ${dto.getMaterialID()}
                                        <input type="hidden" name="txtMaterialID" value=" ${dto.getMaterialID()}"/>
                                   </td>

                                   <td>
                                        ${dto.getNameMaterial()} / ${dto.getUnit()}
                                   </td>

                                   <td>
                                        ${dto.getOrigin()}
                                   </td>

                                   <td>
                                        <div class="input-container">
                                             <input placeholder="Price" class="input-field" type="number" value="${dto.getPrice()}" min="0"
                                                    max="1000000" name="txtPrice" oninput="this.value = Math.abs(this.value)" >
                                             <span class="input-highlight"></span>
                                        </div>
                                   </td>
                                   <td>
                                        <div class="input-container">
                                             <input placeholder="Quantity" class="input-field" type="number" value="${dto.getQuantity()}" min="0"
                                                    max="1000000" name="txtQuantity"  oninput="this.value = Math.abs(this.value)">
                                             <span class="input-highlight"></span>
                                        </div>
                                   </td>



                                   <td class="edit_button">
                                        <div class="update_button">
                                             <button type="submit" value="" name="btAction">
                                                  <i class="fa fa-pencil-square"></i>
                                             </button>
                                        </div>

                                   </td>
                              </tr>
                         </c:forEach>
                    </tbody>
               </table>
          </div>

          <button class="custom-btn btn-1">New Material</button>

          <div class="tablesorter-custom1" style="display: none;">
               <form action="MainController">

                    <div class="step">
                         <div class="step-header">
                              <h2>+ New Material</h2>
                         </div>
                         <div class="form-step">
                              <label for="username">Material Name</label>
                              <div class="input-container">
                                   <input placeholder="Material Name" class="input-field" type="text" name="txtMaterialName" value="${param.txtMaterialName}">
                                   <span class="input-highlight"></span>
                              </div>
                         </div>

                         <div class="form-step">
                              <label for="username">Origin</label>
                              <div class="input-container">
                                   <input placeholder="Origin" class="input-field" type="text" name="txtOrigin" value="${param.txtOrigin}">
                                   <span class="input-highlight"></span>
                              </div>
                         </div>

                         <div class="form-step">
                              <label for="username">Price</label>
                              <div class="input-container">
                                   <input placeholder="Price" class="input-field1" type="number" min="0" max="100000000" oninput="this.value = Math.abs(this.value)"
                                          name="txtPrice" value="${param.txtPrice}">
                                   <span class="input-highlight"></span>
                              </div>
                         </div>

                         <div class="form-step">
                              <label for="username">Quantity</label>
                              <div class="input-container">
                                   <input placeholder="Quantity" class="input-field1" type="number" min="0" max="100000000" oninput="this.value = Math.abs(this.value)"
                                          name="txtQuantity" value="${param.txtQuantity}">
                                   <span class="input-highlight"></span>
                              </div>
                         </div>

                         <div class="form-step">
                              <label for="status">Unit</label>
                              <div class="input-container">
                                   <select class="input-field" name="txtUnit">
                                        <option value="Cai">Cai</option>
                                        <option value="Mieng">Mieng</option>
                                        <option value="Cay">Cay</option>
                                   </select>
                                   <span class="input-highlight"></span>
                              </div>
                         </div>

                         <div class="form-step">

                         </div>

                         <div class="form-step">

                         </div>

                    </div>
                    <div class="form-step1">
                         <button class="create-button" value="AddMaterial" name="btAction">Create</button>
                    </div>
               </form>

          </div>

     </section>
     <script src="js/Material_1.js"></script>
</body>

</html>
