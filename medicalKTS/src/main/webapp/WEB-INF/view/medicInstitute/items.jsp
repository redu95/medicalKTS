<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Avaialble Items</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Avaialble Items</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">items
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
								<a href="${pageContext.request.contextPath}/Institute/addMedicItems" class="btn btn-primary">  <i class="bi bi-credit-card-2-back "></i> New Item</a>
							</div>
	
						</div>
						<hr>

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped">
                                    <thead>
                                        <tr style="background-color: #D9DFF2;">
                                            <th>ItemName</th>
                                            <th>On-Hand</th>		
											<th>Quantity</th>
											<th>Unit</th>
											<th>Minimum Stock</th>
											<th>Description</th>
											<th>ItemType</th>
											<th>Vendor Name</th>
										    <th width="10%">Action</th>		
                                        </tr>
                                    </thead>
                                    <tbody>
											<tr>
												<td>Sterilizer</td>
												<td>120</td>
												<td>260</td>
												<td>Pcs</td>
												<td>50</td>
												<td>Sterilizer</td>
												<td>Common Use</td>
												<td>AISIE</td>
										 	    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersmkjh?id=11">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersgh/1" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
											<tr>
												<td>Sterilizer</td>
												<td>120</td>
												<td>260</td>
												<td>Pcs</td>
												<td>50</td>
												<td>Sterilizer</td>
												<td>Common Use</td>
												<td>AISIE</td>
										 	    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersmkjh?id=11">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersgh/1" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
											<tr>
												<td>Sterilizer</td>
												<td>120</td>
												<td>260</td>
												<td>Pcs</td>
												<td>50</td>
												<td>Sterilizer</td>
												<td>Common Use</td>
												<td>AISIE</td>
										 	    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersmkjh?id=11">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersgh/1" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
											<tr>
												<td>Sterilizer</td>
												<td>120</td>
												<td>260</td>
												<td>Pcs</td>
												<td>50</td>
												<td>Sterilizer</td>
												<td>Common Use</td>
												<td>AISIE</td>
										 	    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersmkjh?id=11">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersgh/1" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
											<tr>
												<td>Sterilizer</td>
												<td>120</td>
												<td>260</td>
												<td>Pcs</td>
												<td>50</td>
												<td>Sterilizer</td>
												<td>Common Use</td>
												<td>AISIE</td>
										 	    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersmkjh?id=11">
					                                   	<span class="badge" style="background-color: #8e9ed8;"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersgh/1" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge" style="background-color: #fe6e6e;"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
                                    </tbody>
                                </table>
                            </div>
                            </div>
							<nav aria-label="Page">
									<ul class="pagination justify-content-center"
										style="align-content: center;">
										<li class="page-item"><a class="page-link"
											onclick="handlePage(8)" href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span> <span class="sr-only"></span>
										</a></li>
										<li class="page-item"><a class="page-link"
											onclick="handlePage(6)" href="#" aria-label="Previous"> <span
												aria-hidden="true">&lsaquo;</span> <span class="sr-only"></span>
										</a></li>
										<li id="l2" class="page-item active"><a class="page-link"
											id="p2" onclick="handlePage(2)" href="#">1</a></li>
										<li id="l3" class="page-item"><a class="page-link"
											id="p3" onclick="handlePage(3)" href="#">2</a></li>
										<li id="l1" class="page-item"><a class="page-link"
											id="p1" onclick="handlePage(1)" href="#">3</a></li>

										<li id="l4" class="page-item"><a class="page-link"
											id="p4" onclick="handlePage(4)" href="#">4</a></li>
										<li id="l5" class="page-item"><a class="page-link"
											id="p5" onclick="handlePage(5)" href="#">5</a></li>

										<li class="page-item"><a class="page-link"
											onclick="handlePage(7)" href="#" aria-label="Next"> <span
												aria-hidden="true">&rsaquo;</span> <span class="sr-only"></span>
										</a></li>
										<li id="l9" class="page-item"><a class="page-link"
											id="p9" data-initial-value="1" onclick="handlePage(9)"
											href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												<span class="sr-only"></span>
										</a></li>
									</ul>
								</nav>
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
   	</script>

</body>
</html>