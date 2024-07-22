<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Existing Patient edit</title>
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
							<h3>Edit Patient</h3>
							<a class="btn btn-primary" id="newAppointmentBtn" href="${pageContext.request.contextPath}/Patient/editExistingPatientSchedule/${id}">
								<i class="bi bi-calendar-plus-fill ms-3"></i>New Appointment
							</a>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" id="user_form" name="user_form" modelAttribute="patient">
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
								<div class="c-dflx mb-3">
									<h4>Patient Info</h4>
								</div>
								<div class="row mt-1" id="row1">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="firstname">First Name</label>
											<form:input type="text" maxlength="50" name="name"
												id="name" path="name" class="form-control"
												placeholder="First Name " value="" required="true"/>
										</div>
									</div>
									
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="lastname">Last Name</label>
											<form:input type="text" maxlength="50" name="lastName"
												id="lastName" path="lastName" class="form-control"
												placeholder="Last Name" value="" required="true"/>
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
								<br>
							</div>
						</div>
							
							<div class="card">
								<div class="card-body">
									<div class="row" id="row4">
									<div class="c-dflx mb-4">
										<h4>Payment Details</h4>
										<a href="${pageContext.request.contextPath}/Patient/patientMedicalHistory/${patient.id}" class="btn btn-primary" style="font-weight: bold; color: black; background: transparent;"> <span><i class='bi bi-clock-history mt-3' style=""></i></span> Show history</a>
									</div>
									<!--  -->
							        <c:forEach items="${examinationData}" var="examinationData">
							        	<c:choose>
	 								         <c:when test = "${ empty examinationData.medicService.departmentName}">
									           <div class="col-12 mb-3">
											    	<div class="mb-2 c-dflx">
											    		<span style="font-weight: bold;">Department: <span  style="font-weight: 500;">Custom Department</span> </span>
											    		<div class="form-check form-switch">
															<label class="form-check-label" for="flexSwitchCheckChecked" style="text-decoration-line: line-through;">0.00 ETB</label>
											    		</div>
											    	</div>
											    	<div class="c-dflx">
											        	<span style="font-weight: bold;">Service: <span  style="font-weight: 500;">Custom Service</span> </span>
														<span style="font-weight: bold; background: transparent; color: gray; border-radius: 20px; padding-top: .175rem; padding-bottom: .175rem;" class="unpaid btn btn-secondary">Custom </span>
											        </div>
											       <hr>
										        </div>
									         </c:when>
									         
									         <c:otherwise>
									           <div class="col-12 mb-3">
											    	<div class="mb-2 c-dflx">
											    		<span style="font-weight: bold;">Department: <span  style="font-weight: 500;">${examinationData.medicService.departmentName}</span> </span>
											    		<div class="form-check form-switch">
															<label class="form-check-label" for="flexSwitchCheckChecked">${examinationData.medicService.price} ETB</label>
															<c:choose>
															    <c:when test="${examinationData.paymentStatus==0}">
															     	<input class="form-check-input flexSwitch" type="checkbox" role="switch" id="${examinationData.id}">
															    </c:when>    
															    <c:otherwise>
															       	<input class="form-check-input flexSwitchChecked" type="checkbox" role="switch" id="${examinationData.id}" checked="checked" disabled="disabled">
															    </c:otherwise>
															</c:choose>
															
											    		</div>
											    	</div>
											    	<div class="c-dflx">
											        	<span style="font-weight: bold;">Service: <span  style="font-weight: 500;">${examinationData.medicService.serviceName}</span> </span>
											        	<c:choose>
														    <c:when test="${examinationData.paymentStatus==0}">
														     	<span style="font-weight: bold; background: transparent; color: red; border-radius: 20px; padding-top: .175rem; padding-bottom: .175rem;" class="unpaid btn btn-danger">Unpaid </span>
														    </c:when>    
														    <c:otherwise>
														       	<span style="font-weight: bold; background: transparent; color: green; border-radius: 20px; padding-top: .175rem; padding-bottom: .175rem;" class="unpaid btn btn-success">Paid </span>
														    </c:otherwise>
														</c:choose>
											        </div>
											       <hr>
										        </div>
									         </c:otherwise>
									      </c:choose>
									</c:forEach>
							    
								</div>
								</div>
							</div>
														
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<a href="${pageContext.request.contextPath}/Patient/patientDataReception"
											class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
								<button type="submit" class=" c-btn btn btn-primary" onclick="saveForm()"
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
		$(document).ready(function(){
			$('.checkAll').prop('checked', true);
			$('.dateTimeOnly').hide();
			$('.dropdown-group').select2({
		    });
		});
		
		
		function saveForm() {
			document.getElementById("saveData").disabled = true;
			event.preventDefault();
			
			var invs={}; 
	    	var invv={};
	    	var invvcnt=0;
	    	
	    	var formData = new FormData(document.getElementById("user_form"));
			var medicalId = ${id};
			$('.flexSwitch').each(function() {
				if($(this).is(":checked")){
		    		console.log($(this).attr('id'));
		    		var id = $(this).attr('id');
		    		invv.id = id;
		    		invs[invvcnt]=invv;
		    		invvcnt=invvcnt+1;
		    		invv={};
		    	} 
	   	    });
			
			var json = JSON.stringify(invs);
			
			formData.append('jsonObj', json);
		    formData.append('assignedTo', medicalId);
		    
		    
		    console.log(formData);
			console.log(invs);
			console.log(medicalId);
			$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/Patient/updateExistingPatientData',
		        data: formData,
		        processData: false, // Prevent jQuery from automatically processing formData
		        contentType: false,
				success : function(response) {
					console.log(response);
					if(response=='success'){
						window.scrollTo({ top: 0, behavior: 'smooth' });
					   	$('#msgBoxBg').removeClass("error-msg");
					   	$('#msgBoxBg').addClass("success-msg");
						$('#msgBox').text('Data modified successfully');
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

		}
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
		
		
	</script>
</body>
</html>