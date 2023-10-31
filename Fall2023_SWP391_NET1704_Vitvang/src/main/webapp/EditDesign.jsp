<%-- 
    Document   : EditDesign
    Created on : Oct 20, 2023, 8:50:39 AM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/EditDesign.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <title>EditDesign</title>
     </head>

     <body>
     <c:url var="logout_query" value="MainController">
          <c:param name="cookiekey" value="" />
          <c:param value="Log Out" name="btAction" />
     </c:url>
     <c:url var="productionList" value="MainController">
          <c:param value="SearchCage" name="btAction" />
     </c:url>
     <c:set var="CageID" value="${param.txtCageID}"></c:set>
     <c:set var="Design" value="${requestScope.DESIGN_PROCESS}"></c:set>
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
          <h1>Processing</h1>
          <div class="table-container">
               <table>
                    <thead>
                         <tr>
                              <th>No.</th>
                              <th>ProcessID</th>
                              <th>ProcessName</th>
                              <th>Quantity</th>
                              <th>Employee</th>
                              <th>Status</th>
                              <th>Modify</th>
                         </tr>
                    </thead>

                    <tbody>
                         <tr>
                              <td>
                    <c:set var="countPhare" value=""></c:set>
                    </td>

                    <td>
                         <input type="hidden" name="txtProcessID" value="" />
                    </td>

                    <td>
                         <input type="hidden" name="txtProcessName" value="" />
                    </td>

                    <td>
                         <div class="input-container1">
                              <input placeholder="Quantity" class="input-field" type="number" min="0" max="100"
                                     name="txtNumberOfEmployee" value="">
                              <span class="input-highlight"></span>
                         </div>
                    </td>

                    <td>
                         <div class="input-container1">
                              <input placeholder="Employee" class="input-field" type="number" min="0" max="10"
                                     name="txtNumberOfEmployee" value="">
                              <span class="input-highlight"></span>
                         </div>
                    </td>

                    <td>
                         <div class="input-container2">
                              <select class="input-field" name="txtStatus">
                                   <option value="inactive">Processing</option>
                                   <option value="inactive">Not Yet</option>
                                   <option value="inactive">Done</option>
                              </select>
                              <span class="input-highlight"></span>
                         </div>
                    </td>

                    <td class="update_button">
                         <button type="submit" value="updateDesign" name="btAction">
                              <i class="fa fa-pencil-square"></i>
                         </button>
                         <!--<button type="submit" value="DeleteDesign" name="btAction">
                                                Delete
                                           </button>-->
                    </td>
                    </tr>
                    </tbody>
               </table>
          </div>

          <button class="custom-btn btn-1">New Step</button>

          <div class="tablesorter-custom1" style="display: none;">
               <div class="step">
                    <div class="step-header">
                         <h2>+ New Step</h2>
                    </div>

                    <div class="form-step">
                         <label for="username">ProcessID</label>
                         <div class="input-container">
                              <input placeholder="ProcessID" class="input-field" type="text" name="txtProcessID" value="">
                              <span class="input-highlight"></span>
                         </div>
                    </div>

                    <div class="form-step">
                         <label for="username">ProcessName</label>
                         <div class="input-container">
                              <input placeholder="Name" class="input-field" type="text" name="txtName" value="">
                              <span class="input-highlight"></span>
                         </div>
                    </div>

                    <div class="form-step">
                         <label for="username">Quantity</label>
                         <div class="input-container">
                              <input placeholder="Quantity" class="input-field" type="number" min="0" max="100"
                                     name="txtQuantity" value="">
                              <span class="input-highlight"></span>
                         </div>
                    </div>

                    <div class="form-step">
                         <label for="username">NumberOfEmployee</label>
                         <div class="input-container">
                              <input placeholder="Employee" class="input-field" type="number" min="0" max="10"
                                     name="txtNumberOfEmployee" value="">
                              <span class="input-highlight"></span>
                         </div>
                    </div>

                    <div class="form-step">
                         <label for="status">Status</label>
                         <div class="input-container">
                              <select class="input-field" name="txtStatus">
                                   <option value="inactive">Not Yet</option>
                              </select>
                              <span class="input-highlight"></span>
                         </div>
                    </div>

                    <div class="form-step">

                    </div>

                    <div class="form-step">

                    </div>

                    <div class="form-step">

                    </div>


                    <div class="form-step1">
                         <button class="create-button">Create</button>
                    </div>
               </div>
          </div>
          <div class="button_2">
               <button class="done_button">Done</button>
          </div>
     </section>

     <script src="js/EditDesign.js"></script>

</body>

</html>
