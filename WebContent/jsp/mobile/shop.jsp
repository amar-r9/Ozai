<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="Loan, Loan application, easy loan, tikaana" />
    <meta
      name="description"
      content="Please fill out the details below to apply."
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Try it first | Ozai</title>
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
    <link
      href="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
      rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.card{
    border-radius: 3vh;
    padding: 1vh 1vh;
    box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
      <jsp:include page="/common/backbutton.jsp"></jsp:include>
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
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">

            <!--products -->
            <div class="row mb-3">
                <div class=" px-0">
                	<div class="border-bottom title-part-padding">
	                  	<h4 class="card-title mb-0">Interested   
                       		<span id="interestKey"
                            	style="float: right;"><i class="far fa-heart"></i></span></h4>
	                </div>
                    <!-- swiper categories -->
                        <div class="row">                        	
                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-a96.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo A96
                                            <br />(8 GB RAM, 128 GB ROM)</small><br />
                                            	&#8377; 16900.00</p>
                                    	
                                    </div>
                                </a>
                            </div>

                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-a55.png" 
                                            	style="height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo A55
                                                <br />(6 GB RAM, 128 GB ROM)</small><br />&#8377; 14699.00</p>
                                    </div>
                                </a>
                            </div>

                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-a77.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo A77
                                                <br />(4 GB RAM, 128 GB ROM)</small><br />&#8377; 15499.00</p>
                                    </div>
                                </a>
                            </div>

                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-a16.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo A16
                                                <br />(4 GB RAM, 64 GB ROM)</small><br />&#8377; 12490.00</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-a77s.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo A77s
                                                <br />(8 GB RAM, 128 GB ROM)</small><br />&#8377; 17299.00</p>
                                    </div>
                                </a>
                            </div>
                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-f21spro.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo F21s Pro 4G
                                                <br />(8 GB RAM, 128 GB ROM)</small><br />&#8377; 20990.00</p>
                                    </div>
                                </a>
                            </div>
                            
                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-f21spro5g.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo F21s Pro 5G
                                                <br />(8 GB RAM, 128 GB ROM)</small><br />&#8377; 25290.00</p>
                                    </div>
                                </a>
                            </div>
                            
                            <div class="col-6 text-center">
                                <a href="#" class="card text-center bg-theme">
                                    <div class="card-body p-1">
                                        <figure class="avatar avatar-90 rounded-15 mb-1">
                                            <img src="<%=request.getContextPath() %>/assets/images/shop/oppo-reno8.png" 
                                            	style="width: 100%; height: 145px;" alt="">
                                        </figure>
                                        <p class="text-center size-12"><small class="text-muted">Oppo Reno 8 5G
                                                <br />(8 GB RAM, 128 GB ROM)</small><br />&#8377; 29200.00</p>
                                    </div>
                                </a>
                            </div>

                        </div>
                </div>
            </div>

        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        
        <!-- footer -->
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
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/toastr-init.js"></script>
	<script>
    	$('document').ready(function(){
    		
    		$.ajax({
   				type : "GET",
   				url : "${pageContext.request.contextPath}/mobile/checkAlreadyAddedInterest",
   				timeout : 100000,
   				beforeSend:function(){
   					$('#interestKey').html('<i class="fa fa-spinner fa-spin orange"></i>');
   				},
   				success : function(data) {
   					console.log("SUCCESS: ", data);
   					if(data=="success") {
   						$('#interestKey').html('<i class="fas fa-heart text-warning"></i>');
   					} else {
   						$('#interestKey').html('<i class="far fa-heart"></i>');
   					}				
   				},
   				error : function(e) {
   					console.log("ERROR: ", e);
   					
   				},
   				done : function(e) {
   					console.log("DONE");
   					//$('#loading').remove();
   					
   				}
   			});
    		
    		$('#interestKey').click(function(){
    			addInterest();	
			});
    	});
    </script>
    <script>
       	function addInterest(){
       		$.ajax({
   				type : "POST",
   				url : "${pageContext.request.contextPath}/mobile/addUserInterest",
   				timeout : 100000,
   				beforeSend:function(){
   					$('#interestKey').html('<i class="fa fa-spinner fa-spin orange"></i>');
   				},
   				success : function(data) {
   					console.log("SUCCESS: ", data);
   					if(data) {
   						$('#interestKey').html('<i class="fas fa-heart text-warning"></i>');
   					}   					
   				},
   				error : function(e) {
   					console.log("ERROR: ", e);
   					
   				},
   				done : function(e) {
   					console.log("DONE");
   					//$('#loading').remove();
   					
   				}
   			});
       	}
	</script>
</body>

</html>