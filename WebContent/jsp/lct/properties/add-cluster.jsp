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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Tikaana Admin Dashboard"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Ozai Admin Dashboard</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="<%=request.getContextPath() %>/new/assets/libs/select2/dist/css/select2.min.css" />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png"
    />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet" />
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
      <div class="page-wrapper" style="margin-top: 50px;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 text-center">
              <h5 class="text-dark fw-bold">ADD CLUSTER</h5>
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
			<div class="row">
          		<div class="col-12">            		
            		<div class="card">
                		<div class="card-header">
                			<h4>Clusters</h4>
                		</div>
                		<div class="card-body">
                			<table class="table table-bordered table-hover text-center customize-table mb-0">
                				<thead>
                					<tr>
                						<th>Sno</th>
                						<th>Name</th>
                					</tr>
                				</thead>
                				<tbody>
                					<c:forEach items="${clusters }" var="cluster" varStatus="sno">
                						<tr>
                							<td>${sno.index+1 }</td>
                							<td>${cluster.name }</td>
                						</tr>
                					</c:forEach>
                					<c:choose>
		                				<c:when test="${ClientUser.access_level eq 1 }">		                				
		                					<tr id="cluster-row">
							                    <td>New</td>
							                    <td>
							                        <form action="#" id="cluster-form" method="post">
							                            <div class="input-group">
							                                <input type="text" id="name" name="name" class="form-control" placeholder="Enter cluster name" required>
							                                <input type="hidden" id="client_code" name="client_code" value="${ClientUser.client_code }" />
							                                <input type="submit" id="send" class="btn btn-primary" value="Add" />
							                            </div>
							                        </form>
							                    </td>
							                </tr>
							         	</c:when>
							         	<c:otherwise>
							         		<h4>You are authorized to add cluster.</h4>
							         	</c:otherwise>
							         </c:choose>
                				</tbody>
                			</table>
                		</div>
                	</div>
            		            
          		</div>
        	</div>
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Ozai Living Private Limited.
        </footer>
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
    <script>
		$('document').ready(function(){
			$('#cluster-form').submit(function(){
				event.preventDefault();
				addCluster();
    		});
    	});
	    function addCluster() {
	    	var formData = $("#cluster-form").serialize();
	        // AJAX call to add the new cluster
	        $.ajax({
				type : "POST",
	            url: "${pageContext.request.contextPath}/lct/saveClusterDetails", // Replace with your server-side endpoint
	            data : formData,
	            timeout : 10000,
				beforeSend : function() {
					$(".loading").show();
				},
	            success: function (response) {
	                alert(response);
	                location.reload();
	            },
	            error: function () {
	                alert("Error adding the cluster. Please try again.");
	            }
	        });
	    }
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