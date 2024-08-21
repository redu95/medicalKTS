<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Edit Medical Data</title>
	<style>
        .info-box {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #FCFDFC;
        }
        .main-box {
            border: 1px solid #ddd;
            padding: 15px;
            background-color: #FFFFFF;
        }
        
         .weekDays{
			 color: #435ebe; 
			 border: 1px solid #435ebe; 
			 letter-spacing: 1px;
		 }
		 .weekDays:hover{
			cursor: pointer;
			color: #;
		 }
		 .weekDayActive{
		 	background-color: #435ebe;
		 	color: white;
		 }
       
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
							<h3>Record Edit Page</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
					</div>
				</div>
				<section class="section blnk-db ">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Name: </span>${medicalHistory.patientData.name} ${medicalHistory.patientData.lastName}</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Tel: </span>${medicalHistory.patientData.phoneNumber}</div>
						            </div>
						        </div>
						        <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Reg Date: </span>${medicalHistory.extraNote}</div>
						            </div>
						        </div>
						       
							</div>
							<div class="row">
								<div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Age: </span>${medicalHistory.patientData.age}</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Sex: </span>${medicalHistory.patientData.sex}</div>
						            </div>
						        </div>
						         <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Address: </span>${medicalHistory.patientData.address}</div>
						            </div>
						        </div>
							</div>
						</div>
					</div>
					
					<div class="eror-msg" style="display: none;">
						<div class="card">
							<div class="card-body success-msg" id="msgBoxBg">
								<p class="" id="msgBox"></p>
								<a class="delete-msg btn btn-light">X</a>
							</div>
						</div>
					</div>
					
					

					<div class="c-dflx">
						<h5 style="opacity: 0.7;">Register Patient information</h5>
					</div>
					
					<div class="card">
						<div class="row">
							<div class="card-body">
								 <div class="col-12">
						           
						            <div style="text-align: left;" class="mb-3 me-3">
						                <span style="font-weight: bold; opacity: 0.8; font-size: 18px;">Examination record: ${medicalHistory.extraNote}</span>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Chief Complaint: </span>
						                <textarea name="chiefComplaint recordData" id="chiefComplaint" class="form-control" placeholder="Chief Complaint / CC Data" style="border-right:none;">${medicalHistory.cheifCompliant}</textarea>
						                
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Past Medical History: </span>
						                <textarea name="medicalHistory recordData" id="medicalHistory" class="form-control" placeholder="Past Medical History Data" style="border-right:none;">${medicalHistory.pastMedicalHistory}</textarea>
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Present Medical Status: </span>
						                <textarea name="presentStatus recordData" id="presentStatus" class="form-control" placeholder="Present Medical Status Data" style="border-right:none;">${medicalHistory.presentStatus}</textarea>
						            </div>
								</div>
								<hr>
								<div class="col-12">
									<h5>Examination section</h5>
									<c:forEach items="${examinationData}" var="examinationData">
									<div class="row mb-3" class="examBox">
										<div class="col-4">
											<fieldset class="form-group">
												<label for="examination1" class="form-label" style="font-weight: bold;">Department: </label>
												<select class="form-select dropdown-group" name="examination1" disabled="disabled">
													<option value="1">${examinationData.medicService.departmentName}</option>
												</select>
											</fieldset>
											<fieldset class="form-group">
												<label for="examination2" class="form-label" style="font-weight: bold;">Examination: </label>
												<select class="form-select dropdown-group" name="examination2" disabled="disabled">
													<option value="0">${examinationData.examination}</option>
												</select>
											</fieldset>
											<div class="form-group ms-1">
												<div class="form-check">
													<div class="checkbox">
														<input type="checkbox" name="examCheckbox1" class="form-check-input" data-initial-value="0" disabled="disabled" onclick="toggleExamSelector(this)" >Custom Examination
													</div>
												</div>
											</div>
										</div>
										<div class="col-8">
											<span style="font-weight: bold;">Result: </span>
											<div class="c-dflx me-3">
												<textarea name="result1" class="form-control resultService" placeholder="Result from examination" data-id="${examinationData.id}" style="border-right:none;">${examinationData.result}</textarea>
											</div>
										</div>
									</div>
									</c:forEach>
									
									<div style="text-align: right;">
										<i class="bi bi-plus-circle-fill me-3" style="color: #435ebe; font-size: 40px; cursor: pointer;" id="plusIcon"></i>
									</div>
									
							        
						        </div>
						        <hr>
						        <div class="col-12">
						            <div class="mb-2">
						                <span style="font-weight: bold;" class="treatment-section">Treatment: </span>
						                <!-- <textarea name="treatment" id="treatment" class="form-control" placeholder="Medical treatment data" style="border-right:none;">${medicalHistory.treatement}</textarea> -->
						           		<div style="text-align: right;">
											<i class="bi bi-plus-circle-fill me-3" style="color: #435ebe; font-size: 40px; cursor: pointer;" id="plusIcon2"></i>
										</div>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Prescription: </span>
						                <textarea name="prescription" id="prescription" class="form-control" placeholder="Prescription data" style="border-right:none;">${medicalHistory.prescription}</textarea>
						            </div>
								</div>

								<div class="col-12 mt-3">
									<div class="form-group">
										<div class="form-check">
											<div class="checkbox">
												<input type="checkbox" name="checkAll"
													class="form-check-input checkAll"
													onclick="toggleDateTime()">Appoint Schedule
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-4 justify-content-between datetimepick mb-3">
											    <label for="startDate">Registry Date</label>&nbsp;
											    <input type="date" name="startDate" id="startDate" class="form-control me-3" placeholder="Start Date" value="${formattedDateStartDate}" min="${formattedDateStartDate}"  onchange="showVal(this.value)" />
											</div>
								<div class="dateTimeOnly mb-3">
									<div class="dateTimeOnlyData"></div>
									<div class="col-12 dateDropDown" style="text-align: center;">
										<div class="c-dflx center">
											<h6>Schedule date</h6>
										</div>
										<div class="row flexDaysDisplay"></div>

									</div>
								</div>

								<div class="col-12 d-flex justify-content-center">
									<a href="${pageContext.request.contextPath}/Patient/patientData"
										class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
									<button type="submit" class=" c-btn btn btn-primary" onclick="saveForm()"
										id="saveData">Save</button>

								</div>
							</div>
							<h3 id="searchCard"></h3>
							<!-- Modal Treatment -->
							<div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="itemModalLabel">Select Items</h5>
							        <button type="button" onclick="closeModal()" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
		
	
		$(document).ready(function(){
			var isActive = ${isActive};
			if(isActive==0){
				$('input').prop('disabled', true);
				$('textarea').prop('disabled', true);
				$('#saveData').prop('disabled', true);
				$('#plusIcon').hide();
			}
			
			showVal(1);
			$('.datetimepick').hide();
			$('.dateTimeOnly').hide();
			$('.dropdown-group').select2({
		    });
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getItemsData',
				success : function(itemAjaxData) {
					console.log(itemAjaxData);
					var response = itemAjaxData.item;
					console.log(response);
					var loopLength = response.length;
					console.log(loopLength);
					for (var i = 0; i < loopLength; i++) {
						$('.list-group-item-view').append('<div class="list-group-item"><input type="checkbox" class="checkboxIdGrop" id="itemId'+response[i].id+'" name="item'+response[i].id+'" value="'+response[i].id+'" onclick="handleSelection(this,'+response[i].id+')"><label for="item'+response[i].id+'">'+response[i].itemName+'</label><p class="small"><strong>On Hand:</strong>'+response[i].onHand+'<br><strong>Description:</strong> '+response[i].description+'<br></p> </div>');
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
			console.log(inputId);
			console.log($(inputId));
			$(inputId).prop('checked', false); 
			
			var parentRow = $(x).parent().parent();
			console.log($(x));
			console.log($(parentRow));
			$(x).parent().parent().remove();
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
						       console.log("ID is herererer");
						       var itemIdd = '#itemId'+ response[i].id;
						       console.log("ID is herererer" + itemIdd);
						       $(itemIdd).prop('checked', true); 
						        break;
						    } else {
						    	 console.log("ID NOT in herererer");
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
						       console.log("ID is herererer");
						       var itemIdd = '#itemId'+ response[i].id;
						       console.log("ID is herererer" + itemIdd);
						       $(itemIdd).prop('checked', true); 
						        break;
						    } else {
						    	 console.log("ID NOT in herererer");
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
						$('.treatment-section').append('<div class="row treatmentItems mb-2" id="itemIconRow'+response.id+'" data-id-val="'+response.id+'"><div class="col-3">Item Name: '+response.itemName+'</div><div class="col-3">Item Desc: '+response.description+'</div><div class="col-1"><input type="number" maxlength="50" name="err4" id="err4"  class="form-control" placeholder="" value="1" /></div><div class="col-2"><a class="red" href="#"  id="remove" onclick="removeItemRow(this,'+response.id+')"><span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a></div></div>');
					}
				});
	       	};
	       	if(!$(x).is(":checked")){
	    		console.log("UnChecked");
	    		$('#itemIconRow'+id).remove();
	       	};
			
			
			
		}
		
		
		var inputElement = document.getElementById('poSearchValue');
	    inputElement.addEventListener('keydown', function(event) {
	        if (event.key === 'Enter' || event.keyCode === 13) {
	        	searchHandler();
	        }
	    });
		
		function showVal(x) {
			var dateVal = $('#startDate').val();
			var isFreeSlot = "0";
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getScheduledDate/'+dateVal,
				data: {
					isFreeSlot: isFreeSlot,
				},
				success : function(response) {
					//$('.dateTimeOnly').show();
					$('.submitDiv').show();
					var countLenLoop = response.length;
					var dateStr = "";
					if(countLenLoop==0){
						dateStr="<p>No dates available</p>";
					}
					for (var i = 0; i < countLenLoop; i++) {
						var st = '<div class="c-dflx mb-3" style="width: 15%;"><a data-initial-value="0" data-id="'+response[i][0]+'" class="weekDays rounded me-1 ms-1 rounded p-1 px-2" onclick="checkHere(this)">'+response[i][1]+' to '+response[i][2]+' </a></div>';
						if(i==0){
							st = '<div class="c-dflx mb-3" style="width: 15%;"><a data-initial-value="1" data-id="'+response[i][0]+'" class="weekDays weekDayActive rounded me-1 ms-1 rounded p-1 px-2" onclick="checkHere(this)">'+response[i][1]+' to '+response[i][2]+' </a></div>';
						}
						dateStr = dateStr + st;
			        }
					$('.flexDaysDisplay').empty();
					$('.flexDaysDisplay').append(dateStr);
				}
			});
			
		}
		
		function checkHere(x){
			$('.weekDays').each(function() {
				if ($(this).hasClass('weekDayActive')) {
					$(this).removeClass('weekDayActive');
				    $(this).attr('data-initial-value','0');
				}
			});
	   	    
			
			$(x).toggleClass('weekDayActive');
			var checkVal = $(x).attr('data-initial-value');
			if(checkVal=="0"){
				checkVal="1";
			} else {
				checkVal="1";
			}
			$(x).attr('data-initial-value',checkVal);
		}
		
		$('.weekDays').on('click',function(){
			alert('Here');
			$(this).toggleClass('weekDayActive');
			var checkVal = $(this).attr('data-initial-value');
			if(checkVal=="0"){
				checkVal="1";
			} else {
				checkVal="0";
			}
			$(this).attr('data-initial-value',checkVal);
		})
		
		function saveForm() {
			event.preventDefault();
			document.getElementById("saveData").disabled = true;
			var invs={}; 
	    	var invv={};
	    	var invvcnt=0;
	    	var invvcounter=0;
	    	var customActive = 0;
	    	
			$('.regService').each(function() {
	    		var value = $(this).val();
	    	    console.log(value);
	    	    console.log(invvcnt);
	    	    if(invvcnt==0){
	    	    	invv.dept = value;
	    	    }
	    	    if(invvcnt==1){
	    	    	invv.service = value;
	    	    }
	    	    if(invvcnt==2){
	    	    	var checkVal = $(this).attr('data-initial-value');
	    	    	if(checkVal=='1'){
	    	    		customActive=1
	    	    	} 
	    	    }
	    	    if(invvcnt==3){
	    	    	if(customActive==1){
	    	    		invv.customService = value;
	    	    	} else {
	    	    		invv.customService = '';
	    	    		invv.result = value;
	    	    	    console.log(invv);
	    	    		invs[invvcounter]=invv;
		    	    	invvcounter++;
		    	    	invv={};
		    	    	invvcnt=9;
		    	    	customActive=0
	    	    	}
	    	    }
	    	    if(invvcnt==4){
	    	    	invv.result = value;
		    	    console.log(invv);
	    	    	invs[invvcounter]=invv;
	    	    	invvcounter++;
	    	    	invv={};
	    	    	invvcnt=9;
	    	    	customActive=0
	    	    }
	    	   
	    	    if(invvcnt==9){
	    	    	invvcnt=0;
	    	    } else {
	    	    	invvcnt++;
	    	    }
	    	   
	   	    });
			console.log(invs);
			
			var invs2={}; 
	    	var invv2={};
	    	var invvcnt2=0;
	    	var invvcounter2=0;
	    	
	    	$('.resultService').each(function() {
	    		var result = $(this).val();
	    		var idValue = $(this).attr('data-id');
	    		
	    	    console.log(result);
	    	    console.log(idValue);
	    	    
	    	    invv2.id = idValue;
	    	    invv2.result = result;
	    	    invs2[invvcounter2]=invv2;
	    	    invv2={};
	    	    invvcounter2++;
	   	    });
			
	    	 console.log(invs2);
	    	 
			var json = JSON.stringify(invs);
			var jsonResult = JSON.stringify(invs2);
			var cheifComplaint = $('#chiefComplaint').val();
			var pastMedicalHistory = $('#medicalHistory').val();
			var presentStatus = $('#presentStatus').val();
			var treatment = $('#treatment').val();
			var prescription = $('#prescription').val();
			var medicalHistoryId = ${id};
			var scheduledHour = "";
			
			
			$('.weekDays').each(function() {
				if($(this).attr('data-initial-value')=='1'){
					scheduledHour += $(this).attr('data-id')
				}
	   	    });
			
			$('.eror-msg').hide();
			$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/Patient/editMedicalRecordHistory',
				data: {
					json:json,
					jsonResult:jsonResult,
					scheduledHour:scheduledHour,
					medicalHistoryId:medicalHistoryId,
					cheifComplaint:cheifComplaint,
					pastMedicalHistory:pastMedicalHistory,
					presentStatus:presentStatus,
					treatment:treatment,
					prescription:prescription
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
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
			$('.dateTimeOnly').toggle();
		}
	
		$('#plusIcon').on('click', function(){
			$('#plusIcon').parent().before('<div class="row mb-3"><div class="col-4"><fieldset class="form-group"><label for="examination1" class="form-label" style="font-weight: bold;">Department: </label><select class="form-select dropdown-group regService" name="examination1"><c:forEach items="${allDepartments}" var="allDepartments"><option value="${allDepartments.departmentName}">${allDepartments.departmentName}</form:option></c:forEach></select></fieldset><fieldset class="form-group"><label for="examination2" class="form-label" style="font-weight: bold;">Examination: </label><select class="form-select dropdown-group regService" name="examination2"><c:forEach items="${allServices}" var="allServices"><option value="${allServices.id}">${allServices.serviceName}</form:option></c:forEach></select></fieldset><div class="form-group ms-1"><div class="form-check"><div class="checkbox"><input type="checkbox" name="examCheckbox1" class="form-check-input regService" data-initial-value="0" onclick="toggleExamSelector(this)" >Custom Examination</div></div></div></div><div class="col-8"><span style="font-weight: bold;">Result: </span><div class="c-dflx me-3"><textarea name="result1" class="form-control regService" placeholder="Result from examination" style="border-right:none;"></textarea><i class="bi bi-trash-fill ms-5" style="color: #ed3b7d; font-size:20px; cursor: pointer;" onclick="deleteExam(this)"></i></div></div></div>');
			$('.dropdown-group').select2({
		    });
		});
		
		$('#plusIcon2').on('click', function(){
		    // Show the modal when the plus icon is clicked
		    $('#itemModal').modal('show');
		});

		

		
		
		function toggleExamSelector(x){
			var initialDataVal = $(x).attr("data-initial-value");
			var fieldSelector = $(x).parent().parent().parent().prev();
			var fieldSelector2 = $(x).parent().parent().parent().prev().prev();
			$(fieldSelector).toggle();
			$(fieldSelector2).toggle();
			if(initialDataVal==0){
				$(x).parent().after('<div class="form-group"><textarea type="text" name="note" class="form-control regService" placeholder="Custom examination" value="" /></div>');
				$(x).attr("data-initial-value","1");
			} else {
				$(x).attr("data-initial-value","0");
				$(x).parent().parent().children().last().remove();
			}
		}
		
		function deleteExam(x){
			$(x).parent().parent().parent().remove();
		}
		
		
	</script>

</body>
</html>