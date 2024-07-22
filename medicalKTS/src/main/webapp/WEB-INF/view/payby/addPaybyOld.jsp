<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>BannersHallmark | Add ItemGroup</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Add Pay By</h1>
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
						name="user_form" action="addNewPayby" modelAttribute="payby">
						<div class="container">
							<div class="row centered-form">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="panel panel-default">
										<!-- <div class="panel-heading">
                                        <h3 class="panel-title">Edit Admin Role </h3>
                                    </div> -->
										<div class="panel-body">
											<div class="row">
											<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="paybyName">Pay by</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" name="paybyName" id="paybyName"
															path="paybyName" class="form-control"
															placeholder="pay by" value="" required="true"/>
													</div>
												</div>																							
											</div>
			                                </div>
										</div>
										<div class="box-footer">
											<a href="${pageContext.request.contextPath}/payby/paybyData" class="btn btn-warning">Cancel /
												Back</a>
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

</body>

 


</html>