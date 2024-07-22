<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Add Department</title>
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
							<h3>Add Department</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/Institute/departmentsData">
											Department</a></li>
									<li class="breadcrumb-item active" aria-current="page">Add
										Department</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" method="post" id="user_form"
						onsubmit="saveForm()" name="user_form" action="addDepartmentData"
						modelAttribute="department">
						<%@ include file="../common/error-and-success-message.jsp"%>

						<div class="card tp-inpt">
							<div class="card-body">

								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="firstname">Department Name</label>
											<form:input type="text" maxlength="50" name="departmentName"
												id="departmentName" path="departmentName" class="form-control"
												placeholder="Enter Dept Name " value="" required="true" />
										</div>
									</div>
									
								</div>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="lastname">Description</label>
											<form:textarea type="text" name="description" rows="3"
												id="description" path="description" class="form-control"
												placeholder="Add Description" value="" required="true" />
										</div>
									</div>
									<div class="col-4">
										<fieldset class="form-group">
											<label for="departmentHead" class="form-label">Department head</label>
											<form:select class="form-select dropdown-group" name="departmentHead" id="departmentHead" path="departmentHead" style="width:100%;"  value="1">
												<form:option value="">-- Select Department Head --</form:option>
												<c:forEach items="${users}" var="users">
													<form:option value="${users.firstname}">${users.firstname}</form:option>
												</c:forEach>
												</form:select>
										</fieldset>
									</div>
								</div>


								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="addressLine1">Extra Note</label>
											<form:input type="text" maxlength="250" name="extraNote"
												id="extraNote" path="extraNote" class="form-control"
												placeholder="Extra Note" value="" />
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<a href="${pageContext.request.contextPath}/Institute/departmentsData"
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
			var formData = $('#user_form').serialize();
			console.log(formData);
		});
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	</script>
</body>
</html>