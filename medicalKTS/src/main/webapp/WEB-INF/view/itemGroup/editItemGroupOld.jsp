<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>BannersHallmark | Edit ItemGroup</title>
</head>
<body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Edit ItemGroup</h1>
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
						name="user_form" action="${pageContext.request.contextPath}/itemGroup/updateItemGroup" modelAttribute="itemGroup">
						<form:input type="hidden" path="id"/>
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
														<label for="name">Name</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" name="name" id="name"
															path="name" class="form-control"
															placeholder="Name" value="" required="true" readonly="true"/>
													</div>
												</div>
												</div>																							
											</div>

											<!-- Start -->

											<div class="row">
											<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="itemGroup">Item Group</label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="itemGroup" id="itemGroup"
															path="itemGroup" class="form-control"
															placeholder="Item Group" value="">
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
													</div>
												</div>
																								
											    <div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="itemGroupRepl">Item Group Repl</label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="itemGroupRepl" id="itemGroupRepl"
															path="itemGroupRepl" class="form-control"
															placeholder="Item Group Repl" value="">
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
													</div>
												</div>
												</div>
											    
											    <div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-4">
													<div class="form-group">
														<label for="itemGroupSpec">Item Group Spec</label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="itemGroupSpec" id="itemGroupSpec"
															path="itemGroupSpec" class="form-control"
															placeholder="Item Group Spec" value="">
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
													</div>
												</div>											
											</div>										
											</div>
										</div>
										<div class="box-footer">
											<a href="${pageContext.request.contextPath}/itemGroup/itemGroups" class="btn btn-warning">Cancel /
												Back</a>
											<button type="submit" id="saveForm" class="btn btn-info pull-right">Update</button>
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