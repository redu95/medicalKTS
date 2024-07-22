<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Monthly Report</title>
	 <style>
        .info-box {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            text-align: center;
            background-color: white;
        }

        .icon {
            font-size: 24px;
        }

        .title {
            font-size: 18px;
            margin-top: 10px;
            color: #2c2c2e;
        }

        .amount {
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
            color: #2c2c2e;
        }

        .percentage {
            font-size: 14px;
        }

        .increase {
            color: green;
        }

        .decrease {
            color: red;
        }

        .title2 {
            font-size: 23px;
            margin-top: 10px;
            color: #2c2c2e;
        }

		.top-selling {
            padding-left 0px;
            margin-bottom: 20px;
        }

        .item {
            margin-bottom: 10px;
        }

        .item-name {
            font-size: 15px;
            font-weight: bold;
        }

        .item-price {
            font-size: 13px;
            font-weight: bold;
        }
        
        .topSaleQuantity {
            font-size: 13px;
            color: green;
        }
        
        .topSalePrice {
        	font-size: 13px;
        	font-style: oblique;
            color: red;
        }

         .item-price2 {
            font-size: 13px;
            color: red;
        }
        
    </style>
</head>


<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">

				<section class="section blnk-db">

					<div class="card" style="background: none;">
							<div class="row mt-3">
						         <div class="col-12">
						            <div class="info-box" style="text-align: left;">
						                <div class="title2">Monthly Sales summary</div>
						                <div>Total: <span id="monthlyTotal">244,000</span> ETB</div>
						                <hr>
						                
											<div class="row" style="justify-content: flex-start;">
												<div class="form-group col-6">
												<label for="monthSelector">Month</label> 
													<select name="monthSelector" id="monthSelector" class="form-select">
														<option value="3">April</option>
													</select>
												</div>	
												<div class="form-group col-6">
												<label for="yearSelector">Year</label> 
													<select name="yearSelector" id="yearSelector" class="form-select">
														<option value="2024">2024</option>
													</select>
												</div>
										</div>
										<hr>	
														<div class="row">
															<div class="col-12 col-sm-6 mb-3">
																<h5 style="text-align: center;" class="mb-0">Top selling by Service</h5>
																<hr>
																<div class="row me-1" style="border-right: 1px solid #ddd;; border-radius: 5px; box-shadow:5px 5px 0 rgba(0, 0, 0, 0.1);">
																	<div class="col-6 m-0">
																		<div class="item">
																			<div class="item-name topSaleName">General Practioner 1</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">198 per procedure</span> <br> Price:  <span class="topSalePrice">1000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Ultrasound</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">164 per procedure</span> <br> Price:  <span class="topSalePrice">350.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Chest Physiotherapy</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">130 per procedure</span> <br> Price:  <span class="topSalePrice">14000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Nebulization</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">98 per procedure</span> <br> Price:  <span class="topSalePrice">9500.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Tendon Transfer</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">90 per procedure</span> <br> Price:  <span class="topSalePrice">5000.00 ETB</span></div>
																		</div>
																	</div>
																	<div class="col-6 m-0">
																		<div class="item">
																			<div class="item-name topSaleName">Tumor Removal</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">88 per procedure</span> <br> Price:  <span class="topSalePrice">6550.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Tendon Repair</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">45 per procedure</span> <br> Price:  <span class="topSalePrice">6000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Shaft Fixation</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">33 per procedure</span> <br> Price:  <span class="topSalePrice">950.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Dialysis</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">30 per procedure</span> <br> Price:  <span class="topSalePrice">7450.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Rhinoscopy</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">29 per procedure</span> <br> Price:  <span class="topSalePrice">5000.00 ETB</span></div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-12 col-sm-6">
																<h5 style="text-align: center;" class="mb-0">Top selling by Price</h5>
																<hr>
																<div class="row me-1" style="border-right: 1px solid #ddd;; border-radius: 5px; box-shadow:5px 5px 0 rgba(0, 0, 0, 0.1);">
																	<div class="col-6 m-0">
																		<div class="item">
																			<div class="item-name topSaleName">Chest Physiotherapy</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">9 per procedure</span> <br> Price:  <span class="topSalePrice">159,600.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Rhinoscopy</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">15 per procedure</span> <br> Price:  <span class="topSalePrice">101,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Tendon Transfer</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">45 per procedure</span> <br> Price:  <span class="topSalePrice">94,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Joint fixation</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">3 per procedure</span> <br> Price:  <span class="topSalePrice">88,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Ultrasound</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">2 per procedure</span> <br> Price:  <span class="topSalePrice">50,000.00 ETB</span></div>
																		</div>
																	</div>
																	<div class="col-6 m-0">
																		<div class="item">
																			<div class="item-name topSaleName">Dialysis</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">19 per procedure</span> <br> Price:  <span class="topSalePrice">47,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Nebulization</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">10 per procedure</span> <br> Price:  <span class="topSalePrice">44,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Tongue Tie release</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">22 per procedure</span> <br> Price:  <span class="topSalePrice">40,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">Tonsillectomy 1</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">78 per procedure</span> <br> Price:  <span class="topSalePrice">33,000.00 ETB</span></div>
																		</div>
					
																		<div class="item">
																			<div class="item-name topSaleName">EEG 1</div>
																			<div class="item-price">Unit <span class="topSaleQuantity">14 per procedure</span> <br> Price:  <span class="topSalePrice">32,500.00 ETB</span></div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
												
												<hr>
												<div class="row">
													<div class="col-12 col-sm-12" id="chartContainerMonthly" style="height: 370px;"></div>
												</div>
						            </div>
						        </div>
						        
						       
					    	</div>
					</div>
					    
					

				</section>

		</div>
	</div>


	<script src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
	
		$(document).ready(function(){
				$.ajax({
					url: '${pageContext.request.contextPath}/Institute/monthlyGraphData',
					data: {
						monthInt: 5,
						yearInt: 2023,
					},
					success : function(response) {
						var graphLen = response.length;
						var gl = graphLen.toString();
						var options = {
								exportEnabled: false,
								animationEnabled: true,
								title: {
									text: "Monthly report - ${monthDateLabel}"
								},
								axisX:{
								       title: "Month Date",
								       interval: 1,
					                   valueFormatString: "0"
								},
								data: [
								{
									type: "splineArea",
									dataPoints: []
								}
								]
							};
							for (var i = 0; i < graphLen; i++) {
				                options.data[0].dataPoints.push({ x: i+1, y: Number(response[i].message) });
				            }
						$("#chartContainerMonthly").CanvasJSChart(options);						
					}
				});
				
		});
		
		
		
	</script>


</body>
</html>