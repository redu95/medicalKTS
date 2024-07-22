<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banners Hallmark - ItemGroups</title>        
    </head>
    
	
    <body>
 <div id="main" class='layout-navbar'>
             <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Item Groups</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Item Groups
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %>
                        <div class="card">
                            <div class="card-body">
                                <div class="ig-dflx ">

                                    <!-- <div class="upld-bill-dlt">
                                        <a href="" class="btn btn-warning">Upload To Bill.com</a>
                                        <a href=""class="btn btn-danger">Delete</a>
                                    </div> -->
                                        

                                        <a href="${pageContext.request.contextPath}/itemGroup/addItemGroup" class="btn btn-primary " >  <i class="bi bi-box "></i> New Item Groups </a>
                                   
                                </div>
                            </div>  
                        </div>

                           <div class="card">
                            <div class="card-body  ">
                               <div class="inv-data-tble">
                                <table class="table table-striped " id="table-p"  >
                                    <thead>
                                        <tr>
                                            
                                            <th>Name</th>
                                            <th>Item Group</th>                                           
                                            <th>Item Group Repl</th>
                                            <th>Item Group Spec</th>                                                                                      
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="itemGroup" items="${itemGroups}">
											<tr>
												<td>${itemGroup.name}</td>
												<td>${itemGroup.itemGroup}</td>
												<td>${itemGroup.itemGroupRepl}</td>
												<td>${itemGroup.itemGroupSpec}</td>
												<td class="td-actions">
					                                <div class="action-buttons">
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/itemGroup/getItemGroup/${itemGroup.id}">
					                                   	<span class="badge bg-success"><i class="bi bi-pencil"></i></span></a>&nbsp;
					                                	<a class="red" href="${pageContext.request.contextPath}/itemGroup/deleteItemGroup/${itemGroup.id}" id="remove">
					                                   	<span class="badge bg-danger"><i class="bi bi-trash-fill"></i></span></a>&nbsp;
					                                 </div>			                                
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

                <footer>
                    <div class="footer clearfix mb-0 text-muted c-ftr">
                        <div class="float-start">
                            <p>2021 &copy; Banners Hallmark</p>
                        </div>
                        <div class="float-end">
                            <p>Developed by <span class="text-danger"><i class="bi bi-heart"></i></span>  <a
                                    href="#">Suntek IT Solutions </a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
 <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	    
	
	</body>
</html>