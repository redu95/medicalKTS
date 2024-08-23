<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Preferences</title>
    <style>

    </style>
</head>
<body>
<div class="card rounded-2 m-5 shadow-sm">
    <div class="card-header">
        <h1 class="title text-center    ">Preferences</h1>
    </div>
    <div class="card-body row">
        <div class="text-primary col-sm-6 text-end">Appointment duration</div>
        <div class="col-sm-6 d-flex "><input class="input" type="number" placeholder="7"></div>
    </div>
    <div class="card-body row">
        <div class="text-primary col-sm-6 text-end">Department Cards</div>
        <div class="col-sm-6 d-flex "><input class="input" type="number" placeholder="4"></div>
    </div>
    <div class="card-body row">
        <div class="text-primary col-sm-6 text-end">Rows Per Table</div>
        <div class="col-sm-6 d-flex "><input class="input" type="number" placeholder="10"></div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>