<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>All Patients</title>
	<style>
		.info-box {
			border: 1px solid #ddd;
			padding: 15px;
			margin-bottom: 20px;
			background-color: #FCFDFC;
		}
		
		.circleNum {
			width: 140px;
			height: 140px;
			background-color: white;
			border-radius: 20%;
			padding-right: 5px;
			padding-left: 5px;
		}
		
		.circleNum2 {
			width: 140px;
			height: 140px;
			background-color: #D9DFF2;
			color: #435EBE;
			border-radius: 20%;
			padding-right: 5px;
			padding-left: 5px;
		}
		.activeTab {
			 background-color: #D9DFF2;
		}
		.passiveTab {
			 background-color: #f5f6f7;
		}
</style>
</head>


<body>
	<div id="main" class='layout-navbar'>
		<div id="main-content">

			<div class="page-heading">
				<div class="page-title mb-5">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Patients List</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Patient
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
					
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3 col-12">
									<fieldset class="form-group">
										<label for="orderBy" class="form-label">Order by</label>
										<select class="form-select dropdown-group" name="orderBy" id="orderBy">
											<option value="0">Default</option>
											<option value="0">Order by Date ASC</option>
											<option value="0">Order by Date DESC</option>
										</select>
									</fieldset>
								</div>
								
								<!-- 
								<div class="col-sm-3 col-6">
									<fieldset class="form-group">
										<label for="byVendor" class="form-label">By Status</label>
										<select class="form-select dropdown-group" name="byVendor" id="byVendor">
											<option value="1">Incoming</option>
											<option value="2">Pending</option>
											<option value="3">Examination Complete</option>
										</select>
									</fieldset>
								</div>
								 -->
								
								
								<div class="col-sm-3 col-6">
									<fieldset class="form-group">
										<label for="byType" class="form-label">By Doctor</label>
										<select class="form-select dropdown-group" name="byType" id="byType">
											<option value="0">All</option>
											<c:forEach items="${doctors}" var="doctors">
												<option value="${doctors.firstname}">${doctors.firstname}</option>
											</c:forEach>
										</select>
									</fieldset>
								</div>
								
								<div class="col-sm-4 col-6 c-dflx justify-content-between ms-auto p-2">
								    <label for="startDate">From</label>&nbsp;
								    <input type="date" maxlength="50" name="startDate" id="startDate" class="form-control me-3 dropdown-group" placeholder="Start Date" value="${startDate}" />
								    
								    <label for="endDate">To</label>&nbsp;
								    <input type="date" maxlength="50" name="endDate" id="endDate" class="form-control dropdown-group" placeholder="End Date" value="${endDate}" />
								</div>
								
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
								<a href="${pageContext.request.contextPath}/Patient/addNewPatient" class="btn btn-primary">  <i class="bi bi-credit-card-2-back "></i> New Patient</a>
							</div>
	
						</div>
					<hr>

					<h3 id="searchCard"></h3>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="inv-data-tble">
										<table class="table table-striped" id="itemTable">
											<thead>
												<tr style="background-color: #D9DFF2;">
													<th>Name</th>		
													<th>Age</th>
													<th>Phone</th>
													<th>Visit Date</th>
													<th>Ass.By</th>
													<th>Ass.To</th>
												    <th width="10%"></th>
												</tr>
											</thead>
											 
											 
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
						</div>
					</div>

				</section>
			</div>
		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script>
	var aoColumns = [{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.patientData.name + ' ' + data.patientData.lastName;
				if(status==null){
					status="-";
				}
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.patientData.age;
				if(status==null){
					status="-";
				}
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.patientData.phoneNumber;
				if(status==null){
					status="-";
				}
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status =  data.eventStartDate;
				var startDate = new Date(status);
				var formattedStartDate = formatDate(startDate);

				if(status==null){
					status="-";
				}
				return '<div class=\"form-check-Data\">'+formattedStartDate+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.assignedBy;
				if(status==null){
					status="-";
				}
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = data.assignedTo;
				if(status==null){
					status="-";
				}
				return '<div class=\"form-check-Data\">'+status+'</div>';
			}
		},{
			"mData" : null,
			"mRender" : function(data) {
				var status = "<div class='action-buttons'><a class='red' href='${pageContext.request.contextPath}/Patient/editExistingPatientData/"+data.id+"'><i class='bi bi-eye-fill'></i></a></div>";
				return status;
			}
		}];

		$(document).ready(function(){
			$('.cancelIcon').hide();
			$('#searchCard').hide();
			
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Patient/sendPatientTableData/'+startDate+'/'+endDate,
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.item,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						"processing": true,
						info:           false,
					    paging:         false,
					    searching: 		false,
						language: {
								processing: "<div class='loader'></div>"
							}
					    
					} );
					$('#p1').text(response.page1);
					$('#p2').text(response.page2);
					$('#p3').text(response.page3);
					$('#p4').text(response.page4);
					$('#p5').text(response.page5);
					$('#p9').attr("data-initial-value",response.countItem)
					
				}
			});
		});
		
		
		$('.dropdown-group').on('change',function(){
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var assignedTo = $('#assignedTo').val();
			var orderByVal = $('#orderBy').val();
			
			$('#poSearchValue').val('');
			$('#searchCard').text('');
			var searchValue=$('#poSearchValue').val();
			$('#searchCard').text(searchValue);
			
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Patient/sendPatientTableData/'+startDate+'/'+endDate,
				data: {
					page: 1,
					orderBy: orderByVal,
					assignedTo: assignedTo,
				}, 
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.item,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						"processing": true,
						info:           false,
					    paging:         false,
					    searching: 		false,
						language: {
								processing: "<div class='loader'></div>"
							}
					    
					} );
					$('#p1').text(response.page1);
					$('#p2').text(response.page2);
					$('#p3').text(response.page3);
					$('#p4').text(response.page4);
					$('#p5').text(response.page5);
					$('#p9').attr("data-initial-value",response.countItem)
					
				}
			}); 
		});
		
		function handlePage(x){
			var searchValue=$('#searchCard').text();
			var orderByVal=$('#orderBy').val();
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var assignedTo = $('#assignedTo').val();

			if(x===1){
				var pagenum = $('#p1').text();
			}
			if(x===2){
				var pagenum = $('#p2').text();
			}
			if(x===3){
				var pagenum = $('#p3').text();
			}
			if(x===4){
				var pagenum = $('#p4').text();
			}
			if(x===5){
				var pagenum = $('#p5').text();
			}
			if(x===6){
				var pagenum = 1;
				$('.page-item').each(function() {
					if($(this).hasClass("active")){
						pagenum=$(this).after().text();
						if(pagenum === '1'){
							
						} else {
							pagenum = Number(pagenum) - 1;
						}
					}
		   	    });
			}
			if(x===7){
				var pagenum = 1;
				$('.page-item').each(function() {
					if($(this).hasClass("active")){
						pagenum=$(this).after().text();
						pagenum = Number(pagenum) + 1;
					}
		   	    });
			}
			if(x===8){
				var pagenum = 1;
			}
			if(x===9){
				var pagenum = $('#p9').attr("data-initial-value");
			}
			
			if(pagenum==="-"){
				return;
			}
			
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
				
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Patient/sendPatientTableData/'+startDate+'/'+endDate,
				data: {
					page: pagenum,
					search: searchValue,
					orderBy: orderByVal,
					assignedTo: assignedTo,
				},
				success : function(response) {
					console.log(response);
					$('#itemTable').DataTable( {
						data: response.item,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						"processing": true,
						info:           false,
					    paging:         false,
					    searching: 		false,
						language: {
								processing: "<div class='loader'></div>"
							}
					    
					} );
					$('#p1').text(response.page1);
					$('#p2').text(response.page2);
					$('#p3').text(response.page3);
					$('#p4').text(response.page4);
					$('#p5').text(response.page5);
					$('#p9').attr("data-initial-value",response.countItem)

					if(response.page===1){
						 $("#l2").addClass("active");
						 $("#l1,#l3,#l4,#l5").removeClass("active");
					} else if(response.page===2){
						 $("#l3").addClass("active");
						 $("#l1,#l2,#l4,#l5").removeClass("active");
					} else {
						 $("#l1").addClass("active");
						 $("#l2,#l3,#l4,#l5").removeClass("active");
					}
					
					if(response.pageLimit===1 || response.pageLimit===2){
						$('#p4,#p5').text('-');
					}
				}
			});
			
		};
		
		function searchHandler(){
			var searchValue=$('#poSearchValue').val();
			var orderByVal=$('#orderBy').val();
			var startDate = '2024-01-01';
			var endDate = '2029-01-01';
			var isReception = 1;
			if(searchValue==''){
				startDate = $('#startDate').val();
				endDate = $('#endDate').val();
				isReception = 0;
			}
			
			var assignedTo = $('#assignedTo').val();
			
			$('#searchCard').text(searchValue);
			if ( $.fn.DataTable.isDataTable('#itemTable') ) {
				$('#itemTable').DataTable().destroy();
				$('#itemTable tbody').empty();
				
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/Patient/sendPatientTableData/'+startDate+'/'+endDate,
				data: {
					page: 1,
					search: searchValue,
					orderBy: orderByVal,
					assignedTo: assignedTo,
					isReception: isReception,
				},
				success : function(response) {
					$('#itemTable').DataTable( {
						data: response.item,
						"aoColumns": aoColumns,
						"scrollX": true,
						ordering: false,
						"processing": true,
						info:           false,
					    paging:         false,
					    searching: 		false,
						language: {
								processing: "<div class='loader'></div>"
							}
					    
					} );
					var searchVar = response.searchVal;
					$('#p1').text(response.page1);
					$('#p2').text(response.page2);
					$('#p3').text(response.page3);
					$('#p4').text(response.page4);
					$('#p5').text(response.page5);
					$('#p9').attr("data-initial-value",response.countItem)
					
					if(response.page===1){
						 $("#l2").addClass("active");
						 $("#l1,#l3,#l4,#l5").removeClass("active");
					} else if(response.page===2){
						 $("#l3").addClass("active");
						 $("#l1,#l2,#l4,#l5").removeClass("active");
					} else {
						 $("#l1").addClass("active");
						 $("#l2,#l3,#l4,#l5").removeClass("active");
					}
					
					if(response.pageLimit===1 || response.pageLimit===2){
						$('#p4,#p5').text('-');
					}
				}
				
			});
		}
		
		var inputElement = document.getElementById('poSearchValue');
	    inputElement.addEventListener('keydown', function(event) {
	        if (event.key === 'Enter' || event.keyCode === 13) {
	        	searchHandler();
	        }
	    });
		// Assuming you have received the Unix timestamps for eventDate and eventStartDate
		function formatDate(date) {
		    var year = date.getFullYear();
		    var month = ('0' + (date.getMonth() + 1)).slice(-2);
		    var day = ('0' + date.getDate()).slice(-2);
		    var hours = ('0' + date.getHours()).slice(-2);
		    var minutes = ('0' + date.getMinutes()).slice(-2);
		    var seconds = ('0' + date.getSeconds()).slice(-2);
		    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
		}

		
		
	</script>

</body>
</html>