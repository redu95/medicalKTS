<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Scheduled date</title>
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
						<div class="col-12 c-dflx order-md-1 order-last">
							<h3>Schedule Page</h3>
							<a href="${pageContext.request.contextPath}/Institute/scheduleDate" class="btn btn-primary">  <i class="bi bi-credit-card-2-back "></i> New Schedule</a>
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
						<!-- 
						<div class="card">
							<div class="card-body">
								<div class="row mt-3" id="row3">
									<div class="row">
										<div class="col-4 justify-content-between">
											<div class="c-dflx mb-3">
												<h4>Schedule date</h4>
											</div>
											<div class="col-12 mt-1">
												<div class="form-group">
													<div class="form-check">
														<div class="checkbox">
															<input type="checkbox" name="checkAll"
																class="form-check-input checkAll"
																onclick="toggleDateTime()" disabled="disabled">Appoint
															Schedule
														</div>
													</div>
												</div>
											</div>
											<div>
												<div class="form-group datetimepick">
													<label for="startDate">Date</label>&nbsp; <input
														type="date" name="startDate" id="startDate"
														class="form-control me-3" placeholder="Start Date"
														value="2024-03-19" min="2024-03-29"
														onclick="showVal(this.value)" />
												</div>
											</div>
										</div>
										<div class="col-8 justify-content-between">
											<div class="c-dflx mb-3">
												<h4>Selected Hours</h4>
											</div>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
						 -->
						
						
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
																	class="weekDays weekDayActive rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Wednesday </a>
											<a data-initial-value="0"
																	class="weekDays weekDayActive rounded me-1 ms-1 rounded p-1 px-2"
																	>
																	Thursday </a>
											<a data-initial-value="0"
																	class="weekDays weekDayActive rounded me-1 ms-1 rounded p-1 px-2"
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
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="3">3</option>
													        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="00">00</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="15">15</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="00">30</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="45">45</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											

										</div>

										<div class="col-6 justify-content-between containerStart" data-initial-value="1">
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="00">15</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3" style="visibility: hidden;">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled" 
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="00">30</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3" style="visibility: hidden;">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="00">45</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3" style="visibility: hidden;">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
											</div>
											<label for="startTime">Hour and minute</label>&nbsp;
											<div class="form-group datetimepick">
												    <div class="input-group">
												        <select class="form-select selectVals rowgroup1 startHour1" id="startHour1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="1">3</option>
												        </select>
												        &nbsp; &nbsp; &nbsp;
												        <select class="form-select selectVals rowgroup1 startMinute1" id="startMinute1" onchange="readScheduleDate(1,this.value,this)" disabled="disabled">
												            <option value="00">59</option>
												        </select>
												       
												    </div>
												    <div class="form-check mt-3" style="visibility: hidden;">
														<div class="checkbox">
															<input type="checkbox" name="checkAll" id="freeSlotCheck1" disabled="disabled"
																class="form-check-input selectVals">Free slot
														</div>
													</div>
												
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
</body>
</html>