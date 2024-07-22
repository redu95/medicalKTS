<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Assets</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Asset Data</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">asset
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                    	<div class="eror-msg" style="display: none;">
							<div class="card">
								<div class="card-body success-msg" id="msgBoxBg">
									<p class="" id="msgBox"></p>
									<a class="delete-msg btn btn-light">X</a>
								</div>
							</div>
						</div>
                      <div class="row">
							<div class="col-6 col-sm-5">
								<div class="input-group">
									<h3 id="searchCard"></h3>
									<input type="text" name="poSearchValue" id="poSearchValue"
										class="form-control" onkeyup="showCancelIcon()"
										placeholder="Search here" value="" style="border-right: none; border-radius: 8px;" />
									<div class="input-group-append cancelIcon"
										style="background-color: white; border: 1px solid #dce7f1;"
										onclick="clearSearch()">
										<span class="input-group-text"
											style="background-color: white; border: none;"> <i
											class="bi bi-x-square"
											style="background-color: white; border: none; color: red; margin-top: 4px;"></i>
										</span>
									</div>
								</div>
							</div>
	
							<div class="col">
								<a class="btn btn-primary" onclick="searchHandler()"> <i class="bi bi-search"></i>
								</a>
								<!--
									<a tabindex="0" class="btn btn-primary" role="button" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-title="Dismissible popover" data-bs-content="And here's some amazing content. It's very engaging. Right?">Dismissible popover</a>
								  -->
							</div>
							<div class="col-4 ig-dflx">
								<a href="#" class="btn btn-primary" data-dismiss="modal" id="newServiceBtnOriginal" data-bs-toggle="modal" data-bs-target="#staticBackdrop">  <i class="bi bi-credit-card-2-back "></i> New Asset</a>
							</div>
	
						</div>
						<hr>

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped" id="itemTable">
                                    <thead>
                                        <tr style="background-color: #D9DFF2;">
                                            <th>ServiceName</th>
                                            <th>Description</th>		
											<th>Department</th>
											<th>Type</th>
											<th>Price</th>
											<th>Unit</th>
										    <th width="10%">Action</th>		
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
                        
                         <!-- Modal -->
					    <div class="modal fade" id="newServiceModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="newServiceModalLabel" aria-hidden="true">
					        <div class="modal-dialog" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="newServiceModalLabel">New Service</h5>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModalView()">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					                <div class="modal-body">
					                	<form:form class="form-horizontals" method="post" id="user_form"
										onsubmit="saveForm()" name="user_form" action="addServiceData"
										modelAttribute="service">
										<%@ include file="../common/error-and-success-message.jsp"%>
				
										<div class="card tp-inpt">
											<div class="card-body">
				
												<div class="row">
													<div class="col-12">
														<div class="form-group">
															<label for="serviceName">Service Name</label>
															<form:input type="text" maxlength="50" name="serviceName"
																id="serviceName" path="serviceName" class="form-control"
																placeholder="Enter Service Name " value="" required="true" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<div class="form-group">
															<label for="price">Price</label>
															<form:input type="number" maxlength="50" name="price"
																id="price" path="price" class="form-control"
																placeholder="ETB" value="" required="true" />
														</div>
													</div>
													<div class="col-6">
														<div class="form-group">
															<label for="measurmentUnit">Measurement Unit</label>
															<form:select type="text" name="measurmentUnit" id="measurmentUnit"
																path="measurmentUnit" class="form-select" placeholder="measurmentUnit"
																value="">
																<form:option value="Unit">Per Unit</form:option>
																<form:option value="Kg">Per KG</form:option>
																<form:option value="Liter">Per Liter</form:option>
																<form:option value="KM">Per KM</form:option>
															</form:select>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12">
														<div class="form-group">
															<label for="serviceDescription">Description</label>
															<form:textarea type="text" name="serviceDescription" rows="3"
																id="serviceDescription" path="serviceDescription" class="form-control"
																placeholder="Add Description" value="" required="true" />
														</div>
													</div>
													
												</div>
												<div class="row">
													<div class="col-6">
														<div class="form-group">
															<label for="departmentName">Department</label>
															<form:select type="text" name="departmentName" id="departmentName"
																path="departmentName" class="form-select" placeholder="itemType"
																value="">
																<form:option value="">-- Select Department --</form:option>
																<c:forEach items="${departments}" var="departments">
																	<option value="${departments.departmentName}">${departments.departmentName}</option>
																</c:forEach>
															</form:select>
														</div>
													</div>
													<div class="col-6">
														<div class="form-group">
															<label for="servictType">Service Type</label>
															<form:select type="text" name="servictType" id="servictType"
																path="servictType" class="form-select" placeholder="servictType"
																value="">
																<form:option value="">-- Select Type --</form:option>
																<form:option value="Common">Common Service</form:option>
																<form:option value="Labratory">Lab Service</form:option>
															</form:select>
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
				    
                    </section>
                </div>
            </div>
        </div>


   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
   	<script>
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
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.measurmentUnit;
				return '<div class=\"form-check-Data\">Per '+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = '<div class="action-buttons"><a class="" title="Edit" href="${pageContext.request.contextPath}/Institute/editService/'+ data.id+'"><span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a><a class="red" href="#" onclick="deleteService('+ data.id+')" id="removeService"><span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a></div>';
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		}];
	
	   	$(document).ready(function(){
			$('.cancelIcon').hide();
			$('#searchCard').hide();

			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/sendServiceData',
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
			
			//Initiatization of popouts
			const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
			const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
			
			
		});
	   	
	   	$("#newServiceBtnOriginal").click(function(){
            $("#newServiceModal").modal('show');
        });
		 
		function closeModalView(){
			$('#newServiceModal').modal('hide');
		}
		
		
		function handlePage(x){
			var searchValue=$('#searchCard').text();
			var orderByVal=$('#orderBy').val();
			var deptVal=$('#byDept').val();
			var byTypeVal=$('#byType').val();

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
					search: searchValue,
					orderBy: orderByVal,
					dept: deptVal,
					byType: byTypeVal,
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
	   	
		
		function searchHandler(){
			var searchValue=$('#poSearchValue').val();
			var orderByVal=$('#orderBy').val();
			var deptVal=$('#byDept').val();
			var byTypeVal=$('#byType').val();
			
			$('#searchCard').text(searchValue);
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
				
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/sendServiceData',
				data: {
					page: 1,
					search: searchValue,
					orderBy: orderByVal,
					dept: deptVal,
					byType: byTypeVal,
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
					var searchVar = response.searchVal;
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
		}
	   	
		
		function clearSearch(){
			var orderByVal=$('#orderBy').val();
			var deptVal=$('#byDept').val();
			var byTypeVal=$('#byType').val();
			
	   		$('.cancelIcon').hide();
			$('#poSearchValue').val('');
			$('#searchCard').text('');
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
				
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/sendServiceData',
				data: {
					page: 1,
					orderBy: orderByVal,
					dept: deptVal,
					byType: byTypeVal,
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
					var searchVar = response.searchVal;
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
			
		}
		
		var inputElement = document.getElementById('poSearchValue');
	    inputElement.addEventListener('keydown', function(event) {
	        if (event.key === 'Enter' || event.keyCode === 13) {
	        	searchHandler();
	        }
	    });
	    
		function deleteService(id){
	   		confirm('Are you sure to delete?')
	   		$.ajax({
				url: '${pageContext.request.contextPath}/Institute/deleteService/'+id,
				success : function(response) {
					window.location.reload();
				}
			});
	   	}
		
		function showCancelIcon(){
	   		$('.cancelIcon').show();
	   	}
   	</script>

</body>
</html>