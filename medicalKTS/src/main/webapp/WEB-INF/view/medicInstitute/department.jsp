<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Departments</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        
        .department-card {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            position: relative;
        }
        
        .department-card:hover {
            transform: translateY(-5px);
        }

        .department-card img {
            width: 100%;
            height: 50%;
            object-fit: cover;
        }

        .member-avatars img {
            border-radius: 50%;
            width: 24px;
            height: 24px;
            margin-left: -8px;
            border: 2px solid white;
        }
        
        .details-button {
            background-color: white;
            border: 1px solid #3b82f6;
            color: #3b82f6;
            margin-left:125px;
        }

        .details-button:hover {
            background-color: #3b82f6;
            color: white;
        }

        .delete-icon {
            position: absolute;
            left: 16px;
            bottom: 16px;
            cursor: pointer;
            color: #fe6e6e;
        }

        .delete-icon:hover {
            color: #f87171;
        }
        
    </style>
</head>

<body class="bg-gray-100">
    <div id="main" class="layout-navbar">
    	<div id="main-content">
    		<div class="container mx-auto p-4">
		        <div class="flex justify-between items-center mb-6">
		            <h1 class="text-3xl font-bold">Departments</h1>
		        </div>
		        
		        <div class="container row mb-6 ">
		            <div class = "col-8 ">
		            	<input type="text" id="poSearchValue" placeholder="Search by Name" class=" w-full border border-gray-300 px-4 py-2 rounded-lg">
		            </div>
		            <div class = "col-4">
		            	<a href="#" class="btn btn-primary"data-dismiss="modal" id="newDepartmentBtnOriginal" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> <i class="bi bi-credit-card-2-back "></i> + Add Department</a>
		            </div>
		            <div class="absolute right-4 top-2">
		                <i class="bi bi-x-square text-red-500 cursor-pointer" onclick="clearSearch()" style="display: none;"></i>
		            </div>
		        </div>
		        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
		            <c:forEach var="department" items="${departments}">
	                    <div class="department-card bg-white">
	                        <img src="${pageContext.request.contextPath}/resources/assets/images/departments/department${department.id}.jpg" alt="Department Image">
	                        <div class="p-4">
	                            <h3 class="text-xl font-semibold">${department.departmentName}</h3>
	                            <div class="flex items-center mt-2">
	                                <span class="text-gray-600 text-sm mr-2">MEMBERS:</span>
	                                <div class="member-avatars flex">
	                                    <img src="https://picsum.photos/24?random=${department.id}1" alt="Member 1">
	                                    <img src="https://picsum.photos/24?random=${department.id}2" alt="Member 2">
	                                    <img src="https://picsum.photos/24?random=${department.id}3" alt="Member 3">
	                                    <img src="https://picsum.photos/24?random=${department.id}4" alt="Member 4">
	                                </div>
	                            </div>
	                            <p class="text-gray-600 mt-2">${department.description}</p>
	                            <div class="flex justify-between items-center mt-4">
	                                <a href="#" data-toggle="modal" data-dismiss="modal" data-target="user_form" onclick="loadDepartmentDetails(${department.id})" class="details-button px-4 py-2 rounded-lg">Details</a>
	                            </div>
	                        </div>
	                        <i class="bi bi-trash-fill delete-icon" onclick="deleteDept(${department.id})"></i>
	                    </div>
	                </c:forEach>
		        </div>
		    </div>
    	</div>
    	
		<section class="section blnk-db">
			<!-- Modal Structure -->
			<div class="modal fade" id="editDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="editDepartmentModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="editDepartmentModalLabel">Edit Department</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <!-- Form goes here -->
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
			      </div>
			    </div>
			  </div>
			</div>
	    	
	    	<!-- Modal Add Dept -->
	    	<div class="modal fade" id="newDepartmentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="newDepartmentModalLabel" aria-hidden="true">
		        <div class="modal-dialog modal-lg" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="newServiceModalLabel">Register New Department</h5>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModalView()">
		                        <span aria-hidden="true">&times;</span>
		                    </button>
		                </div>
		                <div class="modal-body">
		                	<form:form class="form-horizontals" method="post" id="user_form"
								onsubmit="saveForm()" name="user_form" action="addDepartmentData"
								modelAttribute="department">
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
													<form:select class="form-select dropdown-group" name="departmentHead" id="departmentHead" path="departmentHead" style="width:100%;"  value="1">
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
									</div>
								</div>
		
								<div class="row">
									<div class="col-12 d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/Institute/departmentsData"
											class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
										<button type="submit" class=" c-btn btn btn-primary"
											id="saveData">Save</button>
		
									</div>
								</div>
								
							</form:form>
		                </div>
		               
		            </div>
		        </div>
		    </div>
		</section>
    </div>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    <script>
        function clearSearch() {
            document.getElementById('poSearchValue').value = '';
            // Add any additional logic to handle clearing the search input
        }

        $("#newDepartmentBtnOriginal").click(function(){
            $("#newDepartmentModal").modal('show');
        });
        
        function deleteDept(id) {
            if (confirm('Are you sure to delete?')) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/Institute/deleteDepartment/' + id,
                    success: function(response) {
                        window.location.reload();
                    }
                });
            }
        }
        
        function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
        
        function loadDepartmentDetails(departmentId) {
        	
        	console.log(departmentId)
            $.ajax({
                url: '${pageContext.request.contextPath}/Institute/getDepartmentDetails/' + departmentId,
                type: 'GET',
                dataType: 'json',
                success: function (department) {
                    // Populate the modal form fields with the department data
                    $('#user_form').find('#departmentName').val(department.departmentName);
                    $('#user_form').find('#description').val(department.description);
                    $('#user_form').find('#departmentHead').val(department.departmentHead);
                    $('#user_form').find('#extraNote').val(department.extraNote);
                    
                    console.log(department)
                    // Show the modal
                    $('#editDepartmentModal').modal('show');
                },
                error: function (xhr, status, error) {
                    // Handle error
                    alert('An error occurred while fetching department details: ' + error);
                }
            });
        }

        
        
        
        
        
        function closeModalView(){
			$('#newDepartmentModal').modal('hide');
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
