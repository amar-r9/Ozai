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
                  href="<%=request.getContextPath() %>/ops"
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
                      href="<%=request.getContextPath() %>/ops/b2c-module/walkins-list"
                      aria-expanded="false"
                      ><i class="fa fa-users"></i
                      ><span class="hide-menu">Walkins List</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/b2c-module/bookings-list"
                      aria-expanded="false"
                      ><i class="fas fa-check-square display-6 fw-bold"></i
                      ><span class="hide-menu">Bookings</span></a
                    >
                  </li>
                </ul>
              </li> --%>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/ops/properties/owners-list"
                  aria-expanded="false"
                  ><i class="fa fa-archive"></i
                  ><span class="hide-menu">Property Module</span></a
                >
              </li>
              
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
                  ><span class="hide-menu">Residents</span></a
                >
                <ul aria-expanded="false" class="collapse first-level">
                  
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/residents/list"
                      aria-expanded="false"
                      ><i class="fa fa-users"></i
                      ><span class="hide-menu">List</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/tickets/list"
                      aria-expanded="false"
                      ><i class="fas fa-ticket-alt display-6 fw-bold"></i
                      ><span class="hide-menu">Tickets</span></a
                    >
                  </li>
                  <%-- <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/residents/payments-list"
                      aria-expanded="false"
                      ><i class="fas fa-money-bill-alt"></i
                      ><span class="hide-menu">Pending Payments</span></a
                    >
                  </li> --%>
				  <%-- <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/residents/add-user-payments"
                      aria-expanded="false"
                      ><i class="fas fa-money-bill-alt"></i
                      ><span class="hide-menu">Electricity/SD</span></a>
                  </li> --%>
				  <%-- <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/residents/sd/pending-payments"
                      aria-expanded="false"
                      ><i class="fas fa-rupee-sign"></i
                      ><span class="hide-menu">Pending SD</span></a
                    >
                  </li> --%>
				  <%-- <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/residents/eb/pending-payments"
                      aria-expanded="false"
                      ><i class="fas fa-bolt"></i
                      ><span class="hide-menu">Pending Electricity</span></a
                    >
                  </li> --%>
                </ul>
              </li>
              <li class="nav-small-cap">
                <i class="ri-wallet-3-fill display-6 fw-bold"></i>
                <span class="hide-menu">Expenses</span>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false"
                  ><i class="ri-wallet-3-fill display-6 fw-bold"></i
                  ><span class="hide-menu">Expenses</span></a
                >
                <ul aria-expanded="false" class="collapse first-level">
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/expenses/add-vendor"
                      aria-expanded="false"
                      ><i class="fas fa-user-plus"></i
                      ><span class="hide-menu">Add Vendor</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/expenses/vendor-list"
                      aria-expanded="false"
                      ><i class="fa fa-users"></i
                      ><span class="hide-menu">Vendor List</span></a
                    >
                  </li>
                  <li class="sidebar-item">
                    <a
                      class="sidebar-link waves-effect waves-dark sidebar-link"
                      href="<%=request.getContextPath() %>/ops/expenses/add"
                      aria-expanded="false"
                      ><i class="fa fa-plus"></i
                      ><span class="hide-menu">Add Expense</span></a
                    >
                  </li>
                  <c:choose>
					<c:when test="${OpsUser.access_level eq 1 }">
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/ops/expenses/payment-list"
		                      aria-expanded="false"
		                      ><i class="fas fa-money-bill-alt"></i
		                      ><span class="hide-menu">Expense List</span></a
		                    >
		                  </li>
	                 </c:when>
	                 <c:otherwise>
		                 <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/ops/expenses/approve-list"
		                      aria-expanded="false"
		                      ><i class="fas fa-money-bill-alt"></i
		                      ><span class="hide-menu">Expense List</span></a
		                    >
		                  </li>
	                 </c:otherwise>
		          </c:choose> 	
                </ul>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/ops/add-notification"
                  aria-expanded="false"><i class="fas fa-bullhorn"></i>
                  <span class="hide-menu">Add Notice</span></a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="<%=request.getContextPath() %>/ops/properties/partners-list"
                  aria-expanded="false"><i class="fas fa-building"></i>
                  <span class="hide-menu">Partners</span></a>
              </li>
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>