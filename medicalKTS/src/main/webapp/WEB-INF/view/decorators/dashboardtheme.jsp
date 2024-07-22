<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../parts/cachecontrol.jsp"></jsp:include>

<html lang="en">

	<head>
		<title><sitemesh:write property='title' /></title>
			<sitemesh:write property='head' />
			
				<meta charset="UTF-8">
			    <meta name="viewport" content="width=device-width, initial-scale=1.0">
			    <title> Banners Hallmark</title>
			
			 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
	
				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
			    <link rel="preconnect" href="https://fonts.gstatic.com">
			    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
			   
			    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css"  type="text/css">			
			   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/simple-datatables/style.css"  type="text/css">			
			    --%>     
			     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/datatables.min.css"  type="text/css">			
			 
			    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css"  type="text/css">
			    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css"  type="text/css">
			    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css"  type="text/css">
			    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon"  type="text/css">
				<jsp:include page="../decorators/script.jsp"></jsp:include>
	</head>

	
		
	<body>
		
		<div id="app">	
		<jsp:include page="../decorators/navbar.jsp"></jsp:include>	
		<jsp:include page="../decorators/header.jsp"></jsp:include>	
		<sitemesh:write property='body'/> 	
		
	</body>
	
		
		<!-- <jsp:include page="../decorators/footer.jsp"></jsp:include> -->
</html>