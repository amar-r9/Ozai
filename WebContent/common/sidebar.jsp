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
              
                <%-- <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="<%=request.getContextPath() %>/admin"
                  aria-expanded="false"
                  ><i class="mdi mdi-av-timer"></i
                  ><span class="hide-menu">Home </span></a
                > --%>
               <c:choose>
               	<c:when test="${AdminUser.client eq 'ALL' }">
		              <li class="sidebar-item">
		                <a
		                  class="sidebar-link waves-effect waves-dark sidebar-link"
		                  href="<%=request.getContextPath() %>/admin"
		                  aria-expanded="false"
		                  ><i class="fa fa-archive"></i
		                  ><span class="hide-menu">Dashboard</span></a
		                >
		              </li>
					  <li class="nav-small-cap">
		                <i class="mdi mdi-dots-horizontal"></i>
		                <span class="hide-menu">Walk In / Bookings</span>
		              </li>
		              <li class="sidebar-item">
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
		                      href="<%=request.getContextPath() %>/admin/b2c-module/add-walkin"
		                      aria-expanded="false"
		                      ><i class="fas fa-user-plus"></i
		                      ><span class="hide-menu">Add Walkin</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/b2c-module/walkins-list"
		                      aria-expanded="false"
		                      ><i class="fa fa-users"></i
		                      ><span class="hide-menu">Walkins List</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/b2c-module/bookings-list"
		                      aria-expanded="false"
		                      ><i class="fas fa-check-square display-6 fw-bold"></i
		                      ><span class="hide-menu">Bookings</span></a
		                    >
		                  </li>
		                </ul>
		              </li>
		              <li class="sidebar-item">
		                <a
		                  class="sidebar-link waves-effect waves-dark sidebar-link"
		                  href="<%=request.getContextPath() %>/admin/property-module/owners-list"
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
		                      href="<%=request.getContextPath() %>/admin/tenant-module/add"
		                      aria-expanded="false"
		                      ><i class="fas fa-user-plus"></i
		                      ><span class="hide-menu">Add</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/tenant-module/list"
		                      aria-expanded="false"
		                      ><i class="fa fa-users"></i
		                      ><span class="hide-menu">List</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/tenants-tickets/list"
		                      aria-expanded="false"
		                      ><i class="fas fa-ticket-alt display-6 fw-bold"></i
		                      ><span class="hide-menu">Tickets</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/tenant-module/payments-list"
		                      aria-expanded="false"
		                      ><i class="fas fa-money-bill-alt"></i
		                      ><span class="hide-menu">Pending Payments</span></a
		                    >
		                  </li>
						  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/b2c-module/add-user-payments"
		                      aria-expanded="false"
		                      ><i class="fas fa-money-bill-alt"></i
		                      ><span class="hide-menu">Electricity/SD</span></a>
		                  </li>
						  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/tenants/sd/pending-payments"
		                      aria-expanded="false"
		                      ><i class="fas fa-rupee-sign"></i
		                      ><span class="hide-menu">Pending SD</span></a
		                    >
		                  </li>
						  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/tenants/eb/pending-payments"
		                      aria-expanded="false"
		                      ><i class="fas fa-bolt"></i
		                      ><span class="hide-menu">Pending Electricity</span></a
		                    >
		                  </li>
		                </ul>
		              </li>
		              <c:if test="${AdminUser.property eq 'ALL' }">
		              <li class="nav-small-cap">
		                <i class="ri-wallet-3-fill display-6 fw-bold"></i>
		                <span class="hide-menu">Finance</span>
		              </li>
		              <li class="sidebar-item">
		                <a
		                  class="sidebar-link has-arrow waves-effect waves-dark"
		                  href="javascript:void(0)"
		                  aria-expanded="false"
		                  ><i class="ri-wallet-3-fill display-6 fw-bold"></i
		                  ><span class="hide-menu">Finance</span></a
		                >
		                <ul aria-expanded="false" class="collapse first-level">
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/finance-module/all-list"
		                      aria-expanded="false"
		                      ><i class="fas fa-user-plus"></i
		                      ><span class="hide-menu">Add Vendor</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/finance-module/vendor-list"
		                      aria-expanded="false"
		                      ><i class="fa fa-users"></i
		                      ><span class="hide-menu">Vendor List</span></a
		                    >
		                  </li>
		                  <li class="sidebar-item">
		                    <a
		                      class="sidebar-link waves-effect waves-dark sidebar-link"
		                      href="<%=request.getContextPath() %>/admin/finance-module/add"
		                      aria-expanded="false"
		                      ><i class="fa fa-plus"></i
		                      ><span class="hide-menu">Add Expense</span></a
		                    >
		                  </li>
		                  <c:choose>
							<c:when test="${AdminUser.access_level eq 1 }">
				                  <li class="sidebar-item">
				                    <a
				                      class="sidebar-link waves-effect waves-dark sidebar-link"
				                      href="<%=request.getContextPath() %>/admin/finance-module/payment-list"
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
				                      href="<%=request.getContextPath() %>/admin/finance-module/approve-list"
				                      aria-expanded="false"
				                      ><i class="fas fa-money-bill-alt"></i
				                      ><span class="hide-menu">Expense List</span></a
				                    >
				                  </li>
			                 </c:otherwise>
				          </c:choose> 	
		                </ul>
		              </li>
		             </c:if>
		             
               	</c:when>
               	<c:otherwise>
               		<li class="sidebar-item">
                    <a href="<%=request.getContextPath() %>/" class="sidebar-link"
                      ><i class="fa fa-home"></i
                      ><span class="hide-menu"> Home </span></a
                    >
                  </li>
	              <li class="sidebar-item">
	                <a
	                  class="sidebar-link waves-effect waves-dark sidebar-link"
	                  href="<%=request.getContextPath() %>/admin"
	                  aria-expanded="false"
	                  ><i class="fa fa-archive"></i
	                  ><span class="hide-menu">Dashboard</span></a
	                >
	              </li>
	              <li class="sidebar-item">
	                <a
	                  class="sidebar-link waves-effect waves-dark sidebar-link"
	                  href="<%=request.getContextPath() %>/admin/client-module/residents-list"
	                  aria-expanded="false"
	                  ><i class="fa fa-users"></i
	                  ><span class="hide-menu">Residents</span></a
	                >
	              </li>
	              
	              
	              <li class="sidebar-item">
	                <a
	                  class="sidebar-link has-arrow waves-effect waves-dark"
	                  href="javascript:void(0)"
	                  aria-expanded="false"
	                  ><i class="mdi mdi-settings"></i
	                  ><span class="hide-menu">Roles & Privileges</span></a
	                >
	                <ul aria-expanded="false" class="collapse first-level">
	                  <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/admin/client-module/add-role"
	                      aria-expanded="false"
	                      ><i class="mdi mdi-user-plus"></i
	                      ><span class="hide-menu">Add User Role</span></a>
	                  </li>
	                  <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/admin/client-module/roles-list"
	                      aria-expanded="false"
	                      ><i class="mdi mdi-users"></i
	                      ><span class="hide-menu">User Roles List</span></a>
	                  </li>
	                </ul>
	              </li>
	              
	              <li class="nav-small-cap">
	                <i class="mdi mdi-dots-horizontal"></i>
	                <span class="hide-menu">Quick Links</span>
	              </li>
	              <li class="sidebar-item">
	                <a
	                  class="sidebar-link has-arrow waves-effect waves-dark"
	                  href="javascript:void(0)"
	                  aria-expanded="false"
	                  ><i class="mdi mdi-collage"></i
	                  ><span class="hide-menu">Quick Links</span></a
	                >
	                <ul aria-expanded="false" class="collapse first-level">
	                  <%-- <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/admin/events/list"
	                      aria-expanded="false"
	                      ><i class="mdi mdi-creation"></i
	                      ><span class="hide-menu">Events</span></a
	                    >
	                  </li> --%>
	                  <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/admin/client-module/tickets/list"
	                      aria-expanded="false"
	                      ><i class="fa fa-sticky-note"></i
	                      ><span class="hide-menu">Tickets</span></a
	                    >
	                  </li>
	                  <li class="sidebar-item">
	                    <a
	                      class="sidebar-link waves-effect waves-dark sidebar-link"
	                      href="<%=request.getContextPath() %>/admin/client-module/invoice/list"
	                      aria-expanded="false"
	                      ><i class="mdi mdi-folder-multiple"></i
	                      ><span class="hide-menu">Invoices</span></a
	                    >
	                  </li>
	                </ul>
	              </li>
	              <li class="sidebar-item">
	                <a
	                  class="sidebar-link waves-effect waves-dark sidebar-link"
	                  href="<%=request.getContextPath() %>/admin/client-module/add-beds"
	                  aria-expanded="false"
	                  ><i class="fa fa-bed"></i
	                  ><span class="hide-menu">Add Beds</span></a
	                >
	              </li>
               	</c:otherwise>
               </c:choose>
            </ul>
          </nav>
          <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
      </aside>