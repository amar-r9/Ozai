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
      content="admin dashboard, tikaana, tikaana client dashboard, tikaana customer"
    />
    <meta
      name="description"
      content="Admin roles and privileges for Tikaana customers/clients "
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Roles & Privileges for Admin | Tikaana Admin Dashboard</title>
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
    <!-- This page plugin CSS -->
    <link
      href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
      rel="stylesheet"/>
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
      <jsp:include page="/common/adminheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/adminsidebar.jsp"></jsp:include>
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
              <h4 class="page-title">Admin Roles List</h4>
            </div>
            <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/admin">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Admin Roles List
                    </li>
                  </ol>
                </nav>
              </div>
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
          <!-- File export -->
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0">Admin</h4>
                </div>
                <div class="card-body row">
                	<div class="row gap-2" style="float: right;">
						<div class="col-md-2">
							<a href="<%=request.getContextPath() %>/admin/roles/list"
								class="btn d-flex align-items-center
                         				btn-info w-100 d-block font-weight-medium">
								Admin Roles List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
							</a>
						</div>
						<div class="col-md-2">
							<a href="<%=request.getContextPath() %>/admin/roles/add"
								class="btn d-flex align-items-center
		                          btn-success w-100 d-block
		                          font-weight-medium">
								Add Admin Role  <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
							</a>
						</div>
					</div>
                  <div class="table-responsive"><br>
                  	<c:if test="${not empty tenants }">
                    <table id="tenants"
                      class="table table-bordered table-condensed display text-nowrap">
                      <thead>
                        <!-- start row -->
                        <tr>
                          <th>#</th>
                          <th>Name</th>
                          <th>Username</th>
                          <th>Property</th>
                          <th>Role/ Access Level</th>
						  <th>Status</th>
						  <th>Action</th>
                        </tr>
                        <!-- end row -->
                      </thead>
                      <tbody>
                        <!-- start row -->
                        <c:forEach items="${tenants}" var="tenant" varStatus="sno">
                        <tr>
                        	<td>${sno.index+1}</td>
                          <td>${tenant.name }</td>
                          <td>${tenant.username }</td>
                          <td>${tenant.property }</td>
						  <td>
						  	<c:if test="${tenant.access_level eq 1 }">
						  		Head Office
						  	</c:if>
						  	<c:if test="${tenant.access_level eq 2 }">
						  		State Head
						  	</c:if>
						  	<c:if test="${tenant.access_level eq 3 }">
						  		Zonal In-charge
						  	</c:if>
						  	<c:if test="${tenant.access_level eq 4 }">
						  		Manager
						  	</c:if>
						  </td>
						  <td>
						  	<c:choose>
						  		<c:when test="${tenant.active eq 1 }">
						  		 	Active
						  		</c:when>
						  		<c:otherwise>
						  			Inactive
						  		</c:otherwise>
						  	</c:choose>
						  </td>
						  <td>
						  	<c:choose>
						  		<c:when test="${ClientUser.access_level eq 1 }">
								  	<a href="<%=request.getContextPath() %>/admin/roles/edit/${tenant.id}"
								  		class="btn btn-sm btn-warning">Edit</a>
						  		</c:when>
						  		<c:otherwise>
						  			No Access
						  		</c:otherwise>
						  	</c:choose>
                        </tr>
                        </c:forEach>
                        <!-- end row -->
                      </tbody>
                    </table>
                    </c:if>
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
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">All right reserved by Pradeenav Tikaana Private Limited.</footer>
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
    <!--This page plugins -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
   <script>
	$('document').ready(function(){
		$('#tenants').DataTable({

			dom: "Bfrtip",
			  buttons: ["copy", "csv", "excel", "pdf", "print"]
			
	    } );
		$(".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel"
		).addClass("btn btn-warning btn-sm mr-1");
		$('.buttonJoin').click();
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