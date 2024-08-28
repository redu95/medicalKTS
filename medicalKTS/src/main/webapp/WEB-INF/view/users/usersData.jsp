<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>All Users</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Users</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Users
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                    	<%@ include file="../common/error-and-success-message.jsp" %>  
                       <div class="eror-msg" style="display: none;">
							<div class="card">
								<div class="card-body success-msg" id="msgBoxBg">
									<p class="" id="msgBox"></p>
									<a class="delete-msg btn btn-light">X</a>
								</div>
							</div>
						</div>
                       	<div class="row">
							<div class="col-6 col-sm-5">
								<div class="input-group">
									<input type="text" name="poSearchValue" id="poSearchValue"
										class="form-control" onkeyup="showCancelIcon()"
										placeholder="Search here" value="" style="border-right: none;" />
									<div class="input-group-append cancelIcon"
										style="background-color: white; border: 1px solid #dce7f1;"
										onclick="clearSearch()">
										<span class="input-group-text"
											style="background-color: white; border: none;"> <i
											class="bi bi-x-square"
											style="background-color: white; border: none; color: red; margin-top: 4px;"></i>
										</span>
									</div>
								</div>
							</div>
	
							<div class="col">
								<a class="btn btn-primary" onclick="searchHandler()"> <i class="bi bi-search"></i>
								</a>
							</div>
							<div class="col-4 ig-dflx">
								<a href="#" id="newUsersBtnOriginal" class="btn btn-primary">  <i class="bi bi-credit-card-2-back "></i> New User</a>
							</div>
	
						</div>
						<hr>

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped" >
                                    <thead>
                                        <tr style="background-color: #D9DFF2;">
                                            <th>Name</th>	
                                            <th>Phone</th>	
                                            <th>Department</th>	
											<th>Email</th>
											<th>Address</th>
											<th>Role</th>
										    <th width="10%">Action</th>		
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="users" items="${users}">
											<tr>
												<td>${users.firstname} ${users.lastname}</td>
												<td>${users.phoneNumber}</td>
												<td>Reception</td>
												<td>${users.email}</td>
												<td>${users.addressLine1}</td>
												<td>${users.role.name}</td>
											    <td class="td-actions">
					                                <div class="action-buttons">
					                                   <a class="" title="Edit" onClick="loadUsersdata(${users.id})" href="#">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                   	<a class="" title="Edit" href="${pageContext.request.contextPath}/users/downloadFile?id=${users.id}">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-eye"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersgh/1" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                                
											</tr>
										</c:forEach>
                                    </tbody>
                                </table>


                            </div>
                          </div>

                        </div>
                        <!-- Add Users Modal -->
                        <div class="modal fade" id="newUsersModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="newUsersModalLabel" aria-hidden="true">
				        <div class="modal-dialog modal-lg" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="newUsersModalLabel">Register New User</h5>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModalView()">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body">
				                	<form:form class="form-horizontals" method="post" id="user_form"
										onsubmit="saveForm()" name="user_form" action="addNewUsers"
										modelAttribute="user" enctype="multipart/form-data"
										>
										<%@ include file="../common/error-and-success-message.jsp"%>
				
										<div class="card tp-inpt">
											<div class="card-body">
				
												<div class="row" id="row1">
													<div class="col-md-4 col-12">
														<div class="form-group">
															<label for="firstname">First Name</label>
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
												
												<div class="row" id="row3">
													<div class="col-md-4 col-12">
														<div class="form-group">
															<label for="role">Institute</label>
															<form:select type="text" required="true" name="role"
																id="role" path="role.id" class="form-select" value="" disabled="true">
																<form:option value="">ADDIS HOSPITAL</form:option>
															</form:select>
														</div>
													</div>
													<div class="col-md-4 col-12">
														<div class="form-group">
															<label for="role">Department</label>
															<form:select type="text" required="true" name="role"
																id="role" path="role.id" class="form-select" value="">
																<form:option value="">--Select Department--</form:option>
																<c:forEach items="${departments}" var="departments">
																	<form:option value="${departments.departmentName}">${departments.departmentName}</form:option>
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
													
													<div class="col-md-4 col-12">
														<div class="form-group">
															<label for="file" class="form-label">User Profile</label>
															<input type="file" name="file" id="file" class="form-control" value=""  />
			
														</div>
													</div>
				
												</div>
											</div>
										</div>
				
										<div class="row">
											<div class="col-12 d-flex justify-content-center">
												<a href="${pageContext.request.contextPath}/users/usersData"
													class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
												<button type="submit" class=" c-btn btn btn-primary"
													id="saveData">Save</button>
											</div>
										</div>
									</form:form>
				                </div>
				               
				            </div>
				        </div>
				    </div>

						<!-- Edit User Modal -->	
						<div class="modal fade" id="editUsersModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="editUsersModalLabel" aria-hidden="true">
					        <div class="modal-dialog modal-lg" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="newUsersModalLabel">Edit  User</h5>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModalViewE()">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
					                </div>
					                <div class="modal-body">
					                	<form:form class="form-horizontals" method="post" id="edit_form"
											onsubmit="saveForm()" name="edit_form" action="${pageContext.request.contextPath}/users/updateUsers"
											modelAttribute="userEdit">
											<form:input type="hidden" path="id" />
											
											
					
											<div class="card tp-inpt">
												<div class="card-body">
					
													
													<div class="row" id="row1">
														<div class="col-md-4 col-12">
															<div class="form-group">
																<label for="firstname">First Name</label>
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
													
													<div class="row" id="row3">
														<div class="col-md-4 col-12">
															<div class="form-group">
																<label for="role">Institute</label>
																<form:select type="text" required="true" name="role"
																	id="role" path="role.id" class="form-select" value="" disabled="true">
																	<form:option value="">ADDIS HOSPITAL</form:option>
																</form:select>
															</div>
														</div>
														<div class="col-md-4 col-12">
															<div class="form-group">
																<label for="role">Department</label>
																
																<form:select type="text" required="true" name="role"
																	id="role" path="role.id" class="form-select" value="">
																	<form:option value="">--Select Department--</form:option>
																	<c:forEach items="${departments}" var="departments">
																		<form:option value="${departments.departmentName}">${departments.departmentName}</form:option>
																	</c:forEach>
																</form:select>
															</div>
														</div>
													
														<div class="col-md-4 col-12" style="visibility: hidden;">
															<div class="form-group">
																<label for="id">Id</label>
																<form:input type="text" name="id"
																	id="id" path="id" class="form-control"
																	placeholder="" value="" required="true" />
															</div>
														</div>
														
														
													</div>
												
												</div>
					
					
													
											</div>
											
					
											<div class="row mb-3">
												<div class="col-12 d-flex justify-content-center">
													<a href="${pageContext.request.contextPath}/users/usersData"
														class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
													<button type="submit" class=" c-btn btn btn-primary"
														id="saveData">Save</button>
												</div>
											</div>
										</form:form>
								    </div>
					            </div>
					               
					        </div>
					    </div>
					                            
                    </section>
                
                </div>
            </div>
        </div>


   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
   	<script>
		$(document).ready(function(){
			$('.cancelIcon').hide();
		});
		
		$("#newUsersBtnOriginal").click(function(){
			$("#newUsersModal").modal('show');
		});
		
		function loadUsersdata(userId){
			console.log(userId)
			$.ajax({
                url: '${pageContext.request.contextPath}/users/getUsersDetails/' + userId,
                type: 'GET',
                dataType: 'json',
                success: function (users) {
                    // Populate the modal form fields with the department data
                    $('#edit_form').find('#id').val(users.id);
                    $('#edit_form').find('#firstname').val(users.firstname);
                    $('#edit_form').find('#lastname').val(users.lastname);
                    $('#edit_form').find('#email').val(users.email);
                    $('#edit_form').find('#addressLine1').val(users.addressLine1);
                    $('#edit_form').find('#phoneNumber').val(users.phoneNumber);
                    $('#edit_form').find('#role').val(users.role.id);
                    $('#edit_form').find('#addressLine1').val(users.addressLine1);
                    $('#edit_form').find('#addressLine1').val(users.addressLine1);
                    $('#edit_form').find('#departmentId').val(users.departmentId);
                    
                    
                	
                    // Show editUsersModal modal
                    $('#editUsersModal').modal('show');
                },
                error: function (xhr, status, error) {
                    // Handle error
                    alert('An error occurred while fetching Users details: ' + error);
                }
            });
		}
		
		function closeModalView(){
				$('#newUsersModal').modal('hide');
			};
			
		function closeModalViewE(){
			$('#editUsersModal').modal('hide');
		};
		function checkPasswordMatch() {
			var newpassword = $("#createpassword").val();
			var confirmPassword = $("#confirmpassword").val();
			if (newpassword != confirmPassword)
				$("#show").text("Passwords does not match!");
			else
				$("#show").text("Passwords match.");
		}
		$(document).ready(function() {
			$("#confirmpassword").keyup(checkPasswordMatch);
		});
		
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
   	</script>

</body>
</html>