<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.sidebar-link {
		opacity: 10 !important;
		/* font-weight: 500;
		 font-size: 18px !important; */
	}
</style>
<aside class="left-sidebar">
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
              <li class="sidebar-item pt-2">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/smartlife"
                  aria-expanded="false"
                  ><i class="fa fa-archive"></i
                  ><span class="hide-menu">Dashboard</span></a
                >
              </li>	
              <li class="sidebar-item pt-2">
                <a
                  class=" waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/smartlife/entries/All"
                  aria-expanded="false"
                  ><i class="fa fa-list"></i
                  ><span class="hide-menu">All Entries</span></a
                >
              </li>	 
              <li class="sidebar-item pt-2">
                <a
                  class=" waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/smartlife/entries/Selected"
                  aria-expanded="false"
                  ><i class="far fa-check-square"></i
                  ><span class="hide-menu">Selected Entries</span></a
                >
              </li>
			  <li class="sidebar-item pt-2">
                <a
                  class=" waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/smartlife/entries/Rejected"
                  aria-expanded="false"
                  ><i class="far fa-window-close"></i
                  ><span class="hide-menu">Rejected Entries</span></a
                >
              </li>
                             
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>