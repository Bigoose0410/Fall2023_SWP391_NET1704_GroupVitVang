<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <c:set var="errorADD" value="${requestScope.ADD_DESIGN_ERR}"></c:set>
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
                         <li><a href="MainController?btAction=Search">
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
                         <li ><a href="MainController?btAction=Production process">
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
               <h1>Design</h1>
               <h3>Cage: ${param.txtCageName}</h3>
               <div class="table-container">
                    <table>
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
                              <c:set var="errorUpdate" value="${requestScope.UPDATE_DESIGN_ERR}"></c:set>
                              <c:set var="errorUpdateInPhrase" value="${requestScope.UPDATE_DESIGN_ERR_IN_PHRASE}"></c:set>
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
                                                  <input placeholder="Time Process" class="input-field"
                                                         oninput="this.value = Math.abs(this.value)" type="number"
                                                         name="txtTimeProcess" value="${dto.getTimeProcess()}">
                                                  <span class="input-highlight"></span>
                                                  <c:if test="${not empty errorUpdate.getTimeProcessErr() and dto.getPhrase().equals(errorUpdateInPhrase)}">
                                                       <font color="red">
                                                       ${errorUpdate.getTimeProcessErr()}
                                                       </font>
                                                  </c:if>
                                             </div>
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Description" class="input-field" type="text"
                                                         name="txtDescription" value="${dto.getDescription()}">
                                                  <span class="input-highlight"></span>
                                                  <div class="error">
                                                       <c:if test="${not empty errorUpdate.getDescriptionLengthErr() and dto.getPhrase().equals(errorUpdateInPhrase)}">
                                                            <font color="red">
                                                            ${errorUpdate.getDescriptionLengthErr()}
                                                            </font>
                                                       </c:if>
                                                  </div>
                                             </div>
                                        </td>

                                        <td>
                                             <div class="input-container1">
                                                  <input placeholder="Employee Need" class="input-field" type="number"
                                                         name="txtNumberOfEmployee" value="${dto.getNumberOfEmployee()}"
                                                         oninput="this.value = Math.abs(this.value)">

                                                  <c:if test="${not empty errorUpdate.getEmployeeFormatErr() and dto.getPhrase().equals(errorUpdateInPhrase)}">
                                                       <font color="red">
                                                       ${errorUpdate.getEmployeeFormatErr()}
                                                       </font>
                                                  </c:if>
                                                  <span class="input-highlight"></span>
                                             </div>
                                        </td>
                                        <td class="update_button">
                                             <input type="hidden" name="txtCageID" value="${dto.getCageID()}" />
                                             <input type="hidden" name="txtCageName" value="${param.txtCageName}" />
                                             <button type="submit" value="updateDesign" name="btAction">
                                                  <i class="fa fa-pencil-square"></i>
                                             </button>
                                        </td>
                                   </tr>
                              </form>
                         </c:forEach>

                         </tbody>
                    </table>
               </div>

               <button class="custom-btn btn-1">Add Phrase</button>
               <c:if test="${not empty errorADD.getDuplicateIDErr()}">
                    <font color="red">
                    <h4>${errorADD.getDuplicateIDErr()}</h4>
                    </font>
               </c:if>
               <c:if test="${not empty errorADD.getTimeProcessErr()}">
                    <font color="red">
                    <h4>${errorADD.getTimeProcessErr()}</h4>
                    </font>
               </c:if>
               <c:if test="${not empty errorADD.getDescriptionLengthErr()}">
                    <font color="red">
                    <h4>${errorADD.getDescriptionLengthErr()}</h4>
                    </font>
               </c:if>
               <c:if test="${not empty errorADD.getEmployeeFormatErr()}">
                    <font color="red">
                    <h4>${errorADD.getEmployeeFormatErr()}</h4>
                    </font>
               </c:if>
               <div class="tablesorter-custom1" style="display: none;">
                    <form action="MainController">
                         <div class="step">
                              <div class="step-header">
                                   <h2>New Phrase</h2>
                              </div>

                              <div class="form-step">
                                   <label for="Phrase">Phrase</label>
                                   <div class="input-container">
                                        <input placeholder="Phrase" class="input-field" type="text" name="txtPhrase"
                                               value="${param.txtPhrase}">
                                        <span class="input-highlight"></span>
                                        <div class="error">

                                             <!-- xuat loi trung ID-->

                                        </div>
                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="Time">Time Process</label>
                                   <div class="input-container">
                                        <input placeholder="Time" class="input-field" type="number" name="txtTimeProcess" min="0"
                                               max="100" value="1" oninput="this.value = Math.abs(this.value)">
                                        <span class="input-highlight"></span>
                                        <!-- xuat loi time process-->

                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="Description">Description</label>
                                   <div class="input-container">
                                        <input placeholder="Description" class="input-field" type="text" name="txtDescription"
                                               value="${param.txtDescription}">
                                        <span class="input-highlight"></span>
                                        <!-- xuat loi Desscription-->

                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="username">Number Of Employee</label>
                                   <div class="input-container">
                                        <input placeholder="Employee" class="input-field" type="number" min="0" max="10"
                                               name="txtNumberOfEmployee" value="1" oninput="this.value = Math.abs(this.value)">
                                        <span class="input-highlight"></span>
                                        <!-- xuat loi Number of employee-->
                                   </div>
                              </div>

                              <div class="form-step">
                                   <label for="username">Note:</label>
                                   <div class="input-container">
                                        <!--                                        <input placeholder="Employee" class="input-field" type="number" readonly=""
                                                                                       name="txtCompletionCage" value="1" oninput="this.value = Math.abs(this.value)">-->
                                        <h5>"Time process" and "Number of employee" are for 1 cage</h5>
                                        <p>Check detail before submit</p>
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
                                   <input type="hidden" name="txtCageID" value="${CageID}" />
                                   <button class="create-button" type="submit" value="AddDesignProcess"
                                           name="btAction">Create</button>
                              </div>
                    </form>
               </div>
          </div>

          <div class="button_2">
               <a href="MainController?btAction=DetailProduct&txtCageID=${CageID}"><button class="next_button"><i
                              class="fas fa-arrow-right"></i></button></a>
          </div>
     </section>

     <script src="js/EditDesign.js"></script>

</html>

</body>
</html>