<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Banners Hallmark</title>        
    </head>
    
	
<body>
	 <div id="main" class='layout-navbar'>
           <div id="main-content">

                <div class="page-heading">
                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Loss prevention summary</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                        </div>
                    </div>
				<div class="card">
					<div class="card-body">
						<div class="c-dflx">
							<fieldset class="form-group me-2" style="width: 35%">
								<select class="form-select" name="formal" id="filterReceived"
									onchange="changeFilter(this.value)">
									<option value="#">Site ${store}</option>
									<option
										value="${pageContext.request.contextPath}/lossPrevention/all">All
										Site</option>
									<c:forEach var="stores" items="${stores}">
										<option
											value="${pageContext.request.contextPath}/lossPrevention/all?store=${stores.store}">Site
											${stores.store}</option>
									</c:forEach>

								</select>
							</fieldset>
							<a href="${pageContext.request.contextPath}/lossPrevention/newData"
								class="btn btn-primary "> <i
								class="bi bi-credit-card-2-back "></i> Add data
							</a>

						</div>
					</div>
				</div>
				<section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %> 
                        

                           <div class="card">
                            <div class="card-body  ">
                            <div class="inv-data-tble">
                                <table class="table table-striped  " id="table-p"  >
                                    <thead>
                                        <tr>
                                           <th>Store No</th>	
                                           <th>Cashier No</th>	
                                           <th>Reg No</th>	
                                           <th>Trans No</th>	
                                           <th>Trans day</th>	
                                           <th>Trans Amount</th>
                                           <th>Trans Type</th>
                                       </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="lossPre" items="${lossPre}">
											<tr>
												<td>${lossPre.storeNo}</td>
												<td>${lossPre.cashierNo}</td>
												<td>${lossPre.countResult}</td>
												<td>${lossPre.transNo}</td>
												<td>${lossPre.tradingDay}</td>
												<td>${lossPre.transAmount}</td>
												<td>${lossPre.transType}</td>
											</tr>
										</c:forEach>
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
                            <p>2021 &copy; Banners Hallmark</p>
                        </div>
                        <div class="float-end">
                            <p>Developed by <span class="text-danger"><i class="bi bi-heart"></i></span>  <a
                                    href="#">Suntek IT Solutions </a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>


   	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
   		function downloadFile(x){
   			if (x!=null) {
   				var link = "${pageContext.request.contextPath}/paidInOut/downloadFile?id="+x;
				window.location = link;
			} 
   		}
   		function changeFilter(x){
 			window.location = x;
   		}
   	</script>
</body>
</html>