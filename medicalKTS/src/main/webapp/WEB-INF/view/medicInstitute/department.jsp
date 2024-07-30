<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Departments</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        
        .department-card {
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            position: relative;
        }
        
        .department-card:hover {
            transform: translateY(-5px);
        }

        .department-card img {
            width: 100%;
            height: 50%;
            object-fit: cover;
        }

        .member-avatars img {
            border-radius: 50%;
            width: 24px;
            height: 24px;
            margin-left: -8px;
            border: 2px solid white;
        }
        
        .details-button {
            background-color: white;
            border: 1px solid #3b82f6;
            color: #3b82f6;
            margin-left:125px;
        }

        .details-button:hover {
            background-color: #3b82f6;
            color: white;
        }

        .delete-icon {
            position: absolute;
            left: 16px;
            bottom: 16px;
            cursor: pointer;
            color: #fe6e6e;
        }

        .delete-icon:hover {
            color: #f87171;
        }
    </style>
</head>

<body class="bg-gray-100">
    <div id="main" class="layout-navbar">
    	<div id="main-content">
    		<div class="container mx-auto p-4">
		        <div class="flex justify-between items-center mb-6">
		            <h1 class="text-3xl font-bold">Departments</h1>
		            <a href="${pageContext.request.contextPath}/Institute/addDepartment" class="bg-blue-500 text-white px-4 py-2 rounded-lg">+ Add Department</a>
		        </div>
		        
		        <div class="relative mb-6">
		            <input type="text" id="poSearchValue" placeholder="Search by Name" class="w-full border border-gray-300 px-4 py-2 rounded-lg">
		            <div class="absolute right-4 top-2">
		                <i class="bi bi-x-square text-red-500 cursor-pointer" onclick="clearSearch()" style="display: none;"></i>
		            </div>
		        </div>
		        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
		            <c:forEach var="department" items="${departments}">
	                    <div class="department-card bg-white">
	                        <img src="${pageContext.request.contextPath}/resources/assets/images/departments/department${department.id}.jpg" alt="Department Image">
	                        <div class="p-4">
	                            <h3 class="text-xl font-semibold">${department.departmentName}</h3>
	                            <div class="flex items-center mt-2">
	                                <span class="text-gray-600 text-sm mr-2">MEMBERS:</span>
	                                <div class="member-avatars flex">
	                                    <img src="https://picsum.photos/24?random=${department.id}1" alt="Member 1">
	                                    <img src="https://picsum.photos/24?random=${department.id}2" alt="Member 2">
	                                    <img src="https://picsum.photos/24?random=${department.id}3" alt="Member 3">
	                                    <img src="https://picsum.photos/24?random=${department.id}4" alt="Member 4">
	                                </div>
	                            </div>
	                            <p class="text-gray-600 mt-2">${department.description}</p>
	                            <div class="flex justify-between items-center mt-4">
	                                <a href="${pageContext.request.contextPath}/Institute/editDepartment/${department.id}" class="details-button px-4 py-2 rounded-lg">Details</a>
	                            </div>
	                        </div>
	                        <i class="bi bi-trash-fill delete-icon" onclick="deleteDept(${department.id})"></i>
	                    </div>
	                </c:forEach>
		        </div>
		    </div>
    	</div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    <script>
        function clearSearch() {
            document.getElementById('poSearchValue').value = '';
            // Add any additional logic to handle clearing the search input
        }

        function deleteDept(id) {
            if (confirm('Are you sure to delete?')) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/Institute/deleteDepartment/' + id,
                    success: function(response) {
                        window.location.reload();
                    }
                });
            }
        }
    </script>
</body>

</html>
