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
    <title>Tikaana Admin Dashboard</title>
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
      href="<%=request.getContextPath() %>/new/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
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
              <h4 class="page-title">Employ Module</h4>
            </div>
            <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/ops">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Payment List
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
            <div class="col-9">
              <!-- ---------------------
                            start File export
                        ---------------- -->
              <div class="card">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0">Payments</h4>
                </div>
                <div class="card-body row">
                  
                  <div class="table-responsive">
                  <c:if test="${OpsUser.access_level eq 1 }">
                  	<c:if test="${not empty salaries }">
                    <table id="tenants"
                      class="table table-bordered display text-nowrap">
                      <thead>
                        <!-- start row -->
                        <tr>
                          <th>#</th>
                          <th>Name</th>
                          <th>Employ ID</th>
                          <th>Salary</th>
                          <th>Salary Month</th>
                          <th>Paid Date</th>
                          <th>Payment ID</th>
                        </tr>
                        <!-- end row -->
                      </thead>
                      <tbody>
                        <!-- start row -->
                        <c:forEach items="${salaries}" var="salary" varStatus="sno">
                        <tr>
                        	<td>${sno.index+1}</td>
                          <%-- <td>
                          	<span id="empName${salary.id }"></span>
                          	<button id="btn${salary.id}" class="buttonJoin"
								onclick="getEmpName${salary.id}()" style="display: none;">
							</button>
							<script>
						        function getEmpName${salary.id}(){
						        	$('document').ready(function() {
						        		$.ajax({
						    				type : "GET",
						    				url : "${pageContext.request.contextPath}/ops/getEmployName/${salary.employ_id}",
						    				//contentType: "application/json; charset=utf-8",
						    	            //dataType: "json",
						    				timeout : 100000,
						    				beforeSend:function(){
						    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
						    				},
						    				success : function(data) {
						    					console.log("SUCCESS: ", data);
						    					if(data) {
							    					$("#empName${salary.id }").html(data);
							    					//location.reload();
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
                          </td> --%>
                          <td>${salary.payment_status }</td>
                          <td>${salary.employ_id }</td>
						  <td>${salary.amount_paid }</td>
						  <td>${salary.salary_month }</td>
						  <td>${salary.payemnt_date }</td>
						  <td>${salary.paymentId }</td>
                        </tr>
                        </c:forEach>
                        <!-- end row -->
                      </tbody>
                      
                    </table>
                    </c:if>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 d-flex align-items-stretch">
				<div class="card w-100">
					<div class="d-flex border-bottom title-part-padding
                    	align-items-center">
						<div>
							<h4 class="card-title mb-0">Links</h4>
						</div>
					</div>
					<div class="card-body">
						<h4 class="card-title mt-3">Employees</h4>
						<div class="row gap-2">
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/ops/employees/list"
									class="btn d-flex align-items-center
                          				btn-light-info w-100 d-block text-info font-weight-medium">
									Employ List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
								</a>
							</div>
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/ops/employees/add"
									class="btn d-flex align-items-center
			                          btn-light-success w-100 d-block
			                          text-success font-weight-medium">
									Add Employ <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
								</a>
							</div>
							<c:if test="${OpsUser.access_level eq 1 }">
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/ops/employees/payment-list"
									class="btn d-flex align-items-center
                          				btn-light-warning w-100 d-block text-warning font-weight-medium">
									Payment List <span class="badge ms-auto bg-warning"><i class="fa fa-list"></i></span>
								</a>
							</div>
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/ops/employees/salary-list"
									class="btn d-flex align-items-center
                          				btn-light-primary w-100 d-block text-primary font-weight-medium">
									Salary List <span class="badge ms-auto bg-primary"><i class="fa fa-list"></i></span>
								</a>
							</div>
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
    <script src="<%=request.getContextPath() %>/new/assets/libs/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/datatable/custom-datatable.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/datatable/datatable-advanced.init.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
   <script>
	$('document').ready(function(){
		$('#tenants').DataTable({
			sorting: false,
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
	                '&#8377;'+pageTotal +' ( &#8377;'+ total +' total)'
	            );
	        }
	    } );
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
