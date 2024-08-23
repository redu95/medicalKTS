<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Avaialble Items</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">
 
                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Avaialble Items</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard ${msg}</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">items
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                    	<%@ include file="../common/error-and-success-message.jsp"%>
                   		<div class="eror-msg" style="display: none;">
							<div class="card">
								<div class="card-body success-msg" id="msgBoxBg">
									<p class="" id="msgBox"></p>
									<a class="delete-msg btn btn-light">X</a>
								</div>
							</div>
						</div>
                       <div class="row c-dflx">
							<div class="col-6 col-sm-5">
								<div class="input-group">
						            <input type="text" name="poSearchValue" id="poSearchValue" class="form-control"  placeholder="Search here" value="" data-initial-val="" style="border-right: none;" />
						            <span class="input-group-text bg-white border-left-0">
						                <i class="bi bi-search" onclick="searchHandler()"></i>
						            </span>
						        </div>
							</div>
							<div class="col-4 ig-dflx">
								<a href="${pageContext.request.contextPath}/Institute/addMedicItems" class="btn btn-primary">  <i class="bi bi-credit-card-2-back "></i> New Item</a>
							</div>
						</div>
						<hr>

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped" id="itemTable">
                                    <thead>
                                        <tr style="background-color: #D9DFF2;">
                                            <th>ItemName</th>
                                            <th>On-Hand</th>		
											<th>Quantity</th>
											<th>Unit</th>
											<th>Minimum Stock</th>
											<th>Description</th>
											<th>ItemType</th>
											<th>Vendor Name</th>
										    <th width="10%">Action</th>		
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<!-- 
                                    	<c:forEach var="items" items="${items}">
											<tr>
												<td>${items.itemName}</td>
												<td>${items.onHand}</td>
												<td>${items.totalQuanitiy}</td>
												<td>${items.measmurmentUnit}</td>
												<td>${items.minimunStock}</td>
												<td>${items.description}</td>
												<td>${items.itemType}</td>
												<td>${items.vendorName}</td>
											    <td class="td-actions">
					                                <div class="action-buttons">
					                                   <a class="" title="Edit" onClick="loadItemsdata(${items.id})" href="#">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                 
					                                	<a class="red" href="${pageContext.request.contextPath}/Institute/deleteItem/${items.id}" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                                
											</tr>
										</c:forEach>
                                    	 -->
										
                                    </tbody>
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
                        <h3 id="searchCard"></h3>
                        <!-- Modal edit item -->
				    	<div class="modal fade" id="newItemModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="newDepartmentModalLabel" aria-hidden="true">
					        <div class="modal-dialog modal-lg" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="newServiceModalLabel">Edit items</h5>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModalView()">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					                <div class="modal-body">
					                	<form:form class="form-horizontals" method="post" id="user_form"
											onsubmit="saveForm()" name="user_form" action="editItemsData"
											modelAttribute="item">
					
											<div class="card tp-inpt">
												<div class="card-body">
					
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<label for="itemName">Item Name</label>
																<form:input type="text" maxlength="50" name="itemName"
																	id="itemName" path="itemName" class="form-control"
																	placeholder="Enter Item Name " value="Sterilizer" required="true" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<label for="lastname">Description</label>
																	<form:textarea type="text" name="description" rows="3"
																		id="description" path="description" class="form-control"
																		placeholder="Add Description" value="" required="true" />															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-6">
															<div class="form-group">
																<label for="onHand">Quantity</label>
																<form:input type="number" maxlength="50" name="totalQuanitiy"
																	id="totalQuanitiy" path="totalQuanitiy" class="form-control"
																	placeholder="" value="" required="true" />
															</div>
														</div>
														<div class="col-6">
															<div class="form-group">
																<label for="onHand">Min.Stock</label>
																<form:input type="number" maxlength="50" name="minimunStock"
																	id="minimunStock" path="minimunStock" class="form-control"
																	placeholder="" value="" required="true" />
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-6">
															<div class="form-group">
																<label for="measmurmentUnit">Measurement unit</label>
																<form:select type="text" name="measmurmentUnit" id="measmurmentUnit"
																	path="measmurmentUnit" class="form-select" placeholder="Measure Unit"
																	value="">
																	<form:option value="Pcs">Pcs</form:option>
																	<form:option value="Liter">Liter</form:option>
																	<form:option value="KG">KG</form:option>
																</form:select>
															</div>
														</div>
														<div class="col-6">
															<div class="form-group">
																<label for="vendorName">Vendor Name</label>
																<form:select type="text" name="vendorName" id="vendorName"
																	path="vendorName" class="form-select" placeholder="vendorName"
																	value="">
																	<form:option value="AISE">AISE</form:option>
																	<form:option value="EPA">EPA</form:option>
																	<form:option value="other">other</form:option>
																</form:select>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-6">
															<div class="form-group">
																<label for="itemType">Item Type</label>
																<form:select type="text" name="itemType" id="itemType"
																	path="itemType" class="form-select" placeholder="itemType"
																	value="">
																	<form:option value="Consumable">Consumable</form:option>
																	<form:option value="Durable">Durable</form:option>
																</form:select>
															</div>
														</div>
														<div class="col" style="visibility: hidden;">
															<div class="form-group">
																<form:input type="number" maxlength="50" name="id"
																	id="id" path="id" class="form-control"
																	placeholder="" value="" />
															</div>
														</div>
													</div>
												</div>
											</div>
					
											<div class="row">
												<div class="col-12 d-flex justify-content-center">
													<a href="${pageContext.request.contextPath}/Institute/medicItems"
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
	   	$(document).ready(function(){
	   		$('#searchCard').hide();
	   		$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.item,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						lengthMenu: [
					        [10, 25, 50, -1],
					        [10, 25, 50, 'All']
					    ],
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
	   	
	   	
	   	var aoColumns = [{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.itemName;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.onHand;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.totalQuanitiy;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.measmurmentUnit;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.minimunStock;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.description;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.itemType;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.vendorName;
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = '<div class="action-buttons"><a class="" title="Edit" onClick="loadItemsdata('+data.id+')" href="#"><span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a><a class="red" href="${pageContext.request.contextPath}/Institute/deleteItem/'+data.id+'" onclick="return confirm("Are you sure to delete?")" id="remove"><span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a></div>';
				return status;
			}
		}];
	   	
	   	
		function loadItemsdata(itemsId) {
        	
        	console.log(itemsId)
        	var deptName = "";
            $.ajax({
                url: '${pageContext.request.contextPath}/Institute/getItemDetails/' + itemsId,
                type: 'GET',
                dataType: 'json',
                success: function (item) {
                	console.log(item);
                    // Populate the modal form fields with the department data
                    $('#user_form').find('#id').val(item.id);
                    $('#user_form').find('#itemName').val(item.itemName);
                    $('#user_form').find('#description').val(item.description);
                    $('#user_form').find('#totalQuanitiy').val(item.totalQuanitiy);
                    $('#user_form').find('#minimunStock').val(item.minimunStock);
                    $('#user_form').find('#measmurmentUnit').val(item.measmurmentUnit);
                    $('#user_form').find('#itemType').val(item.itemType);
                    $('#user_form').find('#vendorName').val(item.vendorName);
                    
                	
                    // Show the modal
                    $('#newItemModal').modal('show');
                },
                error: function (xhr, status, error) {
                    // Handle error
                    alert('An error occurred while fetching department details: ' + error);
                }
            });
        	
        	
        }
		
		
		function handlePage(x){
			var searchValue=$('#poSearchValue').attr('data-initial-val');
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
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				data: {
					page: pagenum,
					search: searchValue,
				},
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.item,
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
			$('#poSearchValue').attr('data-initial-val',searchValue);
			console.log(searchValue);
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
				
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				data: {
					search: searchValue,
				},
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.item,
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
		
		var inputElement = document.getElementById('poSearchValue');
	    inputElement.addEventListener('keydown', function(event) {
	        if (event.key === 'Enter' || event.keyCode === 13) {
	        	searchHandler();
	        }
	    });
	    
	    function closeModalView(){
	    	$('#newItemModal').modal('hide');
	    }

   	</script>

</body>
</html>