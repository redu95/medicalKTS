<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Patient Medical History</title>
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
	</style>
</head>
<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">
			<div class="page-heading">

				<div class="page-title mb-3">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Patient History</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/users/usersData">
											Users</a></li>
									<li class="breadcrumb-item active" aria-current="page">Patient History</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
						<c:forEach items="${allexamination}" var="allexaminationLoop" varStatus="loop">
						<div class="card tp-inpt">
							<div class="card-body">
								<div class="card">
									<h4>Appointment Info</h4>
										<div class="row mt-1">
											<div class="col-3">
									            <div class="c-dflx">
									                <div class="title"><span style="font-weight: bold;">Date: </span>${medicalHistory[loop.index].extraNote}</div>
									            </div>
									        </div>
									        <div class="col-3">
									            <div class="c-dflx">
									                <div class="title"><span style="font-weight: bold;">Assigned By: </span>${medicalHistory[loop.index].assignedBy}</div>
									            </div>
									        </div>
									        <div class="col-6">
									            <div class="c-dflx">
									                <div class="title"><span style="font-weight: bold;">Assigned To: </span>${medicalHistory[loop.index].assignedTo}</div>
									            </div>
									        </div>
										</div>
								</div>
								<div class="row" id="row4">
									<h4>Appointment Details</h4>
									 <c:forEach items="${allexaminationLoop}" var="examinationData">
										 <c:choose>
		 								         <c:when test = "${ empty examinationData.medicService.departmentName}">
										           <div class="col-12 mb-3">
												    	<div class="mb-2 c-dflx">
												    		<span style="font-weight: bold;">Department: <span  style="font-weight: 500;">Custom Department</span> </span>
												    	</div>
												    	<div class="c-dflx">
											        		<span style="font-weight: bold;">Service: <span  style="font-weight: 500;">Custom Service</span> </span>
															<span style="font-weight: bold; background: transparent; color: gray; border-radius: 20px; padding-top: .175rem; padding-bottom: .175rem;" class="unpaid btn btn-secondary">Custom </span>
														</div>
											        </div>
											         <hr>
										         </c:when>
										         
										         <c:otherwise>
										           <div class="col-12 mb-3">
												    	<div class="mb-2 c-dflx">
												    		<span style="font-weight: bold;">Department: <span  style="font-weight: 500;">${examinationData.medicService.departmentName}</span> </span>
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
											        </div>
											         <hr>
										         </c:otherwise>
										      </c:choose>
										
							        </c:forEach>
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
		$(document).ready(function(){
			$('.checkAll').prop('checked', true);
			$('.dropdown-group').select2({
		    });
		});
		
		
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
		
		function showVal(x) {
			console.log(x);
		}
	</script>
</body>
</html>