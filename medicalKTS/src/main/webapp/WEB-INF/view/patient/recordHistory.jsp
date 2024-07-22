<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Register New Medical Data</title>
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
							<h3>Record Page</h3>
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
						                <div class="title"><span style="font-weight: bold;">Name: </span>Ermias Ashebr</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Tel: </span>0925416359</div>
						            </div>
						        </div>
						        <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Reg Date: </span>01-03-2024</div>
						            </div>
						        </div>
						       
							</div>
							<div class="row">
								<div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Age: </span>45</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Sex: </span>Male</div>
						            </div>
						        </div>
						         <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Address: </span>Piassa sc</div>
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
						                <span style="font-weight: bold; opacity: 0.8; font-size: 20px;">2023-03-12 record form</span>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Chief Complaint: </span>
						                <textarea name="chiefComplaint recordData" id="chiefComplaint" class="form-control" placeholder="Chief Complaint / CC Data" style="border-right:none;"></textarea>
						                
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Past Medical History: </span>
						                <textarea name="medicalHistory recordData" id="medicalHistory" class="form-control" placeholder="Past Medical History Data" style="border-right:none;"></textarea>
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Present Medical Status: </span>
						                <textarea name="presentStatus recordData" id="presentStatus" class="form-control" placeholder="Present Medical Status Data" style="border-right:none;"></textarea>
						            </div>
								</div>
								<hr>
								<div class="col-12">
									<div class="row mb-3" class="examBox1">
										<div class="col-4">
											<fieldset class="form-group">
												<label for="examination1" class="form-label" style="font-weight: bold;">Department: </label>
												<select class="form-select dropdown-group" name="examination1" id="examination1">
													<option value="0">-- Select department --</option>
													<option value="1">Department 1</option>
													<option value="2">Department 2</option>
													<option value="3">Department 3</option>
													<option value="4">Department 4</option>
												</select>
											</fieldset>
											<fieldset class="form-group">
												<label for="examination2" class="form-label" style="font-weight: bold;">Examination: </label>
												<select class="form-select dropdown-group" name="examination2" id="examination2">
													<option value="0">-- Select Service --</option>
													<option value="1">Exam 1</option>
													<option value="2">Exam 2</option>
													<option value="3">Exam 3</option>
													<option value="4">Exam 4</option>
			
												</select>
											</fieldset>
											<div class="form-group ms-1">
												<div class="form-check">
													<div class="checkbox">
														<input type="checkbox" name="examCheckbox1" id="customCheck1" class="form-check-input" data-initial-value="0" onclick="toggleExamSelector(this)" >Custom Examination
													</div>
												</div>
											</div>
										</div>
										<div class="col-8">
											<span style="font-weight: bold;">Result: </span>
											<div class="c-dflx me-3">
												<textarea name="result1" id="result1" class="form-control" placeholder="Result from examination" style="border-right:none;"></textarea>
											</div>
										</div>
									</div>
									
									<div style="text-align: right;">
										<i class="bi bi-plus-circle-fill me-3" style="color: #435ebe; font-size: 40px; cursor: pointer;" id="plusIcon"></i>
									</div>
									
							        
						        </div>
						        <hr>
						        <div class="col-12">
						            <div class="mb-2">
						                <span style="font-weight: bold;">Treatment: </span>
						                <textarea name="treatment" id="treatment" class="form-control" placeholder="Medical treatment data" style="border-right:none;"></textarea>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Prescription: </span>
						                <textarea name="prescription" id="prescription" class="form-control" placeholder="Prescription data" style="border-right:none;"></textarea>
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
								<div class="form-group datetimepick">
									<div class="row">
										<div class="col-4 justify-content-between">
											<label for="startDate">Date</label>&nbsp; <input type="date"
												maxlength="50" name="startDate" id="startDate"
												class="form-control me-3" placeholder="Start Date" value="" />
										</div>
									</div>
								</div>

								<div class="col-12 d-flex justify-content-center">
									<a href="${pageContext.request.contextPath}/Patient/patientHistory"
										class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
									<button type="submit" class=" c-btn btn btn-primary"
										id="saveData">Save</button>

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
			$('.datetimepick').hide();
			$('.dropdown-group').select2({
		    });
		});
		
		
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	
		$('#plusIcon').on('click', function(){
			$('#plusIcon').parent().before('<div class="row mb-3" id="examBox1"><div class="col-4"><fieldset class="form-group"><label for="examination1" class="form-label" style="font-weight: bold;">Department: </label><select class="form-select dropdown-group" name="examination1" id="examination1"><option value="0">To be selected from services</option><option value="1">Exam 1</option></select></fieldset><fieldset class="form-group"><label for="examination2" class="form-label" style="font-weight: bold;">Examination: </label><select class="form-select dropdown-group" name="examination2" id="examination2"><option value="0">To be selected from services</option><option value="1">Exam 1</option></select></fieldset><div class="form-group ms-1"><div class="form-check"><div class="checkbox"><input type="checkbox" name="examCheckbox1" id="customCheck1" class="form-check-input" data-initial-value="0" onclick="toggleExamSelector(this)" >Custom Examination</div></div></div></div><div class="col-8"><span style="font-weight: bold;">Result: </span><div class="c-dflx me-3"><textarea name="result1" id="result1" class="form-control" placeholder="Result from examination" style="border-right:none;"></textarea><i class="bi bi-trash-fill ms-5" style="color: #ed3b7d; font-size:20px; cursor: pointer;" id="deleteExam1" onclick="deleteExam(this)"></i></div></div></div>');
			$('.dropdown-group').select2({
		    });
		});
		
		
		function toggleExamSelector(x){
			var initialDataVal = $(x).attr("data-initial-value");
			var fieldSelector = $(x).parent().parent().parent().prev();
			var fieldSelector2 = $(x).parent().parent().parent().prev().prev();
			
			$(fieldSelector).toggle();
			$(fieldSelector2).toggle();
			
			if(initialDataVal==0){
				$(x).parent().after('<div class="form-group"><textarea type="text" name="note" id="note" class="form-control" placeholder="Custom examination" value="" /></div>');
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