<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banner's Hallmark | Roles</title>        
    </head>
    
	
    <body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Roles<!--  <small>advanced tables</small> -->
		</h1>
		<c:if test="${not empty msg}">
			<p  id="hide" style="color: red;">${msg}</p>
		</c:if>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
			
				<div class="box">
					<div class="box-header">						
						<div class="box-tools">
	                		<div class="input-group input-group-sm" style="width: 150px;">
	                		<p class="text-right"><button class="btn btn-default"><i class="fa fa-plus"></i> <a href="${pageContext.request.contextPath}/role/addRole">New Role</a></button></p>
	                	</div>
	                	 	<!-- <button  class="btn btn-danger btn-xs" onclick="populate()"><i class="fa fa-trash-o"></i> click</button>
	              	 -->
	              	</div>
					</div>
					
					<!-- /.box-header -->
					<div class="box-body table-responsive">
						<table id="example" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Role Name</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="role" items="${role}">
									<tr>
									
									
									  <td>
									  									  
									    <c:choose>
											<c:when test="${role.name eq 'ADMIN'}">
												   ${role.name}
									 				</c:when>
															<c:otherwise>		
											  <a href="${pageContext.request.contextPath}/accessPermission/getRole/${role.id}" >${role.name}</a>
									 	
														</c:otherwise>
										</c:choose>
									  
									  </td>										
										<td class="td-actions">
			                                <div class="action-buttons">
			                                
			                                <c:choose>
											<c:when test="${role.name eq 'ADMIN'}">
												 <a class="" id="hidebutton1" style="pointer-events: none" title="Edit" href="${pageContext.request.contextPath}/role/getRole/${role.id}">
			                                   	<button disabled class="btn btn-primary btn-xs" ><i class="fa fa-pencil"></i></button></a>&nbsp;
			                                					</c:when>
															<c:otherwise>		
											  <a class="" title="Edit" href="${pageContext.request.contextPath}/role/getRole/${role.id}">
			                                   	<button  class="btn btn-primary btn-xs" ><i class="fa fa-pencil"></i></button></a>&nbsp;
			                                	
															</c:otherwise>
														</c:choose>	
			                    
			                                   <c:choose>
														<c:when test="${role.name eq 'ADMIN'}">
																<a class="red"  id="hidebutton2" style="pointer-events: none" href="${pageContext.request.contextPath}/role/deleteRole/${role.id}" id="remove">
			                                   	<button  disabled  class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></button></a>&nbsp;
																</c:when>
															<c:otherwise>		
															<a class="red" href="${pageContext.request.contextPath}/role/deleteRole/${role.id}" id="remove">
			                                   	<button  class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i></button></a>&nbsp;
					
															</c:otherwise>
												</c:choose>	
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
	     
	   	   
	   	   $("#hidebutton1").hide();
	   	   $("#hidebutton2").hide();
	   	   
	   	$("#hide").delay(5000).fadeOut(500);
	    }); 
	    
	   
	 
	    
	    
	    $('INPUT[type="file"]').change(function () {
		    var ext = this.value.match(/\.(.+)$/)[1];
		    switch (ext) {
		        case 'xls':
		        case 'xlsx':
		            $('#uploadButton').attr('disabled', false);
		            break;
		        default:
		            alert("Only '.xls' and '.xlsx' file formats are allowed");
			        $('#uploadButton').attr('disabled', true);
		            this.value = '';
		    }
		});
	    
	    
	
	    
	 /*    var concertArray = [
	        ["Billy Joel", "99"],
	        ["Billy Joel", "89"]
	        ];

	    function populate(){
	        for(i=0;i<concertArray.length;i++)
	        {
	            for(j=0;j<concertArray[i].length;j++)
	            {
	                 console.log(concertArray[i][j]);
	            }
	        }
	    } */

	   
   	    </script>
    
    </body>
</html>