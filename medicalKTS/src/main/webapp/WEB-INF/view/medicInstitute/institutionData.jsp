<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Institute Data</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Institute Data</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Institute
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %> 
						<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Name: </span>H.K General Hospital</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Tel: </span>0925416359</div>
						            </div>
						        </div>
						        <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Reg Date: </span>01-03-2024</div>
						            </div>
						        </div>
						       
							</div>
							<div class="row">
								<div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Manager: </span>Ermias.A</div>
						            </div>
						        </div>
						        <div class="col-3">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Address: </span>Bole subcity</div>
						            </div>
						        </div>
						         <div class="col-6">
						            <div class="c-dflx">
						                <div class="title"><span style="font-weight: bold;">Status: </span>Active</div>
						            </div>
						        </div>
							</div>
						</div>
					</div>
					
					<div class="eror-msg" style="display: none;">
						<div class="card">
							<div class="card-body success-msg" id="msgBoxBg">
								<p class="" id="msgBox"></p>
								<a class="delete-msg btn btn-light">X</a>
							</div>
						</div>
					</div>
					<!-- 
						<div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped" >
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>		
											<th>Description</th>
											<th>Manager</th>
											<th>Phone</th>
											<th>Address</th>
											<th>Registry Date</th>
										    <th width="10%">Action</th>		
                                        </tr>
                                    </thead>
                                    <tbody>
											<tr>
												<td>001</td>
												<td>H.K General Hospital</td>
												<td>general hospital</td>
												<td>Miki.B</td>
												<td>0906248218</td>
												<td>Bole, A.A</td>
												<td>04-03-2024</td>
											    <td class="td-actions">
					                                <div class="action-buttons">
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersddd?id=5">
					                                   	<span class="badge bg-success"><i class="bi bi-pencil"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
											<tr>
												<td>002</td>
												<td>H.K General Hospital</td>
												<td>general hospital</td>
												<td>Miki.B</td>
												<td>0906248218</td>
												<td>Bole, A.A</td>
												<td>04-03-2024</td>
											    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersddd?id=5">
					                                   	<span class="badge bg-success"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersghkk/6" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge bg-danger"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
											<tr>
												<td>003</td>
												<td>H.K General Hospital</td>
												<td>general hospital</td>
												<td>Miki.B</td>
												<td>0906248218</td>
												<td>Bole, A.A</td>
												<td>04-03-2024</td>
											    <td class="td-actions">
					                                <div class="action-buttons">
					                                
					                                   <a class="" title="Edit" href="${pageContext.request.contextPath}/users/getUsersddd?id=5">
					                                   	<span class="badge bg-success"><i class="bi bi-pencil"></i></span></a>
					                                	
					                                	<a class="red" href="${pageContext.request.contextPath}/users/deleteUsersghkk/6" onclick="return confirm('Are you sure to delete?')" id="remove">
					                                   		<span class="badge bg-danger"><i class="bi bi-trash-fill"></i></span></a>
					                                 </div>			                                
					                            </td>			                            
											</tr>
                                    </tbody>
                                </table>
                            </div>
                             </div>

                        </div>
					 -->
                           
                    </section>
                </div>
            </div>
        </div>


   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>