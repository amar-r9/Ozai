<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="topbar">
	<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header" style="position: fixed;">
			<!-- This is for the sidebar toggle which is visible on mobile only -->
			<a class="nav-toggler waves-effect waves-light d-block d-md-none"
				href="javascript:void(0)"> <i
				class="ri-close-line fs-6 ri-menu-2-line"></i>
			</a>
			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<div class="navbar-brand">
				<a href="<%=request.getContextPath() %>/lct" class="logo"> <!-- Logo icon --> <b
					class="logo-icon"> 
					<!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
						<!-- Dark Logo icon --> <img
						src="<%=request.getContextPath() %>/assets/img/adminlogo.png" alt="homepage"
						class="dark-logo" /> <!-- Light Logo icon -->
						<img src="<%=request.getContextPath() %>/assets/img/adminlogo.png" alt="homepage"
						class="light-logo" />
				</b> <!--End Logo icon -->
				</a>
				
			</div>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Toggle which is visible on mobile only -->
			<!-- ============================================================== -->
			
			<div class="d-block d-sm-none">
	            <c:if test="${not empty ClientUser }">
					<a
						class="
	                    nav-link
	                    dropdown-toggle
	                    waves-effect waves-dark
	                    pro-pic"
						href="" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <img
							src="<%=request.getContextPath()%>/new/assets/images/users/2.jpg"
							alt="user" class="rounded-circle" width="40" />
							<span class="ms-1 font-weight-medium d-none d-sm-inline-block">${ClientUser.name }
								<i data-feather="chevron-down" class="feather-sm"></i>
						</span>
					</a>
						<div class="dropdown-menu dropdown-menu-end user-dd animated flipInY">
							<span class="with-arrow"> <span class="bg-primary"></span>
							</span>
							<div class="d-flex no-block align-items-center p-3 bg-primary text-white mb-2">
								<div class="">
									<img
										src="<%=request.getContextPath()%>/new/assets/images/users/5.jpg"
										alt="user" class="rounded-circle" width="60" />
								</div>
								<div class="ms-2">
									<h4 class="mb-0 text-white">${ClientUser.name }</h4>
									<!-- <p class="mb-0">deo@gmail.com</p> -->
								</div>
							</div>
							
							<div class="dropdown-divider"></div>
							<!-- <a class="dropdown-item" href="#"><i
								data-feather="settings" class="feather-sm text-warning me-1 ms-1"></i>
								Account Setting</a> -->
							<div class="dropdown-divider"></div>
							<a class="dropdown-item clearSession" onclick="clearCookie()"><i
								data-feather="log-out" class="feather-sm text-danger me-1 ms-1"></i>
								Logout</a>
							<div class="dropdown-divider"></div>
							<!-- <div class="p-2">
								<a href="#" class="btn d-block w-100 btn-primary rounded-pill">View
									Profile</a>
							</div> -->
						</div>
					</c:if>
				</div>
		</div>
		<!-- ============================================================== -->
		<!-- End Logo -->
		<!-- ============================================================== -->
		<div class="navbar-collapse collapse" id="navbarSupportedContent">			
			<!-- ============================================================== -->
			<!-- Right side toggle and nav items -->
			<!-- ============================================================== -->
			<ul class="navbar-nav me-auto">
             
            </ul>
			<ul class="navbar-nav">
				<!-- ============================================================== -->
				<!-- User profile and search -->
				<!-- ============================================================== -->
				<c:if test="${not empty ClientUser }">
				<li class="nav-item dropdown d-none d-lg-block"><a
					class="
                    nav-link
                    dropdown-toggle
                    waves-effect waves-dark
                    pro-pic"
					href="" data-bs-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img
						src="<%=request.getContextPath()%>/new/assets/images/users/2.jpg"
						alt="user" class="rounded-circle" width="40" />
						<span class="ms-1 font-weight-medium d-none d-sm-inline-block">${ClientUser.name }
							<i data-feather="chevron-down" class="feather-sm"></i>
					</span>
				</a>
					<div class="dropdown-menu dropdown-menu-end user-dd animated flipInY">
						<span class="with-arrow"> <span class="bg-primary"></span>
						</span>
						<div class="d-flex no-block align-items-center p-3 bg-primary text-white mb-2">
							<div class="">
								<img
									src="<%=request.getContextPath()%>/new/assets/images/users/5.jpg"
									alt="user" class="rounded-circle" width="60" />
							</div>
							<div class="ms-2">
								<h4 class="mb-0 text-white">${ClientUser.name }</h4>
								<!-- <p class="mb-0">deo@gmail.com</p> -->
							</div>
						</div>
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"><i
							data-feather="settings" class="feather-sm text-warning me-1 ms-1"></i>
							Account Setting</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" onclick="clearCookie()"><i
							data-feather="log-out" class="feather-sm text-danger me-1 ms-1"></i>
							Logout</a>
						<div class="dropdown-divider"></div>
						<div class="p-2">
							<a href="#" class="btn d-block w-100 btn-primary rounded-pill">View
								Profile</a>
						</div>
					</div></li>
				</c:if>
				<!-- ============================================================== -->
				<!-- User profile and search -->
				<!-- ============================================================== -->
			</ul>
		</div>
	</nav>
</header>
<style>
		.card {
			box-shadow: 3px 3px 3px 3px #c7c4d7;
		}
		small {
			font-size: .650em;
		}		
		.page-wrapper {
			margin-top: 80px;
		}
		body {
			/*font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
				"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
				"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji" !important;*/
			font-family: -apple-system,system-ui,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Fira Sans,Ubuntu,Oxygen,Oxygen Sans,Cantarell,Droid Sans,Apple Color Emoji,Segoe UI Emoji,Segoe UI Emoji,Segoe UI Symbol,Lucida Grande,Helvetica,Arial,sans-serif !important;
		}
		.control-label {
			color: #355423;
			font-weight: 500;
		}
		/* input, select, textarea {
			-webkit-text-size-adjust: none !important;
		}*/

	  </style>
	  <script>	
		function clearCookie() {
			localStorage.clear();
			window.location.href = "<%=request.getContextPath() %>/lct/adminlogout";
		}
	</script>
<a onclick="history.back()" class="card pt-2 ps-2 bg-light" id="hideBack" style="z-index: 10;
    margin-bottom: 50px; top: 70px; position: fixed; width: 100%;
	border-radius: unset; box-shadow: none; background: none;">
	<i class="bi bi-arrow-left fa-2x text-secondary" style="vertical-align: bottom;"></i></a>