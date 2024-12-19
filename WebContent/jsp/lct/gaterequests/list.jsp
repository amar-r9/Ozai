<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="admin dashboard, tikaana, tikaana client dashboard, tikaana customer" />
<meta name="description"
	content="Admin roles and privileges for Tikaana customers/clients " />
<meta name="robots" content="noindex,nofollow" />
<title>Gate Requests | Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page plugin CSS -->
<link
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
	p {
		color: #000;
		overflow: hidden;
	    text-overflow: ellipsis;
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
		<div class="page-wrapper" style="margin-top: 50px; background: #fff;">
            <!-- Chat list   -->
            <div class="row">
                <div class="col-12">
					<h4 class="text-center mt-3 mb-3">Gate entry requests</h4>
                	
                	<ul class="nav nav-tabs" role="tablist">
                    	<li class="nav-item">
                        	<a class="nav-link d-flex active"
                          		data-bs-toggle="tab" href="#requests1" role="tab">
                          		<span>Requests</span>
                        	</a>
                      	</li>
                      	<li class="nav-item">
                        	<a class="nav-link d-flex"
                          		data-bs-toggle="tab" href="#logs1" role="tab">
                          		<span>Logs</span>
                        	</a>
                      	</li>
                    </ul>
                    
                    <div class="tab-content">
                    	<div class="tab-pane active" id="requests1" role="tabpanel">
                    		<div class="container m-0 p-0 mb-4 mt-4" id="gateRequest">
						    	<div class="list-group" id="gateRequestAlert">
                        			<c:forEach items="${requests }" var="req">
		                        		<c:if test="${req.status eq 'Pending'}">
				                        	<div class="">				                          		
		                        				<div class="mb-3 m-2 text-dark border border-dark" 
		                        					style="border-radius: 10px;">
		                        					<a href="<%=request.getContextPath() %>/lct/gaterequests/view/${req.id}">
														<span style="float: right;" class="p-2 bg-dark text-white">${req.status }</span>
														<div class="d-flex justify-content-between align-items-center p-2">
												            <div class="d-flex flex-column">
												                <c:choose>
												                	<c:when test="${req.type eq 'Guest' }">
												                		<h5 class="mb-1">Guest</h5>
												                		<p class="mb-1">You have a guest, <b>${req.name}</b> is waiting for your approval.</p>
												                	</c:when>
												                	<c:otherwise>
												                		<h5 class="mb-1">Delivery</h5>
													                	<p class="mb-1">${req.name } from <b>${req.from }</b> is waiting for your approval.</p>
													     			</c:otherwise>
												                </c:choose>
												                <small class="mb-1">Mobile: ${req.mobile}</small>
												                <small>Requested at: 
												                    <fmt:formatDate value="${req.time}" pattern="MMM dd, yyyy"/>,
												                    <fmt:formatDate value="${req.time}" pattern="hh:mm aa"/>
												                </small>
												            </div>
												        </div>
												    </a>
												</div>
				                        	</div>
				                        </c:if>
			                        </c:forEach>
                      			</div>
                      		</div>
                      	</div>
                      	<div class="tab-pane" id="logs1" role="tabpanel">
                      		<div class="container m-0 p-0 mb-4 mt-4">
						    	<div class="list-group">
		                        	<c:forEach items="${requests }" var="req">
		                        		<c:if test="${req.status eq 'Approved' }">
		                        			<a href="<%=request.getContextPath() %>/lct/gaterequests/view/${req.id}" class="mb-3 m-2 text-dark border-dark" style="background: #b6a0a0b5; 
										        border-radius: 10px;">												
												<div class="d-flex justify-content-between align-items-center p-2">
										            <div class="d-flex flex-column">
										                <h5 class="mb-1">Guest</h5>
										                <p class="mb-1"><b>${req.name}</b> visited ${req.bdetails.user.name }.</p>
										                <small class="mb-1">Mobile: ${req.mobile}</small>
										                <small>At: 
										                    <fmt:formatDate value="${req.time}" pattern="MMM dd, yyyy"/>,
										                    <fmt:formatDate value="${req.time}" pattern="hh:mm aa"/>
										                </small>
										            </div>
										        </div>
										    </a>
		                        		</c:if>
		                        	</c:forEach>
		                        </div>
		                	</div>
                      	</div>
                    </div>                	
                    
					<c:if test="${empty requests }">
						<div class="card row card-body">
							No results.
						</div>
					</c:if>
                </div>
            </div>

        <footer class="footer">All right reserved by Ozai Living
				Private Limited.</footer>
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
		src="<%=request.getContextPath()%>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<!--This page plugins -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<!-- start - This is for export functionality only -->
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
    <script>
		$('document').ready(function() {
			$('.sidebartoggler').toggle();
		});
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				Theme : true, // this can be true or false ( true means dark and false means light ),
				Layout : "horizontal",
				LogoBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				NavbarBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarType : "overlay", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
</body>
</html>