
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
 .kegeberew-medical-system {
    width: 200px;
    height: 25px;
    font-family: 'Gilroy-Bold';
    font-style: normal;
    font-weight: 600;
    font-size: 14px;
    line-height: 15px;
    leading-trim: both;
    text-edge: cap;
    text-align: center;
    text-transform: uppercase;
    color: #3388D7;
    /* Inside auto layout */
    flex: none;
    order: 1;
    flex-grow: 0;
    margin-top: 10px; 
    margin-left: -60px;
}
</style>
<div id="sidebar" class="active">
	<div class="sidebar-wrapper active">
		<div class="sidebar-header">
			<div class="d-flex justify-content-between">
				<div class="logo ms-5">
					<a href="${pageContext.request.contextPath}"><img
						src="${pageContext.request.contextPath}/resources/assets/images/logo/sideBarLogo.png"
						alt="Logo" srcset=""></a>
					<div class="kegeberew-medical-system">
                        Kegeberew Medical System
                    </div>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl-none d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div>
			</div>
		</div>
		<div class="sidebar-menu">
			<ul class="menu">				
				<li
					class="sidebar-item dashboard-submenu">
					<a
					href="${pageContext.request.contextPath}/Institute/dashboard"
					class="sidebar-link"> <i class="bi bi-grid"></i><span>Dashboard</span></a>
				</li>
				
				
				<li class="sidebar-item schedule-submenu">
					<a href="${pageContext.request.contextPath}/Institute/allSchedule" class="sidebar-link"> <i class="bi bi-calendar-check"></i><span>Working hours</span></a>
				</li>
				
				<li
					class="sidebar-item has-sub dept-submenu">
					<a href="#" class="sidebar-link"> <i class="bi bi-kanban"></i>
						<span>Departments</span></a>
					<ul class="submenu">
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/departmentsData"> <i
								class="bi bi-people"></i> Department details
						</a></li>
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/addDepartment"><i
								class="bi bi-shop"></i> Add department</a></li>
					</ul>
				</li>
				
				<li
					class="sidebar-item has-sub service-submenu">
					<a href="#" class="sidebar-link"> <i class="bi bi-ui-checks-grid"></i>
						<span>Services</span></a>
					<ul class="submenu">
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/serviceData"> <i
								class="bi bi-cart"></i> All services
						</a></li>
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/addService"> <i class="bi bi-plus-square"></i> Add service
						</a></li>
						<li class="submenu-item"><a
							href="#"><i
								class="bi bi-trash"></i> Deleted Services</a></li>
					</ul>
				</li>
				
				 <li
					class="sidebar-item has-sub item-submenu">
					<a href="#" class="sidebar-link"> <i class="bi bi-cart"></i>
						<span>Item Management</span></a>
					<ul class="submenu">
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/medicItems"> <i
								class="bi bi-cart"></i> Item Details
						</a></li>
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/addMedicItems"> <i
								class="bi bi-cart"></i> Add Item
						</a></li>
						<li class="submenu-item"><a
							href="#"> <i
								class="bi bi-exclamation-circle"></i> Low-stock Items
						</a></li>
						<li class="submenu-item"><a
							href="#"><i
								class="bi bi-trash"></i> Deleted Items</a></li>
					</ul>
				</li>
				
				<li
					class="sidebar-item has-sub sales-submenu">
					<a href="#" class="sidebar-link"> <i class="bi bi-bar-chart-line"></i>
						<span>Sales Reporting</span></a>
					<ul class="submenu">
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/salesSummary"> <i
								class="bi bi-clipboard-data"></i> Sales Summary
						</a></li>
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/monthlyReport"> <i
								class="bi bi-calendar"></i> Monthly Report
						</a></li>
						<li class="submenu-item"><a
							href="#"> <i
								class="bi bi-clock-history"></i> Transactions
						</a></li>
						<li class="submenu-item"><a
							href="#"> <i
								class="bi bi-clock-history"></i> Sales by Service
						</a></li>
						<li class="submenu-item"><a
							href="#"><i
								class="bi bi-trash"></i> Void Transactions</a></li>
					</ul>
				</li>
				
                <li
					class="sidebar-item has-sub settings-submenu">
					<a href="#" class="sidebar-link"> <i class="bi bi-gear-fill"></i>
						<span>Settings</span></a>
					<ul class="submenu">
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/Institute/institutionData"><i
								class="bi bi-shop"></i> Institute</a></li>
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/role/roleData"><i
								class="bi bi-bookmark-check"></i> User Roles</a></li>
						<li class="submenu-item"><a
							href="${pageContext.request.contextPath}/users/usersData"><i
								class="bi bi-person"></i> Users</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<button class="sidebar-toggler btn x">
			<i data-feather="x"></i>
		</button>
	</div>
</div>
<script>
	$(document).ready(function() {
		
		var url = window.location.href;
		if (url.includes('departmentsData') || url.includes('addDepartment') || url.includes('editDepartment')) {
			$('.dept-submenu').addClass("active");
		} else if (url.includes('serviceData') || url.includes('addService')) {
			$('.service-submenu').addClass("active");
		} else if (url.includes('allSchedule') || url.includes('scheduleDate')) {
			$('.schedule-submenu').addClass("active");
		} else if (url.includes('medicItems') || url.includes('addMedicItems')) {
			$('.item-submenu').addClass("active");
		} else if (url.includes('institutionData') || url.includes('roleData') || url.includes('usersData') || url.includes('addUsers') || url.includes('getUsers')) {
			$('.settings-submenu').addClass("active");
		} else if (url.includes('salesSummary') || url.includes('monthlyReport')) {
			$('.sales-submenu').addClass("active");
		} else if (url.includes('dashboard')) {
			$('.dashboard-submenu').addClass("active");
		}
	});


</script>

