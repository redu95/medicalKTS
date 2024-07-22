<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Banners Hallmark | Forgot password</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css"  type="text/css">			
			    

  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css"  type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/pages/auth.css" type="text/css">
</head>

<body>
    <div id="auth">
		
		<div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left" class="cus-log">
                    
                    <h1 class="auth-title">Forgot Password</h1>
                    <p class="auth-subtitle mb-5">Input your User ID and we will send you reset password link to your email address.</p>

                   <form  class="form1" action="" id="submitData" method="get">
                        <div class="form-group position-relative has-icon-left mb-4">
                            
                             <input class="form-control form-control-xl" type="text" id="username" name="username" placeholder="User Id" required="">
                            
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                            
                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                        </div>
                        <button  id="saveId" class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Send</button>
                        <!-- <input type="button"  id="saveId" class="submit" class="btn btn-block btn-primary btn-default"  value="Submit">
     -->
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Remember your account? <a href="${pageContext.request.contextPath}/login" class="font-bold">Log
                                in</a>.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">
                    <img src="assets/images/logo/logo-white.png" alt="">
                </div>
            </div>
        </div>
		
		
        
    </div>
    
     <script>
	         $('.delete-msg').click(function(){
	            $(this).parents(".eror-msg").remove();
	        });
	
	    </script>
	    
	    <script>
  
			  $(document).ready(function (){
			  	
				  $("#saveId").click(function() {
				    	   var username = $('#username').val(); 
				    	   if(username!=null)
				    		{   
						   $('#submitData').attr('action', "${pageContext.request.contextPath}/forgotpassword/"+username); 
						   $("#submitData").submit();   
				           }
						 
					});
				    
			   });
			  
		    
		 </script>
</body>

</html>