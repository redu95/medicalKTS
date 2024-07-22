<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banners Hallmark - Forgot Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css"  type="text/css">			
			    

  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css"  type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pages/auth.css" type="text/css">
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
                    
                    <h1 class="auth-title">Forgot Password</h1>
                    <p class="auth-subtitle mb-5">Input your Username and we will email you the reset password link.</p>
   
                    <%@ include file="common/error-and-success-message.jsp" %>
                    <form  class="form1" action="" id="submitData" method="get">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" placeholder="Username"  id="username" name="username">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <button   id="saveId" class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Send</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Remember your login credentials? <a href="${pageContext.request.contextPath}/login"  class="font-bold">Log
                                in</a>.
                        </p>
                    </div>
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
  
  $(document).ready(function (){
  
	  $("#saveId").click(function() {
		  
		  
		 
	    	   var username = $('#username').val(); 
	    	 //alert("========username======="+username);
	    	   if(username!=null)
	    		{   
			   $('#submitData').attr('action', "${pageContext.request.contextPath}/users/reset/forgotpassword/"+username); 
			   $("#submitData").submit();   
	           }
		});
	    
   });
     </script>
  
    
</body>

</html>