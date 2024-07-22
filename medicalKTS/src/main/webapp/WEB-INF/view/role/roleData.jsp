<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>User Roles</title>        
    </head>
    
	
    <body>
    
    	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>User Roles</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">User Roles
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %>  
                           <div class="card">
                            <div class="card-body  ">
                              <div class="inv-data-tble">
                                <table class="table table-striped " id="table-p"  >
                                    <thead>
                                       <tr>
											<th>User Role</th>
										</tr>
                                    </thead>
                                    <tbody>
                                   	
                                    <c:forEach var="role" items="${role}">
											<tr>											
											  <td>											  									  
													${role.name}
											  </td>										
											</tr>
										</c:forEach>	
                                    
                                    
                                       
                                    </tbody>
                                </table>
                            </div>
                             </div>

                        </div>
                    </section>
                </div>

            </div>
        </div>

    	
    
	

   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	  
</body>
</html>