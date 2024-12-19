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
    <title>Properties | Ozai</title>
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
<style>
  .loader {
	  border: 16px solid #f3f3f3;
	  border-radius: 50%;
	  border-top: 16px solid blue;
	  border-right: 16px solid green;
	  border-bottom: 16px solid red;
	  border-left: 16px solid pink;
	  width: 120px;
	  height: 120px;
	  -webkit-animation: spin 2s linear infinite;
	  animation: spin 2s linear infinite;
	  margin-left: 32%;
	}
	
	@-webkit-keyframes spin {
	  0% { -webkit-transform: rotate(0deg); }
	  100% { -webkit-transform: rotate(360deg); }
	}
	
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
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
            <div class="col-12 align-self-center">
              <h4 class="page-title">Properties</h4>
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
				<form class="mt-3 row" action="#" id="">
					<div class="col-6 mb-3">
						<div class="form-group">
							<label for="register-form-repassword">Country:</label>
							<select id="country" name="country" 
								required class="form-control-sm form-select"></select>
						</div>
					</div>
					<div class="col-6 mb-3">
						<div class="form-group">
							<label for="register-form-repassword">State:</label>
							<select id="state" name="state" 
								required class="form-control-sm form-select"></select>
						</div>
					</div>
					<div class="col-6 mb-3">
						<div class="form-group">
							<label for="register-form-repassword">Location:</label>
							<select id="location" name="locationSelect" 
								required class="form-control-sm form-select">
								<option value="">Location</option>
							</select>
						</div>
					</div>
				</form>
				<section class="property-grid grid">
					<div class="container">
						<c:if test="${not empty properties }">
							<section class="header">
							    <div class="container">
							        <div class="row" id="properties-tab">
						                <!-- Tabs nav -->
			                        	<c:forEach items="${properties}" var="property">
								        	<div class="card">
								                <div class="card-body">
													<img class="card-img-top"
														src="<%=request.getContextPath() %>/assets/img/${property.id }/1.jpg"
														onerror="this.onerror=null; this.src='https://tikaana.com/assets/img/alt-image.png'"
														alt="Card image cap">
													<div class="card-body">
														<h5 class="card-title">
															Tikaana ${property.name }
															<c:choose>
																<c:when test="${property.gender == 'Male' }">
																	<span class="pull-right"> <a
																		class="btn btn-sm btn-danger"
																		style="border-radius: 50px; color: #FFF;">${property.gender }</a></span>
																</c:when>
																<c:otherwise>
																	<span class="pull-right"> <a
																		class="btn btn-sm btn-warning"
																		style="border-radius: 50px;">${property.gender }</a></span>
																</c:otherwise>
															</c:choose>
														</h5>
														<p class="card-text">${property.location },${property.city }&nbsp;</p>
				
														<hr>
														<p class="pull-right">
															<c:choose>
																<c:when test="${property.client_type == 'B2B' }">
																	<a href="#" class="btn btn-info btn-sm">View Property</a>
																</c:when>
																<c:otherwise>
																	<a
																		href="<%=request.getContextPath() %>/mobile/property/${property.id }"
																		class="btn btn-info btn-sm">View Property</a>
																</c:otherwise>
															</c:choose>
														</p>
													</div>
												</div>
											</div>
												
			                        	</c:forEach>
			                    	</div><br><br>
			                    </div>
			                  </section>
							</c:if>
						</div>
					</section>
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
    <script src="<%=request.getContextPath() %>/assets/country-state.js"></script>
	<script>
		$('document').ready(function() {
			populateCountries("country", "state");
			$('#country option:contains("India")').prop('selected',true);
			populateStates("country", "state");
			$('#property').addClass("active");
			$('.nav-tabs-dropdown').each(function(i, elm) {
			    
			    $(elm).text($(elm).next('ul').find('li.active a').text());
			    
			});
			  
			$('.nav-tabs-dropdown').on('click', function(e) {

			    e.preventDefault();
			    
			    $(e.target).toggleClass('open').next('ul').slideToggle();
			    
			});

			$('#nav-tabs-wrapper a[data-toggle="tab"]').on('click', function(e) {

			    e.preventDefault();
			    
			    $(e.target).closest('ul').hide().prev('a').removeClass('open').text($(this).text());
			      
			});
		});
	</script>
	<script>
    	$('document').ready(function(){
    		$('#state').change(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/getLocations/"+$('#state').val()+"",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#location').empty();
						$('#location').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						if(data=="No Locations Found") {
							$('#location').empty();
							$('#location').html(data);
							$('#location').removeClass('loader');
							$('#properties-tab').empty();
							$('#properties-tab').removeClass('loader');
							$('#properties-tab').html("<p>There are no properties listed for this State.</p><div class=\"row\"><a href=\"https://ozailiving.com/mobile/findabed\" style=\"display: block !important;\" class=\"btn btn-warning btn-block btn-pill d-flex text-center\">FIND A BED</a></div>");
						} else {
							$('#location').empty();
							$('#location').removeClass('loader');
							$('#location').html(data);
							$('#properties-tab').empty();
							$('#properties-tab').append("<p><span class=\"text-danger\">*</span>Select Location to get Properties.</p>");
						}
					},
				error : function(e) {
						console.log("ERROR: ", e);
					},
				done : function(e) {
						console.log("DONE");
						$('#loading').remove();
					}
				});
   			});
				
    		$('#location').change(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/getPropertiesByLocation/"+$('#location').val()+"",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#properties-tab').empty();
						$('#properties-tab').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						//setTimeout(function() {
						$('#properties-tab').empty();
						$('#properties-tab').removeClass('loader');
						$('#properties-tab').html(data);
					},
				error : function(e) {
						console.log("ERROR: ", e);
					},
				done : function(e) {
						console.log("DONE");
						$('#loading').remove();
					}
				});
   			});
				
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