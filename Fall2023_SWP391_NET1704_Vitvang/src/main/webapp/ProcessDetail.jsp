<%-- 
    Document   : processs
    Created on : Oct 7, 2023, 11:32:39 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">

          <!----======== CSS ======== -->
          <link rel="stylesheet" href="css/ProcessDetail1.css">

          <!----===== Iconscout CSS ===== -->
          <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <!--<script src="index.js"></script>-->

          <title>Production Process</title>
     </head>

     <body>
          <nav>

               <div class="logo-name"style="display: block;">

                    <div class="logo-image">
                         <a href="HomePage.html"><img src="img/OIP.jpg" alt=""></a>
                         <span class="logo_name">${sessionScope.USER.getName()}</span>
                    </div>
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
          <section class="dashboard1">
               <div id="processing-form">
                    <!--Processing-->
                    <!--<h1>Processing</h1>-->

                    <c:set var="result" value="${requestScope.PROCESS_RESULT}"></c:set>
                    <c:set var="processID" value="${requestScope.HIGHLIGHT}"></c:set>
                         <section class="dashboard">
                              <header>
                                   <h1>Process Detail<i class="fas fa-cogs"></i></h1>
                              </header>
                         <c:if test="${not empty result}">
                              <div class="infomation_form">
                                   <div class="form_row">
                                        <i class="fa fa-user"></i>
                                        <label for="field1">Customer: </label>
                                        <a href="MainController?btAction=Customers"><i>${result[1].getUserName()}</i></a>   

                                        <i class="fa fa-shopping-cart"></i>
                                        <label for="field2">OrderID: </label>
                                        <i>${result[1].getOrderID()}</i>

                                        <i class="fa fa-cube"></i>
                                        <label for="field3">Cage Name: </label>
                                        <i>${result[1].getCageName()}</i>
                                   </div>
                              </div>

                              <!--Processing-->
                              <div class="process-wrapper">
                                   <div id="progress-bar-container">
                                        <c:set var="perFinish" value="0"></c:set>
                                             <ul>
                                             <c:forEach var="dto" items="${result}" varStatus="counter">
                                                  <li class="step ${dto.getProcessID()} active">
                                                       <div class="step-inner">
                                                            ${dto.getProcessName()}
                                                            <c:set var="perFinish"
                                                                   value="${perFinish + ( 100/result.size() * (dto.getCompletedQuantity() / dto.getQuantity()))}">
                                                            </c:set>
                                                       </div>
                                                  </li>
                                             </c:forEach>
                                        </ul>
                                        <div id="line">
                                             <div id="line-progress" style="width: ${perFinish}%; color: blue"></div>
                                        </div>
                                   </div>

                                   <div id="progress-content-section">

                                        <c:forEach var="dto" items="${result}" varStatus="counter">
                                             <input type="hidden" name="LastStep" 
                                                    <c:if test="${counter.count == result.size()}">
                                                         value="true";
                                                    </c:if> />
                                             <div class="section-content discovery active"  
                                                  <c:if test="${!dto.getProcessID().equals(processID)}"> 
                                                       style="opacity: 0.2"</c:if>
                                                       >

                                                       <div class="section-content discovery active">
                                                            <table id="myTable"
                                                                   class="table table-bordered table-striped table-hover table-sm mt-4">
                                                                 <thead>
                                                                      <tr>

                                                                           <th>Process Name</th>
                                                                           <th>Description</th>
                                                                           <th class="nosort">Update</th>
                                                                           <th class="nosort">Status</th>
                                                                      </tr>
                                                                 </thead>
                                                                 <tbody>
                                                                 <form action="MainController">
                                                                      <input type="hidden" name="LastStep" <c:if
                                                                             test="${counter.count == result.size()}">
                                                                             value="true";
                                                                        </c:if> />
                                                                 <input type="hidden" name="txtOrderID" value="${dto.getOrderID()}" />
                                                                 <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                                                 <input type="hidden" name="txtProcessID" value="${dto.getProcessID()}" />
                                                                 <tr data-ng-repeat="pdiskmovie in people| filter: table">
                                                                      <td>${dto.getProcessName()}</td>

                                                                      <td width="25%" class="description"> <!-- Placeholder for details -->
                                                                 <li><strong>Start Date:</strong> ${dto.getStartDate()}</li>
                                                                 <li><strong>End Date:</strong> ${dto.getEndDate()}</li>
                                                                 <li>
                                                                      <strong>Completed :  </strong> 
                                                                      ${dto.getCompletedQuantity()} \ ${dto.getQuantity()}
                                                                 </li>
                                                                 <li>
                                                                      <strong>Number Employee</strong> 
                                                                      ${dto.getNumberOfEmployee()}
                                                                 </li>
                                                                 </td>
                                                                 <td>
                                                                      <strong>Add More Completed:</strong>
                                                                      <div class="quantity">
                                                                           <input placeholder="Quantity" class="input-field" type="number" min="0"
                                                                                  name="txtCompletedAdd" value="0" max="${dto.getQuantity() - dto.getCompletedQuantity()}">
                                                                           <input type="hidden" name="txtTotalQuantity" value="${dto.getQuantity()}" />
                                                                           <input type="hidden" name="txtquantityCompleted" value="${dto.getCompletedQuantity()}" />
                                                                           <div class="tick_button">
                                                                                <button  type="submit" value="UpdateStatusProcess" name="btAction"
                                                                                         <c:if test="${!dto.getProcessID().equals(processID)}">
                                                                                              disabled style="opacity: 0.2";
                                                                                         </c:if>>
                                                                                     <i class="fa fa-check-square"></i></button>
                                                                           </div>
                                                                      </div>
                                                                      <strong>Number of Employees:</strong>
                                                                      <div class="employee" >
                                                                           <input placeholder="Employee" class="input-field" type="number" 
                                                                                  name="txtNumberOfEmployee" min="0" max="10" value="${dto.getNumberOfEmployee()}">
                                                                           <div class="tick_button">
                                                                                <button type="submit" value="UpdateEmployee"
                                                                                        <c:if test="${!dto.getProcessID().equals(processID)}">
                                                                                             disabled ;
                                                                                             style="opacity: 0.2";
                                                                                        </c:if>
                                                                                        name="btAction"><i class="fa fa-check-square"></i></button>
                                                                           </div>
                                                                      </div>
                                                                 </td>
                                                                 <td class="process_button">
                                                                      <div class="input-container">
                                                                           <select class="input-field" name="txtStatus">
                                                                                <option selected="selected">${dto.getStatus()}</option>

                                                                           </select>
                                                                           <span class="input-highlight"></span>
                                                                      </div>
                                                                 </td>
                                                                 </tr>
                                                            </form>
                                                            </tbody>
                                                       </table>
                                                       <div class="mb-4" data-pagination="" data-num-pages="numPages()" data-current-page="currentPage"
                                                            data-max-size="maxSize" data-boundary-links="true">
                                                       </div>
                                                  </div>
                                             </div>
                                        </c:forEach>
                                   </div>
                              </c:if>
                              <c:if test="${empty result}">
                                   <p>Yours order is not in processing!!!</p>
                              </c:if>
                         </div>
                    </section>
                    <script src="ProcessDetail.js"></script>
               </div>
          </section>
     </body>
</html>
