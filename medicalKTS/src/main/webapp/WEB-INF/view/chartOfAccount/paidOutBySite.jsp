<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banners Hallmark</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Paid in out summary</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %> 
                        

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped  " id="table-p"  >
                                    <thead>
                                        <tr>
                                           <th>TransDate</th>
                                           <th>Site</th>	
                                           <th>CategoryDesc</th>	
                                           <th>ReasonDesc</th>	
                                           <th>Receipt</th>
                                           <th>DM Approved</th>
                                           <th>EmployeeId</th>	
                                           <th>EmployeeName</th>	
                                           <th>RegNo</th>	
                                           <th>TranNo</th>	
                                           <th>LineNo</th>		
                                           <th>Amount</th>	
                                           		
                                           <th></th>
                                           <th></th>	
                                       </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="paidInOut" items="${paidInOut}">
											<tr>
												<form class="form-horizontals" method="post" id="task_form" name="user_form" onsubmit="saveForm()" action="${pageContext.request.contextPath}/paidInOut/updatePaidOut?id=${paidInOut.id}&site=${paidInOut.site}" encType="multipart/form-data" modelAttribute="paidSite">
													<td>${paidInOut.transDate}</td>
													<td>${paidInOut.site}</td>
													<td>${paidInOut.categoryDesc}</td>
													<td>${paidInOut.reasonDesc}</td>
													<td onclick="downloadFile(${paidInOut.paidInOutFileid})">${paidInOut.docName}</td>
													<td>
														<div class="action-buttons">
														
														   <c:if test="${paidInOut.dmApproved==0}">
														       <button onClick='updateApproval(${paidInOut.id},1)' type="submit" id="updateForm">
																<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-x" viewBox="0 0 16 16"> <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/> </svg>
	                                                         </button>
														   </c:if>
															
	                                                       <c:if test="${paidInOut.dmApproved==1}"> 
	                                                         <button onClick='updateApproval(${paidInOut.id},0)' type="submit" id="updateForm">
																<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="40" zoomAndPan="magnify" viewBox="0 0 30 30.000001" height="40" preserveAspectRatio="xMidYMid meet" version="1.0" fill="red"><defs><clipPath id="id1"><path d="M 2.328125 4.222656 L 27.734375 4.222656 L 27.734375 24.542969 L 2.328125 24.542969 Z M 2.328125 4.222656 " clip-rule="nonzero"/></clipPath></defs><g clip-path="url(#id1)"><path fill="green" d="M 27.5 7.53125 L 24.464844 4.542969 C 24.15625 4.238281 23.65625 4.238281 23.347656 4.542969 L 11.035156 16.667969 L 6.824219 12.523438 C 6.527344 12.230469 6 12.230469 5.703125 12.523438 L 2.640625 15.539062 C 2.332031 15.84375 2.332031 16.335938 2.640625 16.640625 L 10.445312 24.324219 C 10.59375 24.472656 10.796875 24.554688 11.007812 24.554688 C 11.214844 24.554688 11.417969 24.472656 11.566406 24.324219 L 27.5 8.632812 C 27.648438 8.488281 27.734375 8.289062 27.734375 8.082031 C 27.734375 7.875 27.648438 7.679688 27.5 7.53125 Z M 27.5 7.53125 " fill="green"/></g></svg> 
															 </button>
														   </c:if>	 
															 
														</div>
													</td>
													<td>${paidInOut.employeeId}</td>
													<td>${paidInOut.employeeName}</td>
													<td>${paidInOut.regNo}</td>
													<td>${paidInOut.tranNo}</td>
													<td>${paidInOut.lineNo}</td>
													<td>${paidInOut.amount}</td>
													<td class="td-actions">
						                                <div class="action-buttons">
						                                   <input type="file" name="files" value="null" class="" title="Edit">
						                                 </div>			                                
							                         </td>
													<td>
														<div class="action-buttons">
															<button type="submit" id="updateForm">
																<svg style="width: 30px;"
																	class="svg-inline--fa fa-save fa-w-14 fa-fw select-all"
																	focusable="false" data-prefix="fas" data-icon="save"
																	role="img" xmlns="http://www.w3.org/2000/svg"
																	viewBox="0 0 448 512" data-fa-i2svg="">
																	<path fill="blue"
																		d="M433.941 129.941l-83.882-83.882A48 48 0 0 0 316.118 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48V163.882a48 48 0 0 0-14.059-33.941zM224 416c-35.346 0-64-28.654-64-64 0-35.346 28.654-64 64-64s64 28.654 64 64c0 35.346-28.654 64-64 64zm96-304.52V212c0 6.627-5.373 12-12 12H76c-6.627 0-12-5.373-12-12V108c0-6.627 5.373-12 12-12h228.52c3.183 0 6.235 1.264 8.485 3.515l3.48 3.48A11.996 11.996 0 0 1 320 111.48z"></path></svg>
	
															</button>
														</div>
													</td>
													</form>                      
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
   		function downloadFile(x){
   			if (x!=null) {
   				var link = "${pageContext.request.contextPath}/paidInOut/downloadFile?id="+x;
				window.location = link;
			} 
   		}
   	</script>

</body>
</html>