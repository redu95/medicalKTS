<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>BannersHallmark | Add Users</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Add Users</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="box box-info">
				<div class="overlay" id="loading_overlay" style="display: none;">
					<i class="fa fa-refresh fa-spin"></i>
				</div>
				<div class="container">
					<!-- Horizontal Form -->
					<form:form class="form-horizontals" method="post" id="user_form"
						name="user_form" action="addNewUsers" modelAttribute="users">
						<div class="container">
							<div class="row centered-form">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="panel panel-default">
									<div class="panel-body">

											<div class="row">
												<div class="col-4">
													<div class="col-xs-12 col-sm-12 col-md-4">
														<div class="form-group">
															<label for="firstname">First Name</label>
														</div>

														<div class="form-group">
															<form:input type="text" maxlength="50" name="firstname"
																id="firstname" path="firstname" class="form-control"
																placeholder="First Name " value="" required="true" />
														</div>
													</div>
												</div>

												<div class="col-4">
													<div class="col-xs-12 col-sm-12 col-md-4">
														<div class="form-group">
															<label for="lastname">Last Name</label>
														</div>

														<div class="form-group">
															<form:input type="text" maxlength="50" name="lastname"
																id="lastname" path="lastname" class="form-control"
																placeholder="Last Name" value="" required="true" />
														</div>
													</div>
												</div>

												<div class="col-4">
													<div class="col-xs-12 col-sm-12 col-md-4">
														<div class="form-group">
															<label for="vendorName">Email</label>
														</div>

														<div class="form-group">
															<form:input type="email"  name="email"
																id="email" path="email" class="form-control"
																placeholder="email" value="" required="true" />
														</div>
													</div>
												</div>
											
											</div>

	                                     <%--start--%>

											<div class="row">
												<div class="col-4">
													<div class="col-xs-12 col-sm-12 col-md-4">
														<div class="form-group">
															<label for="addressLine1">Address</label>
														</div>

														<div class="form-group">
															<form:input type="text" maxlength="250"
																name="addressLine1" id="addressLine1"
																path="addressLine1" class="form-control"
																placeholder="Address Line 1" value="" />
														</div>
													</div>
												</div>

												<div class="col-4">
													<div class="col-xs-12 col-sm-12 col-md-4">
														<div class="form-group">
															<label for="addressLine2"></label>
														</div>

														<div class="form-group">
															<form:input type="text" maxlength="250"
																name="addressLine2" id="addressLine2"
																path="addressLine2" class="form-control"
																placeholder="Address Line 2" value="" />
														</div>
													</div>
												</div>
												<div class="col-4">
													<div class="col-xs-12 col-sm-12 col-md-4">

														<div class="form-group">
															<label for="addressLine3"></label>
														</div>

														<div class="form-group">
															<form:input type="text" maxlength="250"
																name="addressLine3" id="addressLine3"
																path="addressLine3" class="form-control"
																placeholder="Address Line 3" value="" />
														</div>
													</div>
												</div>
											</div>



	                                            <%--start--%>

											<div class="row">
											
											
											  <div class="col-4">
											    <div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="country">Country</label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="country" id="country"
															path="country" class="form-control" placeholder="Country"
															value="">
															<form:option value="USA">USA</form:option>
															<form:option value="India">India</form:option>
															<form:option value="Germany">Germany</form:option>
														</form:select>
													</div>
												</div>
												</div>
											
											 <div class="col-4">
												   
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="city">City</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" maxlength="50" name="city"
															id="city" path="city" class="form-control"
															placeholder="City" value="" />
													</div>
												</div>
												</div>
												
												
                                                <div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="zipCode">Zip Code</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" maxlength="10" name="zipCode"
															id="zipCode" path="postalCode" class="form-control"
															placeholder="Postal Code" value="" />
													</div>
												</div>
												</div>
 
											</div>

											<%--start--%>

											<div class="row">
                                  
											 <div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="repPhoneNumber">Phone Number</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" maxlength="20"
															name="phoneNumber" id="phoneNumber"
															path="phoneNumber" class="form-control"
															placeholder=" Phone Number" value="" />
													</div>
												</div>
												</div>
												
											<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="role">Role </label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="role" id="role"
															path="role.id" class="form-control" 
															value="">
															<form:option value="">--Select Role--</form:option>

															<c:forEach items="${role}" var="role">
																<form:option value="${role.id}">${role.name}</form:option>
															</c:forEach>


														</form:select>
													</div>
												</div>
												</div> 
												
											</div>
										</div>
										<div class="box-footer">
											<a href="${pageContext.request.contextPath}/users/usersData"
												class="btn btn-warning">Cancel / Back</a>
											<button type="submit" id="saveForm" class="btn btn-info pull-right">Save</button>
												
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</form:form>
				</div>
				<!-- /.box -->
			</div>
		</div>
	</section>
	<script>
	
	
	
		
	</script>



</body>
</html>