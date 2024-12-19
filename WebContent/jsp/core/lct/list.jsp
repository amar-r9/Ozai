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
      content="Tikaana admin dashboard for finacne module"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Admin Dashboard | Ozai</title>
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
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- This page plugin CSS -->
    <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
    
    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.css" rel="stylesheet" type="text/css" />
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
.btn-pill {
	border-radius: 50px;
	float: right;
}
.img-circle {
	width: 100% !important;
}

.rating {
  float:left;
}

/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
  follow these rules. Every browser that supports :checked also supports :not(), so
  it doesn’t make the test unnecessarily selective */
.rating:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.rating:not(:checked) > label {
    float:right;
    width:1em;
    /* padding:0 .1em; */
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    /* line-height:1.2; */
    color:#ddd;
}

.rating:not(:checked) > label:before {
    content: '★ ';
}

.rating > input:checked ~ label {
    color: dodgerblue;
    
}

.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
    color: dodgerblue;
    
}

.rating > input:checked + label:hover,
.rating > input:checked + label:hover ~ label,
.rating > input:checked ~ label:hover,
.rating > input:checked ~ label:hover ~ label,
.rating > label:hover ~ input:checked ~ label {
    color: dodgerblue;
    
}

.rating > label:active {
    position:relative;
    top:2px;
    left:2px;
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
      <jsp:include page="/common/coreheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/coresidebar.jsp"></jsp:include>
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
            <div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
              <h4 class="page-title">Operators</h4>
            </div>
            <div class="col-7 align-self-center d-none d-lg-block">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Operators
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
          
          <!-- Row selection (multiple rows) -->
          <div class="row">
            <div class="col-md-12 col-12">
              <!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
              <div class="card">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0"></h4>
                </div>
                <div class="card-body">
                  <c:if test="${not empty operators }">
					<table class="table">
						<thead>
							<tr>
								<th>SNo</th>
								<th>Name</th>
								<th>Username</th>
								<th>Client</th>
								<th>Client Code</th>
						</thead>
						<tbody>
                    		<c:forEach items="${operators}" var="order" varStatus="sno">
								<tr>
									<td>${sno.index+1 }</td>
									<td>${order.name }</td>
									<td>${order.username }</td>
									<td>${order.client }</td>
									<td>${order.client_code }</td>
								</tr>						
							</c:forEach> 
						</tbody>
					</table>           
                 </c:if>
                 <c:if test="${empty operators }">
                 	<h5>No results found.</h5>
                 </c:if>
                </div>
              </div>
              <!-- ---------------------
                end Row selection (multiple rows)
               ---------------- -->
            </div>
          </div>
          <!-- Form inputs -->
          
          <!-- row selection & deletion -->
          
          <!-- -------------------------------------------------------------- -->
          <!-- End PAge Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- -------------------------------------------------------------- -->
          <!-- Right sidebar -->
          <!-- -------------------------------------------------------------- -->
          <!-- .right-sidebar -->
          <!-- -------------------------------------------------------------- -->
          <!-- End Right sidebar -->
          <!-- -------------------------------------------------------------- -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">All right reserved by Ozai.</footer>
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
    <script>
		$('document').ready(function() {
		    var panels = $('.user-infos');
		    var panelsButton = $('.dropdown-user');
		    panels.hide();

		    //Click dropdown
		    panelsButton.click(function() {
		        //get data-for attribute
		        var dataFor = $(this).attr('data-for');
		        var idFor = $(dataFor);

		        //current button
		        var currentButton = $(this);
		        idFor.slideToggle(400, function() {
		            //Completed slidetoggle
		            if(idFor.is(':visible'))
		            {
		                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
		            }
		            else
		            {
		                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
		            }
		        })
		    });

		    $('[data-toggle="tooltip"]').tooltip();
		});
	</script>
    <script>
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
		$('document').ready(function(){    		
    		$('.sidebartoggler').toggle();
    	});
    </script>
  </body>
</html>