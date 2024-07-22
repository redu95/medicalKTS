<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE html>
<html>
    <head>
        <title>Banner's Hallmark | Users</title> 
  <style>
  
  
  select {
        width:180px;
        height:35px
    }
    
table.dataTable thead th, table.dataTable thead td {
	padding: 10px 18px;
	border-bottom: 1px solid #111;
}

.boxbody {
	overflow-x: scroll
}

.boxbody table thead th+th {
	min-width: 100px;
}

.boxbody table thead th+th {
	min-width: 100px;
}
</style>       
    </head>
    
	
    <body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		Users
		</h1>
		<c:if test="${not empty msg}">
			<p id="hide" style="color: red;">${msg}</p>
		</c:if>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
			
				<div class="box">
				<div class="validationMsg" style="color: red;"></div>
				<br>
                      <div class="box-header">						
						<div class="box-tools">
	                		<div class="input-group input-group-sm" style="width: 150px;">
	                		<p class="text-right"><button class="btn btn-default"><i class="fa fa-plus"></i> <a href="${pageContext.request.contextPath}/users/addUsers">New User</a></button></p>
	                	</div>
	              	</div>
					</div>
			
					<!-- /.box-header -->
					<div class="boxbody box-body table-responsive">
					
						<table id="example" class="table table-bordered table-striped">
						
							<thead>
										
			     			<tr>
									<th>Full Name</th>		
									<!-- <th>Last name</th> -->
									<th>Email</th>
									<th>Address</th>
									<th>Country</th>
									<th>City</th>
									<th>Zip Code</th>
									<th>Phone Number</th>
									<th>Role</th>
									<!-- <th>Date Changed</th> -->
								    <th>Actions</th>									
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="users" items="${users}">
									<tr>
										<td>${users.firstname} ${users.lastname}</td>
										<td>${users.email}</td>
										<%-- <td>${users.dateChanged}</td> --%>
										<td>${users.addressLine1},${users.addressLine2},${users.addressLine3}</td>
										<td>${users.country}</td>
										<td>${users.city}</td>
										<td>${users.postalCode}</td>
										<td>${users.phoneNumber}</td>
										<td>${users.role.name}</td>
										
									    <td class="td-actions">
			                                <div class="action-buttons">
			                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsers/${users.id}">
			                                   	<button  class="btn btn-primary btn-xs" ><i class="fa fa-pencil"></i></button></a>&nbsp;
			                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsers/${users.id}" id="remove">
			                                   	<button  class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></button></a>&nbsp;
			                                 </div>			                                
			                            </td>			                            
									</tr>
								</c:forEach>							
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
		</div>

	</section>
	<!-- /.content -->
	<script src="${pageContext.request.contextPath}/resources/js/modules/alert/deleteAlert.js" type="text/javascript"></script>
   
   <script>
    $(document).ready(function (){
	   	   var table = $('#example').DataTable({
	   	     'order': [[0, 'asc']]
	   	   }) 
	    	$("#hide").delay(5000).fadeOut(500);
	    }); 
	    
   	    </script>
    </body>
</html>