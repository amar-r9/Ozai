<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
          <!-- Sidebar navigation-->
          <nav class="sidebar-nav">
            <ul id="sidebarnav">
              <!-- User Profile-->
              <li class="nav-small-cap">
                <i class="mdi mdi-dots-horizontal"></i>
                <span class="hide-menu">Personal</span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/core"
                  aria-expanded="false"
                  ><i class="fa fa-archive"></i
                  ><span class="hide-menu">Dashboard</span></a
                >
              </li>
			  <!-- <li class="nav-small-cap">
                <i class="mdi mdi-dots-horizontal"></i>
                <span class="hide-menu">Walk In / Bookings</span>
              </li> -->
              <%-- <li class="sidebar-item">
                <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false"
                  ><i class="fas fa-user-plus"></i
                  ><span class="hide-menu">Walk In / Bookings</span></a
                >
                <ul aria-expanded="false" class="collapse first-level">
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/admin/bookings/add-walkin"
                      aria-expanded="false"
                      ><i class="fas fa-user-plus"></i
                      ><span class="hide-menu">Add Walkin</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/admin/bookings/walkins-list"
                      aria-expanded="false"
                      ><i class="fa fa-users"></i
                      ><span class="hide-menu">Walkins List</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/admin/bookings/bookings-list"
                      aria-expanded="false"
                      ><i class="fas fa-check-square display-6 fw-bold"></i
                      ><span class="hide-menu">Bookings</span></a
                    >
                  </li>
                </ul>
              </li> --%>
              
              <li class="nav-small-cap">
                <i class="mdi mdi-dots-horizontal"></i>
                <span class="hide-menu">Residents</span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false"
                  ><i class="fas fa-users"></i
                  ><span class="hide-menu">Operators</span></a
                >
                <ul aria-expanded="false" class="collapse first-level">
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/core/operators/add"
                      aria-expanded="false"
                      ><i class="fas fa-user-plus"></i
                      ><span class="hide-menu">Add</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/core/operators/list"
                      aria-expanded="false"
                      ><i class="fa fa-users"></i
                      ><span class="hide-menu">List</span></a
                    >
                  </li>
                </ul>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false">
                  <i class="mdi mdi-settings"></i>
                  <span class="hide-menu">LCT</span></a>
	                <ul aria-expanded="false" class="collapse first-level">
	                  <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/core/lct/add"
	                      aria-expanded="false">
	                      <i class="mdi mdi-user-plus"></i>
	                      <span class="hide-menu">Add LCT</span></a>
	                  </li>
	                  <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/core/lct/list"
	                      aria-expanded="false">
	                      <i class="mdi mdi-users"></i>
	                      <span class="hide-menu">List</span></a>
	                  </li>
	                </ul>
	              </li>		              
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>