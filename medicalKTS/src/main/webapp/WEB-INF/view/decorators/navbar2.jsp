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
					href="${pageContext.request.contextPath}/Patient/patientDataReception"
					class="sidebar-link"> <i class="bi bi-file-earmark-person"></i><span>Dashboard</span></a>
				</li>
			</ul>
		</div>
		<button class="sidebar-toggler btn x">
			<i data-feather="x"></i>
		</button>
	</div>
</div>
<script>
	

</script>


