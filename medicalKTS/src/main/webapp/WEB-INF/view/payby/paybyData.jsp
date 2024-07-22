<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banners Hallmark - All Pay By</title>        
    </head>
    
	
    <body>
       <div id="app">
    	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Pay By</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Pay By
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

                                        <a href="${pageContext.request.contextPath}/payby/addPayby" class="btn btn-primary " >  <i class="bi bi-credit-card-2-back "></i> New Pay By </a>
                                   
                                </div>
                            </div>  
                        </div>


                        <div class="card">
                            <div class="card-body ">
                             <div class="inv-data-tble">
                                <table class="table table-striped " id="table-p"  >
                                  <thead>
                                        <tr>
                                            
                                            <th class="pay-by-table">Pay by</th>                                                                                                                                
                                            <th >Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    
	                                    <c:forEach var="payby" items="${payby}">
											<tr>
												<td>${payby.paybyName}</td>
												<td class="td-actions">
					                                <div class="action-buttons">
					                                   <a  title="Edit" href="${pageContext.request.contextPath}/payby/getPayby/${payby.id}">
					                                   	<span class="badge bg-success"><i class="bi bi-pencil"></i></span></a>
					                                	<a href="${pageContext.request.contextPath}/payby/deletePayby/${payby.id}" id="remove">
					                                   	<span class="badge bg-danger"><i class="bi bi-trash-fill"></i></span></td></a>
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
         </div>

	
   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	   
  
	    
	
</body>
</html>