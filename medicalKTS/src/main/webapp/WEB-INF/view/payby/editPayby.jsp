<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Banners Hallmark - Edit Pay By</title>
</head>
<body>
	 <div id="main" class='layout-navbar'>
            <div id="main-content">



                <div class="page-heading">

                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Edit  Pay By</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/payby/paybyData"> Pay By</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Edit  Pay By
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section blnk-db">
                    	<form:form class="form-horizontals" method="post" id="user_form"
						name="user_form"  action="${pageContext.request.contextPath}/payby/updatePayby"  modelAttribute="payby">
						<form:input type="hidden" path="id"/>
					        <%@ include file="../common/error-and-success-message.jsp" %>

                            <div class="card tp-inpt">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="Payby">Pay by</label>
                                                <form:input type="text" name="paybyName" id="paybyName"
															path="paybyName" class="form-control"
															placeholder="pay by" value="" required="true"/>
                                            </div>
                                        </div>
                                        



                                    </div>
                                </div>
                            </div>                           

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <button type="submit" class=" c-btn btn btn-primary me-3 mb-1">Update</button>
                                     <a href="${pageContext.request.contextPath}/payby/paybyData" class="c-btn btn btn-danger  mb-1">Cancel</a>
                               
                                </div>
                            </div>
                        </form:form>

                    </section>

                </div>



                <footer>
                    <div class="footer clearfix mb-0 text-muted c-ftr">
                        <div class="float-start">
                            <p>2021 &copy; Banners Hallmark</p>
                        </div>
                        <div class="float-end">
                            <p>Developed by <span class="text-danger"><i class="bi bi-heart"></i></span> <a
                                    href="#">Suntek
                                    IT Solutions </a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script>
	    var filterActive;
	
	    function filterCategory(category) {
	        if (filterActive != category) {
	
	            // reset results list
	            $('.filter-cat-results .f-cat').removeClass('active-inv-v');
	
	            // elements to be filtered
	            $('.filter-cat-results .f-cat')
	                .filter('[data-cat="' + category + '"]')
	                .addClass('active-inv-v');
	
	            // reset active filter
	            filterActive = category;
	        }
	    }
	
	    // $('.f-cat').addClass('active');
	
	    $('.filtering select').change(function () {
	        if ($(this).val() == 'cat-all') {
	            $('.filter-cat-results .f-cat').addClass('active-inv-v');
	            filterActive = 'cat-all';
	        } else {
	            filterCategory($(this).val());
	        }
	    });
	</script>
    
</body>
</html>