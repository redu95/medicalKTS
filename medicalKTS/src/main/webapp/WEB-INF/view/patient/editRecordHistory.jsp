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
						                <span style="font-weight: bold;">Treatment: </span>
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
							
							<!-- Modal -->
							<div class="modal fade" id="itemModal" tabindex="-1" aria-labelledby="itemModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="itemModalLabel">Select Items</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <div class="list-group">
							          <!-- Example item -->
							          <div class="list-group-item">
							            <input type="checkbox" id="item1" name="item1" value="item1">
							            <label for="item1">Item 1</label>
							            <p class="small">This is a brief description of item 1.</p>
							          </div>
							          <!-- Add more items as needed -->
							          <div class="list-group-item">
							            <input type="checkbox" id="item2" name="item2" value="item2">
							            <label for="item2">Item 2</label>
							            <p class="small">This is a brief description of item 2.</p>
							          </div>
							          <!-- More items here -->
							        </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary" onclick="saveSelectedItems()">Save</button>
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

		// Example function to handle saving the selected items
		function saveSelectedItems() {
		    // You can retrieve selected items here and process them as needed
		    let selectedItems = [];
		    $('#itemModal input[type="checkbox"]:checked').each(function() {
		        selectedItems.push($(this).val());
		    });

		    console.log('Selected items:', selectedItems);
		    // You can then hide the modal
		    $('#itemModal').modal('hide');
		}

		
		
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