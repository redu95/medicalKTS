<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<div id="main" class='layout-navbar'>
			<header class='mb-3'>
                <nav class="navbar navbar-expand navbar-light ">
                    <div class="container-fluid">
                        <a href="#" class="burger-btn d-block">
                            <i class="bi bi-justify fs-3"></i>
                        </a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                <li class="nav-item dropdown me-1">
                                    <!-- <a class="nav-link active dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class='bi bi-envelope bi-sub fs-4 text-gray-600'></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                        <li>
                                            <h6 class="dropdown-header">Mail</h6>
                                        </li>
                                        <li><a class="dropdown-item" href="#">No new mail</a></li>
                                    </ul> -->
                                </li>
                                <li class="nav-item dropdown me-3">
                                    <!-- <a class="nav-link active dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class='bi bi-bell bi-sub fs-4 text-gray-600'></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                        <li>
                                            <h6 class="dropdown-header">Notifications</h6>
                                        </li>
                                        <li><a class="dropdown-item">No notification available</a></li>
                                    </ul> -->
                                </li>
                            </ul>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="user-menu d-flex c-algn-itm-cntr">
                                        <div class="user-name text-end me-3">
                                            <h6 class="mb-0 text-gray-600">${sessionScope.userName}</h6>
                                            <!-- <p class="mb-0 text-sm text-gray-600">Administrator</p> -->
                                        </div>
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                 <c:if test="${not empty sessionScope.logoImg}">
											        <img src="data:image/jpeg;base64,${sessionScope.logoImg}" alt="User Logo" />
											    </c:if>
											    <c:if test="${empty sessionScope.logoImg}">
											         <img src="${pageContext.request.contextPath}/resources/assets/images/faces/1.jpg">
											    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <h6 class="dropdown-header">Hello, ${sessionScope.userName} !</h6>
                                    </li>
                                   
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/users/getUsers?id=${sessionScope.id}"><i class="icon-mid bi bi-person me-2"></i> My
                                            Profile</a></li>
                                    
                                  
                                   <li><a class="dropdown-item" href="${pageContext.request.contextPath}/users/changepassword"><i class="icon-mid bi bi-lock me-2"></i> 
                                             Change Password</a></li>
                                                   
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i
                                                class="icon-mid bi bi-box-arrow-left me-2"></i> Logout</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>
           
		</div>

