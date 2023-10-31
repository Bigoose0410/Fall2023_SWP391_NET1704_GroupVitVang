<%-- 
    Document   : CreateProcess
    Created on : Oct 17, 2023, 10:58:50 AM
    Author     : Nguyen Ba Tung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/CreateProcess.css">
          <!--<link rel="stylesheet" href="css/HomePage.css">-->

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <script src="Material.js"></script>
          <title>BCMS</title>
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
          <c:set var="error" value="${requestScope.UPDATE_DESIGN_ERR}"></c:set>
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
                         <li><a href="MainController?btAction=Customers">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Customers</span>
                              </a></li>
                         <li><a href="${productionList}">
                                   <i class="uil uil-grin"></i>
                                   <span class="link-name">Production</span>
                              </a></li>
                         <li><a href="MainController?btAction=Production process">
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
          <h1>Design</h1>
          <h3>Cage: ${param.txtCageName}</h3>
          <section class="dashboard">
               <div id="process-form">
                    <table class="tablesorter-custom">
                         <thead>
                              <tr>
                                   <th>No.</th>
                                   <th>Phrase</th>
                                   <th>Time Process</th>
                                   <th>Description</th>
                                   <th>Employee Need</th>
                                   <th>Modify</th>
                              </tr>
                         </thead>

                         <tbody>
                              <c:set var="countPhare" value=""></c:set>
                              <c:forEach var="dto" items="${Design}" varStatus="counter">
                              <form action="MainController">
                                   <tr>
                                        <td>
                                             ${counter.count}
                                             <c:set var="countPhare" value="${counter.count}"></c:set>
                                             </td>

                                             <td>
                                             ${dto.getPhrase()}
                                             <input type="hidden" name="txtPhrase" value="${dto.getPhrase()}" />
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Time Process" class="input-field" oninput="this.value = Math.abs(this.value)"
                                                         type="number" name="txtTimeProcess" value="${dto.getTimeProcess()}">
                                                  <span class="input-highlight"></span>
                                             </div>                
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Description" class="input-field" type="text"
                                                         name="txtDescription" value="${dto.getDescription()}">
                                                  <span class="input-highlight"></span>
                                             </div>         
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Employee Need" class="input-field" type="number"
                                                         name="txtNumberOfEmployee" value="${dto.getNumberOfEmployee()}" oninput="this.value = Math.abs(this.value)">
                                                  <span class="input-highlight"></span>
                                             </div>               
                                        </td>

                                        <td class="update_button">
                                             <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                             <button type="submit" value="updateDesign" name="btAction">
                                                  <i class="fa fa-pencil-square"></i>
                                             </button>
                                        </td>
                                   </tr>
                              </form>
                         </c:forEach>
                              <c:if test="${not empty error.getDescriptionLengthErr()}">
                                   <font color="red">
                                   ${error.getDescriptionLengthErr()}
                                   </font>     
                              </c:if>
                         </tbody>
                    </table>
          </section>
          <button class="custom-btn btn-1">New Step</button>
          <c:if test="${not empty error.getDuplicateIDErr()}">
               <font color="red">
               ${error.getDuplicateIDErr()}
               </font>     
          </c:if>
          <section class="dashboard1" style="display: none;">
               <div id="process-form">
                    <table class="tablesorter-custom1">
                         <thead>
                         </thead>
                         <tbody>
                         <form action="MainController">
                              <tr>

                                   <td>
                                        <div class="input-container">
                                             <input name="txtPhrase" value="${param.txtPhrase}" placeholder="Phrase" class="input-field" type="text">
                                             <label for="input-field" class="input-label">Phrase</label>
                                             <span class="input-highlight"></span>
                                        </div>          
                                   </td>

                                   <td>
                                        <div class="input-container">
                                             <input name="txtTimeProcess" value="1"
                                                    placeholder="Time Process" class="input-field" 
                                                    type="number" oninput="this.value = Math.abs(this.value)">
                                             <label for="input-field" class="input-label">Time Process</label>
                                             <span class="input-highlight"></span>
                                        </div>              
                                   </td>

                                   <td>
                                        <div class="input-container">
                                             <input name="txtDescription" value="${param.txtDescription}" 
                                                    placeholder="Description" class="input-field" 
                                                    type="text">
                                             <label for="input-field" class="input-label">Description</label>
                                             <span class="input-highlight"></span>
                                        </div>                
                                   </td>

                                   <td>
                                        <div class="input-container">
                                             <input name="txtNumberOfEmployee" value="1"
                                                    placeholder="NumberOfEmployee" class="input-field" 
                                                    type="number" oninput="this.value = Math.abs(this.value)">
                                             <label for="input-field" class="input-label">Employee Need</label>
                                             <span class="input-highlight"></span>
                                        </div>            
                                   </td>

                                   <td>
                                        <div class="input-container">
                                             <input name="txtCompletionCage" value="1"
                                                    placeholder="CompletionCage" class="input-field" 
                                                    type="number" oninput="this.value = Math.abs(this.value)">
                                             <label for="input-field" class="input-label">CompletionCage</label>
                                             <span class="input-highlight"></span>
                                        </div>          
                                   </td>

                                   <td>
                                        <input type="hidden" name="txtCageID" value="${CageID}"  />
                                        <div class="plus_button">
                                             <button type="submit" value="AddDesignProcess" name="btAction"><i class="fa fa-plus"></i></button>
                                        </div>
                                   </td>

                              </tr>
                         </form>
                         </tbody>

                    </table>
          </section>
          <script src="js/CreateProcess.js"></script>
     </body>

</html>

