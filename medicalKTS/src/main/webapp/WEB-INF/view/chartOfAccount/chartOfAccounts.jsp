<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Banners Hallmark - Chart Of Accounts</title>
<style type="text/css">
	#table-p_wrapper .action-buttons {
	    display: flex;
	    align-items: center;
	}
</style>
</head>


<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">

			<div class="page-heading">
				<div class="page-title mb-5">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Chart of accounts</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Chart
										of accounts</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section blnk-db ">
					<%@ include file="../common/error-and-success-message.jsp" %>
					<div class="card">
						<div class="card-body">
							<div class="c-dflx">

								<div class="upld-bill-dlt">
								
								
								 <form class="form" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/chartOfAccount/uploadInBulk"  >
                                            <input type="file" id="real-file" hidden="hidden"  name="file" accept=".xls, .xlsx" />
                                            <button type="button" class="btn btn-info" id="custom-button">Choose a file</button>
                                            <span id="custom-text">No file chosen, yet.</span>
                                            <input type="submit" class="btn btn-warning upld-btn" value="Upload file" disabled>
                                        </form>
                                   <button id="syncFromBill" style="margin-left: .5rem!important;" type="button"  style="margin-left: 300px;" class="btn btn-danger">Delete All</button>
								</div>
								<a
									href="${pageContext.request.contextPath}/chartOfAccount/addChartOfAccount"
									class="btn btn-primary "> <i class="bi bi-graph-up "></i>
									New Chart of Accounts
								</a>

							</div>
						</div>
					</div>

                       <div class="card">
						<div class="card-body">
							<div class="c-dflx">

                                <fieldset class="form-group me-2">
                                            <select class="form-select" name="formal"  id="invoiceType" onchange="javascript:handleSelect(this)" required >
                                                <option value="${pageContext.request.contextPath}/chartOfAccount/chartOfAccounts" >All Chart of Accounts</option>
						                				
						                		<option value="${pageContext.request.contextPath}/chartOfAccount/chartOfAccountsIsActive/false"
																					<c:if test="${requestScope['javax.servlet.forward.request_uri'].indexOf('false') >= 0}"> selected = "selected" </c:if>
																					  >Deleted</option>
											    
											    <option value="${pageContext.request.contextPath}/chartOfAccount/chartOfAccountsIsActive/true"
																					<c:if test="${requestScope['javax.servlet.forward.request_uri'].indexOf('true') >= 0}"> selected = "selected" </c:if>
																					  >Active</option>
											</select>
                                        </fieldset> 
                          </div>
						</div>
						
					</div>
					<div class="card">
						<div class="card-body ">
							<div class="inv-data-tble">
								<table class="table table-striped " id="table-p">
									<thead>
										<tr>

											<th>Name</th>
										
											<th>Account Number</th>
											<th>Type</th>
											<th>Description</th>
										<!-- 	<th>Parent Name</th>
											<th>Parent Account Number</th> -->
											<!-- <th>Category1099</th> -->
												<th>Deleted?</th>
											<th>Created</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="chartOfAccount" items="${chartOfAccounts}">
											<tr>
											
												<td>${chartOfAccount.name}
												<c:if test="${not chartOfAccount.isSynchronized()}"> <span style="color:red;font-size: 25px;">*</span></c:if>
												</td>
												
												<td>${chartOfAccount.accountNumber}</td>
												<td>${chartOfAccount.type}</td>
												<td>${chartOfAccount.description}</td>
											<%-- 	<td>${chartOfAccount.parentName}</td>
												<td>${chartOfAccount.parentAccountNumber}</td> --%>
												<%-- <td>${chartOfAccount.category1099}</td> --%>	
												
												<td><c:choose>
												   	<c:when test="${ not chartOfAccount.isActive}">
												   	Deleted     
												    </c:when> 
												    <c:otherwise>
												    Active
												    </c:otherwise>
												    </c:choose></td>
											<td>${chartOfAccount.createdConvert}</td>

                                               <td class="td-actions">
                                                  <c:choose>
												  <c:when test="${not chartOfAccount.isActive}"> 
												  	<div class="action-buttons">
												  	 <a class="red"
															href="${pageContext.request.contextPath}/chartOfAccount/undeleteChartOfAccount/${chartOfAccount.id}"
															onclick="return confirm('Are you sure to Undelete?')"
															id="remove"> <span class="badge btn-warning">
<!-- 															<i class="bi bi-trash-fill"></i> -->
<!-- 															<i class="bi bi-lock-fill"></i> -->
																<img class="icon-image" src="${pageContext.request.contextPath}/resources/assets/images/un-delete.png">
															</span></a>
													</div>
												  </c:when> 
												    <c:otherwise>  
													<div class="action-buttons">
														<a class="" title="Edit"
															href="${pageContext.request.contextPath}/chartOfAccount/getChartOfAccount/${chartOfAccount.id}">
															<span class="badge bg-success"><i
																class="bi bi-pencil"></i></span>
														</a> <a class="red"
															href="${pageContext.request.contextPath}/chartOfAccount/deleteChartOfAccount/${chartOfAccount.id}"
															onclick="return confirm('Are you sure to delete?')"
															id="remove"> <span class="badge bg-danger"><i
																class="bi bi-trash-fill"></i></span></a>
												      <c:if test="${not chartOfAccount.isSynchronized()}">
															<a class="red"
																href="${pageContext.request.contextPath}/chartOfAccount/readChartOfAccount/${chartOfAccount.id}"
																onclick="return confirm('Are you sure to update?')"
																id="remove"> <span class="badge btn-info">
<!-- 																<i class="bi bi-bootstrap-reboot"></i> -->
<!-- 																<i class="bi bi-arrow-counterclockwise"></i> -->
																	<i class="bi bi-arrow-repeat"></i>
																</span></a>
														</c:if>
													</div>
												    </c:otherwise>
												</c:choose>
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
						<p>
							Developed by <span class="text-danger"><i
								class="bi bi-heart"></i></span> <a href="#">Suntek IT Solutions </a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
	<script	src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
	 
      <script>
	     	$('#syncFromBill').on('click', function(e){
	      if(confirm('Are you sure to delete all chart of accounts ?')){		
	   		document.getElementById("syncFromBill").disabled = true;
			window.location = "${pageContext.request.contextPath}/chartOfAccount/deleteChartOfAccountAll";	
	      }	
	   	});
	   
	   </script>
	    <script>
        const realFileBtn = document.getElementById("real-file");
        const customBtn = document.getElementById("custom-button");
        const customTxt = document.getElementById("custom-text");

        customBtn.addEventListener("click", function () {
            realFileBtn.click();
        });

        realFileBtn.addEventListener("change", function () {
            if (realFileBtn.value) {
                customTxt.innerHTML = realFileBtn.value.match(
                    /[\/\\]([\w\d\s\.\-\(\)]+)$/
                )[1];

                $('.upld-btn').removeAttr("disabled");


            } else {
                customTxt.innerHTML = "No file chosen, yet.";
                $('.upld-btn').Attr("disabled");
            }
        });
        
        function handleSelect(elm)
	    {
	       window.location = elm.value;
	    }
    </script>
	
	    
</body>
</html>