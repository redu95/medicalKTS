<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banner's Hallmark | ItemGroups</title>        
    </head>
    
	
    <body>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			ItemGroups<!--  <small>advanced tables</small> -->
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
					<div class="box-header">						
						<div class="box-tools">
	                		<div class="input-group input-group-sm" style="width: 150px;">
	                		<p class="text-right"><button class="btn btn-default"><i class="fa fa-plus"></i> <a href="${pageContext.request.contextPath}/itemGroup/addItemGroup">New Item Group</a></button></p>
	                	</div>
	              	</div>
					</div>
					
					<!-- /.box-header -->
					<div class="box-body table-responsive">
						<table id="example" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Name</th>
									<th>Item Group</th>
									<th>Item Group Repl</th>
									<th>Item Group Spec</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="itemGroup" items="${itemGroups}">
									<tr>
										<td>${itemGroup.name}</td>
										<td>${itemGroup.itemGroup}</td>
										<td>${itemGroup.itemGroupRepl}</td>
										<td>${itemGroup.itemGroupSpec}</td>
										<td class="td-actions">
			                                <div class="action-buttons">
			                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/itemGroup/getItemGroup/${itemGroup.id}">
			                                   	<button  class="btn btn-primary btn-xs" ><i class="fa fa-pencil"></i></button></a>&nbsp;
			                                	<a class="red" href="${pageContext.request.contextPath}/itemGroup/deleteItemGroup/${itemGroup.id}" id="remove">
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
   	    </script>
    
    </body>
</html>