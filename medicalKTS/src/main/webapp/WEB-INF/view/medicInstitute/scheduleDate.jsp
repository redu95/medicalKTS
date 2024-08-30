<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Schedule date</title>
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
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Schedule Page</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/users/usersData">
											Users</a></li>
									<li class="breadcrumb-item active" aria-current="page">Edit
										Patient</li>
								</ol>
							</nav>
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
									<div class="row">
										<div class="col-12 justify-content-between">
											<div class="c-dflx mb-3">
												<h4>Schedule date</h4>
											</div>
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Monday </a>
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Tuesday </a>
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Wednesday </a>
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Thursday </a>
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Friday </a>					
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Saturday </a>
											<a data-initial-value="0"
																	class="weekDays rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Sunday </a>
										</div>
										
									</div>
									<div class="row mt-5">
										<div class="col-6 justify-content-between containerStart" data-initial-value="1">
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)">
												            <option value="1">1</option>
												            <option value="2">2</option>
												            <option value="3">3</option>
												            <option value="4">4</option>
												            <option value="5">5</option>
												            <option value="6">6</option>
												            <option value="7">7</option>
												            <option value="8">8</option>
												            <option value="9">9</option>
												            <option value="10">10</option>
												            <option value="11">11</option>
												            <option value="12">12</option>
												        </select>
<%--												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)">--%>
<%--												            <option value="00">00</option>--%>
<%--												            <option value="15">15</option>--%>
<%--												            <option value="30">30</option>--%>
<%--												            <option value="45">45</option>--%>
<%--												        </select>--%>
														&nbsp; &nbsp; &nbsp;
														<select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)">
															<!-- Options will be populated dynamically -->
														</select>
												       
												    </div>
												    <div class="form-check mt-3">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											
											

										</div>

										<div class="col-6 justify-content-between containerEnd">
											<div class="form-group datetimepick">
												<label for="startTime">Hour and minute</label>&nbsp;
												<div class="form-group datetimepick">
													<div class="input-group">
														<input class="form-select rowgroup1 startHour1" disabled="disabled" value="1" />
														 &nbsp; &nbsp; &nbsp; 
														<input class="form-select rowgroup1 startMinute1" disabled="disabled" value="${userPreference}"/>

													</div>
												    <div class="form-check mt-3" style="visibility: hidden;">
														<div class="checkbox">
															<input type="checkbox" name="checkAll"
																class="form-check-input">Free slot
														</div>
													</div>
												</div>
											</div>
											<div class="floatPlus" id="floatPlus" style="text-align: right;">
															<i class="bi bi-plus-circle-fill" style="color: #435ebe; font-size: 40px; cursor: pointer;" id="plusIcon"></i>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						
						

						<div class="row">
								<div class="col-12 d-flex justify-content-center">
									<a href="${pageContext.request.contextPath}/Patient/patientData"
												class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
									<button type="submit" class=" c-btn btn btn-primary" onclick="sendScheduleDate()"
												id="saveData">Save</button>
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
			$('.dropdown-group').select2({
		    });
			var defaultInterval = ${userPreference}; // You can change this value to 15, 30, or 45 based on your logic
			updateMinuteOptions(1, defaultInterval);
		});

		// Function to dynamically populate the minute dropdown options
		function updateMinuteOptions(sequenceNumber, interval) {
			var minuteDropdown = $('#startMinute' + sequenceNumber);
			minuteDropdown.empty(); // Clear existing options

			for (var i = 0; i < 60; i += interval) {
				minuteDropdown.append($('<option></option>').val(i < 10 ? '0' + i : i).text(i < 10 ? '0' + i : i));
			}
		}
		
		
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
		
		function showVal(x) {
			console.log(x);
		}
		
		$('.weekDays').on('click',function(){
			$(this).toggleClass('weekDayActive');
			var checkVal = $(this).attr('data-initial-value');
			if(checkVal=="0"){
				checkVal="1";
			} else {
				checkVal="0";
			}
			$(this).attr('data-initial-value',checkVal);
		})

		$('#plusIcon').on('click', function() {
			var sequenceStr = $('.containerStart').attr("data-initial-value");
			var sequenceNumber = Number(sequenceStr);
			sequenceNumber += 1;
			$('.containerStart').attr("data-initial-value", sequenceNumber);

			var lastChild = $('.containerStart').children(':last-child');
			var lastChildEnd = $('.containerEnd').children(':last-child');

			$(lastChild).after(
					'<div class="form-group datetimepick">' +
					'<div class="input-group">' +
					'<select id="startHour' + sequenceNumber + '" class="form-select selectVals rowgroup' + sequenceNumber + ' startHour' + sequenceNumber + '" onchange="readScheduleDate(' + sequenceNumber + ',this.value,this)">' +
					'<option value="1">1</option>' +
					'<option value="2">2</option>' +
					'<option value="3">3</option>' +
					'<option value="4">4</option>' +
					'<option value="5">5</option>' +
					'<option value="6">6</option>' +
					'<option value="7">7</option>' +
					'<option value="8">8</option>' +
					'<option value="9">9</option>' +
					'<option value="10">10</option>' +
					'<option value="11">11</option>' +
					'<option value="12">12</option>' +
					'</select>&nbsp; &nbsp; &nbsp;<select id="startMinute' + sequenceNumber + '" class="form-select selectVals rowgroup' + sequenceNumber + ' startMinute' + sequenceNumber + '" onchange="readScheduleDate(' + sequenceNumber + ',this.value,this)">' +
					'</select></div>' +
					'<div class="form-check mt-3">' +
					'<div class="checkbox">' +
					'<input type="checkbox" name="checkAll" class="form-check-input selectVals">Free slot</div></div></div>'
			);

			$(lastChildEnd).before('<div class="form-group datetimepick"> <div class="input-group"><input class="form-select rowgroup' + sequenceNumber + ' startHour' + sequenceNumber + '" disabled="disabled" value="2" />&nbsp; &nbsp; &nbsp;<input class="form-select rowgroup' + sequenceNumber + ' startMinute' + sequenceNumber + '" disabled="disabled" value="${userPreference}" /></div> <div class="form-check mt-3" style="visibility: hidden;"><div class="checkbox"><input type="checkbox" name="checkAll" class="form-check-input">Free slot</div></div></div>');

			// Set the minute options based on the desired interval
			var interval = ${userPreference}; // You can change this value to 15, 30, or 45 based on your logic
			updateMinuteOptions(sequenceNumber, interval);
		});


		function updateMinuteOptions(sequenceNumber, interval) {
			var minuteDropdown = $('#startMinute' + sequenceNumber);
			minuteDropdown.empty(); // Clear existing options

			for (var i = 0; i < 60; i += interval) {
				minuteDropdown.append($('<option></option>').val(i < 10 ? '0' + i : i).text(i < 10 ? '0' + i : i));
			}
		}



		function sendScheduleDate(){
			var dayinvs={};
			var dayinvv={};
			var invvcntDay=0;
			//var rowValues = [];
			$('.weekDays').each(function() {
				if($(this).attr('data-initial-value')=='1'){
					//rowValues.push($(this).text());
					dayinvv.day = $(this).text().trim();
					dayinvs[invvcntDay]=dayinvv;
					dayinvv={};
					invvcntDay=invvcntDay+1;
				}
	   	    });
			var invs={};
	    	var invv={};
	    	var invvcnt=0;
	    	if(invvcntDay==0){
	    		window.scrollTo({ top: 0, behavior: 'smooth' });
		   		$('#msgBoxBg').removeClass("success-msg");
		   		$('#msgBoxBg').addClass("error-msg");
				$('#msgBox').text('Select date to apply');
				$('.eror-msg').show();
				return;
	    	}
			var counter = 1;
			var counterDate = 1;
			$('.selectVals').each(function() {
				if (counter % 3 == 0){
					var checkStat = $(this).prop("checked");
					invv.checkStat = checkStat;
					invs[invvcnt]=invv;
					invv={};
					invvcnt=invvcnt+1;
			    } else {
			    	if(counterDate==1){
			    		var hour = $(this).val();
			    		invv.hour = hour;
			    		counterDate=2;
			    	} else {
			    		var minute = $(this).val();
			    		invv.minute = minute;
			    		counterDate=1;
			    	}

			    }
				counter++;
	   	    });

			var json = JSON.stringify(invs);
			var jsonDay =  JSON.stringify(dayinvs);
			document.getElementById("saveData").disabled = true;
	    	$.ajax({
				url: '${pageContext.request.contextPath}/Institute/sendScheduledDate',
				data: {
					json: json,
					jsonDay: jsonDay,
				},
				success : function(response) {

				}
			});
		}

		function readScheduleDate(rowSequence,currentVal, lineVal){
			var hourVal = $('#startHour'+rowSequence).val();
			var minuteVal = $('#startMinute'+rowSequence).val();

			var hour = Number(hourVal);
			var minute = Number(minuteVal);

			var loopSeq = '.rowgroup' + rowSequence;

			var rowValues = [];
			$('.rowgroup'+ rowSequence).each(function() {
	    		var value = $(this).val();
	    	    rowValues.push(value);
	   	    });

			var firstVal = rowValues[0];
			var secondVal =  rowValues[1];

			var scheduleIntervalLimit = ${userPreference};

			let interval = parseInt(scheduleIntervalLimit);
			let nextVal = parseInt(secondVal) + interval;

			if (nextVal >= 60) {
				secondVal = '59';
			} else {
				secondVal = nextVal.toString().padStart(2, '0');
			}


			var counter = 0;
			$('.rowgroup'+ rowSequence).each(function() {
				if(counter==2){
					$(this).val(firstVal);
				}
				if(counter==3){
					$(this).val(secondVal);
					counter = 0;
				}
				counter++;
	   	    });
		}
	</script>
</body>
</html>