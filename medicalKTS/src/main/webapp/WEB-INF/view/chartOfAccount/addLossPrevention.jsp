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
								<h3>Loss prevention page</h3>
								<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
							</div>
							<div class="col-12 col-md-6 order-md-2 order-first">
								<nav aria-label="breadcrumb"
									class="breadcrumb-header float-start float-lg-end">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a
											href="${pageContext.request.contextPath}/lossPrevention/all">
												Loss Prevention</a></li>
										<li class="breadcrumb-item active" aria-current="page">Add
											data</li>
									</ol>
								</nav>
							</div>
						</div>
					</div> 
				<div id="stattt">
                        </div>
				<div class="card">
                            <div class="card-body">
                                <div class="ig-dflx ">

                                        <button class="btn btn-primary" onclick="myfunc()"> Submit Data</button>
                                   
                                </div>
                            </div>  
                        </div>
                        
				<section class="section blnk-db ">
                        <%@ include file="../common/error-and-success-message.jsp" %> 
                        
					
 					<div class="card">
						<div class="card-body  ">
							<div class="row">
								<div class="col-1">
									<h6>No</h6>
								</div>
								<div class="col-1">
									<h6>Store No</h6>
								</div>
								<div class="col-2">
									<h6>Cashier No</h6>
								</div>
								<div class="col-1">
									<h6>Reg No</h6>
								</div>
								<div class="col-1">
									<h6>Trans No</h6>
								</div>
								<div class="col-2">
									<h6>Trans Date</h6>
								</div>
								<div class="col-2">
									<h6>Trans Amount</h6>
								</div>
								<div class="col-2">
									<h6>Trans Type</h6>
								</div>
							</div>
							<hr>
							<div class="row r1 mb-2" id="r1">
								<div class="col-1">
									<h6>1</h6>
								</div>
								<div class="col-1">
									<input type="number" name="store" id="store"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="cashierNo" id="cashierNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="countResult" id="countResult"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="transNo" id="transNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="date" maxlength="50" name="lastname" id="lastname"
										class="form-control" placeholder="Last Name" value="" />
								</div>
								<div class="col-2">
									<input type="number" maxlength="50" name="transAmount" id="transAmount"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="transType" id="transType"
										class="form-control" placeholder="" value="" />
								</div>
							</div>
							<div class="row r2 mb-2" id="r2">
								<div class="col-1">
									<h6>1</h6>
								</div>
								<div class="col-1">
									<input type="number" name="store" id="store"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="cashierNo" id="cashierNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="countResult" id="countResult"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="transNo" id="transNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="date" maxlength="50" name="lastname" id="lastname"
										class="form-control" placeholder="Last Name" value="" />
								</div>
								<div class="col-2">
									<input type="number" maxlength="50" name="transAmount" id="transAmount"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="transType" id="transType"
										class="form-control" placeholder="" value="" />
								</div>
							</div>
							<div class="row r3 mb-2" id="r3">
								<div class="col-1">
									<h6>1</h6>
								</div>
								<div class="col-1">
									<input type="number" name="store" id="store"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="cashierNo" id="cashierNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="countResult" id="countResult"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="transNo" id="transNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="date" maxlength="50" name="lastname" id="lastname"
										class="form-control" placeholder="Last Name" value="" />
								</div>
								<div class="col-2">
									<input type="number" maxlength="50" name="transAmount" id="transAmount"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="transType" id="transType"
										class="form-control" placeholder="" value="" />
								</div>
							</div>
							<div class="row r4 mb-2" id="r4">
								<div class="col-1">
									<h6>1</h6>
								</div>
								<div class="col-1">
									<input type="number" name="store" id="store"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="cashierNo" id="cashierNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="countResult" id="countResult"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="transNo" id="transNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="date" maxlength="50" name="lastname" id="lastname"
										class="form-control" placeholder="Last Name" value="" />
								</div>
								<div class="col-2">
									<input type="number" maxlength="50" name="transAmount" id="transAmount"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="transType" id="transType"
										class="form-control" placeholder="" value="" />
								</div>
							</div>
							<div class="row r5 mb-2" id="r5">
								<div class="col-1">
									<h6>1</h6>
								</div>
								<div class="col-1">
									<input type="number" name="store" id="store"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="cashierNo" id="cashierNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="countResult" id="countResult"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-1">
									<input type="number" name="transNo" id="transNo"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="date" maxlength="50" name="lastname" id="lastname"
										class="form-control" placeholder="Last Name" value="" />
								</div>
								<div class="col-2">
									<input type="number" maxlength="50" name="transAmount" id="transAmount"
										class="form-control" placeholder="" value="" />
								</div>
								<div class="col-2">
									<input type="text" maxlength="50" name="transType" id="transType"
										class="form-control" placeholder="" value="" />
								</div>
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
   		function myfunc(){
   			$(this).find('input[type="submit"]').attr('disabled', 'disabled');
 			var losses={};
 			var counter=0;
 			var link = "${pageContext.request.contextPath}/lossPrevention/newData";
 			
 			var r1 = document.getElementById('r1').getElementsByTagName('input'); 
			var r11={};
 			r11.store=r1[0].value;
 			r11.cashier=r1[1].value;
 			r11.countResult=r1[2].value;
 			r11.transNo=r1[3].value;
 			r11.tradingDay=r1[4].value;
 			r11.transAmount=r1[5].value;
 			r11.transType=r1[6].value;
 			
 			losses[counter]=r11;
 			counter++;
 			
 			var r2 = document.getElementById('r2').getElementsByTagName('input'); 
 			var r22={};
 			r22.store=r2[0].value;
 			r22.cashier=r2[1].value;
 			r22.countResult=r2[2].value;
 			r22.transNo=r2[3].value;
 			r22.tradingDay=r2[4].value;
 			r22.transAmount=r2[5].value;
 			r22.transType=r2[6].value;
 			
 			losses[counter]=r22;
 			counter++;
 			
 			var r3 = document.getElementById('r3').getElementsByTagName('input'); 
 			var r33={};
 			r33.store=r3[0].value;
 			r33.cashier=r3[1].value;
 			r33.countResult=r3[2].value;
 			r33.transNo=r3[3].value;
 			r33.tradingDay=r3[4].value;
 			r33.transAmount=r3[5].value;
 			r33.transType=r3[6].value;
 			
 			losses[counter]=r33;
 			counter++;
 			
 			var r4 = document.getElementById('r4').getElementsByTagName('input'); 
			var r44={};
			r44.store=r4[0].value;
 			r44.cashier=r4[1].value;
 			r44.countResult=r4[2].value;
 			r44.transNo=r4[3].value;
 			r44.tradingDay=r4[4].value;
 			r44.transAmount=r4[5].value;
 			r44.transType=r4[6].value;
 			
 			losses[counter]=r44;
 			counter++;
 			
 			
 			var r5 = document.getElementById('r5').getElementsByTagName('input'); 
			var r55={};
			r55.store=r5[0].value;
 			r55.cashier=r5[1].value;
 			r55.countResult=r5[2].value;
 			r55.transNo=r5[3].value;
 			r55.tradingDay=r5[4].value;
 			r55.transAmount=r5[5].value;
 			r55.transType=r5[6].value;
 			
 			losses[counter]=r55;
 			counter++;
 			
 			console.log(losses);
 			
 			var json = JSON.stringify(losses);
 			
 			$.ajax({
				url : "${pageContext.request.contextPath}/lossPrevention/saveData",
				type : "POST",
				data : {json:json},
				success : function(response) {
					alert("Data entered successfully")
					window.location = "${pageContext.request.contextPath}/lossPrevention/all";
				}
			});
   		}
   	</script>
</body>
</html>