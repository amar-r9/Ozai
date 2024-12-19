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
            <div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
              <h4 class="page-title">Finance Module</h4>
            </div>
            <div class="col-7 align-self-center d-none d-lg-block">
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
                  	<div class="row gap-2 d-none d-lg-block">
		          		<div class="col-2 col-md-2 col-xs-12 col-12">
							<a href="<%=request.getContextPath() %>/admin/expenses/vendor-list"
								class="btn d-flex align-items-center
                          				btn-info w-100 d-block font-weight-medium">
								Vendor List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
							</a>
						</div>
			          	<div class="col-2 col-md-2 col-xs-12 col-12">
							<a href="<%=request.getContextPath() %>/admin/expenses/add-vendor"
								class="btn d-flex align-items-center
                          				btn-success w-100 d-block font-weight-medium">
								Add Vendor <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
							</a>
						</div>
			          	<div class="col-2 col-md-2 col-xs-12 col-12">
							<a
								href="<%=request.getContextPath()%>/admin/expenses/list"
								class="btn d-flex align-items-center
                        				btn-warning w-100 d-block font-weight-medium">
								Expense List <span class="badge ms-auto bg-warning"><i
									class="fa fa-list"></i></span>
							</a>
						</div>
			          	<div class="col-2 col-md-2 col-xs-12 col-12">
							<a href="<%=request.getContextPath() %>/admin/expenses/add"
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
                        <a class="nav-link" href="<%=request.getContextPath() %>/admin/expenses/paid-list">
                          <span>Cleared</span>
                        </a>
                      </li>
                    </ul><br>
                    <div class="active" id="pending">
	                  <div class="table-responsive">
	                    <table id="tenants"
	                      class="display no-wrap" width="100%" style="width: 100%">
	                      <thead>
	                        <!-- start row -->
	                        <tr>
	                          	<th>Code</th>
								<th>Bill</th>
								<th>Action</th>
								<th>Month</th>
								<th>Vendor</th>
								<th>Invoice No</th>
								<th>Amount</th>
								<th>Property</th>
								<th>Service</th>
								<th>Material</th>
								<th>Invoice Date</th>
								<th>Upload Date</th>
	                        </tr>
	                        <!-- end row -->
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							  </tr>
	                      </thead>
						  <tfoot>
							<tr>
	                          	<th>Code</th>
								<th>Bill</th>
								<th>Action</th>
								<th>Month</th>
								<th>Vendor</th>
								<th>Invoice No</th>
								<th>Amount</th>
								<th>Property</th>
								<th>Service</th>
								<th>Material</th>
								<th>Invoice Date</th>
								<th>Upload Date</th>
	                        </tr>
						  </tfoot>
	                      <tbody id="pulledData">
	                        <!-- start row -->
	                        <c:forEach items="${finances}" var="finance">
		                        <%-- <c:choose>
	                        		<c:when test="${finance.approved eq 0 }">
	                        	
	                        		</c:when>
	                        		<c:otherwise> --%>
				                        <tr>
				                          <td>${finance.id }</td>
				                          <td><a href="https://ozailiving.com/uploaded_files/DOC/EXPENSES/${finance.filename }"
						                        class="btn btn-light-warning text-warning"
						                        target="_blank"><i class="ri-attachment-2"></i></a>
  													
          										</td>
											<td>
												<a
													href="<%=request.getContextPath() %>/admin/expenses/update-payment/${finance.id }"
													class="btn-sm btn btn-success">Pay</a>
											</td>
											<td>${finance.service_month }</td>
				                          <td>${finance.vendor.name }</td>
				                          <td>${finance.vendor_invoice_no }</td>
				                          <td>${finance.invoice_amount }</td>
				                          <td style="text-transform: capitalize;">${finance.property_code }</td>
				                          <td>${finance.service_type }</td>
										  <td>${finance.material_purchased }</td>
				                          <td>${finance.vendor_invoice_date }</td>
				                          <td>${finance.submit_date }</td>
				                        </tr>
					                <%-- </c:otherwise>
					              </c:choose> --%>
		                    </c:forEach>
	                        <!-- end row -->
	                        </tbody>
	                        <!-- <tfoot>
					            <tr>
					                <th colspan="6" style="text-align:right">Total:</th>
					                <th colspan="6"></th>
					            </tr>
					        </tfoot> -->
	                    </table>
	                  </div>
	                 </div>
	                 
                 </c:if>
                 <c:if test="${empty finances }">
                 	<h5>No expenses added yet.</h5>
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
    <!-- start - This is for export functionality only -->
    <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.colVis.min.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.colVis.min.js"></script>
    <script>
		$.fn.dataTable.Api.register('column().searchable()', function() {
		  var ctx = this.context[0];
		  return ctx.aoColumns[this[0]].bSearchable;
		});

		function createDropdowns(api) {
			api.columns().every(function() {
				if (this.searchable()) {
					var that = this;
					var col = this.index();

					// Only create if not there or blank
					var selected = $('thead tr:eq(1) td:eq(' + col + ') select').val();
					if (selected === undefined || selected === '') {
						// Create the `select` element
						$('thead tr:eq(1) td')
							.eq(col)
							.empty();
						var select = $('<select><option value=""></option></select>')
							.appendTo($('thead tr:eq(1) td').eq(col))
							.on('change', function() {
								that.search($(this).val()).draw();
								createDropdowns(api);
							});

						api
							.cells(null, col, {
								search: 'applied'
							})
							.data()
							.sort()
							.unique()
							.each(function(d) {
								select.append($('<option>' + d + '</option>'));
							});
					}
				}
			});
		}

    	$('document').ready(function(){
    		var table = $('#tenants').DataTable({
				fixedHeader: true,
				orderCellsTop: true,
				search: true,
				columnDefs: [
					{
						searchable: false,
						targets: [ 1, 2, 5, 6, 9, 10 ]
					}
				],
				initComplete: function() {
					createDropdowns(this.api());
				}
			});
    		/*<!-- $('#tenants').DataTable({
				columnDefs: [
					{
						searchable: false,
						targets: [0, 1, 2, 4,7 ]
					}
				],
				initComplete: function() {
					createDropdowns(this.api());
				},
				dom: "Bfrtip",
				buttons: ["copy", "csv", "excel", "pdf", "print"],
   		       
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
   			}); --> */
			$(".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel"
			).addClass("btn btn-warning btn-sm mr-1");
    		
   			$('#showPending').click(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/expenses/payment-list/pending",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#pulledData').empty();
						$('#pulledData').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						//setTimeout(function() {
						$('#pulledData').empty();
						$('#pulledData').removeClass('loader');
						$('#pulledData').html(data);
						//$('#is-texts-loaded').text('yes');
						//}, 800);
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
   			
   			$('#showCleared').click(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/expenses/payment-list/cleared",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#pulledData').empty();
						$('#pulledData').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						//setTimeout(function() {
						$('#pulledData').empty();
						$('#pulledData').removeClass('loader');
						$('#pulledData').html(data);
						//$('#is-texts-loaded').text('yes');
						//}, 800);
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
    		
    		$('#showPending').click(function(){
    			$('#showPending').addClass('active');
    			$('#showCleared').removeClass('active');
    		});
    		$('#showCleared').click(function(){
    			$('#showPending').removeClass('active');
    			$('#showCleared').addClass('active');
    		});
    		
    		$('.sidebartoggler').toggle();
    	});
    </script>
  </body>
</html>