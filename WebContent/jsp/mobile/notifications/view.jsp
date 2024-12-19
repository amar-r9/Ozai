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
                	
                  	<c:if test="${not empty ticket }">
						<div class="container-fluid">
							<div class="row justify-content-center">
								<div class="col-12 text-center p-0 mt-3 mb-2">
						            <div class="card px-0 pb-0 mt-3 mb-3">
						                <h3 id="heading">${ticket.title }</h3>
						                <form id="msform">
						                    <!-- progressbar -->
						                    <ul id="progressbar" style="padding-left: 0px;">
						                        <li class="active" id="account"><strong>Raised</strong></li>
						                        <li id="personal"><strong>Opened</strong></li>
						                        <li id="payment"><strong>Progress</strong></li>
						                        <li id="confirm"><strong>Finished</strong></li>
						                    </ul>
						                    <div class="progress">
						                    	<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
						                	</div>
						                    <br>
						                    <!-- fieldsets -->
						                    <div class="form-card border-bottom" id="finished" style="display: none;">
						                        	
					                            <h2 class="purple-text text-center"><strong>FINISHED !</strong></h2>
					                            <br>
					                            <div class="row justify-content-center">
					                                <div class="col-3">
					                                    <img src="https://i.imgur.com/GwStPmg.png" class="fit-image">
					                                </div>
					                            </div>
					                            <br><br>
					                            <div class="row justify-content-center">
					                                <div class="col-10 text-center">
					                                    <h5 class="text-success text-center">Your issue has been resolved.</h5>
					                                    <h6 class="purple-text text-center">Please contact us if you still facing the issue.</h6>
					                                </div>
					                            </div>
					                        </div><br>
						                    <fieldset>
						                        <div class="form-card">
						                        	<div class="row">
						                        		<div class="col-7">
						                            		<h6 class="text-primary">Details:</h6>
						                            	</div>
						                            </div>
						                            <div class="alert alert-primary text-primary" style="background: none;">
						                            	<c:choose>
						                            		<c:when test="${not empty ticket.summary }">
						                            			${ticket.summary }
						                            		</c:when>
						                            		<c:otherwise>
						                            			No description for this ticket.
						                            		</c:otherwise>
						                            	</c:choose>
						                            </div>
						                            <h6 class="text-success">Comments:</h6>
						                            <div class="alert alert-success text-success" style="background: none;">
						                            	<c:choose>
						                            		<c:when test="${not empty ticket.comments }">
								                            	${ticket.comments }
								                            </c:when>
								                            <c:otherwise>
							                            		There are no comments for this ticket.
								                            </c:otherwise>
								                      	</c:choose>
						                            </div>
						                            <h6 class="text-warning">Image:</h6>
					                            	<div class="alert alert-warning text-warning" style="background: none;">
						                            	<c:choose>
						                            		<c:when test="${not empty ticket.filename }">
								                            	<img src="<%=request.getContextPath() %>/uploaded_files/DOC/TICKET/${ticket.filename }" 
								                            		alt="ticket image" width="100%" />
						                            		</c:when>
						                            		<c:otherwise>
						                            			<h6>No image available</h6>
						                            		</c:otherwise>
						                            	</c:choose>
						                            </div>
						                        </div>
						                    </fieldset>    
						                    <fieldset>
						                        <div class="form-card">
						                        	<div class="row">
						                        		<div class="col-7">
						                            		<h2 class="fs-title">Finish:</h2>
						                            	</div>
						                            	<div class="col-5">
						                            		<h2 class="steps">Step 4 - 4</h2>
						                            	</div>
						                            </div>
						                            <br><br>
						                            <h2 class="purple-text text-center"><strong>SUCCESS !</strong></h2>
						                            <br>
						                            <div class="row justify-content-center">
						                                <div class="col-3">
						                                    <img src="https://i.imgur.com/GwStPmg.png" class="fit-image">
						                                </div>
						                            </div>
						                            <br><br>
						                            <div class="row justify-content-center">
						                                <div class="col-7 text-center">
						                                    <h5 class="purple-text text-center">You Have Successfully Signed Up</h5>
						                                </div>
						                            </div>
						                        </div>
						                    </fieldset>
						                </form>
						            </div>
						        </div>
							</div>
						</div>
					</c:if>
                </div>
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
          All Rights Reserved by Pradeenav Tikaana PVT LTD.
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
    		
    		$(document).ready(function(){
    		    
    			var current_fs, next_fs, previous_fs, final_fs; //fieldsets
    			var opacity;
    			<c:if test="${ticket.status eq 'Raised'}">
    				$('#account').addClass('active');
    				var current = 1;
    			</c:if>
    			<c:if test="${ticket.status eq 'Opened'}">
    				$('#personal').addClass('active');
    				var current = 2;
    			</c:if>
    			<c:if test="${ticket.status eq 'In Progress'}">
    				$('#personal').addClass('active');
    				$('#payment').addClass('active');
    				var current = 3;
    			</c:if>
    			<c:if test="${ticket.status eq 'Closed'}">
    				$('#personal').addClass('active');
    				$('#payment').addClass('active');
    				$('#confirm').addClass('active');
    				$('#finished').show();
    				var current = 4;
    				
    			</c:if>
    		
    			var steps = 4;

    			setProgressBar(current);

    			function setProgressBar(curStep){
    			    var percent = parseFloat(100 / steps) * curStep;
    			    percent = percent.toFixed();
    			    $(".progress-bar")
    			      .css("width",percent+"%") 
    			}
    		    
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
			url : "${pageContext.request.contextPath}/lct/tickets/add-comments",
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