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
    <title>Confirm Booking | Tikaana</title>
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
<style>
.card {
    width: 350px;
    padding: 10px;
    /* background: #1c162e; */
    color: #000;
    border: none;
    border-radius: 5px;
    text-align: center
}

.card h3 {
    font-weight: 300 !important;
    font-size: 21px
}

.card p {
    font-weight: 100 !important;
    font-size: 13px
}

.ratings img {
    cursor: pointer;
    transition: all 0.5s
}

.ratings img:hover {
    transform: scale(1.3)
}

.enlarge-emoji {
    transform: scale(1.3)
}

.form {
    padding-left: 20px;
    padding-right: 20px;
    margin-top: 20px;
    display: none;
    transition: all 0.5s
}

.form textarea {
    width: 100%;
    height: 100px;
    resize: none;
    border-radius: 4px;
    padding: 2px;
    transition: all 0.5s
}

.form textarea:focus {
    box-shadow: none
}

.post-button {
    text-align: right;
    margin-right: -6px
}

.post-button button {
    height: 30px;
    width: 100px;
    background: green;
    border: none;
    color: #fff;
    border-radius: 3px;
    margin-left: 10px;
    cursor: pointer;
    font-size: 12px
}

.post-button button:hover {
    background: green
}
</style>
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
      
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper" style="display: block;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 align-self-center text-center">
              <!-- <h4 class="page-title">Tikaana</h4> -->
              <img src="<%=request.getContextPath() %>/assets/img/logo.png" alt="Tikaana Logo" 
              	style="width: 100%;"/>
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
        	<br><br>
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- basic table -->
        	 <div class="col-lg-4 col-xlg-3 col-md-5">
              <div class="card">
                <div class="card-body">
				    <table class="table table-bordered">
				    	<tr>
				    		<td style="font-weight: 700; color: #000;">Name </td><td>${booking.name }</td>
				    	</tr>
				    	<tr>
				    		<td style="font-weight: 700; color: #000;">Room </td><td>${booking.room }</td>
				    	</tr>
				    	<tr>
				    		<td style="font-weight: 700; color: #000;">Property </td><td>${booking.property }</td>
				    	</tr>
				    	<tr>
				    		<td style="font-weight: 600; color: #000;">Joining Date </td><td>${booking.joining_date }</td>
				    	</tr>
				    	<tr>
				    		<td style="font-weight: 900; color: #000;">Rent </td><td>${booking.rent }</td>
				    	</tr>
				    </table>
				    <br>
				    <p><input type="checkbox" required id="confirm" />Confirm and Make payment.</p>
				    <a href="${paymentUrl }" class="btn btn-sm btn-info btn-block disabled"
				    	id="payButton">PAY BOOKING AMOUNT - <i class="fa fa-rupee-sign"></i>${booking.booking_amount }</a>
				</div>
			</div>
		</div>
  	</div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        
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
    <!--This page JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/notes/notes.js"></script>
	<script>
		$(document).ready(function(){
			$('#confirm').change(function() {
			    $("#payButton").toggleClass('disabled');
			});
		});
	</script>
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