<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Add Patient</title>
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
	 	opacity: 0.6;
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
							<h3>Add Patient</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/users/usersData">
											Users</a></li>
									<li class="breadcrumb-item active" aria-current="page">Add
										Patient</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" id="user_form"  name="user_form" modelAttribute="patient">
						<%@ include file="../common/error-and-success-message.jsp"%>
						<div class="eror-msg" style="display: none;">
							<div class="card">
								<div class="card-body success-msg" id="msgBoxBg">
									<p class="" id="msgBox"></p>
									<a class="delete-msg btn btn-light">X</a>
								</div>
							</div>
						</div>
						<div class="card tp-inpt">
							<div class="card-body">

								<div class="row" id="row1">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="firstname">First Name</label>
											<form:input type="text" maxlength="50" name="name"
												id="name" path="name" class="form-control"
												placeholder="First Name " value="" required="true" />
										</div>
									</div>
									
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="lastname">Last Name</label>
											<form:input type="text" maxlength="50" name="lastName"
												id="lastName" path="lastName" class="form-control"
												placeholder="Last Name" value="" required="true" />
										</div>
									</div>

									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="age">Age</label>
											<form:input type="number" name="age" id="age" path="age"
												class="form-control" placeholder="Age" value=""
												required="true" />
										</div>
									</div>
								</div>
								

								<div class="row" id="row2">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="sex">Sex</label>
											<form:select type="text" name="sex" id="sex"
												path="sex" class="form-select" placeholder="sex"
												value="" required="true">
												<form:option value="Male">Male</form:option>
												<form:option value="Female">Female</form:option>
											</form:select>
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="phoneNumber">Phone</label>
											<form:input type="number" maxlength="250" name="phoneNumber"
												id="phoneNumber" path="phoneNumber" class="form-control"
												placeholder="Phone Number" value="" required="true" />
										</div>
									</div>
									
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="address">Address</label>
											<form:input type="text" name="address" id="address" path="address"
												class="form-control" placeholder="Address" value=""
												required="true" />
										</div>
									</div>
								</div>
								
								<div class="row" id="row3">
									<div class="col-12">
										<div class="form-group">
											<label for="note">Extra Note</label>
											<form:textarea type="text" name="note"
												id="note" path="note" class="form-control"
												placeholder="Extra Note" value="" />
										</div>
									</div>
								</div>
								<div class="row" id="row3">
									<div class="col-12">
										<div class="form-group">
											<div class="form-check">
												<div class="checkbox">
													<input type="checkbox" name="checkAll" class="form-check-input checkAll" disabled="disabled" checked="checked">Appoint Schedule
												</div>
											</div>
										</div>
									</div>
									<div>
									   <div class="form-group datetimepick">
									      <div class="row">
									      	<div class="col-4">
										      	<fieldset class="form-group">
													<label for="orderBy" class="form-label">Department</label>
													<form:select class="form-select dropdown-group" name="orderBy" id="orderBy" required="true" path="assignedTo" style="width:100%;"  value="1">
														<option value="">-- Select Department --</option>
														
														<c:forEach items="${departments}" var="departments">
																<form:option value="${departments.departmentName}">${departments.departmentName}</form:option>
														</c:forEach>
													</form:select>
												</fieldset>
											</div>
											<div class="col-4">
										      	<fieldset class="form-group">
													<label for="orderBy" class="form-label">Doctor</label>
													<form:select class="form-select dropdown-group" name="orderBy2" id="orderBy2" required="true" path="doctorId" style="width:100%;"  value="1">
														<form:option value="">-- Select Doctor --</form:option>
														<c:forEach items="${doctors}" var="doctors">
																<form:option value="${doctors.firstname}">${doctors.firstname}</form:option>
														</c:forEach>
													</form:select>
												</fieldset>
											</div>
											<div class="col-4 justify-content-between">
											    <label for="startDate">Date</label>&nbsp;
											    <form:input type="date" name="registryDate" id="registryDate" class="form-control me-3" onchange="showVal()" path="registryDate" placeholder="Start Date"  min="${formattedDateStart}" value="" />
											</div>
										   </div>
											<div class="dateTimeOnly">
												<div class="dateTimeOnlyData"></div>
												<div class="col-12 dateDropDown" style="text-align: center;">
													<div class="c-dflx center">
														<h6>Schedule date</h6>
													</div>
													<div class="row flexDaysDisplay">
														<c:if test="${empty dateTimeList}">
															<p>No dates available</p>
														</c:if>
														<c:forEach var="dateTimeList" items="${dateTimeList}" varStatus="loop">
															<div class="c-dflx mb-3" style="width: 13%;">
																<c:if test="${loop.index eq 0}">
																	<a data-initial-value="1" data-id="${idList[loop.index]}" class="weekDays weekDayActive rounded me-1 ms-1 rounded p-1 px-2" onclick="checkHere(this)">${dateTimeList}</a>
																</c:if>
																<c:if test="${loop.index ne 0}">
																	<a data-initial-value="0" data-id="${idList[loop.index]}" class="weekDays rounded me-1 ms-1 rounded p-1 px-2" onclick="checkHere(this)">${dateTimeList}</a>
																</c:if>
															</div>
														</c:forEach>
													</div>
													
												</div>
											</div>

										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-12 d-flex justify-content-center">
										<a href="${pageContext.request.contextPath}/Patient/patientDataReception"
											class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
										<button class=" c-btn btn btn-primary" onclick="saveForm()"
											id="saveData">Save</button>
		
									</div>
								</div>
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
		$(document).ready(function(){
			$('#pickD').datepicker();
			$('.dropdown-group').select2({
		    });
		});
		
		function showVal() {
			var dateVal = $('#registryDate').val();
			//console.log(dateVal);
			var isFreeSlot = "0";
			$.ajax({
				url: '${pageContext.request.contextPath}/Institute/getScheduledDate/'+dateVal,
				data: {
					isFreeSlot: isFreeSlot,
				},
				success : function(response) {
					console.log(response);
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
			console.log("Check val is " + checkVal);
			if(checkVal=="0"){
				checkVal="1";
			} else {
				checkVal="1";
			}
			$(x).attr('data-initial-value',checkVal);
		}
		
		function saveForm() {
			event.preventDefault();
			var formData = $("#user_form").serialize();
			var scheduledHour = "&instituteId=";
			$('.weekDays').each(function() {
				if($(this).attr('data-initial-value')=='1'){
					scheduledHour += $(this).attr('data-id')
					formData += scheduledHour;
				}
	   	    });
			
			
			document.getElementById("saveData").disabled = true;
			console.log(formData);
			var queryString = formData;

			// Parse the query string
			var params = new URLSearchParams(queryString);
			// Extract each parameter into separate variables
			var name = params.get("name");
			var lastName = params.get("lastName");
			var age = params.get("age"); // Example of accessing a parameter that may not exist
			var sex = params.get("sex");
			var phoneNumber = params.get("phoneNumber");
			var address = params.get("address");
			var note = params.get("note");
			var assignedTo = params.get("assignedTo");
			var doctorId = params.get("doctorId");
			var registryDate = params.get("registryDate");
			var instituteId = params.get("instituteId");
			if (name && lastName && age && sex && phoneNumber && assignedTo && doctorId && registryDate && instituteId) {
				console.log("All parameters have some value.");
				$('.eror-msg').hide();
				$.ajax({
					type: "POST",
					url: '${pageContext.request.contextPath}/Patient/editExistingPatient',
					data: formData,
					success : function(response) {
						console.log(response);
						if(response=='success'){
							window.scrollTo({ top: 0, behavior: 'smooth' });
						   	$('#msgBoxBg').removeClass("error-msg");
						   	$('#msgBoxBg').addClass("success-msg");
							$('#msgBox').text('Patient added successfully');
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
				console.log("Not all parameters have some value.");
				window.scrollTo({ top: 0, behavior: 'smooth' });
			   	$('#msgBoxBg').removeClass("success-msg");
			   	$('#msgBoxBg').addClass("error-msg");
				$('#msgBox').text('Fill in all fields to continue');
				$('.eror-msg').show();
				document.getElementById("saveData").disabled = false;
				return;
				}
				return;
			
			
			
			
		}
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	</script>
</body>
</html>