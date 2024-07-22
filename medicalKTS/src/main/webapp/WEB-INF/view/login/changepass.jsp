<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Banners Hallmark - Reset Password</title>
</head>
<body>
 <div id="main" class='layout-navbar'>
            <div id="main-content">



                <div class="page-heading">

                    <div class="page-title mb-5">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Change Password</h3>
                                <!-- <p class="text-subtitle text-muted">Navbar will appear in top of the page.</p> -->
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html"> Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Change Password
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <section class="section blnk-db">
                        <form class="form">
                            <div class="eror-msg">
                                <div class="card">
                                    <div class="card-body">

                                        <p class="text-danger"> Error - You missed a field, pay attention!
                                        </p>

                                        <a class="delete-msg btn btn-light">X</a>
                                    </div>
                                </div>
                            </div>

                            <div class="card tp-inpt">
                                <div class="card-body">

                                    <div class="row">
                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="new-pass">New Password</label>
                                                <input type="password" id="new-pass" class="form-control"
                                                    placeholder="New Password" name="new-pass">
                                            </div>
                                        </div>

                                        <div class="col-md-4 col-12">
                                            <div class="form-group">
                                                <label for="con-pass">Confirm Password</label>
                                                <input type="password" id="con-pass" class="form-control"
                                                    placeholder="Confirm Password" name="con-pass">
                                            </div>
                                        </div>

                                        



                                    </div>
                                </div>
                            </div>                           

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <button type="submit" class=" c-btn btn btn-primary me-3 mb-1">Update</button>
                                    <button type="reset" class="c-btn btn btn-danger  mb-1">Cancel</button>
                                </div>
                            </div>
                        </form>

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
<script src="${pageContext.request.contextPath}/resources/assets/js/costom-c.js"></script> 

    <script>
         $('.delete-msg').click(function(){
            $(this).parents(".eror-msg").remove();
        });

    </script>
</body>
</html>