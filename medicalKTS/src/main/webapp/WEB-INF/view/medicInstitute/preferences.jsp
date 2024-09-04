<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Preferences</title>
    <style>
        /* Add your styles here */
    </style>
</head>
<body>
<div class="card rounded-2 m-5 shadow-sm">
    <div class="card-header">
        <h1 class="title text-center">Preferences</h1>
    </div>
    <form action="${pageContext.request.contextPath}/Institute/savePreferences" method="post">
        <div class="card-body row">
            <div class="text-primary col-sm-6 text-end">Appointment duration</div>
            <div class="col-sm-6 d-flex" >
                <select class="input original-value" name="appointmentDuration" style="width: 30%; height: 30px">
                    <option value="10" ${userPreferences[0].preferenceValue == 10 ? 'selected' : ''}>10</option>
                    <option value="15" ${userPreferences[0].preferenceValue == 15 ? 'selected' : ''}>15</option>
                    <option value="20" ${userPreferences[0].preferenceValue == 20 ? 'selected' : ''}>20</option>
                    <option value="30" ${userPreferences[0].preferenceValue == 30 ? 'selected' : ''}>30</option>
                </select>
            </div>

        </div>
        <div class="card-body row">
            <div class="text-primary col-sm-6 text-end">Department Cards</div>
            <div class="col-sm-6 d-flex">
                <input class="input original-value" type="number"
                       name="departmentCards"
                       value="${userPreferences[1].preferenceValue}"
                       />
            </div>
        </div>
        <div class="card-body row">
            <div class="text-primary col-sm-6 text-end">Rows Per Table</div>
            <div class="col-sm-6 d-flex">
                <input class="input original-value" type="number"
                       name="rowsPerTable"
                       value="${userPreferences[2].preferenceValue}"
                        >
            </div>
        </div>
        <div class="card-body row">
            <div class="col-sm-12 text-center">
                <button class="btn btn-primary" id="saveButton" type="submit" disabled>Save Changes</button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<%--<script>--%>

<%--    $('.original-value').on('change', function(){--%>
<%--        console.log("Change event jquery");--%>
<%--        $('#saveButton').disable = false;--%>
<%--    });--%>
<%--</script>--%>
<script>
    function checkForChanges() {
        var inputs = document.querySelectorAll(".input");
        var saveButton = document.getElementById("saveButton");
        var hasChanges = false;

        inputs.forEach(function(input) {
            if (input.value !== input.getAttribute('data-original-value')) {
                hasChanges = true;
            }
        });

        saveButton.disabled = !hasChanges;
    }

    window.onload = function() {
        var inputs = document.querySelectorAll(".input");
        inputs.forEach(function(input) {
            // Set data-original-value attribute to the initial value
            input.setAttribute('data-original-value', input.value);
            // Add event listeners to detect changes
            input.addEventListener('input', checkForChanges);
            input.addEventListener('change', checkForChanges); // Detect change events
        });
    }
</script>
</body>
</html>