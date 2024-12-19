<aside class="left-sidebar">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar" style="position: fixed;">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<%=request.getContextPath() %>/lct" aria-expanded="false">
					<i class="mdi mdi-home"></i>
					<span class="hide-menu">Dashboard</span></a></li>
				<li class="sidebar-item">
					<a class="sidebar-link has-arrow waves-effect waves-dark"
						href="javascript:void(0)" aria-expanded="false">
						<i class="fa fa-users"></i>
						<span class="hide-menu">Residents</span>
					</a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a
							href="<%=request.getContextPath() %>/lct/residents/add-b2b" class="sidebar-link"> <i
								class="mdi mdi-account-plus"></i> <span class="hide-menu">
									Add </span>
						</a></li>
						<li class="sidebar-item"><a
							href="<%=request.getContextPath() %>/lct/residents/list" class="sidebar-link"> <i
								class="mdi mdi-format-align-right"></i> <span class="hide-menu">
									List </span>
						</a></li>
						<!-- <li class="sidebar-item"><a
							href="sidebar-type-overlaysidebar.html" class="sidebar-link">
								<i class="mdi mdi-view-day"></i> <span class="hide-menu">
									Overlay Sidebar </span>
						</a></li> -->						
					</ul></li>
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="false"> <i
						class="mdi mdi-crop-square"></i> <span class="hide-menu">Roles & Privileges</span>
				</a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a
							href="<%=request.getContextPath() %>/lct/roles/add" class="sidebar-link">
								<i class="mdi mdi-plus"></i> <span
								class="hide-menu"> Add Role </span>
						</a></li>
						<li class="sidebar-item"><a
							href="<%=request.getContextPath() %>/lct/roles/list" class="sidebar-link">
								<i class="mdi mdi-format-align-right"></i> <span
								class="hide-menu"> List </span>
						</a></li>
					</ul></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<%=request.getContextPath() %>/lct/tickets/list" aria-expanded="false">
					<i class="fas fa-ticket-alt"></i>
					<span class="hide-menu">Tickets</span></a></li>
				
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="false"> <i
						class="fa fa-building"></i> <span class="hide-menu">Properties </span>
				</a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item">
							<a href="<%=request.getContextPath() %>/lct/properties/add-property"
								class="sidebar-link">
								<i class="mdi mdi-plus"></i>
								<span class="hide-menu"> Add </span>
							</a></li>
						<li class="sidebar-item">
							<a href="<%=request.getContextPath() %>/lct/properties/list"
								class="sidebar-link">
								<i class="mdi mdi-format-align-right"></i>
								<span class="hide-menu"> List </span>
							</a></li>
						<li class="sidebar-item">
							<a href="<%=request.getContextPath() %>/lct/properties/worksites"
								class="sidebar-link">
								<i class="fa fa-industry"></i>
								<span class="hide-menu"> Worksites </span>
							</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>