<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Banners Hallmark - Add Role</title>
</head>
<body>


   <div id="main" class='layout-navbar'>
            <div id="main-content">



                <div class="page-heading">

                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Add  Role</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/role/roleData"> Role</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Add Role
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section blnk-db">
                        <form:form class="form-horizontals" method="post" id="user_form"
						name="user_form" action="addNewRole"   onsubmit="saveForm()" modelAttribute="role">
                           <%@ include file="../common/error-and-success-message.jsp" %>

                            <div class="card tp-inpt">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="Payby">Role Name</label>
                                                <form:input type="text" name="name" id="name"
															path="name" class="form-control"
															placeholder="Role Name" value="" required="true"/>
                                            </div>
                                        </div>
                                        



                                    </div>
                                </div>
                            </div>                           

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <button type="submit" class=" c-btn btn btn-primary me-3 mb-1" id="saveData">Save</button>
                                    <a href="${pageContext.request.contextPath}/role/roleData" class="c-btn btn btn-danger  mb-1">Cancel</a>
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
	 function saveForm() {
			document.getElementById("saveData").disabled = true;       
	    }
	 
</script>

</body>
</html>