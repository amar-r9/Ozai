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
      content="Tikaana Admin Dashboard"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Ozai Admin Dashboard</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
     <link
      href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
      rel="stylesheet"/>
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet" />
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
body {
	font-family: math;
}
.row {
	--bs-gutter-x: 0rem;
}
p {
	color: grey;
}

#heading {
	text-transform: uppercase;
	color: #673AB7;
	font-weight: normal;
}

#msform {
    text-align: center;
    position: relative;
    margin-top: 20px;
}

#msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 100%;
    margin: 0;
    padding-bottom: 20px;

    /*stacking fieldsets above each other*/
    position: relative;
}

.form-card {
	text-align: left;
}

/*Hide all except first fieldset*/
#msform fieldset:not(:first-of-type) {
    display: none;
}

#msform input, #msform textarea {
    padding: 8px 15px 8px 15px;
    border: 1px solid #ccc;
    border-radius: 0px;
    margin-bottom: 25px;
    margin-top: 2px;
    width: 100%;
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
    background-color: #ECEFF1;
    font-size: 16px;
    letter-spacing: 1px;
}

#msform input:focus, #msform textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #673AB7;
    outline-width: 0;
}

/*Next Buttons*/
#msform .action-button {
    width: 100px;
    background: #673AB7;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 0px 10px 5px;
    float: right;
}

#msform .action-button:hover, #msform .action-button:focus {
    background-color: #311B92;
}

/*Previous Buttons*/
#msform .action-button-previous {
    width: 100px;
    background: #616161;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0px;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px 10px 0px;
    float: right;
}

#msform .action-button-previous:hover, #msform .action-button-previous:focus {
    background-color: #000000;
}

/*The background card*/
.card {
    z-index: 0;
    border: none;
    position: relative;
}

/*FieldSet headings*/
.fs-title {
    font-size: 25px;
    color: #673AB7;
    margin-bottom: 15px;
    font-weight: normal;
    text-align: left;
}

.purple-text {
	color: #673AB7;
    font-weight: normal;
}

/*Step Count*/
.steps {
	font-size: 25px;
    color: gray;
    margin-bottom: 10px;
    font-weight: normal;
    text-align: right;
}

/*Field names*/
.fieldlabels {
	color: gray;
	text-align: left;
}

/*Icon progressbar*/
#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: lightgrey;
}

#progressbar .active {
    color: #673AB7;
}

#progressbar li {
    list-style-type: none;
    font-size: 12px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400;
}

/*Icons in the ProgressBar*/
#progressbar #account:before {
    font-family: FontAwesome;
    content: "\f040";
}

#progressbar #personal:before {
    font-family: FontAwesome;
    content: "\f06e";
}

#progressbar #payment:before {
    font-family: FontAwesome;
    content: "\f085";
}

#progressbar #confirm:before {
    font-family: FontAwesome;
    content: "\f00c";
}

/*Icon ProgressBar before any progress*/
#progressbar li:before {
    width: 30px; /*changed from 50 to 30*/
    height: 30px; /*changed from 50 to 30*/
    line-height: 25px; /*changed from 45 to 25*/
    display: block;
    font-size: 15px;
    color: #ffffff;
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px;
}

/*ProgressBar connectors*/
#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 15px;   /*changed from 25 to 15*/
    z-index: -1;
}

/*Color number of the step and the connector before it*/
#progressbar li.active:before, #progressbar li.active:after {
    background: #673AB7;
}

/*Animated Progress Bar*/
.progress {
	height: 20px;
}

.progress-bar {
	background-color: #673AB7;
}

/*Fit image in bootstrap div*/
.fit-image{
    width: 100%;
    object-fit: cover;
}
.progress-bar-animated {
	animation: 1s linear infinite progress-bar-stripes;
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
            <div class="col-12 align-self-center">
              <h4 class="page-title">#${ticket.id } - ${ticket.category }</h4>
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
          <!-- basic table -->
          <div class="row">
            <div class="col-9 col-md-9 col-sm-12 col-12">
              <div class="card">
                <div class="card-body">
                	
                	<div class="d-flex btn-group">
						<select id="status${ticket.id }"
							name="status" class="btn btn-outline-dark">
							<option value="">${ticket.status }</option>
                           	<option value="Opened">Opened</option>
                           	<option value="In Progress">In Progress</option>
                           	<option value="Closed">Solved</option>
						</select>
						<input type="submit" class="btn btn-dark"
							value="SAVE" onclick="updateTicket${ticket.id}()">
					</div>
					<script>
				        function updateTicket${ticket.id}(){
				        	$('document').ready(function() {
				        		
				        		$.ajax({
				    				type : "GET",
				    				url : "${pageContext.request.contextPath}/lct/tickets/update-status/${ticket.id}/"+$('#status${ticket.id}').val()+"",
				    				//contentType: "application/json; charset=utf-8",
				    	            //dataType: "json",
				    				timeout : 100000,
				    				beforeSend:function(){
				    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
				    				},
				    				success : function(data) {
				    					console.log("SUCCESS: ", data);
				    					if(data=="Paid") {
				    						$("#failMsg").hide();
					    					$("#successMsg").show();
					    					location.reload();
				    					} else {
				    						$("#failMsg").show();
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
					
					</div></div>
                	
                  	<c:if test="${not empty ticket }">
						<div class="row">
							<div class="card" style="border-radius: 20px;">
								<div class="card-body">
									<div class="row">
										<div class="col-8">
											<p style="font-weight: 700; color: #000;">
												${ticket.title }
											</p>
										</div>
										<div class="col-4">
											<span class="pull-right">
												<label class="btn btn-warning text-white btn-sm btn-rounded">&nbsp; Raised &nbsp;</label>
											</span>
										</div>
									</div>
									<p>${ticket.user.name } | 
										<fmt:formatDate value="${ticket.raised_date }" pattern="hh:mm a"/>, 
										<fmt:formatDate value="${ticket.raised_date }" pattern="dd MMM, yyyy"/></p>
									<div class="row">
										<div class="col-6">
											<p style="font-weight: 800; color: #000;">Room : ${ticket.bdetails.room }</p>
										</div>
										<div class="col-6">
											<p style="font-weight: 800; color: #000;">Camp : ${ticket.bdetails.property.name }</p>														
										</div>
									</div>
									<p>${ticket.summary }</p>
									<c:if test="${not empty ticket.filename }">
										<img src="https://ozailiving.com/uploaded_files/DOC/TICKETS/${ticket.filename }" 
											alt="ticket image" style="width: 100%;" />
									</c:if>
								</div>
							</div>
							
							
							<div class="card" style="border-radius: 20px;">
								<div class="card-body">
									<c:if test="${not empty ticket.progress_by }">
										<div class="row">
											<div class="col-8">
												<p style="font-weight: 700; color: #000;">
													${ticket.progress_by }
												</p>
											</div>
											<div class="col-4">
												<span class="pull-right">
													<label class="btn btn-success text-white btn-wide btn-sm btn-rounded">&nbsp; In Progress &nbsp;</label>
												</span>
											</div>
										</div>
										<p>
											<fmt:formatDate value="${ticket.progress_on }" pattern="hh:mm a"/>, 
											<fmt:formatDate value="${ticket.progress_on }" pattern="dd MMM, yyyy"/></p>
										
										<p>${ticket.comments }</p>												
									</c:if>
									<c:if test="${not empty ticket.closed_by }">
										<div class="row" style="border-top: 2px solid #000;">
											<p>&nbsp;</p>
											<div class="col-8">
												<p style="font-weight: 700; color: #000;">
													${ticket.closed_by }
												</p>
											</div>
											<div class="col-4">
												<span class="pull-right">
													<label class="btn btn-info text-white btn-wide btn-sm btn-rounded">&nbsp; Closed &nbsp;</label>
												</span>
											</div>
										</div>
										<p><fmt:formatDate value="${ticket.closed_on }" pattern="hh:mm a"/>, 
											<fmt:formatDate value="${ticket.closed_on }" pattern="dd MMM, yyyy"/></p>
										
										<p>Issue solved.</p>
										<div style="font-weight: 800; color: #000;">
											<span>Time taken to close the ticket</span>
											<p>${timeTaken }</p></div>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
              </div>
            </div>
            <div class="col-lg-3">
            	<div class="row">
	            	<div class="alert alert-success" id="successMsg" style="display: none;">
	                  	<i class="fa fa-check-circle text-white"></i>&nbsp;Updated successfully.</div>
	                <div class="alert alert-danger" id="failMsg" style="display: none;">
	                  	<i class="fas fa-exclamation-triangle text-white"></i>&nbsp;Updating failed, Try again.</div>
				</div>
				<div class="card w-100">
					<div
						class="d-flex border-bottom title-part-padding
                   			align-items-center">
						<div>
							<h4 class="card-title mb-0">UPDATE</h4>
						</div>
					</div>
					<div class="card-body">
						<!-- <h5 class="card-title">STATUS</h5> -->
						<%-- <div class="row">
                           	<div class="col-md-9">
                           		<select name="status" id="status${ticket.id }" class="form-control">
	                            	<option value="">Select</option>
	                            	<option value="Opened">Opened</option>
	                            	<option value="In Progress">In Progress</option>
	                            	<option value="Solved">Solved</option>
	                            </select>
	                         </div>
                            <div class="col-md-3">
                            	<button class="btn btn-info" onclick="getRentDue${ticket.id}()">
                            		<i class="fa fa-save"></i>
                            	</button>
                            </div>
	                            
	                        <script>
								//int totalDue=0;
						        function getRentDue${ticket.id}(){
						        	$('document').ready(function() {
							        		
							        		$.ajax({
							    				type : "GET",
							    				url : "${pageContext.request.contextPath}/admin/tickets/update-status/${ticket.id}/"+$('#status${ticket.id}').val()+"",
							    				//contentType: "application/json; charset=utf-8",
							    	            //dataType: "json",
							    				timeout : 100000,
							    				beforeSend:function(){
							    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
							    				},
							    				success : function(data) {
							    					console.log("SUCCESS: ", data);
							    					if(data=="Paid") {
							    						$("#failMsg").hide();
								    					$("#successMsg").show();
								    					location.reload();
							    					} else {
							    						$("#failMsg").show();
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
                            </div> --%><br><br>
                            <h5 class="card-title">COMMENTS</h5>
							<div class="row gap-2">
                            	<form action="#" method="get" role="form"
									id="user-form">
				                  	<div class="row">
				                        <div class="col-md-12 col-12">
				                          <div class="mb-3">
											<textarea name="comments" id="comments" class="form-control">
												${ticket.comments }</textarea>
				                          </div>
				                        </div>
										<input type="hidden" name="id" id="id" value="${ticket.id }" />
									</div>
									<div class="form-actions">
				                      <div class="card-body">
										<button type="submit" id="send" style="width: 100%;"
											class="btn btn-primary">UPDATE</button>
									  </div>
									</div>
								</form>
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
        <footer class="footer text-center">
          All Rights Reserved by Ozai Living PVT LTD.
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
    		
    		$("#user-form").submit(function(event) {
				event.preventDefault();
				updateTenant();
			});
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
    <script>
    function updateTenant() {
		var formData = $("#user-form").serialize();
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/admin/tickets/add-comments",
			data : formData,
			//contentType: "text/json; charset=utf-8",
			//dataType: "json",
			timeout : 100000,
			beforeSend : function() {
				$(".loading").show();
			},
			success : function(data) {

				console.log("SUCCESS: ", data);

				if (data == 'success') {
					$('#onSuccess').click();
					location.reload();
					//window.location.href = '${pageContext.request.contextPath}/admin/roles/list';
				} else if (data == 'failed') {
					$('#errorMsg').click();
				} 
				$("#send").button('reset');
			},
			error : function(e) {
				console.log("ERROR: ", e);
				alert(e);
				$("#send").button('reset');
			},
			done : function(e) {
				console.log("DONE");
				$("#send").button('reset');

			}
		});
	}
    </script>
  </body>
</html>