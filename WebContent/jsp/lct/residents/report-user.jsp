<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Report Resident |  Ozai</title>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  <style>
  	.chooseFrom {
      opacity: 0.5;
  	}
  	.chooseFrom1 {
      opacity: 0.5;
  	}
	.checkedClass {
      opacity: 1;
      height: 150px;
      width: 150px;
	}
	/* .checkedClass img {
      height: 150px;
      width: 150px;
	} */
	.checkedClass1 {
      opacity: 1;
      height: 150px;
      width: 150px;
	}
    [type=radio] {
	  position: absolute;
	  opacity: 0;
	}
	.seat {
	  display: flex;
	  flex: 0 0 14.28571428571429%;
	  position: relative;  
	  &:nth-child(3) {
	    margin-right: 14.28571428571429%;
	  }
	  input[type=checkbox] {
	    position: absolute;
	    opacity: 0;
	  }
	  input[type=checkbox]:checked {
	    + label {
	      background: #bada55;      
	      -webkit-animation-name: rubberBand;
	          animation-name: rubberBand;
	      animation-duration: 300ms;
	      animation-fill-mode: both;
	    }
	  }
	  input[type=checkbox]:disabled {
	    + label {
	      background: #dddddd;
	      text-indent: -9999px;
	      overflow: hidden;
	      &:after {
	        content: "X";
	        text-indent: 0;
	        position: absolute;
	        top: 4px;
	        left: 50%;
	        transform: translate(-50%, 0%);
	      }
	      &:hover {
	        box-shadow: none;
	        cursor: not-allowed;
	      }
	    }
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
            <div class="col-5 align-self-center">
              <h4 class="page-title"></h4>
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
          <!-- Row -->
       		<div class="row">
				<div class="card">
	                <div class="card-body">
	                	<div class="card-header" style="border-radius: 30px;">
		                  	<h4 class="card-title text-center" style="font-weight: 900;">
		                    	Monthly review
		                  	</h4>
		                </div>
	                	<div class="row">
	                		<c:choose>
								<c:when test="${exist eq true }">
									<br>
									Already submitted for this month. i.e, ${month }
								</c:when>
								<c:otherwise>
					                <form action="#" id="report-form" method="post">
					                	<div class="row">
					                		<p>&nbsp;</p>
							            	<h5 style="font-weight: 900; color: #000;">Keeps room and common areas clean ?</h5>
							            	<div class="col-sm-12 row controls text-center">
									  			<fieldset class="col-6">
								                	<div class="seat form-check chooseFrom">
								                    	<input type="radio" value="1" name="cleanliness" required
								                              id="styled_radio_inline1" class="form-check-input" />
								                        <label class="form-check-label" for="styled_radio_inline1">
								                        	<img src="<%=request.getContextPath() %>/assets/images/thumbsup.png" 
								                        		style="width: 120px;"/>
								                        </label>
								                    </div>
								            	</fieldset>
								            	<fieldset class="col-6">
							                        <div class="seat form-check chooseFrom">
								                    	<input type="radio" value="0" name="cleanliness" required
								                              id="styled_radio_inline2" class="form-check-input" />
								                        <label class="form-check-label" for="styled_radio_inline2">
								                        	<img src="<%=request.getContextPath() %>/assets/images/thumbsdown.png" 
								                        		style="width: 120px;"/>
								                        </label>
								                    </div>
								         		</fieldset>
						                   	</div>
						                </div>
						                <div class="mb-3 row">
						                	<p>&nbsp;</p>
							            	<h5 style="font-weight: 900; color: #000;">Behaves well with staff and other residents ?</h5>
							            	<div class="col-sm-12 row controls text-center">
									  			<fieldset class="col-6">
								                	<div class="seat form-check chooseFrom1">
								                    	<input type="radio" value="1" name="behavior" required
								                              id="styled_radio_inline3" class="form-check-input" />
								                        <label class="form-check-label" for="styled_radio_inline3">
								                        	<img src="<%=request.getContextPath() %>/assets/images/thumbsup.png" 
								                        		style="width: 120px;"/>
								                        </label>
								                    </div>
								            	</fieldset>
								            	<fieldset class="col-6">
							                        <div class="seat form-check chooseFrom1">
								                    	<input type="radio" value="0" name="behavior" required
								                              id="styled_radio_inline4" class="form-check-input" />
								                        <label class="form-check-label" for="styled_radio_inline4">
								                        	<img src="<%=request.getContextPath() %>/assets/images/thumbsdown.png" 
								                        		style="width: 120px;"/>
								                        </label>
								                    </div>
								         		</fieldset>
						                   	</div>
						                </div>
										<input type="hidden" class="form-control" name="report_month" 
											value="${month }" />
										<input type="hidden" name="user_id" id="user_id" value="${details.id }" />
										<input type="hidden" name="client_code" id="client_code" value="${ClientUser.client_code }" />
				                    	<p>&nbsp;</p>
				                    	<div class="text-center">
				                    		<button type="submit" style="background: #2d74bc; border: #2d74bc;" class="btn btn-primary btn-lg
				                            	rounded-pill btn-wide">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SUBMIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                        	</button>
				                        </div>
					                </form>
								</c:otherwise>
							</c:choose>
							<h4 style="font-weight: 800;">You can rate only once every month.</h4>
	               		</div>
            		</div>
            	</div>
            	<div class="card">
            		<div class="card-body">
            			<h4>${details.name }'s track record</h4>
            			<div class="row">
            				<div class="col-4">
            					
            				</div>
            				<div class="col-4">
            					<h6 style="font-weight: 900;">Cleanliness</h6>
            				</div>
            				<div class="col-4">
            					<h6 style="font-weight: 900;">Behavior</h6>
            				</div>
            			</div>
            			<c:forEach items="${reports }" var="report">
            				<div class="row">
	            				<div class="col-4">
	            					<br><br>
	            					<h4><fmt:formatDate value="${report.report_date }" pattern="MMM, yyyy"/></h4>
	            				</div>
	            				<div class="col-4">
	            					<c:choose>
	            						<c:when test="${report.cleanliness eq 1 }">
	            							<img src="<%=request.getContextPath() %>/assets/images/thumbsup.png"
	            								style="width: 100px;" />
	            						</c:when>
	            						<c:otherwise>
	            							<img src="<%=request.getContextPath() %>/assets/images/thumbsdown.png"
	            								style="width: 100px;" />	            						
	            						</c:otherwise>
	            					</c:choose>
	            				</div>
	            				<div class="col-4">
	            					<c:choose>
	            						<c:when test="${report.behavior eq 1 }">
	            							<img src="<%=request.getContextPath() %>/assets/images/thumbsup.png"
	            								style="width: 100px;" />
	            						</c:when>
	            						<c:otherwise>
	            							<img src="<%=request.getContextPath() %>/assets/images/thumbsdown.png"
	            								style="width: 100px;" />	            						
	            						</c:otherwise>
	            					</c:choose>
	            				</div>
	            			</div>
            			</c:forEach>
            		</div>
            	</div>
         	</div>
      	</div>
          <!-- End Row -->
          <!-- Row -->
          
          <!-- End Row -->
          <!-- -------------------------------------------------------------- -->
          <!-- End PAge Content -->
          <!-- -------------------------------------------------------------- -->
        </div>
        <button type="button" class="btn btn-light-success
        	text-success font-weight-medium
            btn-lg px-4 fs-4 font-weight-medium" style="display: none;"
            data-bs-toggle="modal" id="onSuccess" 
            data-bs-target="#al-success-alert">
           	Success Alert
         </button>
         
        <div
            class="modal fade"
            id="al-success-alert"
            tabindex="-1"
            aria-labelledby="vertical-center-modal"
            aria-hidden="true"
          >
            <div class="modal-dialog modal-sm">
              <div style="background: #fff; color: #000 !important;"
                class="
                  modal-content modal-filled text-dark">
                <div class="modal-body p-4">
                  <div class="text-center text-success">
                    <i
                      data-feather="check-circle"
                      class="fill-white feather-lg"
                    ></i>
                    <h4 class="mt-2 text-success">Thank You!</h4>
                    <p class="mt-3 text-success-50">
                      Details have been submitted.
                    </p>
                    <button
                      type="button"
                      class="btn btn-dark my-2"
                      data-bs-dismiss="modal"
                    >
                      Close
                    </button>
                  </div>
                </div>
              </div>
              <!-- /.modal-content -->
            </div>
          </div>
          
          <button type="button" class="btn btn-light-warning text-warning
              font-weight-medium btn-lg
              px-4 fs-4 font-weight-medium" id="errorMsg"
              data-bs-toggle="modal" style="display: none;"
              data-bs-target="#al-warning-alert">
             Warning Alert
           </button>

           <!-- Vertically centered modal -->
           <div class="modal fade" id="al-warning-alert"
             tabindex="-1" aria-labelledby="vertical-center-modal"
             aria-hidden="true">
                      <div class="modal-dialog modal-sm">
                        <div
                          class="modal-content modal-filled bg-light-warning"
                        >
                          <div class="modal-body p-4">
                            <div class="text-center text-warning">
                              <i
                                data-feather="alert-octagon"
                                class="fill-white feather-lg"
                              ></i>
                              <h4 class="mt-2">Sorry</h4>
                              <p class="mt-3">
                                Submission failed, Please try again later.
                              </p>
                              <button
                                type="button"
                                class="btn btn-light my-2"
                                data-bs-dismiss="modal"
                              >
                                Close
                              </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
                    
                    <button
                      type="button"
                      class="
                        btn btn-light-danger
                        text-danger
                        font-weight-medium
                        btn-lg
                        px-4
                        fs-4
                        font-weight-medium" style="display: none;"
                      data-bs-toggle="modal" id="emptyMsg"
                      data-bs-target="#al-danger-alert"
                    >
                      Danger Alert
                    </button>

                    <!-- Vertically centered modal -->
                    <div
                      class="modal fade"
                      id="al-danger-alert"
                      tabindex="-1"
                      aria-labelledby="vertical-center-modal"
                      aria-hidden="true"
                    >
                      <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-light-danger">
                          <div class="modal-body p-4">
                            <div class="text-center text-danger">
                              <i
                                data-feather="x-octagon"
                                class="fill-white feather-lg"
                              ></i>
                              <h4 class="mt-2">Oh snap!</h4>
                              <p class="mt-3">
                                Please fill in all the fields to submit.
                              </p>
                              <button
                                type="button"
                                class="btn btn-light my-2"
                                data-bs-dismiss="modal"
                              >
                                Close
                              </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Nice admin.
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
      
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
    <c:if test="${success eq true }">
    	<script>
        	$('document').ready(function(){
        		$('#onSuccess').click();
        	});
        </script>
    </c:if>
    <c:if test="${success eq false }">
	     <script>
	     	$('document').ready(function(){
	     		$('#errorMsg').click();
	     	});
	     </script>
    </c:if>
    <script type="text/javascript">
	    $('document').ready(function() {
			$(".chooseFrom").click(function(event) {
				$(this).find('input').prop('checked', true)
			    $('.chooseFrom').not(this).removeClass("checkedClass");
			    $(this).addClass("checkedClass chooseFrom");
		  	});
			$(".chooseFrom1").click(function(event) {
				$(this).find('input').prop('checked', true)
			    $('.chooseFrom1').not(this).removeClass("checkedClass1");
			    $(this).addClass("checkedClass1 chooseFrom1");
		  	});
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
    <script>
	    $('document').ready(function() {
			$("#report-form").submit(function(event) {
				event.preventDefault();
				reportTenant();
			});
		});
		function reportTenant() {
			var formData = $("#report-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/reportUser",
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
						window.location.href = "${pageContext.request.contextPath}/lct/residents/report-user/"+${details.id }+"";
					} else if (data == 'failed') {
						$('#errorMsg').click();
					}
					$("#save").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
					$("#save").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#save").button('reset');

				}
			});
		}
	</script>
  </body>
</html>