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
    <link
      href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
      rel="stylesheet" />
    <style>
      td.details-control {
        background: url('../new/dist/js/pages/datatable/details_open.png')
          no-repeat center center;
        cursor: pointer;
      }

      tr.shown td.details-control {
        background: url('../new/dist/js/pages/datatable/details_close.png')
          no-repeat center center;
      }
      .modal-body img {
      	width: 100%;
      }
      .ui-bg {
      	background: #f3f3f3bf !important;
      }
      .new-text {
      	color: #021740 !important;
      }
    </style>
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
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 align-self-center">
              <h5 class="text-start text-dark fw-bold">${vendor.name } Expenses
				<span style="float: right;">
					<a href="<%=request.getContextPath() %>/lct/expenses/edit-vendor/${vendor.id }">
						View/Edit
					</a>
				</span>
			  </h5>
            </div>
            <!-- <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="#">Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Finance Module
                    </li>
                  </ol>
                </nav>
              </div>
            </div> -->
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
          <div class="">
		  	<div class="row">
				<div class="col-4 text-start">
					<a href="<%=request.getContextPath()%>/lct/expenses/add">
						<div class="card card-body bg-info text-white" style="border-radius: 10px;">
							<i class="fas fa-plus fa-2x"></i><br>
							<small>Add Expense</small>
						</div>
					</a>
				</div>
				<div class="col-4">
					<a href="<%=request.getContextPath()%>/lct/expenses/vendor-list">
						<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
							<i class="fas fa-user fa-2x"></i><br>
							<small>Vendors</small>
						</div>
					</a>
				</div>
				<div class="col-4">
					<a href="<%=request.getContextPath()%>/lct/expenses/add-vendor">
						<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
							<i class="fas fa-plus fa-2x"></i><br>
							<small>Add Vendor</small>
						</div>
					</a>
				</div>
			</div>
            <div class="col-md-12 col-12">
              <!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
              <div class="">
               	<ul
                     class="nav nav-pills justify-content-end"
                      role="tablist">
					  <c:if test="${ClientUser.access_level le 3 }">
						  <li class="nav-item">
							<a class="nav-link"  href="<%=request.getContextPath() %>/lct/expenses/approve-list">
							  <span class="new-text">Approval</span>
							</a>
						  </li>
						</c:if>
                      <li class="nav-item">
                    	<a class="nav-link" href="<%=request.getContextPath() %>/lct/expenses/list">
                          <span class="new-text">Pending</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath() %>/lct/expenses/paid-list">
                          <span class="new-text">Cleared</span>
                        </a>
                      </li>
                    </ul><br>
                <div class="">
					<c:if test="${empty expenses }">
						<div class="card" style="border-radius: 20px;">
							<div class="card-body">
								<div class="row">
									No results found.
								</div>
							</div>
						</div>
					</c:if>
                  	<c:if test="${not empty expenses }">
	                	<c:forEach items="${expenses}" var="expense">
							
							<div class="card ui-bg">
				              	<div class="alert ui-bg"
									style="margin-bottom: 0px; border-radius: 30px;">
				                	<div class="card-body" style="padding: 0px;">
				                  		<div class="d-flex align-items-center">
				                    		<h5 class="text-dark fw-bold">${expense.service_type}</h5>
				                    		<div class="ms-auto">
				                      			<span class="text-dark fs-3 medium"> ${expense.total } AED</span>
				                    		</div>
				                  		</div>
				                  		<div class="d-flex align-items-center">					                    
				                    		<div class="pe-3 col-4">
												<h6 class="pt-2 medium text-dark fw-normal "><fmt:formatDate value="${expense.submit_date }" pattern="dd MMM, yyyy"/></h6>
											</div>
											<div class="col-4 text-end">
												</div>
				                    		<div class="ms-3 col-4 text-end me-2 pe-2">				                      	
						                    	<a href="#">${expense.vendor.name}</a>
				                    		</div>
				                  		</div>
				                  		<div class="row">
											<div class="col-6">
												<a href="<%=request.getContextPath() %>/lct/expenses/details/${expense.id }" 
													class="btn btn-sm" style="background: #F8D8D8; font-weight: 700;
													border-radius: 10px; text-transform: uppercase; width: 100%; color: #000;">
													DETAILS
												</a>												
											</div>
											<div class="col-6">
												<a class="btn btn-sm" style="background: #E0DBEF;
													border-radius: 10px; color: #000; font-weight: 700; width: 100%;"
													href="<%=request.getContextPath() %>/lct/expenses/update-payment/${expense.id }">PAYMENT</a>										
											</div>
										</div>
				                	</div>
				              	</div>
				            </div>
						</c:forEach> 
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
        <footer class="footer">All right reserved by Ozai Admin.</footer>
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
    <script>
    	$('document').ready(function(){
    		
    		$('#tenants').DataTable({
   		       "paging":   true,
   		       
   		    "columnDefs": [{
			      "targets": [6],
			      "render": function(data, type, row) {
			        return Number(data).toLocaleString('en-IN', {
			          maximumFractionDigits: 2,
			          style: 'currency',
			          currency: 'INR'
			        });
			      }
			    }],
   		       
   		       
   		    "footerCallback": function ( row, data, start, end, display ) {
	            var api = this.api();
	 
	            // Remove the formatting to get integer data for summation
	            var intVal = function ( i ) {
	                return typeof i === 'string' ?
	                    i.replace(/[\$,]/g, '')*1 :
	                    typeof i === 'number' ?
	                        i : 0;
	            };
	 
	            // Total over all pages
	            total = api
	                .column( 6 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Total over this page
	            pageTotal = api
	                .column( 6, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Update footer
	            $( api.column( 6 ).footer() ).html(
	                '&#8377;'+Math.ceil(pageTotal) +' ( &#8377;'+ Math.ceil(total) +' total)'
	            );
	        }
   			});
   			
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
    </script>
  </body>
</html>