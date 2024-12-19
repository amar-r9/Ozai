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
    <title>Admin Dashboard | Tikaana</title>
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
      <jsp:include page="/common/opsheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/opssidebar.jsp"></jsp:include>
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
              <h4 class="page-title">Finance Module</h4>
            </div>
            <div class="col-7 align-self-center">
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
                  <h4 class="card-title mb-0">Expense List</h4>
                </div>
               	<div class="card-body row">
                  	<div class="row gap-2">
		          		<div class="col-2 col-md-2 col-xs-12 col-12">
							<a href="<%=request.getContextPath() %>/ops/expenses/vendor-list"
								class="btn d-flex align-items-center
                          				btn-info w-100 d-block font-weight-medium">
								Vendor List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
							</a>
						</div>
			          	<div class="col-2 col-md-2 col-xs-12 col-12">
							<a href="<%=request.getContextPath() %>/ops/expenses/add-vendor"
								class="btn d-flex align-items-center
                          				btn-success w-100 d-block font-weight-medium">
								Add Vendor <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
							</a>
						</div>
			          	<div class="col-2 col-md-2 col-xs-12 col-12">
							<c:choose>
								<c:when test="${OpsUser.access_level eq 1 }">
									<a
										href="<%=request.getContextPath()%>/ops/expenses/payment-list"
										class="btn d-flex align-items-center
                          				btn-warning w-100 d-block font-weight-medium">
										Expense List <span class="badge ms-auto bg-warning"><i
											class="fa fa-list"></i></span>
									</a>
								</c:when>
								<c:otherwise>
									<a
										href="<%=request.getContextPath()%>/ops/expenses/approve-list"
										class="btn d-flex align-items-center
                          				btn-warning w-100 d-block font-weight-medium">
										Expense List <span class="badge ms-auto bg-warning"><i
											class="fa fa-list"></i></span>
									</a>
								</c:otherwise>
							</c:choose>
						</div>
			          	<div class="col-2 col-md-2 col-xs-12 col-12">
							<a href="<%=request.getContextPath() %>/ops/expenses/add"
								class="btn d-flex align-items-center
                          				btn-primary w-100 d-block font-weight-medium">
								 Add Expense <span class="badge ms-auto bg-primary"><i class="fa fa-plus"></i></span>
							</a>
						</div>
					</div>
                </div>
                <div class="card-body">
                  <c:if test="${not empty finances }">
                  	<ul
                      class="nav nav-pills justify-content-end"
                      role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" id="showPending">
                          <span>Pending</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath() %>/ops/expenses/paid-list">
                          <span>Cleared</span>
                        </a>
                      </li>
                    </ul><br>
                    <div class="active" id="pending">
	                  <div class="table-responsive">
	                    <table id="tenants"
	                      class="table table-striped table-bordered
	                        display text-nowrap" style="width: 100%">
	                      <thead>
	                        <!-- start row -->
	                        <tr>
	                          	<th>Code</th>
								<th>Bill</th>
								<th>Action</th>
								<th>Vendor</th>
								<th>Invoice No</th>
								<th>Month</th>
								<th>Amount</th>
								<th>Invoice Date</th>
								<th>Property</th>
								<th>Service</th>
	                        </tr>
	                        <!-- end row -->
	                      </thead>
	                      <tbody id="pulledData">
	                        <!-- start row -->
	                        <c:forEach items="${finances}" var="finance">
								<c:choose>
									<c:when test="${OpsUser.username eq 'nagesh' || OpsUser.username eq 'pruthvi' }">
									<tr>
									  <td>${finance.expense_code }</td>
									  <td><a href="https://tikaana.com/uploaded_files/DOC/EXPENSES/${finance.filename }"
											class="btn btn-light-warning text-warning"
											target="_blank"><i class="ri-attachment-2"></i></a>
														
									  </td>
									  <td>
										<c:choose>
											<c:when test="${finance.approved eq 0 }">
												<button class="btn btn-sm btn-info"
													onclick="getRentDue${finance.id}()">
													<i class="fa fa-check"></i> Approve
												</button>
												<script>
													//int totalDue=0;
													function getRentDue${finance.id}(){
														$('document').ready(function() {
															
															$.ajax({
																type : "GET",
																url : "${pageContext.request.contextPath}/ops/approve-expense/${finance.id}",
																//contentType: "application/json; charset=utf-8",
																//dataType: "json",
																timeout : 100000,
																beforeSend:function(){
																	//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
																},
																success : function(data) {
																	console.log("SUCCESS: ", data);
																	if(data=="Success") {
																		$("#failMsg").hide();
																		$("#successMsg").show();
																		location.reload();
																	} else {
																		$("#Failed").show();
																		$("#successMsg").hide();
																	}
																	//totalDue = totalDue+data;
																	//$('#rent-due-${tenant.id }').html(totalDue);
																	
																},
																error : function(e) {
																	console.log("ERROR: ", e);
																	
																},
																done : function(e) {
																	console.log("DONE");
																	//$('#loading').remove();
																	
																}
															});
														});
													}
												</script>
											</c:when>
											<c:otherwise>
												<span class="text-success"><i
													class="fa fa-user"></i> ${finance.approved_by }</span>
											</c:otherwise>
										</c:choose>
									  </td>
									  <td>${finance.vendor_name }</td>
									  <td>${finance.vendor_invoice_no }</td>
									  <td>${finance.service_month }, ${finance.service_year }</td>
									  <td>${finance.invoice_amount }</td>
									  <td>${finance.vendor_invoice_date }</td>
									  <td style="text-transform: capitalize;">${finance.property_code }</td>
									  <td>${finance.service_type }</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:if test="${finance.entry_by eq OpsUser.name || finance.entry_by eq OpsUser.username }">
										<tr>
										  <td>${finance.expense_code }</td>
										  <td><a href="https://tikaana.com/uploaded_files/DOC/EXPENSES/${finance.filename }"
												class="btn btn-light-warning text-warning"
												target="_blank"><i class="ri-attachment-2"></i></a>
															
										  </td>
										  <td><span class="text-success"><i
														class="fa fa-user"></i> ${finance.approved_by }</span>
										  </td>
										  <td>${finance.vendor_name }</td>
										  <td>${finance.vendor_invoice_no }</td>
										  <td>${finance.service_month }, ${finance.service_year }</td>
										  <td>${finance.invoice_amount }</td>
										  <td>${finance.vendor_invoice_date }</td>
										  <td style="text-transform: capitalize;">${finance.property_code }</td>
										  <td>${finance.service_type }</td>
										</tr>
									</c:if>
								</c:otherwise>
								</c:choose>
		                    </c:forEach>
	                        <!-- end row -->
	                        </tbody>
	                        <tfoot>
					            <tr>
					                <th colspan="6" style="text-align:right">Total:</th>
					                <th colspan="4"></th>
					            </tr>
					        </tfoot>
	                    </table>
	                  </div>
	                 </div>
	                 
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
        <footer class="footer">All right reserved by Tikaana Admin.</footer>
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