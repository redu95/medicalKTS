<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
  <title>Login</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <style>
    body {
        background-color: #f9f9f9;
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 700px;
        
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 15%;
        color: #3c8dbc;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form1 {
        padding-top: 20px;
    }
    
    .pass {
            width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
   
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #3c8dbc, #3c8dbc);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
       
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    .forgot {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #3c8dbc;
        padding-top: 15px;
    }
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        text-decoration: none
    }
    
    @media (max-width: 600px) {
        .main {
            border-radius: 0px;
        }
        
  </style>
</head>
 
 <body valign="middle" align="center" style="height: 100%;vertical-align:middle">
  <div class="main" align="center" valign="middle"><div><div align="center">&nbsp;</div>
    <img src="https://cdn.shopify.com/s/files/1/0271/1971/4406/files/Logo_BH-14_180x.png?v=1603933050"></div>
   
    <form  class="form1" action="" id="submitData" method="get">
     <div align="center">
    <input class="un" type="text" id="username" name="username" placeholder="User Id" required="">
      </div>    
       <div align="center">                 
      <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
     </div> <div align="center">
        <input type="button"  id="saveId" class="submit" class="btn btn-block btn-primary btn-default"  value="Submit">
    <div align="center">&nbsp;</div>                   
     <!--  <a class="submit" onclick="submit();" align="center">Sign in</a> -->
      <%--  <p class="forgot" align="center"><a href="${pageContext.request.contextPath}/forgot">Forgot Password?</a></p>
       --%>      
       </div>
       </form>         
    </div>
     

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