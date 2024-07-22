<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Institute</title>
</head>
<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">



			<div class="page-heading">

				<div class="page-title mb-5">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Add Institute</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/users/usersData">
											Users</a></li>
									<li class="breadcrumb-item active" aria-current="page">Add Institute</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" method="post" id="user_form"
						onsubmit="saveForm()" name="user_form" action="addNewUsers"
						modelAttribute="users">
						<%@ include file="../common/error-and-success-message.jsp"%>

						<div class="card tp-inpt">
							<div class="card-body">

								<div class="row" id="row1">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="firstname">Name</label>
											<form:input type="text" maxlength="50" name="firstname"
												id="firstname" path="firstname" class="form-control"
												placeholder="First Name " value="" required="true" />
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="lastname">Last Name</label>
											<form:input type="text" maxlength="50" name="lastname"
												id="lastname" path="lastname" class="form-control"
												placeholder="Last Name" value="" required="true" />
										</div>
									</div>

									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="email">Email</label>
											<form:input type="email" name="email" id="email" path="email"
												class="form-control" placeholder="email" value=""
												required="true" />
										</div>
									</div>
								</div>


								<div class="row" id="row2">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="addressLine1">Address</label>
											<form:input type="text" maxlength="250" name="addressLine1"
												id="addressLine1" path="addressLine1" class="form-control"
												placeholder="Address Line 1" value="" />
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="addressLine2"></label>
											<form:input type="text" maxlength="250" name="addressLine2"
												id="addressLine2" path="addressLine2" class="form-control"
												placeholder="Address Line 2" value="" />
										</div>
									</div>

									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="addressLine3"></label>
											<form:input type="text" maxlength="250" name="addressLine3"
												id="addressLine3" path="addressLine3" class="form-control"
												placeholder="Address Line 3" value="" />
										</div>
									</div>
								</div>


								<div class="row" id="row3">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="country">Country</label>
											<form:select type="text" name="country" id="country"
												path="country" class="form-select" placeholder="Country"
												value="">
												<form:option value="USA">USA</form:option>
												<form:option value="India">India</form:option>
												<form:option value="Germany">Germany</form:option>
											</form:select>
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="city">City</label>
											<form:input type="text" maxlength="50" name="city" id="city"
												path="city" class="form-control" placeholder="City" value="" />
										</div>
									</div>


									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="state">State</label>
											<form:input type="text" maxlength="50" name="state"
												id="state" path="state" class="form-control"
												placeholder="State" value="" />
										</div>
									</div>


								</div>


								<div class="row" id="row4">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="zipCode">ZIP</label>
											<form:input type="text" maxlength="10" name="zipCode"
												id="zipCode" path="postalCode" class="form-control"
												placeholder="Postal Code" value="" />
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="country">Phone</label>
											<form:input type="text" maxlength="20" name="phoneNumber"
												id="phoneNumber" path="phoneNumber" class="form-control"
												placeholder=" Phone Number" value="" />
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="role">Role</label>
											<form:select type="text" required="true" name="role"
												id="role" path="role.id" class="form-select" value="">
												<form:option value="">--Select Role--</form:option>

												<c:forEach items="${role}" var="role">
													<form:option value="${role.id}">${role.name}</form:option>
												</c:forEach>


											</form:select>
										</div>
									</div>


								</div>

								<div class="row" id="row4">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="username">Username</label>
											<form:input type="text" maxlength="10" name="zipCode"
												id="username" path="username" class="form-control"
												placeholder="User Name" value="" required="true" />
										</div>
									</div>
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="createpassword">Password</label>
											<form:input type="password" maxlength="20"
												name="createpassword" id="createpassword" path="password"
												class="form-control" placeholder="Password " value=""
												required="true" />
										</div>
									</div>

									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="confirmpassword">Confirm Password</label>
											<form:input type="password" maxlength="20"
												name="confirmpassword" id="confirmpassword" path=""
												class="form-control" placeholder=" Confirm Password "
												value="" required="true" />
											<p class="text-danger" id="show"></p>

										</div>
									</div>

								</div>

								<div class="row" id="row5">
									<div class="col-md-4 col-12">
										<div class="form-group">
											<label for="site">Store</label>
											<form:select type="text" name="site" id="site"
												path="store.id" class="form-select" value="">
												<form:option value="">--Select Store--</form:option>

												<c:forEach items="${stores}" var="store">
													<form:option value="${store.id}">${store.storeName}</form:option>
												</c:forEach>

											</form:select>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<button type="submit" class=" c-btn btn btn-primary me-3 mb-1"
									id="saveData">Save</button>
								<a href="${pageContext.request.contextPath}/users/usersData"
									class="c-btn btn btn-danger  mb-1">Cancel</a>

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
	</script>
</body>
</html>