<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${talent.name }'s Entry for Talent Showcase | Ozai</title>
<meta
	content="${talent.summary }"
	name="description">
<meta
	content="Tikaana, Hostel, PG, coliving, app, make friends, coliving space"
	name="keywords">

<link rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/" />
    <!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png" />
<!-- This page css -->
<!-- Custom CSS -->
<link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link
      href="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
      rel="stylesheet" />
<style>
.height-100 {
    height: 50vh
}

.height-10 {
    height: 20vh
}

.card {
    width: 100%;
    border: none;
    border-radius: 0px
}

.content span {
    color: green;
    font-weight: 500
}

.content p {
    font-size: 13px
}

.angle i {
    font-size: 19px;
    cursor: pointer
}

.angle i:nth-child(1) {
    margin-right: 10px
}

.about span:nth-child(1) {
    margin-right: 10px;
    color: green
}
.hide {
	display: none;
}
.n-btn {
	background: none;
	border: none;
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
      <jsp:include page="/common/mobileheader.jsp"></jsp:include>
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
            <div class=" align-self-center">
              <h4 class="page-title">Showcase your talent</h4>
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
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->
				<!-- Row -->
			<div class="row">
				<div class="col-12">
					 <div class="row">
						<div class="card">
					    	 <div class="card-body">
								<div class="row card-box-c foo">
									<div class="col-10">
										<div class="card-header-c d-flex">
											<div class="">
												<span class="fa fa-user-circle fa-2x"></span>
											</div>
											<h5 class="content-c" style="color: #393939;">&nbsp;&nbsp;${talent.name }</h5>
											<div class="card-title-c align-self-center">
												<h2 class="title-c"></h2>
											</div>
										</div>
										<div class="card-body-c">
											<p class="content-c">${talent.summary }</p>
										</div>
									</div>
									<div class="col-2">
										<form class="text-center" action="#" id="like-form">
											<input type="hidden" name="entry_id" value="${talent.id}">
											<button type="submit" data-toggle="tooltip" id="like"
												title="Like This Entry" data-placement="bottom"
												class="mr-3 n-btn">
												<i class="fa text-warning fa-thumbs-up fa-3x"></i>
											</button>
											<h6>Like</h6>
										</form>
										<button type="button" id="clickForLike"
							              data-bs-toggle="modal" style="display: none;"
							              data-bs-target="#al-warning-alert">
							             Warning Alert
							           </button>
										<!-- <i class="fa fa-thumbs-up fa-2x text-warning"></i>
										<p>Like</p> -->
									</div>
									<div class="card-footer-c pull-right">
										<video style="height: 300px !important; width: 100%;" preload="auto" 
						                	poster="<%=request.getContextPath() %>/assets/img/logo.png" controls 
						                	class="embed-responsive-item">
											<source
												src="https://ozailiving.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}"
												type="video/mp4">
											<source
												src="https://ozailiving.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}"
												type="video/ogg">
											<p>Your browser does not support HTML5 video.</p>
										</video>
									</div>
									<div class="card-footer-c pull-right">
										<div class="bg-light alert">
											<h4>Votes <span id="points">${talent.points }</span></h4>
										</div>
									</div>
									<div class="row text-center">
										<h4>Share :</h4>
										<div class="col-md-3 col-3">
											<img src="<%=request.getContextPath() %>/assets/img/social/facebook.png" 
								 				class="fb-icon" style="width: 45px;" alt="facebook icon" />
							 			</div>
							 			<div class="col-md-3 col-3">
								 			<img src="<%=request.getContextPath() %>/assets/img/social/twitter.png" 
										 		class="tw-icon" style="width: 45px;" alt="twitter icon" />
							 			</div>
							 			<div class="col-md-3 col-3">
								 			<a href="https://api.whatsapp.com/send?text=https://ozailiving.com/mobile/user/talent/entry/${talent.id}"
								 				target="_blank">
								 				<img src="<%=request.getContextPath() %>/assets/img/social/whatsapp.png" 
										 			style="width: 45px;" alt="whatsapp icon" /></a>
									 	</div>
									 	<div class="col-md-3 col-3">
										 	<img src="<%=request.getContextPath() %>/assets/img/social/copy.png" 
										 		onclick="copyToClipboard('#copy-link')" style="width: 45px;" alt="Copy icon"/>
										 </div>
									</div>
								</div>
							</div>
						</div>
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
    <button type="button"
		class=" btn btn-lg px-4
        fs-4 btn-light-primary text-primary font-weight-medium"
		id="success-alert" style="display: none;">
		slideDown - slideUp</button>
	<button type="button"
		class=" btn btn-lg px-4
        fs-4 btn-light-primary text-primary font-weight-medium"
		id="empty-alert" style="display: none;">slideDown -
		slideUp</button>
	<button type="button"
		class=" btn btn-lg px-4
        fs-4 btn-light-primary text-primary font-weight-medium"
		id="error-alert" style="display: none;">slideDown -
		slideUp</button>
    <div class="modal fade" id="al-warning-alert" tabindex="-1" 
    	aria-labelledby="vertical-center-modal" aria-hidden="true">
        <div class="modal-dialog modal-md">
        	<div class="modal-content modal-filled bg-light-info">
	     		<div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Login Required</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <p class="mb-0">User need to login to like an entry</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	                <button type="button" class="btn btn-primary" onclick="redirectLogin()">Login</button>
	            </div>
	        </div>
	    </div>
	</div>
    
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
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/toastr-init.js"></script>
    <script>
    	
    	$("#success-alert").on("click", function () {
	    	toastr.success(
	      	"Thank you for liking the entry.",
	      	{ showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
	    	);
	  	});
		$("#error-alert").on("click", function () {
	    	toastr.error(
	      	"Error, Please try again later.",
	      	{ showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
	    	);
	  	});
		$("#empty-alert").on("click", function () {
	    	toastr.warning(
	      	"You already voted, come again tomorrow. Thank you.",
	      	{ showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
	    	);
	  	});
    
		
	    function getParameterByName(name) {
		    var match = RegExp('[?&]' + name + '=([^&]*)').exec(window.location.search);
		    return match && decodeURIComponent(match[1].replace(/\+/g, ' '));
		}
		jQuery(document).ready(function($) {
			
			if (!!(getParameterByName('vote')) && getParameterByName('vote') == 'yes' ){
				voteEntry();
			}
			$("#like-form").submit(function(event) {
				event.preventDefault();
				voteEntry();
			});
	
		});
		function voteEntry() {
			var formData=$("#like-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/validate-user-like",
				data : formData,
				timeout : 100000,
				beforeSend:function(){
				
					$('#like').prop('disabled',true);
				},
				success: function(data) {
				    console.log("SUCCESS: ", data);
				    
				    if (data == 'liked') {
				    	$('#success-alert').click();
				        var points = $('#points').text();
				        $('#points').text(parseInt(points) + 1);
				    } else if (data == 'already-liked') {
				    	$('#empty-alert').click();
				    } else if (data == 'nouser') {
				        $('#clickForLike').click();
				    }
				},
				error: function(e) {
				    console.log("ERROR: ", e);
				    showToast("An error occurred while processing your request. Please try again.");
				},
				complete: function() {
				    $('#like').prop('disabled', false);
				}
			});
	
		}
		function redirectLogin() {
	  	  var next="${requestScope['javax.servlet.forward.request_uri']}".replace('${pageContext.request.contextPath}',"");
				location.href="${pageContext.request.contextPath}/mobile/signin?invalidsession=true&next="+next+"?vote=yes";
	    }
</script>
	<script>
		$('document').ready( function() {
			//$('#about').addClass("active");
			$('.fb-icon').click(function() {

				window.open(
					'http://www.facebook.com/sharer.php?u=https://ozailiving.com/mobile/user/talent/entry/${talent.id}',
					'Tikaana Blog Article',
					'width=626,height=436');
				return false;
			});
			$('.tw-icon').click(function() {
				window.open(
					'https://twitter.com/share?url=https://ozailiving.com/mobile/user/talent/entry/${talent.id}',
					'Tikaana Blog Article',
					'width=626,height=436');
				return false;

			});
		});
	</script>
</body>
</html>