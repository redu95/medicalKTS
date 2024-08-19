<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Add Item</title>
	<style>
		::-webkit-input-placeholder {
		   font-weight: 100;
		   font-style: italic;
		}
		
		:-moz-placeholder { /* Firefox 18- */
		   font-weight: 100;
		   font-style: italic;
		}
		
		::-moz-placeholder {  /* Firefox 19+ */
		   font-weight: 100;
		   font-style: italic;
		}
		
		:-ms-input-placeholder {  
		   font-weight: 100;
		   font-style: italic;
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
							<h3>Add item</h3>
							<!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="${pageContext.request.contextPath}/Institute/medicItems">
											Items</a></li>
									<li class="breadcrumb-item active" aria-current="page">Add
										Item</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section blnk-db">
					<form:form class="form-horizontals" method="post" id="user_form"
						onsubmit="saveForm()" name="user_form" action="addItemsData"
						modelAttribute="item">
						<%@ include file="../common/error-and-success-message.jsp"%>

						<div class="card tp-inpt">
							<div class="card-body">

								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="itemName">Item Name</label>
											<form:input type="text" maxlength="50" name="itemName"
												id="itemName" path="itemName" class="form-control"
												placeholder="Enter Item Name " value="" required="true" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="form-group">
											<label for="lastname">Description</label>
											<form:textarea type="text" name="description" rows="3"
												id="description" path="description" class="form-control"
												placeholder="Add Description" value="" required="true" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-4">
										<div class="form-group">
											<label for="onHand">Quantity</label>
											<form:input type="number" maxlength="50" name="totalQuanitiy"
												id="totalQuanitiy" path="totalQuanitiy" class="form-control"
												placeholder="" value="" required="true" />
										</div>
									</div>
									<div class="col-4">
										<div class="form-group">
											<label for="onHand">Min.Stock</label>
											<form:input type="number" maxlength="50" name="minimunStock"
												id="minimunStock" path="minimunStock" class="form-control"
												placeholder="" value="" required="true" />
										</div>
									</div>
									<div class="col-4">
										<div class="form-group">
											<label for="itemType">Measurement unit</label>
											<form:select type="text" name="measmurmentUnit" id="measmurmentUnit"
												path="measmurmentUnit" class="form-select" placeholder="Measmurment Unit"
												value="">
												<form:option value="#">-- Select unit --</form:option>
												<form:option value="1">Pcs</form:option>
												<form:option value="2">Liter</form:option>
												<form:option value="3">KG</form:option>
											</form:select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="itemType">Item Type</label>
											<form:select type="text" name="itemType" id="itemType"
												path="itemType" class="form-select" placeholder="itemType"
												value="">
												<form:option value="#">-- Select type --</form:option>
												<form:option value="1">Consumable</form:option>
												<form:option value="2">Durable</form:option>
											</form:select>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label for="vendorName">Vendor Name</label>
											<form:select type="text" name="vendorName" id="vendorName"
												path="vendorName" class="form-select" placeholder="vendorName"
												value="">
												<form:option value="#">-- Select vendor --</form:option>
												<form:option value="1">AISE</form:option>
												<form:option value="2">EPA</form:option>
												<form:option value="3">other</form:option>
											</form:select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<a href="${pageContext.request.contextPath}/Institute/medicItems"
									class="c-btn btn btn-primary me-3 mb-1" style="color: #435ebe; background-color: transparent;" >Cancel</a>
								<button type="submit" class=" c-btn btn btn-primary"
									id="saveData">Save</button>

							</div>
						</div>
						
					</form:form>

				</section>

			</div>

		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<script>
		function saveForm() {
			document.getElementById("saveData").disabled = true;
		}
		
		$(document).ready(function(){
			$('.datetimepick').hide();
		});
		
		function toggleDateTime() {
			$('.datetimepick').toggle();
		}
	</script>
</body>
</html>