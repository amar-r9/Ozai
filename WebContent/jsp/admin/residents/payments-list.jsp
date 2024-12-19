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
      content="Tikaana Admin Dashboard "
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Paid Rents For ${month }, ${year } of ${property } | Tikaana Admin Dashboard for payments</title>
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
      rel="stylesheet" />
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
              <h4 class="page-title">Payments List</h4>
            </div>
            <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/admin">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Payments List
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
            <div class="col-12 col-md-12">
              <!-- ---------------------
                            start File export
                        ---------------- -->
              <div class="card">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0">Admin</h4>
                </div>
                <div class="card-body">
                  <%-- <div class="d-flex justify-content-center">
                  	<a href="<%=request.getContextPath() %>/admin/tenant-details"
                  		class="btn btn-primary btn-rounded">Get Tenant Details</a>
                  </div> --%>
                  
           		<div class="row">
           			<div class="col-md-6">
						<form id="month-form" action="<%=request.getContextPath() %>/admin/residents/month-payments"
							role="form" method="post">
							<div class="input-group mb-3">
								<select class="form-select" name="month"
									id="month" required aria-describedby="basic-addon1">
									<option>Month</option>
									<option value="01">Jan</option>
									<option value="02">Feb</option>
									<option value="03">Mar</option>
									<option value="04">April</option>
									<option value="05">May</option>
									<option value="06">June</option>
									<option value="07">July</option>
									<option value="08">August</option>
									<option value="09">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
								</select>
								<select class="form-select" name="year"
									id="year" required aria-describedby="basic-addon1">
									<option>Year</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
								</select>
								
								<input class="btn btn-light-info text-info font-medium"
									type="submit" id="submitThis" value="Go!" />
							</div>
						</form>
					</div>
					<%-- <c:if test="${not empty year }">
						<div class="col-md-6">
							<form class="property-form" action="<%=request.getContextPath() %>/admin/tenants/month/property/pending-payments"
								role="form" method="post">
								<div class="input-group mb-3 ui-bg">
									<input type="hidden" name="month" value="${month }" />
									<input type="hidden" name="year" value="${year }" />
									<select class="form-control-sm form-select" name="property"
										id="property" required aria-describedby="basic-addon1">
										<option>Property</option>
										<c:forEach items="${pgs }" var="pg">
											<option value="${pg.code }">${pg.name }</option>
										</c:forEach>
									</select>
									<input class="btn btn-light-info text-info font-medium"
										type="submit" id="submitIt" value="Go!" />
								</div>
							</form>
						</div>
					</c:if> --%>
				</div>
                  <div class="row">
                  	<div class="alert alert-light-success text-success">
                  		<h4>Showing payments for <span class="text-dark" style="font-weight: 700;">${month }/${year }</span> 
                  		<c:if test="${not empty property }"> for the property <span class="text-danger"
                  			style="font-weight: 700;">${property }</span></c:if></h4>
                  	</div>
                  </div>
                  <div class="table-responsive">
                  	<c:if test="${not empty payments }">
                    <table id="tenants"
                      class="table table-bordered display" style="width: 100%;">
                      <thead>
                        <!-- start row -->
                        <tr>
                          
                          <th>Name</th>
                          <th>Mobile</th>
                          <th>Room</th>
                          <th>Amount</th>
                          <th>Property</th>
                          <th>Month, Year</th>
						  <th>Payment Date</th>
                        </tr>
                        <!-- end row -->
                      </thead>
                      <tbody id="pulledData">
                        <!-- start row -->
                        <c:forEach items="${payments}" var="payment">
                        <tr>
                          
                          <td>${payment.name }</td>
                          <td>${payment.mobile }</td>
                          <td>${payment.room }</td>
						  <td>${payment.rent }</td>
						  <td>${payment.property }</td>
						  <td>${month }, ${year }</td>
						  <td>${payment.paid_date}</td>
                        </tr>
                        </c:forEach>
                        <!-- end row -->
                      </tbody>
                      <tfoot>
			            <tr>
			                <th colspan="3" style="text-align:right">Total:</th>
			                <th colspan="4"></th>
			            </tr>
			        </tfoot>
                    </table>
                    </c:if>
                  </div>
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
	<!-- <script>
    	$('document').ready(function(){
    		
   			$('#submitIt').click(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/tenants/month-payments/"+$('#month').val()+"/"+$('#year').val()+"",
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
   			
   			$('#property-beds').change(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/tenants/property-payments/"+$('#property-beds').val()+"",
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
    </script> -->
    <script>
	$('document').ready(function(){
		$('#tenants').DataTable({
				dom: "Bfrtip",
				buttons: ["copy", "csv", "excel", "pdf", "print"],
   		       
   		    /*"columnDefs": [{
			      "targets": [3],
			      "render": function(data, type, row) {
			        return Number(data).toLocaleString('en-IN', {
			          maximumFractionDigits: 2,
			          style: 'currency',
			          currency: 'INR'
			        });
			      }
			    }],*/
   		       
   		       
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
	                .column( 3 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Total over this page
	            pageTotal = api
	                .column( 3, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Update footer
	            $( api.column( 3 ).footer() ).html(
	                '&#8377;'+Math.ceil(pageTotal) +' ( &#8377;'+ Math.ceil(total) +' total)'
	            );
	        }
   			});
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
