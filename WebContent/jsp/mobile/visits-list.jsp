<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <title>Visits List | Tikaana</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/" />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png" />
    <!-- Custom CSS -->
    <link
      href="<%=request.getContextPath() %>/new/assets/libs/fullcalendar/dist/fullcalendar.min.css"
      rel="stylesheet" />
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
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-5 align-self-center">
              <h4 class="page-title">Schedules</h4>
            </div>
            
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="">
                  <div class="row">
                    <div class="col-lg-3 border-end pe-0">
                      <div class="card-body border-bottom">
                        <h4 class="card-title mt-2">Drag & Drop Event</h4>
                      </div>
                    </div>
                    <div class="col-lg-9">
                      <div class="card-body calender-sidebar">
                        <div id="calendar"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- BEGIN MODAL -->
          
          <div class="modal-backdrop bckdrop hide"></div>
          <!-- Modal Add Category -->
          
          <!-- END MODAL -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
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
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- apps -->
    <script src="<%=request.getContextPath() %>/new/dist/js/app.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app.init.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app-style-switcher.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath() %>/new/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<%=request.getContextPath() %>/new/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/moment/min/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/calendar/cal-init.js"></script>
    <script>
    	$('document').ready(function(){
    		//$('.sidebartoggler').toggle();
    	});
      $(function () {
        "use strict";
        $("#main-wrapper").AdminSettings({
          LogoBg: "skin6",
		  HeaderPosition: true,
		  Theme: false,
        });
      });
    </script>
  </body>
</html>
