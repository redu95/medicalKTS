
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Banners Hallmark - Reset Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css"  type="text/css">			
			    

  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css"  type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pages/auth.css" type="text/css">

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/data-table-jq.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/costom-c.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon"  type="text/css">
		  
</head>
<body>


 <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left" class="cus-log">
                    
                    <h1 class="auth-title">Reset Password</h1>
                    <p class="auth-subtitle mb-5">Input your new password here.</p>

                     
                     
                       

                     

                 <form:form class="form-horizontals" method="post" id="user_form" name="user_form" action="${pageContext.request.contextPath}/users/reset/newResetPassword/${randomId}" modelAttribute="users">
                      <div class="form-group position-relative has-icon-left mb-4">
                            <form:input type="password" class="form-control form-control-xl" id="newpassword"  path="" placeholder="Enter New Password" required="true"/>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                           <form:input type="password" class="form-control form-control-xl" id="confirmpassword"  path="password" placeholder="Enter Confirm Password" required="true"/>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                               <p class=" eror-msg   text-danger">   </p>
                        </div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Reset</button>
                    </form:form>   
                    <%--  <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Remember your login credentials? <a href="${pageContext.request.contextPath}/login" class="font-bold">Log
                                in</a>.
                        </p>
                    </div> --%>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">
            <img src="${pageContext.request.contextPath}/resources/assets/images/logo/logo-white.png" alt="">
               </div>
            </div>
        </div>

    </div>
  <script>
  
    function checkPasswordMatch() {
        var newpassword = $("#newpassword").val();
        var confirmPassword = $("#confirmpassword").val();
        if (newpassword != confirmPassword)
            $(".text-danger").text("Passwords does not match!");
        else
            $(".text-danger").text("Passwords match.");
    }
    $(document).ready(function () {
       $("#confirmpassword").keyup(checkPasswordMatch);
    });
    </script>
</body>

</html>