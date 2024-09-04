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
						                <textarea name="chiefComplaint recordData" id="chiefComplaint" class="form-control" placeholder="Chief Complaint / CC Data" style="border-right:none;" disabled="disabled">${medicalHistory.cheifCompliant}</textarea>
						                
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Past Medical History: </span>
						                <textarea name="medicalHistory recordData" id="medicalHistory" class="form-control" placeholder="Past Medical History Data" style="border-right:none;" disabled="disabled">${medicalHistory.pastMedicalHistory}</textarea>
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Present Medical Status: </span>
						                <textarea name="presentStatus recordData" id="presentStatus" class="form-control" placeholder="Present Medical Status Data" style="border-right:none;" disabled="disabled">${medicalHistory.presentStatus}</textarea>
						            </div>
								</div>
								<hr>
								<div class="col-12">
									<h5>Examination section</h5>
									<c:forEach items="${examinationData}" var="examinationData">
										<div class="row mb-3 examBox">
											<div class="col-4">
												<!-- Department Select Box -->
												<fieldset class="form-group">
													<label for="examination1" class="form-label" style="font-weight: bold;">Department:</label>
													<select class="form-select dropdown-group regService" name="examination1" disabled="disabled">
														<option value="1">${examinationData.medicService.departmentName}</option>
													</select>
												</fieldset>
												<!-- Examination Select Box -->
												<fieldset class="form-group">
													<label for="examination2" class="form-label" style="font-weight: bold;">Examination:</label>
													<select class="form-select dropdown-group regService" name="examination2" disabled="disabled">
														<option value="0">${examinationData.examination}</option>
													</select>
												</fieldset>
												<!-- Custom Examination Checkbox -->
												<div class="form-group ms-1">
													<div class="form-check">
														<div class="checkbox">
															<input type="checkbox" name="examCheckbox1" class="form-check-input regService" data-initial-value="0" disabled="disabled" onclick="toggleExamSelector(this)">
															Custom Examination
														</div>
													</div>
												</div>
											</div>
											<div class="col-8">
												<!-- Result Textarea -->
												<span style="font-weight: bold;">Result:</span>
												<div class="c-dflx me-3">
													<textarea name="result1" class="form-control resultService regService" placeholder="Result from examination" data-id="${examinationData.id}" style="border-right:none;">${examinationData.result}</textarea>
												</div>
												<!-- File Input -->
												<div class="form-group mt-3 w-50">
													<label for="fileInput${examinationData.id}" class="form-label" style="font-weight: bold;">Upload Document (Optional):</label>
													<input type="file" class="form-control fileInput regService" id="fileInput${examinationData.id}" multiple name="fileInput${examinationData.id}" data-id="${examinationData.id}">
												</div>
											</div>
										</div>
									</c:forEach>

								</div>

								<hr>
						        <div class="col-12">
						            <div class="mb-2">
						                <span style="font-weight: bold;">Treatment: </span>
						                <textarea name="treatment" id="treatment" class="form-control" placeholder="Medical treatment data" style="border-right:none;" disabled="disabled">${medicalHistory.treatement}</textarea>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Prescription: </span>
						                <textarea name="prescription" id="prescription" class="form-control" placeholder="Prescription data" style="border-right:none;" disabled="disabled">${medicalHistory.prescription}</textarea>
						            </div>
								</div>

								<div class="col-12 d-flex justify-content-center mt-3">
									<a href="${pageContext.request.contextPath}/Patient/patientData"
										class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
									<button type="submit" class=" c-btn btn btn-primary" onclick="saveForm()"
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
			try {

				event.preventDefault();

				// Loop through each file input with class 'fileInput'
				var formData = new FormData();
				$('.fileInput').each(function() {
					var fileInput = $(this)[0]; // Get the actual DOM element
                    var ids = $(this).attr('data-id').split(',');
                    console.log('ids', ids)// Extract ID from the element's ID


                    if (fileInput && fileInput.files.length > 0) {
                        // Loop through each file selected in the input
                        for (var i = 0; i < fileInput.files.length; i++) {
                            var file = fileInput.files[i];

                            // Loop through each ID associated with this file input
                            ids.forEach(function(id) {
                                console.log('Appending file: ', file.name, ' with ID: ', id);

                                // Create an object with ID and file name
                                var fileData = {
                                    id: id,
                                    fileName: file.name
                                };

                                // Append the ID and file name as a JSON string
                                formData.append('documents', JSON.stringify(fileData));

                                // Append the actual file
                                formData.append('files', file);
                            });
                        }
                    } else {
                        console.log('No file selected for IDs: ', ids.join(', '));
                    }
				});



				// console.log("Form data is");
				// console.log(formData);
				// for (let pair of formData.entries()) {
				// 	console.log(pair[0]+ ': ' + pair[1]);
				// }
				// console.log("Form data ///////");
				document.getElementById("saveData").disabled = true;
				var invs = {};
				var invv = {};
				var invvcnt = 0;
				var invvcounter = 0;
				var customActive = 0;


				var invs2 = {};
				var invv2 = {};
				var invvcnt2 = 0;
				var invvcounter2 = 0;

                $('.resultService').each(function() {
                    var result = $(this).val(); // Get the value of the textarea
                    var idValue = $(this).attr('data-id'); // Get the ID from the data-id attribute

                    // Create an object with ID and result value
                    var resultData = {
                        id: idValue,
                        result: result
                    };

                    // Append the result data as a JSON string
                    formData.append('results', JSON.stringify(resultData));
                });


                var json = JSON.stringify(invs);
				var jsonResult = JSON.stringify(invs2);
				var medicalHistoryId = ${id};
				var scheduledHour = "";

				$('.weekDays').each(function() {
					if ($(this).attr('data-initial-value') == '1') {
						scheduledHour += $(this).attr('data-id');
					}
				});

                // Collect other parameters
                formData.append('scheduledHour', $('#scheduledHour').val());
                formData.append('cheifComplaint', $('#cheifComplaint').val());
                formData.append('pastMedicalHistory', $('#pastMedicalHistory').val());
                formData.append('presentStatus', $('#presentStatus').val());
                formData.append('treatment', $('#treatment').val());
                formData.append('prescription', $('#prescription').val());

				formData.append('json', json);
				formData.append('jsonResult', jsonResult);
				formData.append('medicalHistoryId', medicalHistoryId);

				// for (let pair of formData.entries()) {
				// 	console.log(pair[0]+ ': ' + pair[1]);
				// }



				$('.eror-msg').hide();
				$.ajax({
					type: "POST",
					url: '${pageContext.request.contextPath}/Patient/editMedicalRecordHistoryLab',
					data: formData,
					processData: false,
					contentType: false,
					success: function(response) {
						if (response == 'success') {
							window.scrollTo({ top: 0, behavior: 'smooth' });
							$('#msgBoxBg').removeClass("error-msg");
							$('#msgBoxBg').addClass("success-msg");
							$('#msgBox').text('Data entered successfully');
							console.log('success')
						} else {
							window.scrollTo({ top: 0, behavior: 'smooth' });
							$('#msgBoxBg').removeClass("success-msg");
							$('#msgBoxBg').addClass("error-msg");
							$('#msgBox').text(response);
							$('.eror-msg').show();
						}
						document.getElementById("saveData").disabled = false;
					},
					error: function(response) {
						console.log('++++ error', response);
						document.getElementById("saveData").disabled = false;
					}
				});
			} catch (e) {
				console.log('e', e);
			}
		}


		function toggleDateTime() {
			$('.datetimepick').toggle();
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