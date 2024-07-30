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

        .department-card img {
            width: 100%;
            height: auto;
        }

        .member-avatars img {
            border-radius: 50%;
            width: 24px;
            height: 24px;
            margin-left: -8px;
            border: 2px solid white;
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
		        <p class="mb-6">Welcome to the KMS Dashboard! Manage your hospital's operations efficiently with our intuitive tools and features.</p>
		        <div class="relative mb-6">
		            <input type="text" id="poSearchValue" placeholder="Search by Name" class="w-full border border-gray-300 px-4 py-2 rounded-lg">
		            <div class="absolute right-4 top-2">
		                <i class="bi bi-x-square text-red-500 cursor-pointer" onclick="clearSearch()" style="display: none;"></i>
		            </div>
		        </div>
		        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
		            <c:forEach var="department" items="${departments}">
		                <div class="department-card bg-white p-4 rounded-lg shadow">
		                    <img src="https://source.unsplash.com/random/300x200?hospital" alt="Department Image">
		                    <h3 class="text-xl font-semibold mt-4">${department.departmentName}</h3>
		                    <div class="flex items-center mt-2">
		                        <span class="text-gray-600 text-sm mr-2">MEMBERS:</span>
		                        <div class="member-avatars flex">
		                            <img src="https://source.unsplash.com/random/24x24?person" alt="Member 1">
		                            <img src="https://source.unsplash.com/random/24x24?person" alt="Member 2">
		                            <img src="https://source.unsplash.com/random/24x24?person" alt="Member 3">
		                            <img src="https://source.unsplash.com/random/24x24?person" alt="Member 4">
		                        </div>
		                    </div>
		                    <p class="text-gray-600 mt-2">${department.description}</p>
		                    <a href="${pageContext.request.contextPath}/Institute/editDepartment/${department.id}" class="bg-blue-500 text-white px-4 py-2 rounded-lg mt-4 inline-block">Details</a>
		                    <a href="#" onclick="deleteDept(${department.id})" class="bg-red-500 text-white px-4 py-2 rounded-lg mt-4 inline-block">Delete</a>
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
