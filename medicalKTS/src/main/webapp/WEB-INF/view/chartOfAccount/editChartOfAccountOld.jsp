<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>BannersHallmark | Edit Chart Of Account</title>
</head>
<body>

<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Edit Chart Of Account</h1>
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
						name="user_form" action="${pageContext.request.contextPath}/chartOfAccount/updateChartOfAccount" modelAttribute="chartOfAccount">
						<form:input type="hidden" path="id"/>
						<form:input type="hidden" path="chartOfAccUnqId"/>
						<div class="container">
							<div class="row centered-form">
								<div class="col-xs-12 col-sm-12 col-md-12">
									<div class="panel panel-default">
										<!-- <div class="panel-heading">
                                        <h3 class="panel-title">Edit Admin Role </h3>
                                    </div> -->
										<div class="panel-body">
											<div class="row">
											<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="name">Name</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" maxlength="50" name="name" id="name"
															path="name" class="form-control"
															placeholder="Name" value="" required="true" readonly="true"/>
													</div>
												</div>
                                               </div>
                                               <div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="isActive">Is Active</label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="isActive" id="isActive"
															path="isActive" class="form-control"
															placeholder="Is Active" value="" >														
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
													</div>
												</div>											
											</div>
											</div>

											<!-- Start -->

											<div class="row">
											<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="accountNumber">Account Number</label>
													</div>
											 
													<div class="form-group">
														<form:input type="text" maxlength="7" name="accountNumber" id="accountNumber"
															path="accountNumber" class="form-control" onkeypress="return isNumberKey(event)"
															placeholder="Account Number" value="" required="true" readonly="true"/>
													</div>
												</div>
											 </div>
											 <div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="type">Type</label>
													</div>
												 
													<div class="form-group">
														<form:select type="number" name="type" id="type"
															path="type" class="form-control"
															placeholder="Type" value="" required="true"  >
															
															<c:forEach items="${accountsTypeList}" var="accountsTypeList" varStatus="status">
																<option value="${accountsTypeList.id}">${accountsTypeList.account_name}</option>
															
															
															</c:forEach>
															
															
															
														</form:select>
													</div>
												</div>	
												</div>
												<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="description">Description</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text"  maxlength="250" name="description" id="description"
																	path="description" class="form-control"
																	placeholder="Description" value=""  />
													</div>
												</div>										
											</div>
                                           </div>
											<%--start--%>

											<div class="row">
											<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="parentName">Parent Name</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" maxlength="70" name="parentName" id="parentName"
																	path="parentName" class="form-control"
																	placeholder="Parent Name" value="" />
													</div>
												</div>	
												</div>
												<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="parentAccountNumber">Parent Account Number</label>
													</div>
												 
													<div class="form-group">
														<form:input  type="text" maxlength="7" name="parentAccountNumber" id="parentAccountNumber"
																	path="parentAccountNumber" class="form-control"
																	placeholder="Parent Account Number" value=""   onkeypress="return isNumberKey(event)"/>
													</div>
												</div>																							
											</div>
											</div>
											
											<!-- start -->
											<div class="row">
											<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="category1099">Category1099</label>
													</div>
												 
													<div class="form-group">
														<form:select type="text" name="category1099" id="category1099"
																	path="category1099" class="form-control"
																	placeholder="Category1099" value="" >
															
															<form:option value="true">True</form:option>
															<form:option value="false">False</form:option>
														</form:select>
													</div>
												</div>	
												</div>
												
												<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="created">Created</label>
													</div>
												 
													<div class="form-group">
														<form:input type="date" name="created" id="created"
																	path="created" class="form-control"
																	placeholder="Created" value="" />
													</div>
												</div>																							
											</div>
											</div>
											
											<!-- start -->
											<div class="row">
											<div class="col-4">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="updated">Updated</label>
													</div>
												 
													<div class="form-group">
														<form:input type="date" name="updated" id="updated"
																	path="updated" class="form-control"
																	placeholder="Updated" value="" />
													</div>
												</div>
												</div>	
												
												<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="mergedIntoName">Merged Into Name</label>
													</div>
												 
													<div class="form-group">
														<form:input type="text" maxlength="100" name="mergedIntoName" id="mergedIntoName"
																	path="mergedIntoName" class="form-control"
																	placeholder="Merged Into Name" value="" />
													</div>
												</div>																							
											</div>
											</div>
											
											<!-- start -->
											<div class="row">
											<div class="col-6">
												<div class="col-xs-12 col-sm-12 col-md-6">
													<div class="form-group">
														<label for="mergedIntoAccountNumber">Merged Into Account   </label>
													</div>
												 
													<div class="form-group">
														<form:input type="number" name="mergedIntoAccountNumber" id="mergedIntoAccountNumber"
																	path="mergedIntoAccountNumber" class="form-control"
																	placeholder="Merged Into Account Number" value="" />
													</div>
												</div>										
																																		
											</div>										
										</div>
										<div class="box-footer">
											<a href="${pageContext.request.contextPath}/chartOfAccount/chartOfAccounts" class="btn btn-warning">Cancel /
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
<script>
	$(document).ready(function (){
		var createdDate = document.getElementById("created");
		var today = new Date();
		createdDate.value = today.toISOString().substr(0, 10);
		
		var updatedDate = document.getElementById("updated");
		var today = new Date();
		updatedDate.value = today.toISOString().substr(0, 10);
		
		function isNumberKey(evt)
	    {
	       var charCode = (evt.which) ? evt.which : evt.keyCode;
	       if (charCode < 48 || charCode > 57)
	          return false;

	       return true;
	    }
	});
</script>
</body>
</html>