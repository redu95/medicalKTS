<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banners Hallmark - Services</title>       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Services</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Services
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %> 
                        
                        <div id="stattt">
                        </div>
                        
                        <%-- <div class="card">
                            <div class="card-body">
                                <div class="ig-dflx ">

                                        <a href="${pageContext.request.contextPath}/users/addUsers" class="btn btn-primary " >  <i class="bi bi-credit-card-2-back "></i> New User</a>
                                   
                                </div>
                            </div>  
                        </div> --%>

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped  " id="table-p"  >
                                    <thead>
                                        <tr>
                                           <th>Service Name</th>		
										   <th style="text-align:center; width:10%;">Action</th>		
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="service" items="${services}">
											<tr>
												<td>${service.name}</td>
												<c:if test="${service.status == 'EXECUTED'}">
													<td style="text-align:center;">
														<button type="button" id="btn${service.id}" onclick="myFunction(this)" class="btn btn-primary">Execute</button>
													</td>
												</c:if>
												<c:if test="${service.status == 'EXECUTING'}">
													<td style="text-align:center;">
														<button class="btn btn-primary" type="button" id="btn${service.id}" disabled>
														  <span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"> </span>
														  Executing...
														</button>
													</td>
												</c:if>
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
   	<script>
	   	
	   	function myFunction(crntObj) {
	   	   	var btnId = crntObj.id;
	   	 	crntObj.closest('td').innerHTML = '<button class="btn btn-primary" type="button" id='+btnId+' disabled><span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Executing...</button>';
	   	    
		   	 $.ajax({
				url : "${pageContext.request.contextPath}/microservice/execute/1",
				type : "POST",
				success : function(response) {
					if (response.result == "Success") {
						document.getElementById("stattt").innerHTML='<div class="eror-msg"><div class="card"><div class="card-body success-msg"><p class="">Service Executued Successfully.</p><a onClick="clearx();" class="delete-msg btn btn-light">X</a></div></div></div>';
						document.getElementById(btnId).closest('td').innerHTML = '<button type="button" id='+btnId+' onclick="myFunction(this)" class="btn btn-primary">Execute</button>';
					}else if(response.result == "AlreadyExecuting"){
						document.getElementById("stattt").innerHTML='<div class="eror-msg"><div class="card"><div class="card-body error-msg"><p class="text-danger">Someone else is executing the service. Please wait until the service execution completes.</p><a onClick="clearx();" class="delete-msg btn btn-light">X</a></div></div></div>';
						document.getElementById(btnId).closest('td').innerHTML = '<button class="btn btn-primary" type="button" id='+btnId+' disabled><span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Executing...</button>';
					}else if(response.result == "PERMISSION_DENIED"){
						document.getElementById(btnId).closest('td').innerHTML = '<button type="button" id='+btnId+' onclick="myFunction(this)" class="btn btn-primary">Execute</button>';
						document.getElementById("stattt").innerHTML='<div class="eror-msg"><div class="card"><div class="card-body error-msg"><p class="text-danger">You do not have permission for this action.</p><a onClick="clearx();" class="delete-msg btn btn-light">X</a></div></div></div>';
					}else if (response.result == "ERROR") {
						document.getElementById(btnId).closest('td').innerHTML = '<button type="button" id='+btnId+' onclick="myFunction(this)" class="btn btn-primary">Execute</button>';
						alert("Something went wrong, Please try again after sometime");
					}
				}
			});
	   	};
	   	
	   	function clearx(){
			document.getElementById("stattt").innerHTML="";
		}
	   	
   	</script>

</body>
</html>