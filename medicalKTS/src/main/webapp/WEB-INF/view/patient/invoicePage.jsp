<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Invoice Page</title>
	<style>
	</style>
</head>
<body>
<div class="container-fluid">
    <div class="row mx-5">
        <div class="col text-end mx-5"> <!-- Aligns content to the right -->
            <a href="${pageContext.request.contextPath}/Patient/getReport2/${id}">
                <button class="btn btn-outline-primary w-25">Print</button>
            </a>
        </div>
    </div>
</div>
<div class="container mt-4">
    <div class="card shadow-sm p-4">
        <div class="row mb-4">
            <div class="col-12">
                <h3 class="text-primary">Invoice Details</h3>
                <p class="text-muted">Welcome to the KMS Dashboard! Manage your hospital's operations efficiently with our intuitive tools and features.</p>
            </div>
        </div>
        
        <!-- Invoice Info -->
        <div class="row mb-4 p-3 bg-light">
            <div class="col-md-6">
                <h5 class="text-dark">Invoice</h5>
                <p class="mb-1"><strong>Billed To:</strong></p>
                <p class="mb-1"><strong>Client Name:</strong> ${patient.patientData.name}</p>
                <p class="mb-0"><strong>Address / Contact Info:</strong> ${patient.patientData.address}</p>
            </div>
            <div class="col-md-6 text-end">
                <p class="mb-1"><strong>Invoice No.</strong> #000123</p>
                <p class="mb-1"><strong>Issued Date:</strong> ${patient.patientData.registryDate}</p>
                <p class="mb-0"><strong>Payment Due:</strong> December 22, 2022</p>
            </div>
        </div>
        
        <!-- Services Table -->
        <div class="table-responsive mb-4">
            <h5 class="text-dark">Services</h5>
            <table class="table table-bordered">
                <thead class="table-light">
                    <tr>
                        <th>Date</th>
                        <th>Service</th>
                        <th>Measuring Unit</th>
                        <th>Price</th>
                        <th>Discount</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${examinationData}" var="examination">
                        <tr>
                            <td>${examination.extraNote}</td>
                            <td>${examination.examination}</td>
                            <td>${examination.medicService.measurmentUnit}</td>
                            <td>${examination.medicService.price}</td>
                            <td>0.00 ETB</td>
                            <td>${examination.medicService.price}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        
        <!-- Total -->
        <div class="row mb-4">
            <div class="col-12 text-end">
                <h4>Total (ETB): <span class="text-primary">${total}</span></h4>
            </div>
        </div>
        
        <!-- Footer -->
        <div class="row border-top pt-3">
            <div class="col-6">
                <p class="mb-0"><strong>Company Name LLC</strong></p>
                <p class="mb-0">Bole Addis Ababa, ETHIOPIA</p>
                <p class="mb-0">Email@company.com</p>
                <p class="mb-0">Phone Number</p>
                <p class="mb-0">+2519-4567-8903</p>
                <p class="mb-0">+2519-4567-8903</p>
            </div>
            <div class="col-6 text-end">
                <img src="${pageContext.request.contextPath}/resources/assets/images/logo/logo.png" alt="KTS logo">
            </div>
        </div>
    </div>
</div>
<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js">
</script>
</body>
</html>