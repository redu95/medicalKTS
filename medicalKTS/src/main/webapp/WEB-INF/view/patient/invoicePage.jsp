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
<div class='row d-flex justify-content-end mx-5 px-5'>
	<a href="${pageContext.request.contextPath}/Patient/invoice">
		<button class='col-2 btn btn-outline-primary mx-3'>Print</button>
	</a>
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
                <p class="mb-1"><strong>Client Name:</strong> Solomon Kebede</p>
                <p class="mb-0"><strong>Address / Contact Info:</strong> Bole, Addis Ababa</p>
            </div>
            <div class="col-md-6 text-end">
                <p class="mb-1"><strong>Invoice No.</strong> #000123</p>
                <p class="mb-1"><strong>Issued Date:</strong> December 7, 2022</p>
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
                    <tr>
                        <td>Jun 24, 2024</td>
                        <td>Card</td>
                        <td>Per Procedure</td>
                        <td>4000.00 ETB</td>
                        <td>0.00 ETB</td>
                        <td>4000.00 ETB</td>
                    </tr>
                    <tr>
                        <td>Jun 24, 2024</td>
                        <td>Blood test</td>
                        <td>Per Procedure</td>
                        <td>4000.00 ETB</td>
                        <td>0.00 ETB</td>
                        <td>4000.00 ETB</td>
                    </tr>
                    <tr>
                        <td>Jun 24, 2024</td>
                        <td>Culture</td>
                        <td>Per Procedure</td>
                        <td>4000.00 ETB</td>
                        <td>0.00 ETB</td>
                        <td>4000.00 ETB</td>
                    </tr>
                    <tr>
                        <td>Jun 24, 2024</td>
                        <td>MRI</td>
                        <td>Per Film</td>
                        <td>4000.00 ETB</td>
                        <td>0.00 ETB</td>
                        <td>4000.00 ETB</td>
                    </tr>
                    <tr>
                        <td>Jun 24, 2024</td>
                        <td>STY Scan</td>
                        <td>Per Film</td>
                        <td>4000.00 ETB</td>
                        <td>0.00 ETB</td>
                        <td>4000.00 ETB</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <!-- Total -->
        <div class="row mb-4">
            <div class="col-12 text-end">
                <h4>Total (ETB): <span class="text-primary">24,000.00</span></h4>
            </div>
        </div>
        
        <!-- Footer -->
        <div class="row border-top pt-3">
            <div class="col-6">
                <p class="mb-0"><strong>Company Name LLC</strong></p>
                <p class="mb-0">Bole Addis Ababa, ETHIOPIA</p>
                <p class="mb-0">Email@company.com</p>
            </div>
            <div class="col-6 text-end">
                <p class="mb-0">Phone Number</p>
                <p class="mb-0">+2519-4567-8903</p>
                <p class="mb-0">+2519-4567-8903</p>
            </div>
        </div>
    </div>
</div>
<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js">
</script>
</body>
</html>