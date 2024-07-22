<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<html>
    <head>
        <title>Sales Summary</title>
    </head>
     
    <body>
          <div id="main" class='layout-navbar'>
            <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3  style="opacity: 0.8;">Sales Overview by date</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Sales</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">All Stores Sales
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section blnk-db ">
						<div class="eror-msg" style="display: none;">
							<div class="card">
								<div class="card-body error-msg">
									<p class="text-danger"> <c:if test="${not empty msg}"> Error - ${msg} </c:if></p>
									<a class="delete-msg btn btn-danger">X</a>
								</div>
							</div>
						</div>
						<div class="succes-msg-div" style="display: none;">
							<div class="card">
								<div class="card-body success-msg">
									<p class=""></p>
									<a class="delete-msg btn btn-light">X</a>
								</div>
							</div>
						</div>


                           
                        <div class="card">
                            <div class="card-body  ">
                            
                            <div class="row" >
                               <div class="col-6 col-sm-3">
                                <a class="nav-link disabled" href="#">Date Interval</a>
							  </div>
                              <div class="col-6 col-sm-3">
                                <a class="nav-link" href="#">Last 7 Days</a>
							  </div>
                              <div class="col-6 col-sm-3">
                                  <a class="nav-link" href="#">Last 30 Days</a>
							  </div>	
							  <div class="col-6 col-sm-3">
                                <a class="nav-link" href="#">Last 12 Months</a>
							  </div>
							  <hr>										
                            </div>
                            
                             <div class="row" >
                            	<h6 id="saleTotal">Total Price -- 254,000 ETB</h6>
                            	<p id="dateRange">Date -- ${startDate}</p>
                            </div> 
                            
                            <br>
                            
                            <div class="row" >
                              <div class="col-4 col-sm-3">
                                <a class="nav-link disabled typeGroup" href="#" id="0" onclick="typeGroupClick(this)">All</a>
							  </div>
                              <div class="col-4 col-sm-3">
                                  <a class="nav-link typeGroup" href="#" id="1" onclick="typeGroupClick(this)">By Department</a>
							  </div>	
							  <div class="col-4 col-sm-3">
                                <a class="nav-link typeGroup" href="#" id="2" onclick="typeGroupClick(this)">By Type</a>
							  </div>
							  <hr>										
                            </div>
                            
                            
                            <div class="row mb-5 mb-sm-0">
	                            <div class="col-4 col-sm-3">
	                            <input type="date" maxlength="50" name="dateToStock"
																	id="startDate" path="dateToStock" class="form-control"
																	placeholder="Start Date" value="2024-05-15" /></div>
																	
								<div class="col-4 col-sm-3">
								<input type="date" maxlength="50" name="dateToStock"
																	id="endDate" path="dateToStock" class="form-control"
																	placeholder="End Date" value="2024-05-15" /></div>	
								
								
								
								<div class="col-4 col-sm-2">
								   <input type="radio" class="shopGroup" id="${storeId}" name="fav_language" value="HTML" checked>
	                               <label for="html">All</label><br>
								</div>
							
								
                            </div>
                            
                             <div class="inv-data-tble fix-scroll-t mt-5">
                                <table class="table table-striped hello-worls fix-header-custom" style="text-align: left;">
                                    <thead>
										<tr>
										    <th>Service Name</th>
											<th>Service Type</th>
											<th>Department</th>
											<th>Total Price</th>
										</tr>
									</thead>
									<tbody>
										<tr>
										    <td>General Practioner</td>
											<td>Common</td>
											<td>Card Room</td>
											<td>1000 ETB</td>
										</tr>
										<tr>
										    <td>Ultra sound physiotherapy</td>
											<td>Labratory</td>
											<td>Physiotherapy</td>
											<td>225 ETB</td>
										</tr>
										<tr>
										    <td>Amputation</td>
											<td>Labratory</td>
											<td>Orthopedics</td>
											<td>13000 ETB</td>
										</tr>
										<tr>
										    <td>Tendon Transfer</td>
											<td>Labratory</td>
											<td>Tendon</td>
											<td>18000 ETB</td>
										</tr>
										<tr>
										    <td>Circlage</td>
											<td>Labratory</td>
											<td>ORIF of fracture</td>
											<td>14000 ETB</td>
										</tr>
										<tr>
										    <td>Gridle stone removal</td>
											<td>Labratory</td>
											<td>Arthroplasties</td>
											<td>24000 ETB</td>
										</tr>
										<tr>
										    <td>Total Hip replacement</td>
											<td>Labratory</td>
											<td>Arthroplasties</td>
											<td>55000 ETB</td>
										</tr>
										<tr>
										    <td>Open reduction</td>
											<td>Labratory</td>
											<td>Debredementis</td>
											<td>15000 ETB</td>
										</tr>
										<tr>
										    <td>Closed reduction</td>
											<td>Labratory</td>
											<td>Debredementis</td>
											<td>15000 ETB</td>
										</tr>
									</tbody>
                                </table>
                            </div>
                          </div>
                        </div>
                    </section>
                </div>
                <footer>
                    <div class="footer clearfix mb-0 text-muted c-ftr">
                        <div class="float-start">
                            <p>2023 &copy;</p>
                        </div>
                        <div class="float-end">
                            <p>Developed by <span class="text-danger"><i class="bi bi-heart"></i></span>  <a
                                    href="#">Ermias IT Solutions </a></p>
                        </div>
                    </div>
                </footer>
            </div>
           
        </div>
	 <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	 
	 <script>
	
		 
	
		
		
	</script>
	

    </body>
</html>
            	