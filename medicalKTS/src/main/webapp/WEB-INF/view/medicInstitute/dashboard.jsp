<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home page</title>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            margin-bottom: 0px;
        }

        .item {
            margin-bottom: 0px;
        }

        .item-name {
            font-size: 16px;
            font-weight: bold;
        }

        .item-price {
            font-size: 13px;
        }

         .item-price2 {
            font-size: 12px;
            color: red;
        }
        
        #backButton {
			border-radius: 4px;
			padding: 8px;
			border: none;
			font-size: 16px;
			background-color: #2eacd1;
			color: white;
			position: absolute;
			top: 10px;
			right: 10px;
			cursor: pointer;
		}
		.invisible {
			display: none;
		}
		
		.svg-icon {
			width: 28px; 
    		height: 28px;
		}
        
    </style>
</head>


<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">

				<section class="section blnk-db">
				<!-- 
					<div class="row">
						<div class="card mb-0">
							<div class="card-body">
								<div class="col-12 col-md-6 order-md-1 order-last">
									<h4>Dashboard</h4>
		                            <h5 style="opacity: 0.6;">Welcome to E.T Dashboard</h5>
								</div>
							</div>
						</div>
						
						
					</div>
				 -->
					
					<div class="card" style="background: none;">
							<h4 style="color: #2c2c2e;">Dashboard</h4>
							<div class="c-dflx">
								
								<h5 style="opacity: 0.7;">GENERAL STATISTICS</h5>
								<!-- 
								<img src="data:image/jpeg;base64,${base64Image}" alt="Image" style="width: 120px; height: 120px;">
								-->
								<fieldset class="form-group">
									<select class="form-select form-select-lg" name="formal" id="filterReceived" onchange="changeFilter(this.value)" style="font-size: 16px;">
											<option value="0">Weekly</option>
											<option value="0">Monthly</option>
											<option value="0">Annual</option>
									</select>
								</fieldset>
							</div>
							
							<div class="row mt-3">
						        <div class="col-6 col-sm-3" style="">
						            <div class="info-box" style="border-radius: 15px;">
						                <div class="icon">
						                    <i class="bi bi-people-fill"></i>
						                </div>
						                <div class="title">Total Patients</div>
						                <div class="amount" style="font-size: 16px;">7,349 <span>Patients</span></div>
						                <div class="percentage decrease">-2%</div>
						            </div>
						        </div>
						
						        <div class="col-6 col-sm-3">
						            <div class="info-box" style="border-radius: 15px;">
						                <div class="icon">
						                    <i class="bi bi-people-fill"></i>
						                </div>
						                <div class="title">New Patients</div>
						                <div class="amount" style="font-size: 16px;">87 <span>Patients</span></div>
						                <div class="percentage increase">+3%</div>
						            </div>
						        </div>
						        
						         <div class="col-6 col-sm-3">
						            <div class="info-box" style="border-radius: 15px;">
						                <div class="icon">
						                    <i class="bi bi-people-fill"></i>
						                </div>
						                <div class="title">Total Revenue</div>
						                <div class="amount" style="font-size: 16px;">2,463,493 ETB</div>
						                <div class="percentage increase">+5%</div>
						            </div>
						        </div>
						        
						         <div class="col-6 col-sm-3">
						            <div class="info-box" style="border-radius: 15px;">
						                <div class="icon">
						                    <i class="bi bi-people-fill"></i>
						                </div>
						                <div class="title">Total Stuff</div>
						                <div class="amount" style="font-size: 16px;">122 <span>Stuffs</span></div>
						                <div class="percentage increase" style="visibility: hidden;">+3%</div>
						                
						            </div>
						        </div>
					    	</div>
					</div>
					
					<div class="grid grid-cols-2 gap-4">
					    <!-- Revenue Card -->
					    <div class="bg-white p-6 rounded-lg shadow-lg">
					      <div class="flex justify-between items-center mb-4">
					        <h2 class="text-xl font-semibold">REVENUE</h2>
					        <div class="relative inline-block text-left">
					          <button class="bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-lg">
					            Weekly
					          </button>
					        </div>
					      </div>
					      <h3 class="text-lg font-medium mb-2">Weekly Overview</h3>
					      <canvas id="revenueChart"></canvas>
					    </div>
					    
					    <!-- Appointments Card -->
					    <div class="bg-white p-6 rounded-lg shadow-lg">
					      <div class="flex justify-between items-center mb-4">
					        <h2 class="text-xl font-semibold">APPOINTMENTS</h2>
					        <div class="relative inline-block text-left">
					          <button class="bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-lg">
					            Weekly
					          </button>
					        </div>
					      </div>
					      <h3 class="text-lg font-medium mb-2">Weekly Overview</h3>
					      <canvas id="appointmentsChart"></canvas>
					    </div>
					</div>
					<div class="card" style="background: none;">
							<div class="c-dflx ">
								<h5 style="opacity: 0.7;">GRAPHICAL DATA</h5>
							</div>
							
							<div class="row mt-3">
						       
						        <div class="col-12 col-sm-4">
						            <div class="info-box" style="text-align: left;">
						               	<div id="chartContainer" style="height: 350px; width: 100%;"></div>
										<button class="btn invisible" id="backButton"> Back</button>
						            </div>
						        </div>
						        
						         <div class="col-12 col-sm-4">
						            <div class="info-box" style="text-align: left;">
						               	<div id="chartContainer2" style="height: 320px; width: 100%;"></div>
										<button class="btn invisible" id="backButton2"> Back</button>
						            </div>
						        </div>
						        
						        <div class="col-12 col-sm-4">
						            <div class="info-box" style="text-align: left;">
						               	<div id="chartContainer3" style="height: 320px; width: 100%;"></div>
										<button class="btn invisible" id="backButton3"> Back</button>
						            </div>
						        </div>
					    	</div>
					    	<!-- 
					    	<div class="row">
					    	
					    	 <div class="col-12 col-sm-6" style="line-height: 1;">
						            <div class="info-box" style="text-align: left;">
						                <div class="d-flex justify-content-between">
						                	<div class="title2" style="font-size: 20px; font-weight: bold;">Services</div>
						                	<div class="title2" style="font-size: 15px; color: blue; text-decoration: underline; font-weight: bold;">See more</div>
						                </div>
						                <div class="row">
						                <hr>
										<div class="col-12">
												<div class="top-selling c-dflx">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">1.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Blood Test</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
												<hr>
												<div class="top-selling c-dflx">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">2.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Blood Test</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
												<hr>
												<div class="top-selling c-dflx">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">3.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Blood Test</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
												<hr>
												<div class="top-selling c-dflx" style="border-bottom: 0px;">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">4.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Blood Test</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
										</div>
										
									

									</div>
						            </div>
						        </div>
						        <div class="col-12 col-sm-6" style="line-height: 1;">
						            <div class="info-box" style="text-align: left;">
						                <div class="d-flex justify-content-between">
						                	<div class="title2" style="font-size: 20px; font-weight: bold;">Items</div>
						                	<div class="title2" style="font-size: 13px; color: blue; text-decoration: underline; font-weight: bold;">SEE MORE</div>
						                </div>
						                <div class="row">
						                <hr>
										<div class="col-12">
												<div class="top-selling c-dflx">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">1.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Syringes</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
												<hr>
												<div class="top-selling c-dflx">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">2.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Syringes</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
												<hr>
												<div class="top-selling c-dflx">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">3.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Syringes</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
												<hr>
												<div class="top-selling c-dflx" style="border-bottom: 0px;">
													<div class="item c-dflx">
														<div class="item-name topSaleName me-5">4.</div>
														<div class="ms-2 me-2">
															<i class="bi bi-file-earmark-person" style="font-size: 30px;"></i>
														</div>
														<div>
															<div class="item-name topSaleName">Syringes</div>
															<div class="item-price">Children</div>
														</div>
														
													</div>
													
													<div class="item">
														<div class="item-name topSaleName">2056 <span style="font-size: 13px;">Tests</span></div>
													</div>

													<div class="item">
														<div class="item-name topSaleName">307,000 <span style="font-size: 13px;">ETB</span></div>
													</div>

												</div>
										</div>
										
									

									</div>
						            </div>
						        </div>
						     </div>  
					    	 -->
						     <div class="row">
						     	<div class="col-6">
						     		<div class="card">
							     		<table class="table">
							     			<thead>
							     				<tr>
							     					<th colspan="3">Services</th>
							     					<th style="font-size: 13px; color: blue; text-decoration: underline; font-weight: bold; text-align: right;">SEE MORE</th>
							     				</tr>
							     				<tr>
							     					<th width="5%">No</th>
							     					<th>Service</th>
							     					<th>Service Count</th>
							     					<th style="text-align: right;">Revenue</th>
							     				</tr>
							     			</thead>
							     			<tbody>
							     				<tr>
							     					<td>1.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">Blood Test</p>
													        <p style="margin: 0; font-size: 14px;">Children</p>
													    </div>
													</td>
							     					<td style="font-weight: bold;">330 <span style="font-size: 14px;">Tests</span> </td>
							     					<td style="text-align: right; font-weight: bold;">173,375 <span style="font-size: 14px;">ETB</span></td>
							     				</tr>
							     				<tr>
							     					<td>2.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">UltraSound</p>
													        <p style="margin: 0; font-size: 14px;">Lab</p>
													    </div>
													</td>
													<td style="font-weight: bold;">99 <span style="font-size: 13px;">Tests</span></td>
							     					<td style="text-align: right; font-weight: bold;">92,737 <span style="font-size: 14px;">ETB</span></td>
							     				</tr>
							     				<tr>
							     					<td>3.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">SVC Fixation</p>
													        <p style="margin: 0; font-size: 14px;">Tendon</p>
													    </div>
													</td>
													<td style="font-weight: bold;">12 <span style="font-size: 13px;">Tests</span></td>
							     					<td style="text-align: right; font-weight: bold;">173,375 <span style="font-size: 14px;">ETB</span></td>
							     				</tr>
							     				<tr>
							     					<td>4.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">Blood Test</p>
													        <p style="margin: 0; font-size: 14px;">Children</p>
													    </div>
													</td>
													<td style="font-weight: bold;">451 <span style="font-size: 13px;">Tests</span></td>
							     					<td style="text-align: right; font-weight: bold;">173,375 <span style="font-size: 14px;">ETB</span></td>
							     				</tr>
							     			</tbody>
							     		</table>
						     		</div>
						     	</div>
						     	
						     	<div class="col-6">
						     		<div class="card">
							     		<table class="table">
							     			<thead>
							     				<tr>
							     					<th colspan="3">Items</th>
							     					<th style="font-size: 13px; color: blue; text-decoration: underline; font-weight: bold; text-align: right;">SEE MORE</th>
							     				</tr>
							     				<tr>
							     					<th width="5%">No</th>
							     					<th>Item name</th>
							     					<th>Min stock</th>
							     					<th style="text-align: right;">On hand</th>
							     				</tr>
							     			</thead>
							     			<tbody>
							     				<tr>
							     					<td>1.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">Blood Test</p>
													        <p style="margin: 0; font-size: 14px;">Children</p>
													    </div>
													</td>
							     					<td style="font-weight: bold;">330 <span style="font-size: 14px;">Units</span> </td>
							     					<td style="text-align: right; font-weight: bold;">17 <span style="font-size: 14px;">Units</span></td>
							     				</tr>
							     				<tr>
							     					<td>2.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">UltraSound</p>
													        <p style="margin: 0; font-size: 14px;">Lab</p>
													    </div>
													</td>
													<td style="font-weight: bold;">99 <span style="font-size: 13px;">Units</span></td>
							     					<td style="text-align: right; font-weight: bold;">921 <span style="font-size: 14px;">Units</span></td>
							     				</tr>
							     				<tr>
							     					<td>3.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">SVC Fixation</p>
													        <p style="margin: 0; font-size: 14px;">Tendon</p>
													    </div>
													</td>
													<td style="font-weight: bold;">12 <span style="font-size: 13px;">Units</span></td>
							     					<td style="text-align: right; font-weight: bold;">561 <span style="font-size: 14px;">Units</span></td>
							     				</tr>
							     				<tr>
							     					<td>4.</td>
							     					<td style="display: flex; align-items: center;">
													    <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-file-earmark-person-fill" viewBox="0 0 16 16" style="margin-right: 8px;">
													        <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0m2 5.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-.245S4 12 8 12s5 1.755 5 1.755"/>
													    </svg>
													    <div>
													        <p style="margin: 0; font-weight: bold;">Blood Test</p>
													        <p style="margin: 0; font-size: 14px;">Children</p>
													    </div>
													</td>
													<td style="font-weight: bold;">451 <span style="font-size: 13px;">Units</span></td>
							     					<td style="text-align: right; font-weight: bold;">173 <span style="font-size: 14px;">Units</span></td>
							     				</tr>
							     			</tbody>
							     		</table>
						     		</div>
						     	</div>
						     	
						   </div>
					</div>
					
						       
				</section>

		</div>
	</div>


	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script src="https://cdn.canvasjs.com/jquery.canvasjs.min.js"></script>
		
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
		
	<script>
	window.onload = function () {


		$.ajax({
			url: '${pageContext.request.contextPath}/Institute/ageData',
			success: function(response) {
				ageData = response;
				ageData = ageData.map(item => ({
					y: parseInt(item.message, 10), // Convert message to integer
					name: item.title,
					color: item.status
				}));

				ageChart.ageChartData[0].dataPoints = ageData;
				newVSReturningVisitorsOptions.data = ageChart.ageChartData;
				$("#chartContainer").CanvasJSChart(newVSReturningVisitorsOptions);
			}
		});

		var ageChart = {
				ageChartData: [{
					click: visitorsChartDrilldownHandler,
					cursor: "pointer",
					explodeOnClick: false,
					innerRadius: "75%",
					legendMarkerType: "square",
					name: "Patients by Sex",
					radius: "100%",
					showInLegend: true,
					startAngle: 90,
					type: "doughnut",
					dataPoints: [
						{ y: 100, name: "Error", color: "red" },
						{ y: 12, name: "6-15", color: "#546BC1" },
						{ y: 30, name: "15-30", color: "#8BD8DB" },
						{ y: 30, name: "30-50", color: "#8480E6" },
						{ y: 30, name: "50+", color: "#54B0B0" }
					]
				}],

			};

			var newVSReturningVisitorsOptions = {
				animationEnabled: true,
				theme: "light2",
				title: {
					text: "Patients by Age",
					fontFamily: "calibri",
				    fontSize: 20
				},
				legend: {
					fontFamily: "calibri",
					fontSize: 14,
					itemTextFormatter: function (e) {
						return e.dataPoint.name + ": " + Math.round(e.dataPoint.y);  
					}
				},
				data: []
			};

			var visitorsDrilldownedChartOptions = {
				animationEnabled: true,
				theme: "light2",
				axisX: {
					labelFontColor: "#717171",
					lineColor: "#a2a2a2",
					tickColor: "#a2a2a2"
				},
				axisY: {
					gridThickness: 0,
					includeZero: false,
					labelFontColor: "#717171",
					lineColor: "#a2a2a2",
					tickColor: "#a2a2a2",
					lineThickness: 1
				},
				data: []
			};

			// newVSReturningVisitorsOptions.data = visitorsData["New vs Returning Visitors"];
			// $("#chartContainer").CanvasJSChart(newVSReturningVisitorsOptions);

			function visitorsChartDrilldownHandler(e) {
				e.chart.options = visitorsDrilldownedChartOptions;
				e.chart.options.data = visitorsData[e.dataPoint.name];
				e.chart.options.title = { text: e.dataPoint.name }
				e.chart.render();
				$("#backButton").toggleClass("invisible");
			}

			// $("#backButton").click(function() {
			// 	$(this).toggleClass("invisible");
			// 	newVSReturningVisitorsOptions.data = visitorsData["New vs Returning Visitors"];
			// 	$("#chartContainer").CanvasJSChart(newVSReturningVisitorsOptions);
			// });

		let genderObject = []
		$.ajax({
			url: '${pageContext.request.contextPath}/Institute/genderData',
			success : function(response) {
				genderObject = response;
				genderObject = genderObject.map(item => ({
					y: parseInt(item.message, 10), // Convert message to integer
					name: item.title,
					color: item.status
				}));
				visitorsData2.genderInfo[0].dataPoints = genderObject;

				newVSReturningVisitorsOptions2.data = visitorsData2.genderInfo;
				$("#chartContainer2").CanvasJSChart(newVSReturningVisitorsOptions2);

			}
		});
	
	var visitorsData2 = {
			genderInfo: [{
				click: visitorsChartDrilldownHandler2,
				cursor: "pointer",
				explodeOnClick: false,
				innerRadius: "75%",
				legendMarkerType: "square",
				name: "Patients by Sex",
				radius: "100%",
				showInLegend: true,
				startAngle: 90,
				type: "doughnut",
				dataPoints: [
					{y: 1, name: 'Error', color: 'red'},
					{y: 1, name: 'Error', color: '#90e0ef'}
				]
			}],

		};

		var newVSReturningVisitorsOptions2 = {
			animationEnabled: true,
			theme: "light2",
			title: {
				text: "Patients by Sex",
				fontFamily: "calibri",
			    fontSize: 20
			},
			legend: {
				fontFamily: "calibri",
				fontSize: 14,
				itemTextFormatter: function (e) {
					return e.dataPoint.name + ": " + Math.round(e.dataPoint.y);  
				}
			},
			data: []
		};

		var visitorsDrilldownedChartOptions2 = {
			animationEnabled: true,
			theme: "light2",
			axisX: {
				labelFontColor: "#717171",
				lineColor: "#a2a2a2",
				tickColor: "#a2a2a2"
			},
			axisY: {
				gridThickness: 0,
				includeZero: false,
				labelFontColor: "#717171",
				lineColor: "#a2a2a2",
				tickColor: "#a2a2a2",
				lineThickness: 1
			},
			data: []
		};

		function visitorsChartDrilldownHandler2(e) {
			e.chart.options = visitorsDrilldownedChartOptions2;
			e.chart.options.data = visitorsData2[e.dataPoint.name];
			e.chart.options.title = { text: e.dataPoint.name }
			e.chart.render();
			$("#backButton2").toggleClass("invisible");
		}

		$("#backButton2").click(function() { 
			$(this).toggleClass("invisible");
			newVSReturningVisitorsOptions2.data = visitorsData2["New vs Returning Visitors"];
			$("#chartContainer2").CanvasJSChart(newVSReturningVisitorsOptions2);
		});


		let departmentDataFromEndpoint = []
		$.ajax({
			url: '${pageContext.request.contextPath}/Institute/departmentData',
			success: function(response) {
				console.log('response', response);

				departmentDataFromEndpoint = response.map(item => ({
					y: parseInt(item.message, 10), // Convert message to integer
					name: item.title,
					color: item.status
				}));

				console.log('1', departmentChart.data);
				departmentChartData["New vs Returning Visitors"][0].dataPoints = departmentDataFromEndpoint
				departmentChart.data = departmentChartData["New vs Returning Visitors"];
				console.log('2', departmentChart.data);
				$("#chartContainer3").CanvasJSChart(departmentChart);

			}
		});

		var departmentChartData = {
				"New vs Returning Visitors": [{
					click: visitorsChartDrilldownHandler3,
					cursor: "pointer",
					explodeOnClick: false,
					innerRadius: "75%",
					legendMarkerType: "square",
					name: "Patients by Sex",
					radius: "100%",
					showInLegend: true,
					startAngle: 90,
					type: "doughnut",
					dataPoints: [
						{ y: 100, name: "Tendon", color: "#E7823A" },
						{ y: 120, name: "Children", color: "#546BC1" },
						{ y: 300, name: "Orthopedics", color: "#8480E6" },
						{ y: 250, name: "Maternity", color: "#80D3E6" },
						{ y: 60, name: "Internal", color: "#54B0B0" }
					]
				}]
			};

		var departmentChart = {
				animationEnabled: true,
				theme: "light2",
				title: {
					text: "Patients in Departments",
					fontFamily: "calibri",
				    fontSize: 20
				},
				legend: {
					fontFamily: "calibri",
					fontSize: 14,
					itemTextFormatter: function (e) {
						return e.dataPoint.name + ": " + Math.round(e.dataPoint.y);  
					}
				},
				data: []
			};

		var visitorsDrilldownedChartOptions3 = {
				animationEnabled: true,
				theme: "light2",
				axisX: {
					labelFontColor: "#717171",
					lineColor: "#a2a2a2",
					tickColor: "#a2a2a2"
				},
				axisY: {
					gridThickness: 0,
					includeZero: false,
					labelFontColor: "#717171",
					lineColor: "#a2a2a2",
					tickColor: "#a2a2a2",
					lineThickness: 1
				},
				data: []
			};



		function visitorsChartDrilldownHandler3(e) {
				e.chart.options = visitorsDrilldownedChartOptions3;
				e.chart.options.data = departmentChartData[e.dataPoint.name];
				e.chart.options.title = { text: e.dataPoint.name }
				e.chart.render();
				$("#backButton2").toggleClass("invisible");
			}

		$("#backButton3").click(function() {
				$(this).toggleClass("invisible");
				departmentChart.data = departmentChartData["New vs Returning Visitors"];
				$("#chartContainer3").CanvasJSChart(departmentChart);
			});

	}
		
		
	</script>

	
	
	  <script>
	    // Revenue Chart
	    const revenueCtx = document.getElementById('revenueChart').getContext('2d');
	    const revenueChart = new Chart(revenueCtx, {
	      type: 'bar',
	      data: {
	        labels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
	        datasets: [{
	          label: 'Revenue',
	          data: [12000, 15000, 8000, 6000, 18000, 20000, 7000],
	          backgroundColor: [
	            '#cbd5e1', '#cbd5e1', '#cbd5e1', '#cbd5e1', '#3b82f6', '#cbd5e1', '#cbd5e1'
	          ],
	          borderWidth: 1
	        }]
	      },
	      options: {
	        scales: {
	          y: {
	            beginAtZero: true
	          }
	        }
	      }
	    });
	
	    // Appointments Chart
	    const appointmentsCtx = document.getElementById('appointmentsChart').getContext('2d');
	    const appointmentsChart = new Chart(appointmentsCtx, {
	      type: 'bar',
	      data: {
	        labels: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
	        datasets: [{
	          label: 'Appointments',
	          data: [11000, 9000, 14000, 8000, 16000, 22000, 9000],
	          backgroundColor: [
	            '#cbd5e1', '#cbd5e1', '#cbd5e1', '#cbd5e1', '#3b82f6', '#cbd5e1', '#cbd5e1'
	          ],
	          borderWidth: 1
	        }]
	      },
	      options: {
	        scales: {
	          y: {
	            beginAtZero: true
	          }
	        }
	      }
	    });
	  </script>
	
</body>
</html>