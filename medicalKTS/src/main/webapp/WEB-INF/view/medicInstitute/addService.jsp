<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Add Service</title>
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
							<h3>Add Services</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/Institute/serviceData">
											Items</a></li>
									<li class="breadcrumb-item active" aria-current="page">Add
										Services</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" method="post" id="user_form"
						onsubmit="saveForm()" name="user_form" action="addServiceData"
						modelAttribute="service">
						<%@ include file="../common/error-and-success-message.jsp"%>

						<div class="card tp-inpt">
							<div class="card-body">

								<div class="row">
									<div class="col-8">
										<div class="form-group">
											<label for="serviceName">Service Name</label>
											<form:input type="text" maxlength="50" name="serviceName"
												id="serviceName" path="serviceName" class="form-control"
												placeholder="Enter Service Name " value="" required="true" />
										</div>
									</div>
									<div class="col-2">
										<div class="form-group">
											<label for="price">Price</label>
											<form:input type="number" maxlength="50" name="price"
												id="price" path="price" class="form-control"
												placeholder="ETB" value="" required="true" />
										</div>
									</div>
									<div class="col-2">
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
								<div class="mb-2">
					                <span style="font-weight: bold; font-size: 18px;">Treatment: </span>
					                <div class="row mt-3 treatment-section">
					                </div>
					                <c:forEach items="${treatmentData}" var="treatmentData">
										<div class="col-3 treatmentItems mb-3 align-items-center" id="itemIconRow'+response.id+'" data-id-val="'+response.id+'">
										  <div class="card border" style="width: 18rem;">
										    <div class="card-body">
										      <h5 class="card-title">'+treatmentData.medicItem.itemName+'</h5>
										      <p class="card-text">'+treatmentData.medicItem.description+'</p>
										      <div class="input-group flex-nowrap mt-1 mb-1 c-dflx">
										        <span class="input-group-text" id="addon-wrapping">Qty</span>
										        <input type="number" class="form-control me-3" placeholder="Quantity" data-id2="${tratmentData.id}"  aria-label="Username" aria-describedby="addon-wrapping" value="${treatmentData.quantity}">
										        <a href="#" onclick="removeItemRow(this,'+response.id+')">
										          <i class="bi bi-trash-fill" style="color: #ed3b7d; font-size:20px; cursor: pointer;"></i>
										        </a>
										      </div>
										    </div>
										  </div>
										</div>
										
									</c:forEach>
									
					           		<div style="text-align: right;">
										<i class="bi bi-plus-circle-fill me-3" style="color: #435ebe; font-size: 40px; cursor: pointer;" id="plusIcon2"></i>
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
					
					<!-- Modal Treatment -->
					<div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="itemModalLabel">Select Items</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					      	<div class="mb-3">
								<div class="input-group">
						            <input type="text" name="poSearchValue" id="poSearchValue" class="form-control"  placeholder="Search here" value="" data-initial-val="" style="border-right: none;" />
						            <span class="input-group-text bg-white border-left-0">
						                <i class="bi bi-search" onclick="searchHandler()"></i>
						            </span>
						        </div>
							</div>
					        <div class="list-group">
					          <div class="list-group-item-view">
						        </div>
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
					  </div>
				</section>

			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
		function saveForm() {
			document.getElementById("saveData").disabled = true;
			
			var invs3={}; 
	    	var invv3={};
	    	var invvcnt3=0;
	    	var invvcounter3=0;
	    	
	    	//treatmentItems 
	    	$('.treatmentItems').each(function() {
	    		var id = $(this).attr('data-id-val');
	    		console.log(id + " IDD");
	    		
	    		var firstChild = $(this).children().eq(0);
	    		var secondChild = firstChild.children().eq(0);
	    		var thirdChild = secondChild.children().eq(2);
	    		var finalChild = thirdChild.children().eq(1);
	    		var quantity = finalChild.val();
	    		
	    		
	    		invv3.itemId = id;
	    		invv3.itemQuantity = quantity;
	    		invs3[invvcounter3]=invv3;
    	    	invvcounter3++;
    	    	invv3={};
	    	   
	   	    });
	    	
	    	var jsonTreatment = JSON.stringify(invs3);
	    	
	    	$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/Institute/editMedicalRecordHistory',
				data: {
					jsonTreatment:jsonTreatment,
				},
				success : function(response) {
					if(response=='success'){
						window.scrollTo({ top: 0, behavior: 'smooth' });
					   	$('#msgBoxBg').removeClass("error-msg");
					   	$('#msgBoxBg').addClass("success-msg");
						$('#msgBox').text('Data entered successfully');
						$('.eror-msg').show();
						document.getElementById("saveData").disabled = false;
					} else {
						window.scrollTo({ top: 0, behavior: 'smooth' });
					   	$('#msgBoxBg').removeClass("success-msg");
					   	$('#msgBoxBg').addClass("error-msg");
						$('#msgBox').text(response);
						$('.eror-msg').show();
						document.getElementById("saveData").disabled = false;
					}
				}
			});
		}
		
		$(document).ready(function(){
			$('.datetimepick').hide();
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				success : function(itemAjaxData) {
					console.log(itemAjaxData);
					var response = itemAjaxData.item;
					console.log(response);
					var loopLength = response.length;
					console.log(loopLength);
					for (var i = 0; i < loopLength; i++) {
						$('.list-group-item-view').append('<div class="list-group-item"><input type="checkbox" class="checkboxIdGrop me-1" id="itemId'+response[i].id+'" name="item'+response[i].id+'" value="'+response[i].id+'" onclick="handleSelection(this,'+response[i].id+')"><label for="item'+response[i].id+'">'+response[i].itemName+'</label><div class="ms-3"><p class="small"><strong>On Hand:</strong>'+response[i].onHand+'<br><strong>Description:</strong> '+response[i].description+'<br></p></div></div>');
					}
					$('#p1').text(itemAjaxData.page1);
					$('#p2').text(itemAjaxData.page2);
					$('#p3').text(itemAjaxData.page3);
					$('#p4').text(itemAjaxData.page4);
					$('#p5').text(itemAjaxData.page5);
					$('#p9').attr("data-initial-value",itemAjaxData.countItem)
					
				}
			});
		});
		
		function removeItemRow(x,id){
			console.log(id);
			var inputId = '#itemId'+id;
			$(inputId).prop('checked', false); 
			
			
			$(x).parent().parent().parent().parent().remove();
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
			
			$('.list-group-item').remove();
			
			
			var invsId={}; 
			var counterLoop = 0;
			$('.treatmentItems').each(function() {
	    		var id = $(this).attr('data-id-val');
	    		invsId[counterLoop]=id;
	    		counterLoop++;
     		});
       	    console.log("Incvs is " + invsId);
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				data: {
					page: pagenum,
					search: searchValue,
				},
				success : function(itemAjaxData) {
					console.log(itemAjaxData);
					var response = itemAjaxData.item;
					console.log(response);
					var loopLength = response.length;
					console.log(loopLength);
					for (var i = 0; i < loopLength; i++) {
						$('.list-group-item-view').append('<div class="list-group-item"><input type="checkbox" class="checkboxIdGrop" id="itemId'+response[i].id+'" name="item'+response[i].id+'" value="'+response[i].id+'" onclick="handleSelection(this,'+response[i].id+')"><label for="item'+response[i].id+'">'+response[i].itemName+'</label><p class="small"><strong>On Hand:</strong>'+response[i].onHand+'<br><strong>Description:</strong> '+response[i].description+'<br></p> </div>');
						for (var key in invsId) {
						    if (invsId[key] == response[i].id) {
						       var itemIdd = '#itemId'+ response[i].id;
						       $(itemIdd).prop('checked', true); 
						        break;
						    }
						}
					}
					
					
					$('#p1').text(itemAjaxData.page1);
					$('#p2').text(itemAjaxData.page2);
					$('#p3').text(itemAjaxData.page3);
					$('#p4').text(itemAjaxData.page4);
					$('#p5').text(itemAjaxData.page5);	
					$('#p9').attr("data-initial-value",itemAjaxData.countItem)
					
					if(itemAjaxData.page===1){
						 $("#l2").addClass("active");
						 $("#l1,#l3,#l4,#l5").removeClass("active");
					} else if(itemAjaxData.page===2){
						 $("#l3").addClass("active");
						 $("#l1,#l2,#l4,#l5").removeClass("active");
					} else {
						 $("#l1").addClass("active");
						 $("#l2,#l3,#l4,#l5").removeClass("active");
					}
					
					if(itemAjaxData.pageLimit===1 || itemAjaxData.pageLimit===2){
						$('#p4,#p5').text('-');
					}
				}
			});
			
		};
		
		function searchHandler(){
			var searchValue=$('#poSearchValue').val();
			$('#poSearchValue').attr('data-initial-val',searchValue);
			console.log(searchValue);
			
			$('.list-group-item').remove();
			var invsId={}; 
			var counterLoop = 0;
			$('.treatmentItems').each(function() {
	    		var id = $(this).attr('data-id-val');
	    		invsId[counterLoop]=id;
	    		counterLoop++;
     		});
       	    console.log("Incvs is " + invsId);
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				data: {
					search: searchValue,
				},
				success : function(itemAjaxData) {
					console.log(itemAjaxData);
					var response = itemAjaxData.item;
					console.log(response);
					var loopLength = response.length;
					console.log(loopLength);
					for (var i = 0; i < loopLength; i++) {
						$('.list-group-item-view').append('<div class="list-group-item"><input class="checkboxIdGrop" type="checkbox" id="itemId'+response[i].id+'" name="item'+response[i].id+'" value="'+response[i].id+'" onclick="handleSelection(this,'+response[i].id+')"><label for="item'+response[i].id+'">'+response[i].itemName+'</label><p class="small"><strong>On Hand:</strong>'+response[i].onHand+'<br><strong>Description:</strong> '+response[i].description+'<br></p> </div>');
						for (var key in invsId) {
						    if (invsId[key] == response[i].id) {
						       var itemIdd = '#itemId'+ response[i].id;
						       $(itemIdd).prop('checked', true); 
						        break;
						    }
						}
					}
					$('#p1').text(itemAjaxData.page1);
					$('#p2').text(itemAjaxData.page2);
					$('#p3').text(itemAjaxData.page3);
					$('#p4').text(itemAjaxData.page4);
					$('#p5').text(itemAjaxData.page5);
					$('#p9').attr("data-initial-value",itemAjaxData.countItem)
					
					if(itemAjaxData.page===1){
						 $("#l2").addClass("active");
						 $("#l1,#l3,#l4,#l5").removeClass("active");
					} else if(itemAjaxData.page===2){
						 $("#l3").addClass("active");
						 $("#l1,#l2,#l4,#l5").removeClass("active");
					} else {
						 $("#l1").addClass("active");
						 $("#l2,#l3,#l4,#l5").removeClass("active");
					}
					
					if(itemAjaxData.pageLimit===1 || itemAjaxData.pageLimit===2){
						$('#p4,#p5').text('-');
					}
				}
			});
			
		};
		
		
		function handleSelection(x,id){
			console.log(x);
			if($(x).is(":checked")){
	    		console.log("Checked");
	    		console.log(id);
				$.ajax({
					url: '${pageContext.request.contextPath}/Patient/getItemRecordUnit',
					data: {
						itemId: id,
					},
					success : function(response) {
						console.log(response);
						$('.treatment-section').append('<div class="col-3 treatmentItems mb-3 align-items-center" id="itemIconRow'+response.id+'" data-id-val="'+response.id+'"><div class="card border" style="width: 18rem;"><div class="card-body"><h5 class="card-title regItem">'+response.itemName+'</h5> <p class="card-text regItem">'+response.description+'</p><div class="input-group flex-nowrap mt-1 mb-1 c-dflx"><span class="input-group-text" id="addon-wrapping">Qty</span> <input type="number" max="'+response.totalQuanitiy+'" min="0" oninput="adjustMinMax(this)" class="form-control me-3 regItem" placeholder="Quantity" aria-label="Username" aria-describedby="addon-wrapping" value="1"><a href="#" onclick="removeItemRow(this,'+response.id+')"><i class="bi bi-trash-fill" style="color: #ed3b7d; font-size:20px; cursor: pointer;"></i></a></div> </div></div></div>');
					}
				});
	       	};
	       	if(!$(x).is(":checked")){
	    		console.log("UnChecked");
	    		$('#itemIconRow'+id).remove();
	       	};
			
			
			
		}
		
		$('#plusIcon2').on('click', function(){
		    // Show the modal when the plus icon is clicked
		    $('#itemModal').modal('show');
		});
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	</script>
</body>
</html>