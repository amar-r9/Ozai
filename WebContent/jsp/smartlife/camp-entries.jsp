<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, material design, material dashboard bootstrap 5 dashboard template" />
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/new/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/dist/js/pages/chartist/chartist-init.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/assets/extra-libs/css-chart/css-chart.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/assets/extra-libs/c3/c3.min.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="<%=request.getContextPath()%>/assets/js/maps-tikaana.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/new/assets/libs/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" />
<!-- Demo styles -->
<style>
	.video-container {
           position: relative;
           padding-top: 56.25%; /* 16:9 Aspect Ratio */
           height: 0;
           overflow: hidden;
       }
       .video-container video {
           position: absolute;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           object-fit: contain; /* Ensures the entire image is visible */
       }
       .video-container video::before {
           content: "";
           display: block;
           position: absolute;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
       }
</style>
</head>

<body>
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<div id="main-wrapper">
		<jsp:include page="/common/smartheader.jsp"></jsp:include>
		<div class="page-wrapper" style="margin-top: 50px;">
			<div class="page-breadcrumb ps-0 pe-0">
				<div class="row card-header">
					<div class="align-self-center">
						<h4 class="page-title pt-2">
							<c:choose>
								<c:when test="${not empty camp }">
									${camp } entries
								</c:when>
								<c:otherwise>
									Talent entries
								</c:otherwise>
							</c:choose>						
						</h4>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="alert">
						<div class="row">
							<div class="col-md-8"></div>							
							<div class="col-md-3 text-end">
								<select class="form-control form-select" name="talentStatus" id="talentStatus">
									<option value="All">All</option>
									<option value="Selected">Selected</option>
									<option value="Rejected">Rejected</option>
								</select>
							</div>
						</div>
					</div>			
					<div class="card-group">
						<div class="row col-md-12">				
							<c:forEach items="${entries }" var="talent">
							    <div class="col-md-4 col-sm-12 mb-3 entry 
								    ${talent.selected == 1 ? 'selected' : ''} 
								    ${talent.rejected == 1 ? 'rejected' : ''}">
							        <div class="card card-body m-2">
							            <div class="row">
						                    <div class="col-md-12">
						                        <div class="card-box-c foo">
						                            <div class="card-header-c d-flex">
						                                <div class="">
						                                    <span class="fa fa-user-circle fa-2x"></span>
						                                </div>
						                                <h5 class="m-2" style="color: #393939;">&nbsp;&nbsp;${talent.name }</h5>
						                                <div class="card-title-c align-self-center">
						                                    <h2 class="title-c"></h2>
						                                </div>
						                            </div>
						                            <div class="card-body-c m-4">
						                                <p class="title-c"><i class=" fas fa-globe"></i>&nbsp;${talent.organization }</p>
						                                <p class="text-dark">
						                                    ${talent.summary }
						                                </p>
						                            </div>
						                            <div class="m-4 video-container">
						                                <video controls preload="auto">
						                                    <!-- Test with a static video URL -->
						                                    <source src="https://ozailiving.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}" type="video/mp4">
						                                    <source src="https://ozailiving.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}" type="video/ogg">
						                                    Your browser does not support HTML5 video.
						                                </video>							                                
						                            </div>
						                            <div class="row">
						                            	<div class="col-md-6 col-6 col-sm-6 text-start">
					                                		<c:choose>
					                                			<c:when test="${talent.rejected eq 1 }">
					                                				<button class="btn btn-sm btn-danger">
					                                					<i class="fas fa-window-close"></i>
					                                					&nbsp; Rejected
					                                				</button>
					                                			</c:when>
					                                			<c:otherwise>
					                                				<button class="btn btn-sm btn-warning" id="reject${talent.id }"
																		onclick="rejectEntry${talent.id}()">
																		<i class="far fa-window-close"></i> Reject
																	</button>
																	<script>
																		//int totalDue=0;
																		function rejectEntry${talent.id}() {
																			$('document').ready(function() {
																				
																				$.ajax({
																					type : "GET",
																					url : "${pageContext.request.contextPath}/smartlife/rejectEntry/${talent.id}",
																					timeout : 10000,
																					beforeSend:function(){
																						$('#reject${talent.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
																					},
																					success : function(data) {
																						console.log("SUCCESS: ", data);
																						if(data=="Success") {
																							$("#failMsg").hide();
																							$('#reject${talent.id }').removeClass();
																							$('#reject${talent.id }').addClass('btn btn-sm btn-danger');
																							$('#reject${talent.id }').html('<i class="fas fa-window-close"></i>  Rejected');
																						} else {
																							$("#Failed").show();
																						}																								
																					},
																					error : function(e) {
																						console.log("ERROR: ", e);																								
																					},
																					done : function(e) {
																						console.log("DONE");
																						
																					}
																				});
																			});
																		}
																	</script>
					                                			</c:otherwise>
					                                		</c:choose>
					                                	</div>
						                            
					                                	<div class="col-md-6 col-6 col-sm-6 text-end">
					                                		<c:choose>
					                                			<c:when test="${talent.selected eq 1 }">
					                                				<button class="btn btn-sm btn-success">
					                                					<i class="fa fa-check-circle"></i>
					                                					&nbsp; Selected
					                                				</button>
					                                			</c:when>
					                                			<c:otherwise>
					                                				<button class="btn btn-sm btn-info" id="select${talent.id }"
																		onclick="selectEntry${talent.id}()">
																		<i class="fa fa-check"></i> Select
																	</button>
																	<script>
																		//int totalDue=0;
																		function selectEntry${talent.id}() {
																			$('document').ready(function() {
																				
																				$.ajax({
																					type : "GET",
																					url : "${pageContext.request.contextPath}/smartlife/selectEntry/${talent.id}",
																					timeout : 10000,
																					beforeSend:function(){
																						$('#select${talent.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
																					},
																					success : function(data) {
																						console.log("SUCCESS: ", data);
																						if(data=="Success") {
																							$("#failMsg").hide();
																							$('#select${talent.id }').removeClass();
																							$('#select${talent.id }').addClass('btn btn-sm btn-success');
																							$('#select${talent.id }').html('<i class="fa fa-check-circle"></i>  Selected');
																						} else {
																							$("#Failed").show();
																						}																								
																					},
																					error : function(e) {
																						console.log("ERROR: ", e);																								
																					},
																					done : function(e) {
																						console.log("DONE");
																						
																					}
																				});
																			});
																		}
																	</script>
					                                			</c:otherwise>
					                                		</c:choose>
					                                	</div>
					                                </div>
						                        </div>
						                    </div>
							        	</div>
							        </div>
							    </div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer text-center"> All Rights Reserved by
				Ozai. </footer>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/app-style-switcher.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/dashboards/dashboard1.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>

	<!--Morris JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/raphael/raphael.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/morris.js/morris.min.js"></script>
	<!-- This Page Plugins -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/d3/dist/d3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/c3/c3.min.js"></script>
	<!-- Charts JS -->
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/chartist/dist/chartist.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/flot/excanvas.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/flot/jquery.flot.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery.flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/d3/dist/d3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/c3/c3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/gaugeJS/dist/gauge.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/widget/card-custom.js"></script>
	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/assets/libs/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	
	<!-- Initialize Swiper -->
	<script>
		$('document').ready(function() {
			$('.sidebartoggler').toggle();
		});
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				Theme : true, // this can be true or false ( true means dark and false means light ),
				Layout : "horizontal",
				LogoBg : "skin3", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				NavbarBg : "skin3", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarType : "overlay", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin3", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : true, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
	<script>
		$(document).ready(function(){
			$('#talentStatus').change(function(){
		        var selectedValue = $(this).val(); // Get the selected value from the dropdown

		        if (selectedValue=='Selected') {
		            $('.entry').hide();
		            $('.selected').show();
		        } else if (selectedValue=='Rejected') {
		        	$('.entry').hide();
		            $('.rejected').show();
		        } else if (selectedValue=='All') {
		            $('.entry').show();	        	
		        }
		    });			
		});
	</script>
</body>
</html>