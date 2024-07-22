<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Random"%>

<!DOCTYPE html>
<html>
<head>
	<title>JakTech</title>
</head>
<body>
	 <div id="main" class='layout-navbar'>
            <div id="main-content">



                <div class="page-heading">

                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Upload File ${param.message}</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                        </div>
                    </div>
                    
                    		
					<% System.out.println("JSP code running"); %>
     
				    <%
				        Random random = new Random();
				        System.out.println("Random: " + random.nextBoolean());
				    %>
							  
					<%  
						String name=request.getParameter("uname");  
						out.print(" ");  
					%>  
                                     
                    <section class="section blnk-db">
                       <form:form class="form-horizontals" method="post" id="uploadFiles" name="uploadFiles" onsubmit="saveForm()" action="${pageContext.request.contextPath}/SmsReport/importExcelValue" encType="multipart/form-data">
                            <%@ include file="../common/error-and-success-message.jsp" %> 

                            <div class="card tp-inpt">
                                <div class="card-body">

								<div class="row" id="row1">
									
									<div class="col-md-2 col-12 mt-4">
										<div class="form-group">
											<input type="file" name="file" required="true" />
										</div>
									</div>
								</div>


							</div>
                              </div>
                         
                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <button type="submit" class=" c-btn btn btn-primary me-3 mb-1" id="saveData">Upload</button>
                                    <a href="${pageContext.request.contextPath}/SmsReport/addExcelFile" class="c-btn btn btn-danger  mb-1">Cancel</a>
                               
                                </div>
                            </div>
                        </form:form>

                    </section>
                    

                </div>



                <footer>
                    <div class="footer clearfix mb-0 text-muted c-ftr">
                        <div class="float-start">
                            <p>2021 &copy; Jaktech</p>
                        </div>
                        <div class="float-end">
                            <p>Developed by <span class="text-danger"></span> <a
                                    href="#">Ermias Ashebr
                                    </a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
     
 
</body>
</html>