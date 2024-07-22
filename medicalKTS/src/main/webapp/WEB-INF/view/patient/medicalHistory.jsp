<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Patient History</title>
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
    
		.activeTab {
			 background-color: #D9DFF2;
		}
		.passiveTab {
			 background-color: #f5f6f7;
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
							<h3>Patient Information and Historyyyyy</h3>
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
						                <div class="title"><span style="font-weight: bold;">Name: </span>${medicalHistory[0].patientData.name} ${medicalHistory[0].patientData.lastName}</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Tel: </span>${medicalHistory[0].patientData.phoneNumber}</div>
						            </div>
						        </div>
						        <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Reg Date: </span>${medicalHistory[0].extraNote}</div>
						            </div>
						        </div>
						       
							</div>
							<div class="row">
								<div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Age: </span>${medicalHistory[0].patientData.age}</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Sex: </span>${medicalHistory[0].patientData.sex}</div>
						            </div>
						        </div>
						         <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Address: </span>${medicalHistory[0].patientData.address}</div>
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
					
					 
					<!-- 
						<div class="c-dflx mb-4" style="align-items: baseline;">
						<h5 style="opacity: 0.7;">Patient History</h5>
						 <a href="${pageContext.request.contextPath}/Patient/recordMedicHistory" class="btn btn-primary"> <i class="bi bi-credit-card-2-back "></i> Register New History</a>
					</div>
					 -->
					<div class="card mb-2">
						<div class="row">
							<div class="card-body">
								<div class="col-12">
									<ul class="nav nav-pills nav-fill">
										<li class="nav-item"><a class="nav-link activeTab" id="tab1"
											href="#" style="color: #435EBE; font-weight: bold;"> All
										</a></li>
										<li class="nav-item"><a class="nav-link passiveTab" id="tab2"
											href="#" style="color: #435EBE; font-weight: bold;"> Examination
										</a></li>
										<li class="nav-item"><a class="nav-link passiveTab" id="tab3"
											href="#" style="color: #435EBE; font-weight: bold;"> Treatment
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<c:forEach items="${medicalHistory}" var="medicalHistory" varStatus="loop">
							
					<div class="card">
						<div class="row">
							<div class="card-body">
								
								 <div class="col-12 mb-4">
						           
						            <div class="mb-4 me-3 c-dflx">
						                <span style="font-weight: bold; opacity: 0.8; font-size: 20px;">Examination record: ${medicalHistory.extraNote}</span>
						                 <a href="${pageContext.request.contextPath}/Patient/editMedicHistory/${medicalHistory.id}" class="btn btn-primary" style="background: transparent; color:blue; border: 1.5px solid; width:110px;"><i class="bi bi-pencil ms-3"></i>Edit</a>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Chief Complaint: </span><span class="border-bottom">${medicalHistory.cheifCompliant}</span>
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Past Medical History: </span><span class="border-bottom">${medicalHistory.pastMedicalHistory}</span> 
						            </div>
						            <div class="mb-2">
						                <span style="font-weight: bold;">Present Medical Status: </span><span class="border-bottom">${medicalHistory.presentStatus}</span>
						            </div>
								</div>
								<hr>
								<c:forEach items="${examinationData[loop.index]}" var="examinationData2">
									<div class="col-12">
								    	<div class="mb-2">
								        	<span style="font-weight: bold;">Examination: </span><span class="border-bottom">${examinationData2.examination}</span>
								        </div>
								        <div class="mb-2">
								            <span style="font-weight: bold;">Result: </span><span class="border-bottom">${examinationData2.result}</span>
								        </div>
							        </div>
							     </c:forEach>
								
						        <div class="col-12 mt-5">
						            <div class="mb-2">
						                <span style="font-weight: bold;">Treatment: </span><span class="border-bottom">${medicalHistory.treatement}</span>
						            </div>
						             <div class="mb-2">
						                <span style="font-weight: bold;">Prescription: </span><span class="border-bottom">${medicalHistory.prescription}</span>
						            </div>
								</div>
					    </div>
					</div>
				</div>	
					</c:forEach>
						
					  
				</section>
			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
		
	<script>
	$('#tab1').on('click', function() {
		if ($(this).hasClass('passiveTab')) {
			
	        $(this).removeClass('passiveTab');
	        $(this).addClass('activeTab');

	        $('#tab2').removeClass('activeTab');
	        $('#tab3').removeClass('activeTab');
	        $('#tab2').addClass('passiveTab');
	        $('#tab3').addClass('passiveTab');
	        
	        $('#cirTab1').removeClass('circleNum2');
	        $('#cirTab1').addClass('circleNum');
	        
	        $('#cirTab2').removeClass('circleNum');
	        $('#cirTab3').removeClass('circleNum');
	        $('#cirTab2').addClass('circleNum2');
	        $('#cirTab3').addClass('circleNum2');
	        
	    }
	});
	
	$('#tab2').on('click', function() {
		if ($(this).hasClass('passiveTab')) {
			
	        $(this).removeClass('passiveTab');
	        $(this).addClass('activeTab');

	        $('#tab1').removeClass('activeTab');
	        $('#tab3').removeClass('activeTab');
	        $('#tab1').addClass('passiveTab');
	        $('#tab3').addClass('passiveTab');
	        
	        $('#cirTab2').removeClass('circleNum2');
	        $('#cirTab2').addClass('circleNum');
	        
	        $('#cirTab1').removeClass('circleNum');
	        $('#cirTab3').removeClass('circleNum');
	        $('#cirTab1').addClass('circleNum2');
	        $('#cirTab3').addClass('circleNum2');
	        
	    }
	});

	$('#tab3').on('click', function() {
		if ($(this).hasClass('passiveTab')) {
			
	        $(this).removeClass('passiveTab');
	        $(this).addClass('activeTab');

	        $('#tab1').removeClass('activeTab');
	        $('#tab2').removeClass('activeTab');
	        $('#tab1').addClass('passiveTab');
	        $('#tab2').addClass('passiveTab');
	        
	        $('#cirTab3').removeClass('circleNum2');
	        $('#cirTab3').addClass('circleNum');
	        
	        $('#cirTab1').removeClass('circleNum');
	        $('#cirTab2').removeClass('circleNum');
	        $('#cirTab1').addClass('circleNum2');
	        $('#cirTab2').addClass('circleNum2');
	        
	    }
	});
	</script>

</body>
</html>