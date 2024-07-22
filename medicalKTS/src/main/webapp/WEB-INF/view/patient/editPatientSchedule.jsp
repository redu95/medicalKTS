<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Patient Schedule</title>
	<style>
		.without_ampm::-webkit-datetime-edit-ampm-field {
	   display: none;
	 }
	 input[type=time]::-webkit-clear-button {
	   -webkit-appearance: none;
	   -moz-appearance: none;
	   -o-appearance: none;
	   -ms-appearance:none;
	   appearance: none;
	   margin: -10px; 
	 }
	 .paid{
	 	color: green;
	 }
	  .unpaid{
	 	color: red;
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
	</style>
</head>
<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">
			<div class="page-heading">

				<div class="page-title mb-3">
					<div class="row">
						<div class="col-12 col-md-12 order-md-1 order-last c-dflx">
							<h3>Schedule appointment</h3>
							
						</div>
						
					</div>
				</div>

				<section class="section blnk-db">
					<div class="eror-msg" style="display: none;">
						<div class="card">
							<div class="card-body success-msg" id="msgBoxBg">
								<p class="" id="msgBox"></p>
								<a class="delete-msg btn btn-light">X</a>
							</div>
						</div>
					</div>
					<div class="card">
								
								<div class="card-body">
									<div class="row mt-3" id="row3">
									<!--  -->
									<div class="c-dflx mb-3">
										<h4>Existing patient appointment</h4>
										<a class="btn btn-primary" id="newAppointmentBtn" onclick="addAppoint()" style="background: transparent; color: #435ebe;" >
											<i class="bi bi-calendar-plus-fill ms-3"></i>New Appointment
										</a>

									</div>
									<div class="col-12 mt-1">
										<div class="form-group">
											<div class="form-check">
												<div class="checkbox">
													<input type="checkbox" name="checkAll" class="form-check-input checkAll" onclick="toggleDateTime()" disabled="disabled">Appoint Schedule
												</div>
											</div>
										</div>
									</div>
									<div class="appoint1">
									   <div class="form-group datetimepick">
									      <div class="row">
									      	<div class="col-3">
										      	<fieldset class="form-group">
													<label for="orderBy" class="form-label">Department</label>
													<select class="form-select dropdown-group" name="orderBy" id="assignedToDepartment" style="width:100%;" disabled="disabled">
														<option value="${medicalHistory.assignedToDepartment}">${medicalHistory.assignedToDepartment}</option>
													</select>
												</fieldset>
											</div>
											<div class="col-3">
										      	<fieldset class="form-group">
													<label for="orderBy" class="form-label">Doctor</label>
													<select class="form-select dropdown-group" name="orderBy2" id="assignedTo" style="width:100%;" disabled="disabled">
														<option value="${medicalHistory.assignedTo}">${medicalHistory.assignedTo}</option>
													</select>
												</fieldset>
											</div>
											<div class="col-4 justify-content-between">
											    <label for="startDate">Registry Date</label>&nbsp;
											    <input type="date" name="startDate" class="form-control me-3" placeholder="Start Date" value="${formattedDateEvent}" min="${formattedDateEvent}"  onchange="showVal(this.value)" disabled="disabled" />
											</div>
										   </div>
									   	</div>
									</div>
									<div class="dateTimeOnly">
												<div class="dateTimeOnlyData"></div>
												<div class="col-12 dateDropDown" style="text-align: center;">
													<div class="c-dflx center">
														<h6>Schedule date</h6>
													</div>
													<div class="row flexDaysDisplay">
													</div>
													
												</div>
											</div>
								</div>
								</div>
								<div class="row mb-3 submitDiv">
									<div class="col-12 d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/Patient/patientDataReception"
													class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
										<button type="submit" class=" c-btn btn btn-primary" onclick="saveForm()"
													id="saveData">Save</button>
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
			$('.checkAll').prop('checked', true);
			$('.dateTimeOnly').hide();
			$('.submitDiv').hide();
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
					$('.dateTimeOnly').show();
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
		
		
		function addAppoint(){
			$('#newAppointmentBtn').hide();
			$('.appoint1').after('<div><div class="form-group datetimepick"><div class="row"><div class="col-3"><fieldset class="form-group"><select class="form-select dropdown-group" name="orderBy" id="assignedDept" style="width:100%;"><option value="${medicalHistory.assignedToDepartment}">${medicalHistory.assignedToDepartment}</option><c:forEach items="${departments}" var="departments"><option value="${departments.departmentName}">${departments.departmentName}</option></c:forEach></select></fieldset></div><div class="col-3"><fieldset class="form-group"><select class="form-select dropdown-group" name="orderBy2" id="assignedDoc" style="width:100%;"><option value="${medicalHistory.assignedTo}">${medicalHistory.assignedTo}</option><c:forEach items="${doctors}" var="doctors"><option value="${doctors.firstname}">${doctors.firstname}</option></c:forEach></select></fieldset></div><div class="col-4 justify-content-between"><input type="date" name="startDate" id="startDate" class="form-control me-3" placeholder="Start Date" value"${formattedDateStart}" min="${formattedDateStart}" onchange="showVal(this.value)" /></div></div></div></div>');
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

			var scheduledHour = "";
			var doctorId = $('#assignedTo').val();
			var department = $('#assignedToDepartment').val();
			var medicalHistoryId = ${id};	
			
			$('.weekDays').each(function() {
				if($(this).attr('data-initial-value')=='1'){
					scheduledHour += $(this).attr('data-id')
				}
	   	    });
			
			
			if (scheduledHour) {
				$('.eror-msg').hide();
				$.ajax({
					type: "POST",
					url: '${pageContext.request.contextPath}/Patient/editExistingPatientScheduleData',
					data: {
						scheduledHour:scheduledHour,
						doctorId:doctorId,
						department:department,
						medicalHistoryId:medicalHistoryId,
					},
					success : function(response) {
						if(response=='success'){
							window.scrollTo({ top: 0, behavior: 'smooth' });
						   	$('#msgBoxBg').removeClass("error-msg");
						   	$('#msgBoxBg').addClass("success-msg");
							$('#msgBox').text('Patient appointed successfully');
							$('.eror-msg').show();
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
			} else {
				window.scrollTo({ top: 0, behavior: 'smooth' });
			   	$('#msgBoxBg').removeClass("success-msg");
			   	$('#msgBoxBg').addClass("error-msg");
				$('#msgBox').text('Please select date to procees');
				$('.eror-msg').show();
				document.getElementById("saveData").disabled = false;
				return;
			}
				return;
			
			
			
			
		}
		
	</script>
</body>
</html>