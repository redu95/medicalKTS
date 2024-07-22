<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Edit Department</title>
	<style>
		::-webkit-input-placeholder {
		   font-weight: 100;
		   font-style: italic;
		}
		
		:-moz-placeholder { /* Firefox 18- */
		   font-weight: 100;
		   font-style: italic;
		}
		
		::-moz-placeholder {  /* Firefox 19+ */
		   font-weight: 100;
		   font-style: italic;
		}
		
		:-ms-input-placeholder {  
		   font-weight: 100;
		   font-style: italic;
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
							<h3>Edit Department</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/Institute/departmentsData">
											Department</a></li>
									<li class="breadcrumb-item active" aria-current="page">Edit
										Department</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" method="post" id="user_form"
						onsubmit="saveForm()" name="user_form" action="${pageContext.request.contextPath}/Institute/addDepartmentData"
						modelAttribute="department">
						<form:input type="hidden" path="id" />
						<form:input type="hidden" path="instituteId" />
						<form:input type="hidden" path="isActive" />
						<form:input type="hidden" path="stuffNumber" />
						<form:input type="hidden" path="registeredServices" />
						
						<%@ include file="../common/error-and-success-message.jsp"%>

						<div class="card tp-inpt">
							<div class="card-body">
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="firstname">Department Name</label>
											<form:input type="text" maxlength="50" name="departmentName"
												id="departmentName" path="departmentName" class="form-control"
												placeholder="Enter Dept Name " value="" required="true" />
										</div>
									</div>
									
								</div>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="lastname">Description</label>
											<form:textarea type="text" name="description" rows="3"
												id="description" path="description" class="form-control"
												placeholder="Add Description" value="" required="true" />
										</div>
									</div>
									<div class="col-4">
										<fieldset class="form-group">
											<label for="departmentHead" class="form-label">Department head</label>
											<form:select class="form-select dropdown-group" name="departmentHead" id="departmentHead" path="departmentHead" style="width:100%;"  value="">
												<form:option value="">-- Select Department Head --</form:option>
												<c:forEach items="${users}" var="users">
													<form:option value="${users.firstname}">${users.firstname}</form:option>
												</c:forEach>
												</form:select>
										</fieldset>
									</div>
								</div>


								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="addressLine1">Extra Note</label>
											<form:input type="text" maxlength="250" name="extraNote"
												id="extraNote" path="extraNote" class="form-control"
												placeholder="Extra Note" value="" />
										</div>
									</div>
								</div>
								 <div class="card">
		                            <div class="inv-data-tble">
		                                <table class="table table-striped" id="itemTable">
		                                    <thead>
		                                        <tr style="background-color: #D9DFF2;">
		                                            <th>ServiceName</th>
		                                            <th>Description</th>		
													<th>Department</th>
													<th>Type</th>
													<th>Price</th>
		                                        </tr>
		                                    </thead>
		                                </table>
		                            </div>
		                            </div>
									<nav aria-label="Page">
											<ul class="pagination justify-content-center"
												style="align-content: center;">
												<li class="page-item"><a class="page-link"
													onclick="handlePage(8)" href="#" aria-label="Previous"> <span
														aria-hidden="true">&laquo;</span> <span class="sr-only"></span>
												</a></li>
												<li class="page-item"><a class="page-link"
													onclick="handlePage(6)" href="#" aria-label="Previous"> <span
														aria-hidden="true">&lsaquo;</span> <span class="sr-only"></span>
												</a></li>
												<li id="l2" class="page-item active"><a class="page-link"
													id="p2" onclick="handlePage(2)" href="#">1</a></li>
												<li id="l3" class="page-item"><a class="page-link"
													id="p3" onclick="handlePage(3)" href="#">2</a></li>
												<li id="l1" class="page-item"><a class="page-link"
													id="p1" onclick="handlePage(1)" href="#">3</a></li>
		
												<li id="l4" class="page-item"><a class="page-link"
													id="p4" onclick="handlePage(4)" href="#">4</a></li>
												<li id="l5" class="page-item"><a class="page-link"
													id="p5" onclick="handlePage(5)" href="#">5</a></li>
		
												<li class="page-item"><a class="page-link"
													onclick="handlePage(7)" href="#" aria-label="Next"> <span
														aria-hidden="true">&rsaquo;</span> <span class="sr-only"></span>
												</a></li>
												<li id="l9" class="page-item"><a class="page-link"
													id="p9" data-initial-value="1" onclick="handlePage(9)"
													href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														<span class="sr-only"></span>
												</a></li>
											</ul>
										</nav>
		                        </div>
						</div>


						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<a href="${pageContext.request.contextPath}/Institute/departmentsData"
									class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;">Cancel</a>
								<button type="submit" class=" c-btn btn btn-primary"
									id="saveData">Save</button>

							</div>
						</div>
					</form:form>

					

				</section>

			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}

		var aoColumns = [{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.serviceName;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.serviceDescription;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.departmentName;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.servictType;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.price;
				return '<div class=\"form-check-Data\">'+status+' ETB</div>';
			}
		}];
		
		$(document).ready(function(){
			$('.datetimepick').hide();
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/sendServiceData?dept=${department.departmentName}',
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.medicServices,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						"processing": true,
						info:           false,
					    paging:         false,
					    searching: 		false,
						language: {
								processing: "<div class='loader'></div>"
							}
					    
					} );
					$('#p1').text(response.page1);
					$('#p2').text(response.page2);
					$('#p3').text(response.page3);
					$('#p4').text(response.page4);
					$('#p5').text(response.page5);
					$('#p9').attr("data-initial-value",response.countItem)
				}
			});
			
		});
	   	
		function handlePage(x){
			if(x===1){
				var pagenum = $('#p1').text();
			}
			if(x===2){
				var pagenum = $('#p2').text();
			}
			if(x===3){
				var pagenum = $('#p3').text();
			}
			if(x===4){
				var pagenum = $('#p4').text();
			}
			if(x===5){
				var pagenum = $('#p5').text();
			}
			if(x===6){
				var pagenum = 1;
				$('.page-item').each(function() {
					if($(this).hasClass("active")){
						pagenum=$(this).after().text();
						if(pagenum === '1'){
							
						} else {
							pagenum = Number(pagenum) - 1;
						}
					}
		   	    });
			}
			if(x===7){
				var pagenum = 1;
				$('.page-item').each(function() {
					if($(this).hasClass("active")){
						pagenum=$(this).after().text();
						pagenum = Number(pagenum) + 1;
					}
		   	    });
			}
			if(x===8){
				var pagenum = 1;
			}
			if(x===9){
				var pagenum = $('#p9').attr("data-initial-value");
			}
			
			if(pagenum==="-"){
				return;
			}
			
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
				
				}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/sendServiceData',
				data: {
					page: pagenum,
				},
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.medicServices,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						"processing": true,
						info:           false,
					    paging:         false,
					    searching: 		false,
						language: {
								processing: "<div class='loader'></div>"
							}
					    
					} );
					$('#p1').text(response.page1);
					$('#p2').text(response.page2);
					$('#p3').text(response.page3);
					$('#p4').text(response.page4);
					$('#p5').text(response.page5);
					$('#p9').attr("data-initial-value",response.countItem)

					if(response.page===1){
						 $("#l2").addClass("active");
						 $("#l1,#l3,#l4,#l5").removeClass("active");
					} else if(response.page===2){
						 $("#l3").addClass("active");
						 $("#l1,#l2,#l4,#l5").removeClass("active");
					} else {
						 $("#l1").addClass("active");
						 $("#l2,#l3,#l4,#l5").removeClass("active");
					}
					
					if(response.pageLimit===1 || response.pageLimit===2){
						$('#p4,#p5').text('-');
					}
				}
			});
		
		};

		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	</script>
</body>
</html>