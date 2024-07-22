<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Departments</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Departments</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Departments
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
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
								<a href="${pageContext.request.contextPath}/Institute/addDepartment" class="btn btn-primary">  <i class="bi bi-credit-card-2-back "></i> New Department</a>
							</div>
	
						</div>
						<hr>

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped">
                                    <thead>
                                        <tr style="background-color: #D9DFF2;">
                                            <th>Name</th>		
											<th>Description</th>
											<th>Dept.Head</th>
											<th>Total stuff</th>
											<th>Registered services</th>
											<th>Extra Note</th>
										    <th width="10%">Action</th>		
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	 <c:forEach var="departments" items="${departments}">
											<tr>
												<td>${departments.departmentName}</td>
												<td>${departments.description}</td>
												<td>${departments.departmentHead}</td>
												<td>${departments.stuffNumber}</td>
												<td>${departments.registeredServices}</td>
												<td>${departments.extraNote}</td>
											    <td class="td-actions">
					                                <div class="action-buttons">
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/Institute/editDepartment/${departments.id}">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="#" onclick="deleteDept(${departments.id})" id="removeDept">
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
                    </section>
                </div>
            </div>
        </div>


   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
   	<script>
	   	$(document).ready(function(){
			$('.cancelIcon').hide();
		});
	   	
	   	function deleteDept(id){
	   		confirm('Are you sure to delete?')
	   		$.ajax({
				url: '${pageContext.request.contextPath}/Institute/deleteDepartment/'+id,
				success : function(response) {
					window.location.reload();
				}
			});
	   	}
   	</script>

</body>
</html>