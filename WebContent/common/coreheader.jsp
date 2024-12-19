<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="topbar">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
          <div class="navbar-header" style="position: fixed;">
            <!-- This is for the sidebar toggle which is visible on mobile only -->
            <a
              class="nav-toggler waves-effect waves-light d-block d-md-none"
              href="javascript:void(0)"
            >
              <i class="ri-close-line fs-6 ri-menu-2-line"></i>
            </a>
            <!-- ============================================================== -->
            <!-- Logo -->
            <!-- ============================================================== -->
            <div class="navbar-brand">
              <a href="<%=request.getContextPath() %>/core" class="logo">
                <!-- Logo icon -->
                <b class="logo-icon">
                  <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                  <!-- Dark Logo icon -->
                  <img
                    src="<%=request.getContextPath()%>/assets/img/adminlogo.png"
                    alt="homepage"
                    class="dark-logo"
                  />
                  <!-- Light Logo icon -->
                  <img
                    src="<%=request.getContextPath()%>/assets/img/adminlogo.png"
                    alt="homepage"
                    class="light-logo"
                  />
                </b>
                <!--End Logo icon -->
                <!-- Logo text -->
                <%-- <span class="logo-text">
                  <!-- dark Logo text -->
                  <img
                    src="<%=request.getContextPath()%>/new/assets/images/logo-text.png"
                    alt="homepage"
                    class="dark-logo"
                  />
                  <!-- Light Logo text -->
                  <img
                    src="<%=request.getContextPath()%>/new/assets/images/logo-light-text.png"
                    class="light-logo"
                    alt="homepage"
                  />
                </span> --%>
              </a>
              <!-- <a
                class="sidebartoggler d-none d-md-block"
                href="javascript:void(0)"
                data-sidebartype="mini-sidebar"
              >
                <i class="mdi mdi-toggle-switch mdi-toggle-switch-off fs-6"></i>
              </a> -->
            </div>
            <!-- ============================================================== -->
            <!-- End Logo -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Toggle which is visible on mobile only -->
            <!-- ============================================================== -->
            <div class="d-block d-sm-none">
	            <c:if test="${not empty CoreUser }">
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
							<span class="ms-1 font-weight-medium d-none d-sm-inline-block">${CoreUser.name }
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
									<h4 class="mb-0 text-white">${CoreUser.name }</h4>
									<!-- <p class="mb-0">deo@gmail.com</p> -->
								</div>
							</div>
							
							<div class="dropdown-divider"></div>
							<!-- <a class="dropdown-item" href="#"><i
								data-feather="settings" class="feather-sm text-warning me-1 ms-1"></i>
								Account Setting</a> -->
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<%=request.getContextPath()%>/corelogout"><i
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
            <!-- toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav me-auto">
             
            </ul>
            <!-- ============================================================== -->
            <!-- Right side toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav">
              <!-- ============================================================== -->
              <!-- User profile and search -->
              <!-- ============================================================== -->
              <c:if test="${not empty CoreUser }">
				<li class="nav-item dropdown d-none d-lg-block"><a
					class="
                    nav-link
                    dropdown-toggle
                    waves-effect waves-dark
                    pro-pic
                  "
					href="" data-bs-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img
						src="<%=request.getContextPath()%>/new/assets/images/users/2.jpg"
						alt="user" class="rounded-circle" width="40" />
						<span class="ms-1 font-weight-medium d-none d-sm-inline-block">${CoreUser.name }
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
								<h4 class="mb-0 text-white">${CoreUser.name }</h4>
								<!-- <p class="mb-0">deo@gmail.com</p> -->
							</div>
						</div>
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"><i
							data-feather="settings" class="feather-sm text-warning me-1 ms-1"></i>
							Account Setting</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/corelogout"><i
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