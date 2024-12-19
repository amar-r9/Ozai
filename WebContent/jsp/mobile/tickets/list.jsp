<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Tickets List | Ozai</title>
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
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <h5 class="text-dark text-center fw-bold">Tickets</h5>
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
          <!-- basic table -->
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  
                  <div class="row mt-4">
                   	<div class="col-12 d-flex align-items-stretch">
		              <a href="<%=request.getContextPath() %>/mobile/user/tickets/create"
		                class="btn btn-warning text-white w-100 card-hover">
		                
		                      Create Ticket
		                    
		              </a>
		            </div>
                  </div>
                </div>
              </div>
                  <c:if test="${not empty tickets }">
	                  <div class="table-responsive mt-4">
                  		<c:forEach items="${tickets}" var="ticket">
								<div class="card" style="background: #EFEEEA; border-radius: 15px;">
									<div class="card-body row">
										<div class="col-3" style="writing-mode: vertical-lr;">
											<div class="text-center">
												<c:if test="${ticket.status eq 'Raised' }">
													<i class="fas fa-exclamation-triangle fa-2x text-dark"></i>
												</c:if>
												<c:if test="${ticket.status eq 'Opened' }">
													<i class="fas fa-folder-open fa-2x text-warning"></i>
												</c:if>
												<c:if test="${ticket.status eq 'In Progress' }">
													<i class="fas fa-play fa-2x text-info"></i>
												</c:if>
												<c:if test="${ticket.status eq 'Closed' }">
													<i class="fas fa-window-close fa-2x text-danger"></i>
												</c:if>
											</div>
										</div>
										<div class="col-9">
											<h5 style="font-weight: 700; color: #000;">${ticket.title }</h5>
											<small class="text-muted" style="margin-bottom: 0;">
												<fmt:formatDate value="${ticket.raised_date }" pattern="dd MMM, yyyy"/>,
												 <fmt:formatDate value="${ticket.raised_date }" pattern="hh:mm a"/>
												 | Room: ${ticket.details.room.room_no } | ${ticket.details.property.name }</small>
											<p style="color: #000; font-size: 12px;">${ticket.summary }</p>
											<div class="row">
												<div class="col-6">
												<button class="btn btn-sm" style="background: #F8D8D8; font-weight: 700;
														border-radius: 10px; text-transform: uppercase; width: 100%; color: #000;">
													${ticket.status }</button>													
												</div>
												<div class="col-6">
													<a class="btn btn-sm" style="background: #E0DBEF;
														border-radius: 10px; color: #000; font-weight: 700; width: 100%;"
														href="<%=request.getContextPath() %>/mobile/user/tickets/view/${ticket.id }">DETAILS</a>
												</div>
											</div>
										</div>
									</div>										
								</div>
							</c:forEach>
	                  
	                    <%-- <table
	                      id="zero_config"
	                      class="table table-bordered no-wrap fs-3">
	                      <thead>
	                        <tr>
	                        	<th>#</th>
	                          <th>Status</th>
	                          <th>Category</th>
	                          <th>Issue</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                        <c:forEach items="${tickets}" var="ticket">
		                        <tr>
		                        	<td><a href="<%=request.getContextPath() %>/mobile/user/tickets/view/${ticket.id }"><i class="fa fa-eye"></i></a></td>
		                          <td>
		                          	<c:if test="${ticket.status eq 'Raised' }">
			                            <span class="badge bg-light-info
			                                text-dark font-weight-medium">${ticket.status }</span>
		                          	</c:if>
		                          	<c:if test="${ticket.status eq 'Opened' }">
			                            <span class="badge bg-light-success
			                                text-success font-weight-medium">${ticket.status }</span>
		                          	</c:if>
		                          	<c:if test="${ticket.status eq 'In Progress' }">
			                            <span class="badge bg-light-warning
			                                text-warning font-weight-medium">${ticket.status }</span>
		                          	</c:if>
		                          	<c:if test="${ticket.status eq 'Closed' }">
			                            <span class="badge bg-light-danger
			                                text-danger font-weight-medium">${ticket.status }</span>
		                          	</c:if>
		                          </td>
		                          <td>${ticket.category }</td>
		                          <td>
		                            <a href="#"
		                              class="font-weight-medium link">
		                              ${ticket.title }</a>
		                          </td>
		                        </tr>
		                 	</c:forEach>
	                        
	                      </tbody>
	                      <tfoot>
	                        <tr>
	                          <th>Status</th>
	                          <th>Category</th>
	                          <th>Issue</th>
	                        </tr>
	                      </tfoot>
	                    </table> --%>
	                  </div>
                	</c:if>
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