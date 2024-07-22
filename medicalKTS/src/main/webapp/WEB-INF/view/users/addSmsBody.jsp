<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
							<h3>Message content</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
					</div>
				</div>





				<section class="section blnk-db">
					<%@ include file="../common/error-and-success-message.jsp"%>
					<c:if test="${not empty messageFinal}">

						<div class="card">
							<div class="card-body  ">
								<div class="inv-data-tble">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Message</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="i" begin="0" end="5">
												<c:if test="${not empty messageFinal[i]}">
													<tr>
														<td>To ${phoneValid[i]}: ${messageFinal[i]}</td>
													</tr>
												</c:if>
												
											</c:forEach>
										</tbody>
									</table>
								</div>
								
                                <div class="col-12 d-flex justify-content-center">
                                    <a href="#" class=" c-btn btn btn-primary me-3 mb-1" >Send</a>
                                    <a href="${pageContext.request.contextPath}/SmsReport/addExcelFile" class="c-btn btn btn-danger  mb-1">Cancel</a>
                               
                                </div>
                            </div>
							</div>

						</div>

					</c:if>
					<c:if test="${empty messageFinal}">

						<div class="row">
							<div class="col-6">
								<form:form class="form-horizontals" method="post" id="user_form"
									onsubmit="saveForm()" name="user_form"
									action="sendSmsMessageValue" modelAttribute="smsModel">


									<div class="card tp-inpt">
										<div class="card-body">

											<div class="row" id="row1">
												<div class="col-md-8 col-12">
													<div class="form-group">
														<label for="title">Title</label>
														<form:input type="text" maxlength="50" name="title"
															id="title" path="title" class="form-control"
															placeholder="Enter Message Title " value=""
															required="true" />
													</div>
												</div>
											</div>


											<div class="row" id="row2">
												<div class="col-md-8 col-12">
													<div class="form-group">
														<label for="message">Message</label>
														<div class="mb-3 mt-1">
															<c:forEach var="excelVals" items="${excelVals}">
																<a onclick="changeTxt('_*${excelVals}')"
																	class="border border-1 shadow rounded me-3 ms-1 rounded px-2"
																	style="color: gray; letter-spacing: 1px">
																	${excelVals} </a>
															</c:forEach>
														</div>
														<form:textarea type="textArea" rows="3" maxlength="250"
															name="message" id="message" path="message"
															class="form-control" placeholder="Enter Message Content"
															value="" />
													</div>
												</div>

											</div>

										</div>


										<div class="row">
											<div class="col-12 d-flex justify-content-center">
												<button type="submit"
													class=" c-btn btn btn-primary me-3 mb-1" id="saveData">Continue</button>
												<a href="#" class="c-btn btn btn-danger  mb-1">Cancel</a>


											</div>
										</div>
									</div>
								</form:form>
							</div>
							<div class="col-6">
								<div class="card">
									<div class="card-body  ">
										<div class="inv-data-tble">
											<table class="table table-striped" id="table-p">
												<thead>
													<tr>
														<th>Phone Number</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach var="phoneValid" items="${phoneValid}">
														<tr>
															<td>${phoneValid}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>

								</div>
							</div>
						</div>

					</c:if>



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

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
	$(document).ready(function () {
		$.ajax({
			url : "${pageContext.request.contextPath}/SmsReport/importExcel",
			type : "POST",
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				alert("Something went wrong, Please try again after sometime");
			}
		});
	}
	</script>

	<script>
		function changeText(){ 
		  document.getElementById('message').value += "This text is appended.";
		}
		 
		function changeTxt(a){
			var target = document.getElementById("message")
			if (target.setRangeText) {
			    //if setRangeText function is supported by current browser
			    target.setRangeText(a)
			} else {
			    target.focus()
			    document.execCommand('insertText', false /*no UI*/, data);
			}
		}
		
	</script>









</body>
</html>