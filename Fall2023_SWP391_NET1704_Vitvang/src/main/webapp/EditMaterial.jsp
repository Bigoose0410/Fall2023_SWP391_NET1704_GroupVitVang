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
                              <a href="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                              <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
                    <div class="menu-items">
                         <ul class="nav-links">
                              <!--                              <li ><a href="#">
                                                                      <i class="uil uil-estate"></i>
                                                                      <span class="link-name">Dahsboard</span>
                                                                 </a></li>-->
<<<<<<< HEAD
                              <li ><a href="MainController?btAction=Order">
=======
                              <li ><a href="MainController?btAction=Search">
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
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
                    <h3>${param.txtCageName}</h3>
<<<<<<< HEAD

=======
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                    <table>
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>MaterialID</th>
                                   <th>Name / Unit</th>
                                   <th>Quantity</th>
                                   <th>Origin</th>
                                   <th>Price/Unit</th>
                                   <th>Edit</th>
                              </tr>
                         </thead>

                         <tbody>
                              <c:forEach var="dto" items="${ListMaterial}" varStatus="counter">
                              <div action="MainController">
<<<<<<< HEAD
                                   <tr>
                                        <td>
                                             ${counter.count}
                                        </td>

                                        <td>
                                             ${dto.getMaterialID()}
                                             <input type="hidden" name="txtMaterialID" value="${dto.getMaterialID()}" />
                                        </td>

                                        <td>
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

                                        <td>
                                             ${dto.getPrice()}
                                        </td>



                                        <td class="edit_button">
                                             <div class="update_button">
                                                  <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
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
=======
                                   <form action="MainController">
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

                                             <td>
                                                  ${dto.getPrice()}
                                             </td>



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
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                              </div>
                         </c:forEach>
                         </tbody>
                    </table>
               </div>

               <form action="MainController">
                    <strong>Add More Marterial: </strong>
                    <select onchange="this.form.submit()" name="slMateriaID">
                         <option selected>Open this select menu</option>
<<<<<<< HEAD
                         <c:forEach var="dto" items="">
                              <option value="$"></option>
                         </c:forEach>
                         <input type="hidden" name="btAction" value="EditMaterial" />
                         <input type="hidden" name="txtCageID" value="" />
=======
                         <c:forEach var="dto" items="${materialnotuse}">
                              <option value="${dto.getMaterialID()}" >${dto.getName()}</option>
                         </c:forEach>
                         <input type="hidden" name="btAction" value="EditMaterial" />
                         <input type="hidden" name="txtCageID" value="${param.txtCageID}" />
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                    </select>
               </form>

               <c:if test="${not empty materialwilladd}">
<<<<<<< HEAD

=======
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                    <div class="material_form1">
                         <form action="MainController">
                              <table class="material_form">
                                   <h2><span>Add</span> Material</h2>
                                   <tr>
                                        <td>
                                             <label for="MaterialID_name">MaterialID :</label>
                                             <div class="input-container1">
<<<<<<< HEAD
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" 
                                                         value="${materialwilladd.getMaterialID()}" readonly>

=======
                                                  <input class="input-field" type="text" name="txtMaterialID" 
                                                         value="${materialwilladd.getMaterialID()}" readonly>
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Name">Name :</label>
                                             <div class="input-container1">
<<<<<<< HEAD
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" 
=======
                                                  <input class="input-field" type="text" name="txtName" 
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                                                         value="${materialwilladd.getName()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Origin_name">Origin :</label>
                                             <div class="input-container1">
<<<<<<< HEAD
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" 
                                                         value="${materialwilladd.getOrigin()}" readonly>

=======
                                                  <input class="input-field" type="text" name="txtOrigin" 
                                                         value="${materialwilladd.getOrigin()}" readonly>
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                   </tr>

                                   <tr>
                                        <td>
                                             <label for="Price_name">Price :</label>
                                             <div class="input-container1">
<<<<<<< HEAD
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" 
                                                         value="${materialwilladd.getPrice()}" readonly>

=======
                                                  <input class="input-field" type="text" name="txtPrice" 
                                                         value="${materialwilladd.getPrice()}" readonly>
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Unit_name">Unit :</label>
                                             <div class="input-container1">
<<<<<<< HEAD
                                                  <input class="input-field" type="text" name="txtNumberOfEmployee" 
=======
                                                  <input class="input-field" type="text" name="txtUnit" 
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                                                         value="${materialwilladd.getUnit()}" readonly>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>

                                        <td>
                                             <label for="Quantity_name">Quantity :</label>
                                             <div class="input-container1">
                                                  <input class="input-field" type="number" oninput="this.value = Math.abs(this.value)"
<<<<<<< HEAD
                                                         name="txtNumberOfEmployee" value="0" min="0" max="100">

                                     <span class="input-highlight"></span>
=======
                                                         name="txtQuantity" value="0" min="0" max="100">

                                                  <span class="input-highlight"></span>
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                                             </div>
                                        </td>
                                   </tr>
                              </table>
<<<<<<< HEAD
                              <button class="submit_button" type="submit">Submit</button>
=======
                                <input type="hidden" name="txtCageID" value="${param.txtCageID}"/>
                              <button class="submit_button" type="submit" name="btAction" value="AddMaterialToCage">Add</button>

>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
                         </form>
                    </div>
               </c:if>
               <div class="button_2">
<<<<<<< HEAD
                    
                    <a href="${DesignPage}"><button class="next_button"><i class="fas fa-arrow-right"></i></button></a>


=======
                    <a href="${DesignPage}"><button class="next_button"><i class="fas fa-arrow-right"></i></button></a>
>>>>>>> 38b102bc31c8e824cb6853399fa1c0d56ca036ea
               </div>
          </section>
     </body>
</html>