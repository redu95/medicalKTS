<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Departments</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
      
         .spinner-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }
        
        .spinner {
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>

<body >
    <div id="main" class="layout-navbar">
    	 <div class="spinner-overlay" id="spinner-overlay">
	        <div class="spinner"></div>
	    </div>
    	<div id="main-content">
    		<div class="page-heading">
	    		
	    			<div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last text-3xl font-bold">
                                <h3>Departments</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Departments
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
	    			<%@ include file="../common/error-and-success-message.jsp"%>
			       <div class="row mb-6">
					    <div class="col">
					        <div class="input-group">
					            <input type="text" name="poSearchValue" id="poSearchValue" class="form-control"  placeholder="Search here" value="" data-initial-val="" style="border-right: none;" />
					            <span class="input-group-text bg-white border-left-0">
					                <i class="bi bi-search"></i>
					            </span>
					        </div>
					    </div>
					    <div class="col-4 ig-dflx">
					        <a href="#" class="btn btn-primary" data-dismiss="modal" id="newDepartmentBtnOriginal" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					            <i class="bi bi-credit-card-2-back"></i> New Department
					        </a>
					    </div>
					</div>

			        <div class="departmentBox row mt-5">
				     	 <!-- 
				         <c:forEach var="department" items="${departments}">
		                    <div class="department-card bg-white">
		                    	<c:if test="${not empty department.departmentHead}">
		                    		<img src="data:image/jpeg;base64,${department.departmentHead}" alt="Department Image">  
		                    	</c:if>
		                    	<c:if test="${empty department.departmentHead}">
		                    		 <img src="${pageContext.request.contextPath}/resources/assets/images/bg/woodybg.jpg">  
		                    	</c:if>
		                    	   
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
		                                <a href="#" data-toggle="modal" data-dismiss="modal" data-target="user_form" onclick="loadDepartmentDetails(${department.id})" class="btn btn-primary">Details</a>
		                            </div>
		                        </div>
		                        <i class="bi bi-trash-fill delete-icon" onclick="deleteDept(${department.id})"></i>
		                    </div>
		                </c:forEach>
				       -->  
			           
			        </div>
					<nav aria-label="Page">
						<ul class="pagination justify-content-center" style="align-content: center;">
							<li id="pageNum" class="page-item" data-page-val="2"><a class="page-link" onclick="showMore()" href="#">Show more</a></li>
						</ul>
					</nav>

				<section class="section blnk-db">
					<!-- Modal Structure -->
					<div class="modal fade" id="editDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="editDepartmentModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="editDepartmentModalLabel">Edit Department</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeEditModalView()">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <!-- Form goes here -->
					        <form:form class="form-horizontals" method="post" id="user_form"
								onsubmit="saveForm()" name="user_form" action="${pageContext.request.contextPath}/Institute/addDepartmentData"
								modelAttribute="department" enctype="multipart/form-data">
								<form:input type="hidden" path="id" />
								<form:input type="hidden" path="instituteId" />
								<form:input type="hidden" path="isActive" />
								<form:input type="hidden" path="stuffNumber" />
								<form:input type="hidden" path="registeredServices" />
								
		
								<div class="card tp-inpt">
									<div class="card-body">
										<div class="row">
											<div class="col-12">
												<div class="form-group">
													<label for="firstname">Department Name</label>
													<form:input type="text" maxlength="50" name="departmentName"
														id="departmentName" path="departmentName" class="form-control" data-init-val=""
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
										<div class="col-md-4 col-12">
											<div class="form-group">
												<label for="file" class="form-label">Department Picture</label>
												<input type="file" name="file" id="file" class="form-control" value=""  />

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
										<a href="#" onclick="closeEditModalView()"
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
										modelAttribute="department" enctype="multipart/form-data">
				
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
													<div class="col-md-4 col-12">
														<div class="form-group">
															<label for="file" class="form-label">Department Picture</label>
															<input type="file" name="file" id="file" class="form-control" value=""  />
			
														</div>
													</div>
												</div>
											</div>
										</div>
				
										<div class="row">
											<div class="col-12 d-flex justify-content-center">
												<a href="#" onclick="closeModalView()"
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
				    <div id="deptData">
				    </div>
				</section>
			</div>
    	</div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    <script>
	    $(document).ready(function(){
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getDepartmentsData',
				success : function(department) {
					console.log(department);
					var loopLength = department.length;
					
					for (var i = 0; i < loopLength; i++) {
						// Log each department item to the console
						$('.departmentBox').append('<div class="col-4 department-card"><div class="card shadow"><div class="row"><div class="col-5"><img src="data:image/jpeg;base64,'+department[i].departmentHead+'" class="card-img" alt="Department Image"></div><div class="col-7"><div class="card-body"><h5 class="card-title">'+department[i].departmentName+'</h5><p class="card-text">'+department[i].description+'</p><div class="c-dflx"><p class="card-text" data-toggle="modal" data-dismiss="modal" data-target="user_form" onclick="loadDepartmentDetails('+department[i].id+')"><small class="text-muted" style="color: blue; cursor: pointer;">Go to details</small></p><a href="#"><i class="bi bi-trash-fill" style="color: #ed3b7d; font-size:20px; cursor: pointer;" onclick="deleteDept('+department[i].id+')"></i></a></div></div></div></div></div></div>')
					}
					 $("#spinner-overlay").fadeOut("slow");
					
				}
			});
			
		});
	    
	    function showMore(){
	    	var page = $('#pageNum').attr('data-page-val');
	    	var page2 = Number(page)+1;
	    	var search = $('#poSearchValue').attr('data-initial-val');
	    	$("#spinner-overlay").fadeIn("fast");
	    	$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getDepartmentsData',
				data: {
					page: page,
					search: search,
				},
				success : function(department) {
					console.log(department);
					console.log(page);
					var loopLength = department.length;
					
					for (var i = 0; i < loopLength; i++) {
						// Log each department item to the console
						$('.departmentBox').append('<div class="col-4 department-card"><div class="card shadow"><div class="row"><div class="col-5"><img src="data:image/jpeg;base64,'+department[i].departmentHead+'" class="card-img" alt="Department Image"></div><div class="col-7"><div class="card-body"><h5 class="card-title">'+department[i].departmentName+'</h5><p class="card-text">'+department[i].description+'</p><div class="c-dflx"><p class="card-text" data-toggle="modal" data-dismiss="modal" data-target="user_form" onclick="loadDepartmentDetails('+department[i].id+')"><small class="text-muted" style="color: blue; cursor: pointer;">Go to details</small></p><a href="#"><i class="bi bi-trash-fill" style="color: #ed3b7d; font-size:20px; cursor: pointer;" onclick="deleteDept('+department[i].id+')"></i></a></div></div></div></div></div></div>')
					}
					
					if(!loopLength==0){
						 $('#pageNum').attr('data-page-val', page2);
					}
					$("#spinner-overlay").fadeOut("slow");
				}
			});
	    }
	    
	    function handleSearch(){
	    	var search = $('#poSearchValue').val();
	    	$('#poSearchValue').attr('data-initial-val',search);
	    	$("#spinner-overlay").fadeIn("fast");
	    	if(search==''){
	    		 $('#pageNum').attr('data-page-val', 2);
			}
	    	$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getDepartmentsData',
				data: {
					search: search,
				},
				success : function(department) {
					console.log(department);
					console.log(search);
					var loopLength = department.length;
					
					$('.department-card').each(function() {
			 			$(this).remove();
			   	    });
					
					for (var i = 0; i < loopLength; i++) {
						// Log each department item to the console
						console.log(i);
						$('.departmentBox').append('<div class="col-4 department-card"><div class="card shadow"><div class="row"><div class="col-5"><img src="data:image/jpeg;base64,'+department[i].departmentHead+'" class="card-img" alt="Department Image"></div><div class="col-7"><div class="card-body"><h5 class="card-title">'+department[i].departmentName+'</h5><p class="card-text">'+department[i].description+'</p><div class="c-dflx"><p class="card-text" data-toggle="modal" data-dismiss="modal" data-target="user_form" onclick="loadDepartmentDetails('+department[i].id+')"><small class="text-muted" style="color: blue; cursor: pointer;">Go to details</small></p><a href="#"><i class="bi bi-trash-fill" style="color: #ed3b7d; font-size:20px; cursor: pointer;" onclick="deleteDept('+department[i].id+')"></i></a></div></div></div></div></div></div>')
					}
					$("#spinner-overlay").fadeOut("slow");
				}
			});
	    }
	    
	    var inputElement = document.getElementById('poSearchValue');
	    inputElement.addEventListener('keydown', function(event) {
	        if (event.key === 'Enter' || event.keyCode === 13) {
	        	handleSearch();
	   		}
	    });
	    
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
    
		function handlePage(x){
			
			var deptName = $('#deptData').val();
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
					dept: deptName,
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
		
        function clearSearch() {
            document.getElementById('poSearchValue').value = '';
            // Add any additional logic to handle clearing the search input
        }

       
        
        
        
        function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
        
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
        
        
        
        
        $("#newDepartmentBtnOriginal").click(function(){
            $("#newDepartmentModal").modal('show');
        });
        
        function closeModalView(){
			$('#newDepartmentModal').modal('hide');
		}
        function closeEditModalView(){
			$('#editDepartmentModal').modal('hide');
		}
        
        
        function loadDepartmentDetails(departmentId) {
        	
        	console.log(departmentId)
        	var deptName = "";
        	if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
			}
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
                    $('#user_form').find('#id').val(department.id);
                    $('#user_form').find('#instituteId').val(department.id);
                    $('#user_form').find('#isActive').val(department.id);
                    $('#user_form').find('#registeredServices').val(department.id);
                    $('#user_form').find('#stuffNumber').val(department.id);
                    
                    $('#deptData').val(department.departmentName);
                    console.log(department)
                    deptName = department.departmentName;
                    
                    console.log(department.departmentName + "DEPT NAME");
                	$.ajax({
        				url: '${pageContext.request.contextPath}/Institute/sendServiceData?dept='+deptName,
        				success : function(response) {
        					console.log(response);
        					console.log(deptName);
        					console.log("Dept section");
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
                	
                    // Show the modal
                    $('#editDepartmentModal').modal('show');
                },
                error: function (xhr, status, error) {
                    // Handle error
                    alert('An error occurred while fetching department details: ' + error);
                }
            });
        	
        	
        }

		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
        
    </script>
</body>

</html>