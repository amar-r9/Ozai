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
    <title>${article.title } | Tikaana</title>
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
        <div class="container-fluid note-has-grid">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">${article.title }</h1>
						<span class="color-text-a">${article.article_category }</span>
					</div>
				</div>
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<!-- <ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">News
								Grid</li>
						</ol> -->
					</nav>
				</div>
			</div>
			<div class="card" style="text-align: justify;">
                <div class="card-body">
					<div class="row">
						<div class="image-box mt-4 mb-4 text-center">
							<button class="fb-icon btn btn-facebook waves-effect waves-light"><i data-feather="facebook"
		                      class="feather-sm fill-white"></i></button>
							<button class="tw-icon btn btn-twitter waves-effect waves-light"><i data-feather="twitter" class="feather-sm fill-white"></i></button>
							<a class="btn btn-success waves-effect waves-light" 
								href="https://api.whatsapp.com/send?text=https://tikaana.com/mobile/article/${article.article_id}"
								target="_blank"><i class="fab fa-whatsapp feather-sm fill-white"></i></a>
						</div>
					</div>
					<div class="row" style="padding: 0px;">
						<div class="row col-md-12" style="color: #6b6b6b; padding: 0px;">
							<div class="col-md-6 col-6">
								&nbsp; ${article.date_created }
							</div>
							<div class="col-md-6 col-6">
								<div class="pull-right">
								By : ${article.user_saved }</div>
							</div>
						</div>
					</div>
					<div class="row col-md-12 post-content text-justify"
						style="font-size: 16px;"><br><b>${article.content }</b></div>
						<br>
					</div>
				<div class="col-md-4">
					
						<!-- END / WIDGET CATEGORIES -->
	
						<!-- WIDGET RECENT POST -->
						<div>
							<h4>Recent posts</h4>
							<ul>
								<c:forEach items="${recentArticles}" var="article">
									<li><a
										href="<%=request.getContextPath()%>/mobile/article/${article.article_id}">${article.title}</a>
									</li>
								</c:forEach>
	
							</ul>
						</div>
				</div>
				<!-- /.col -->
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
    <!--This page JavaScript -->
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
	<script>
		$('document').ready(function() {
							//$('#about').addClass("active");
			$('.fb-icon').click(function() {
				window.open('https://www.facebook.com/sharer.php?u=http://tikaana.com/blogs/article/${article.article_id}',
					'Tikaana Blog Article',
					'width=626,height=436');
					return false;
			});
			
			$('.tw-icon').click(function() {
				window.open('https://twitter.com/share?url=http://tikaana.com/blogs/article/${article.article_id}',
					'Tikaana Blog Article',
					'width=626,height=436');
					return false;
			});
		});
	</script>
</body>
</html>