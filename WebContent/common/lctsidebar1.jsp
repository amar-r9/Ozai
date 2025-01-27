<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.sidebar-link {
		opacity: 10 !important;
		font-weight: 500;
		font-size: 18px !important;
	}
</style>
<aside class="left-sidebar" style="position: fixed; z-index: 45;">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
          <!-- Sidebar navigation-->
          <nav class="sidebar-nav">
            <ul id="sidebarnav">
              <!-- User Profile-->
              <li class="nav-small-cap">
                <i class=""></i>
                <span class="hide-menu"></span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/lct"
                  aria-expanded="false"
                  ><i class="fa fa-archive"></i
                  ><span class="hide-menu">Dashboard</span></a
                >
              </li>	
              <li class="sidebar-item pt-2">
                <a
                  class=" waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/lct/residents/list"
                  aria-expanded="false"
                  ><i class="fa fa-users"></i
                  ><span class="hide-menu">Residents</span></a
                >
              </li>	 
              <li class="sidebar-item pt-2">
                <a
                  class=" waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/lct/properties/list"
                  aria-expanded="false"
                  ><i class="fas fa-building"></i
                  ><span class="hide-menu">Properties</span></a
                >
              </li>
              <li class="sidebar-item pt-2">
                <a
                  class=" waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/lct/tickets/list"
                  aria-expanded="false"
                  ><i class="fas fa-ticket-alt"></i
                  ><span class="hide-menu">Tickets</span></a
                >
              </li>	               
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>