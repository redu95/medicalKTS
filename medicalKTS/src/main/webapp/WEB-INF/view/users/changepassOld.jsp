<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>BannersHallmark | Change Password</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Change Password</h1>
		 <h4  id="show" style="color: red;"></h4>
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
						name="user_form" action="${pageContext.request.contextPath}/users/updatepassword" modelAttribute="users">
						<form:input type="hidden" path="id" value="${sessionScope.id}"/>
							<form:input type="hidden" path="username" value="${sessionScope.userNameId}"/>
						<div class="container">
							<div class="row centered-form">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="panel panel-default">
										<!-- <div class="panel-heading">
                                        <h3 class="panel-title">Edit Admin Role </h3>
                                    </div> -->
										<div class="panel-body">
											<div class="row">
										<%-- 	<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="password">Old Password</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" name="password" id="password"
															path="password" class="form-control"
															placeholder="Old password" value="" required="true"/>
													</div>
												</div>																							
											</div> --%>
											
											
												<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="newpasssword">New  Password</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" name="password" id="newpassword"
															path="password" class="form-control"
															placeholder="New password" value="" required="true"/>
													</div>
												</div>																							
											</div>
												<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="confirmpass">Confirm Password</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" name="confirmpassword" id="confirmpassword"
															path="" class="form-control"
															placeholder=" Confirm password" value="" required="true"/>
													</div>
												</div>																							
											</div>
			                                </div>
										</div>
										<div class="box-footer">
											<a href="${pageContext.request.contextPath}/" class="btn btn-warning">Cancel /
												Back</a>
											<button type="submit" id="saveForm" class="btn btn-info pull-right">Change</button>
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
	
	
	
	<script src="${pageContext.request.contextPath}/resources/js/modules/alert/deleteAlert.js" type="text/javascript"></script>
  <script>
    function checkPasswordMatch() {
        var newpassword = $("#newpassword").val();
        var confirmPassword = $("#confirmpassword").val();
        if (newpassword != confirmPassword)
            $("#show").text("Passwords does not match!");
        else
            $("#show").text("Passwords match.");
    }
    $(document).ready(function () {
       $("#confirmpassword").keyup(checkPasswordMatch);
    });
    </script>
</body>

 





</html>