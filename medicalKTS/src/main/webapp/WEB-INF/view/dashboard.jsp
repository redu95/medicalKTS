<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>Banners Hallmark - Dashboard</title>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script> -->
<style type="text/css">
	.chart-section {
		text-align: center;
		font-weight: bold;"
		
	}
	.chart-section canvas {
		border-radius: 15px;
	}
.height{
	min-height: 400px;
}
.dot {
  width: 100px;
  height: 100px;
  line-height: 100px;
  border-radius: 50%;
  font-size: 25px; 
  color: #fff;
  text-align: center;
  background: blue;
  display: inline-block;
}
</style>
</head>
<body>
	<!-- Content Header (Page header) -->
	<div id="main" class='layout-navbar'>
		<div id="main-content">

			<div class="page-heading">
				<div class="page-title mb-5">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Dashboard</h3>
						</div>
					</div>
				</div>
				<c:if test="${not empty param.msg}">
					<div class="eror-msg">
						<div class="card">
							<div class="card-body error-msg">
								<p class="text-danger">Error - ${param.msg}</p>
								<a class="delete-msg btn btn-light">X</a>
							</div>
						</div>
					</div>
				</c:if>

				<section class="section blnk-db ">
					<div class="row">
						<div class="col-6 chart-section">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Invoices</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-4">
											<div>
												<div class="dot">${reviewingInvoices}</div>
											</div>
											Reviewing
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${reviewedInvoices}</div>
											</div>
											Reviewed
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${approvedInvoices}</div>
											</div>
											Approved
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 chart-section">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Purchase Orders</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-6">
											<div>
												<div class="dot">${verifiedPoCount}</div>
											</div>
											Verified POs
										</div>
										<div class="col-6">
											<div>
												<div class="dot">${totalNoOfUnverifiedPO}</div>
											</div>
											Unverified POs
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-6 chart-section">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Invoices Errors</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-4">
											<div>
												<div class="dot">${totalNoOfUnverifiedInvoice}</div>
											</div>
											Unverified Invoices
										</div>
										<div class="col-4">
											<div>
												<div class="dot"> ${erroredUnverifiedInvoices}</div>
											</div>
										Total Invoices Errors
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${duplicateInvoices}</div>
											</div>
											Duplicates
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${vendorIDNotExistsInvoices}</div>
											</div>
											No Vendor ID
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${siteNotExistsInvoices}</div>
											</div>
											No Site ID
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6 chart-section">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Purchase Order Errors</h4>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-4">
											<div>
												<div class="dot">${noOfErroredUnverifiedPO}</div>
											</div>
											Total PO Errors
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${duplicatePO}</div>
											</div>
											Duplicates
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${vendorIDNotExists}</div>
											</div>
											No Vendor ID
										</div>
										<div class="col-4">
											<div>
												<div class="dot">${siteNotExists}</div>
											</div>
											No Site ID
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="c-dflx">
								<div class="inv-mark">
									<fieldset class="form-group me-2">
										<select class="form-select" name="filterValue" id="filterInvoice">
											<option value="1"> 
												ALL Unverified Invoices with Either Duplicates OR Vendor/Site Not Exists
											</option>
											<option value="2"> Duplicate Unverified Invoices </option>
											<option value="3"> Unverified Invoices with Vendor Not Exists </option>
											<option value="4"> Unverified Invoices with Site Not Exists </option>
										</select>
									</fieldset>
								</div>
								<button type="button" class="btn btn-danger" id="deleteInvoices">Delete</button>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Unverified Errored Invoices</h4>
						</div>
						<div class="card-body  ">
							<div class="inv-data-tble">
								<table class="table table-striped invalidInvoice">
									<thead>
										<tr>
											<th> <input type="checkbox" class="form-check-input checkAllInvoices me-2"> Invoice Number</th>
											<th width="10%">Action</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="c-dflx">
								<div class="inv-mark">
									<fieldset class="form-group me-2">
										<select class="form-select" name="filterValue" id="filterValue">
											<option value="1" selected > ALL Unverified PO with Either Duplicates OR Vendor/Site Not Exists </option>
											<option value="2"> Duplicate Unverified PO</option>
											<option value="3"> Unverified PO with Vendor Not Exists</option>
											<option value="4"> Unverified PO with Site Not Exists</option>
										</select>
									</fieldset>
								</div>
								<button type="button" class="btn btn-danger" id="deletePurchaseOrder">Delete</button>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">Unverified Errored Purchase Orders</h4>
						</div>
						<div class="card-body ">
							<div class="inv-data-tble">
								<table class="table table-striped invalidPo">
									<thead>
										<tr>
											<th> <input type="checkbox" class="form-check-input checkAllPo me-2"> PO Number</th>
											<th width="10%">Action</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</section>
			</div>
			<footer>
				<div class="footer clearfix mb-0 text-muted c-ftr">
					<div class="float-start">
						<p>2021 &copy; Banner Hallmark</p>
					</div>
					<div class="float-end">
						<p>
							Developed by <span class="text-danger"><i
								class="bi bi-heart"></i></span> <a href="#">Suntek IT Solutions </a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
		function handleSelectData() {
// 			var statusValue = $("#filterValue").val();
// 			var statusInvoice = $("#filterInvoice").val();
// 			url = "${pageContext.request.contextPath}/dashboard/duplicatesAll"
// 					+ "?filterData=" + statusValue + "&filterInvoice="
// 					+ statusInvoice;
// 			// 	    	

// 			//url = "${pageContext.request.contextPath}/dashboard/duplicatesAll?filterData="+statusValue;

// 			window.location = url;

		}
		var poDataTable = null, invoiceDataTable;
		var aoColumns = [{
		      "mData": null,
		      "bSortable": false,
		      "mRender": function(data, type, full) {
		        return "<input type='checkbox' value="+data+" class='form-check-input example-select-single me-2'>" + data;
		      }
		    }, {
		      "mData": null,
		      "bSortable": false,
		      "mRender": function(data, type, full) {
		        return  '<div class="action-buttons">' +
		        '		<a class="red" title="Delete Purchase Order" href="${pageContext.request.contextPath}/dashboard/deleteBypoNumber/'+full+'"' +
		        '		onclick=\'return confirm("Are you sure to delete?")\' >'+
		        '			<span class="badge bg-danger"><i class="bi bi-trash-fill"></i></span>' +
		        '		</a>'+
	        	'	</div>';
		      }
		    }
	    ];
		var aoColumnsInvoice = [{
		      "mData": null,
		      "bSortable": false,
		      "mRender": function(data, type, full) {
		        return "<input type='checkbox' value="+data+" class='form-check-input example-select-single me-2'>" + data;
		      }
		    }, {
		      "mData": null,
		      "bSortable": false,
		      "mRender": function(data, type, full) {
		        return  '<div class="action-buttons">' +
		        '		<a class="red" title="Delete Purchase Order" href="${pageContext.request.contextPath}/dashboard/deleteByinvoiceNo/'+full+'"' +
		        '		onclick=\'return confirm("Are you sure to delete?")\' >'+
		        '			<span class="badge bg-danger"><i class="bi bi-trash-fill"></i></span>' +
		        '		</a>'+
	        	'	</div>';
		      }
		    }
	    ];
		$(document).ready(function() {
	        // Options define for display value on top of bars
	        var chartOption = {
//         		indexAxis: 'y',
	            hover: {
	                animationDuration: 1
	            },
	        	plugins: {
		            legend: {
		                display: false,
		             }
	            }
	        };
			invoiceDataTable = $('.invalidInvoice').DataTable({
				serverSide: true,
				scrollX : true,
				ajax: {
					url : '${pageContext.request.contextPath}/dashboard/getPaginatedInvalidInvoice',
					data : {
						filterInvoice: function() {
							return $("#filterInvoice").val();
						}
					}
				},
			 	info:           true,
			    paging:         true,
			    serverMethod : 'POST',
			    aSort: false,
			    ordering: false,
				"aoColumns": aoColumnsInvoice,
				"processing": true,
				language: {
					processing: "<div class='loader'></div>",
					paginate: {
 			        	sNext: '<span class="pagination-default">&#x276f;</span>',
 			        	sPrevious: '<span class="pagination-default">&#x276e;</span>'
 			    	}
				}
			});

			poDataTable = $('.invalidPo').DataTable({
				serverSide: true,
				scrollX : true,
				ajax: {
					url : '${pageContext.request.contextPath}/dashboard/getPaginatedInvalidPo',
					data : {
						filterData: function() {
							return $("#filterValue").val();
						}
					}
				},
			 	info:           true,
			    paging:         true,
			    serverMethod : 'POST',
			    ordering: false,
				"aoColumns": aoColumns,
				"processing": true,
				language: {
					processing: "<div class='loader'></div>",
					paginate: {
 			        	sNext: '<span class="pagination-default">&#x276f;</span>',
 			        	sPrevious: '<span class="pagination-default">&#x276e;</span>'
 			    	}
				}
			});
			$("#filterInvoice").change(function() {
				invoiceDataTable.ajax.reload();
			});
			$("#filterValue").change(function() {
				poDataTable.ajax.reload();
			});
			$("#deleteInvoices").click(function() {
				var invoiceIds = [];
				invoiceDataTable.rows().iterator('row', function(context, index) {
		    	    var node = $(this.row(index).node());
		    	    var curCheckbox = $(node).find('.form-check-input');
		    	    if(curCheckbox.prop("checked")) {
		    	    	invoiceIds.push(curCheckbox.val());
		    	    }
		    	});
				if(invoiceIds.length > 0) {
					$.ajax({
			            url:"${pageContext.request.contextPath}/dashboard/deleteBulkByinvoiceNo",
			            data: JSON.stringify(invoiceIds),
		   				type: "POST",
		   				contentType: "application/json; charset=utf-8",
		   				success: function (response) {
	   						if(response.result == "Success") {
	   							invoiceDataTable.ajax.reload();
	   						} else if(response.result == 'noPermission') {
	   							alert("You don't have permission for this action.");
	   						}
		   				}
		   			});
				} else {
					// no invoice selected
				}
			});
			$("#deletePurchaseOrder").click(function() {
				var poNumbers = [];
				poDataTable.rows().iterator('row', function(context, index) {
		    	    var node = $(this.row(index).node());
		    	    var curCheckbox = $(node).find('.form-check-input');
		    	    if(curCheckbox.prop("checked")) {
		    	    	poNumbers.push(curCheckbox.val());
		    	    }
		    	});
				if(poNumbers.length > 0) {
					$.ajax({
			            url:"${pageContext.request.contextPath}/dashboard/deleteBulkBypoNumber",
			            data: JSON.stringify(poNumbers),
		   				type: "POST",
		   				contentType: "application/json; charset=utf-8",
		   				success: function (response) {
	   						if(response.result == "Success") {
	   							poDataTable.ajax.reload();
	   						} else if(response.result == 'noPermission') {
	   							alert("You don't have permission for this action.");
	   						}
		   				}
		   			});
				} else {
					// no invoice selected
				}
			});
			$('.checkAllInvoices').click(function () {
	            var rows = invoiceDataTable.rows({ 'search': 'applied' }).nodes();
	            $('.example-select-single', rows).prop('checked', this.checked);
	        });
			$('.checkAllPo').click(function () {
	            var rows = poDataTable.rows({ 'search': 'applied' }).nodes();
	            $('.example-select-single', rows).prop('checked', this.checked);
	        });
			poDataTable.on("xhr", function() {
	    		$(".checkAllPo").prop("checked", false);
	    	});
			invoiceDataTable.on("xhr", function() {
	    		$(".checkAllInvoices").prop("checked", false);
	    	});
		});
	</script>


</body>
</html>