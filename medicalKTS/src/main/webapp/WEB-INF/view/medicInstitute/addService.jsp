<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Add Service</title>
	<style>
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
							<h3>Add Services</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/Institute/serviceData">
											Items</a></li>
									<li class="breadcrumb-item active" aria-current="page">Add
										Services</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" method="post" id="user_form"
						onsubmit="saveForm()" name="user_form" action="addServiceData"
						modelAttribute="service">
						<%@ include file="../common/error-and-success-message.jsp"%>

						<div class="card tp-inpt">
							<div class="card-body">

								<div class="row">
									<div class="col-8">
										<div class="form-group">
											<label for="serviceName">Service Name</label>
											<form:input type="text" maxlength="50" name="serviceName"
												id="serviceName" path="serviceName" class="form-control"
												placeholder="Enter Service Name " value="" required="true" />
										</div>
									</div>
									<div class="col-2">
										<div class="form-group">
											<label for="price">Price</label>
											<form:input type="number" maxlength="50" name="price"
												id="price" path="price" class="form-control"
												placeholder="ETB" value="" required="true" />
										</div>
									</div>
									<div class="col-2">
										<div class="form-group">
											<label for="measurmentUnit">Measurement Unit</label>
											<form:select type="text" name="measurmentUnit" id="measurmentUnit"
												path="measurmentUnit" class="form-select" placeholder="measurmentUnit"
												value="">
												<form:option value="Unit">Per Unit</form:option>
												<form:option value="Kg">Per KG</form:option>
												<form:option value="Liter">Per Liter</form:option>
												<form:option value="KM">Per KM</form:option>
											</form:select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="serviceDescription">Description</label>
											<form:textarea type="text" name="serviceDescription" rows="3"
												id="serviceDescription" path="serviceDescription" class="form-control"
												placeholder="Add Description" value="" required="true" />
										</div>
									</div>
									
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="departmentName">Department</label>
											<form:select type="text" name="departmentName" id="departmentName"
												path="departmentName" class="form-select" placeholder="itemType"
												value="">
												<form:option value="">-- Select Department --</form:option>
												<c:forEach items="${departments}" var="departments">
													<option value="${departments.departmentName}">${departments.departmentName}</option>
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label for="servictType">Service Type</label>
											<form:select type="text" name="servictType" id="servictType"
												path="servictType" class="form-select" placeholder="servictType"
												value="">
												<form:option value="">-- Select Type --</form:option>
												<form:option value="Common">Common Service</form:option>
												<form:option value="Labratory">Lab Service</form:option>
											</form:select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<a href="${pageContext.request.contextPath}/Institute/medicItems"
									class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
								<button type="submit" class=" c-btn btn btn-primary"
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
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
		
		$(document).ready(function(){
			$('.datetimepick').hide();
		});
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	</script>
</body>
</html>