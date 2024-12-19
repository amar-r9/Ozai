<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Events List | Ozai</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png"
    />
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <jsp:include page="/common/preloader.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
      <!-- ============================================================== -->
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <jsp:include page="/common/lctheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/lctsidebar.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-5 align-self-center">
              <h4 class="page-title"></h4>
            </div>
            <%-- <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/admin">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Events
                    </li>
                  </ol>
                </nav>
              </div>
            </div> --%>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid note-has-grid">
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- basic table -->
          			<h5 class="text-dark fw-bold text-center">Events</h5>
                  <ul class="nav nav-pills p-3 bg-white mb-3 align-items-center">
		            <li class="nav-item">
		              <a href="javascript:void(0)"
		                class="nav-link rounded-pill note-link
		                  d-flex align-items-center justify-content-center
		                  active px-3 px-md-3 me-0 me-md-2" id="all-category">
		                <i data-feather="list"
		                  class="feather-sm fill-white me-0 me-md-1">
		                 </i>
		                 <span class="d-none d-md-block font-weight-medium">All Events</span></a>
		            </li>
		            <li class="nav-item">
		              <a
		                href="javascript:void(0)"
		                class="nav-link rounded-pill note-link d-flex
		                  align-items-center justify-content-center px-3 px-md-3 me-0 me-md-2"
		                id="note-business">
		                <i data-feather="clock"
		                  class="feather-sm fill-white me-0 me-md-1">
		                </i>
		                <span class="font-weight-medium"
		                  >Upcoming</span
		                ></a
		              >
		            </li>
		            <li class="nav-item">
		              <a
		                href="javascript:void(0)"
		                class="
		                  nav-link
		                  rounded-pill
		                  note-link
		                  d-flex
		                  align-items-center
		                  justify-content-center
		                  px-3 px-md-3
		                  me-0 me-md-2
		                "
		                id="note-important"
		              >
		                <i
		                  data-feather="lock"
		                  class="feather-sm fill-white me-0 me-md-1"
		                ></i
		                ><span class="font-weight-medium"
		                  >Closed</span
		                ></a
		              >
		            </li>
		          </ul>
		          <div class="tab-content">
		            <div id="note-full-container" class="note-has-grid row">
		            	<h4 class="text-dark text-center" id="upComingTitle" style="display: none;">Upcoming</h4>
		            	<h4 class="text-dark text-center" id="closedTitle" style="display: none;">Closed</h4>
			            <c:choose>
		            		<c:when test="${not empty events}">
					            <c:forEach items="${events }" var="event">
					            	<c:choose>
					            		<c:when test="${event.status eq 'Closed' }">
								            <div class="col-md-4 single-note-item all-category note-important">
								               <a href="<%=request.getContextPath() %>/lct/events/view/${event.id }">
									               	<div class="card card-body">
									                  <span class="side-stick"></span>
									                  <h5
									                    class="note-title text-truncate w-75 mb-0"
									                    data-noteHeading="Book a Ticket for Movie">
									                    ${event.title }
									                    <i
									                      class="point ri-checkbox-blank-circle-fill ms-1 fs-1"></i>
									                  </h5>
									                  <p class="note-date fs-2 text-muted">${event.date }</p>
									                  <div class="note-content">
									                    <p
									                      class="note-inner-content text-muted"
									                      data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis."
									                    >
									                      ${event.summary }</p>
									                  </div>
									                  
									                </div>
								                </a>
								              </div>
							          		</c:when>
							          		<c:when test="${event.status eq 'Open' }">
									            <div class="col-md-4 single-note-item all-category note-business">
									                <a href="<%=request.getContextPath() %>/lct/events/view/${event.id }">
										                <div class="card card-body">
										                  <span class="side-stick"></span>
										                  <h5
										                    class="note-title text-truncate w-75 mb-0"
										                    data-noteHeading="Meeting with Mr.Jojo"
										                  >
										                    ${event.title }
										                    <i
										                      class="point ri-checkbox-blank-circle-fill ms-1 fs-1"
										                    ></i>
										                  </h5>
										                  <p class="note-date fs-2 text-muted">${event.date }</p>
										                  <div class="note-content">
										                    <p
										                      class="note-inner-content text-muted"
										                      data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis."
										                    >
										                      ${event.summary }</p>
										                  </div>
										                  
										                </div>
										              </a>
									              </div>
							          		</c:when>
							          	</c:choose>
					            </c:forEach>
					       	</c:when>
					       	<c:otherwise>
					       		<div class="col-12">
					       			There are no events listed.</div>
					       	</c:otherwise>
					  	</c:choose>
		            </div>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Ozai Living Private Limited.
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
      </div>
      <!-- ============================================================== -->
      <!-- End Page wrapper  -->
      <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- customizer Panel -->
    <!-- ============================================================== -->
    
    <div class="chat-windows"></div>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- apps -->
    <script src="<%=request.getContextPath() %>/new/dist/js/app.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app.init.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath() %>/new/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<%=request.getContextPath() %>/new/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/feather.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/custom.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/notes/notes.js"></script>
    <!--This page JavaScript -->
    <script>
    	$('document').ready(function(){
    		//$('.sidebartoggler').toggle();
    		$('#note-business').click(function(){
    			$('#upComingTitle').show();
    			$('#closedTitle').hide();
    		});
    		$('#note-important').click(function(){
    			$('#closedTitle').show();
    			$('#upComingTitle').hide();
    		});
    		$('#all-category').click(function(){
    			$('#upComingTitle').hide();
    			$('#closedTitle').hide();
    		});
    	});
    </script>
    <script>
    	$('document').ready(function(){
    		$('.sidebartoggler').toggle();
    	});
      $(function () {
        "use strict";
        $("#main-wrapper").AdminSettings({
          Theme: true, // this can be true or false ( true means dark and false means light ),
          Layout: "horizontal",
          LogoBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          NavbarBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          SidebarType: "overlay", // You can change it full / mini-sidebar / iconbar / overlay
          SidebarColor: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          SidebarPosition: false, // it can be true / false ( true means Fixed and false means absolute )
          HeaderPosition: false, // it can be true / false ( true means Fixed and false means absolute )
          BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid )
        });
      });
    </script>
  </body>
</html>