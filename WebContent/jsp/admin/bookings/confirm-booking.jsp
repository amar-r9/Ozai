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
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Bookings | Admin | Ozai</title>
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
	.Available {
		border: 1px solid #1ea83c;
		color: #1ea83c;
	}
	.Occupied {
		border: 1px solid RED;
		color: RED;
		cursor: not-allowed;
		pointer-events: none;
	}
	.Notice {
		border: 1px solid #ffb63c;
		color: #ffb63c;
	}
	.chechedClass {
		border: 1px solid #515253;
		margin: 5px;
		/*border: 2px solid blueviolet;
   		background: blueviolet; */
	    background: #515253;
	    color: #FFF;
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
              <h4 class="page-title">Booking</h4>
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
            <div class="">
              <div class="card">
              	<div class="row">
              		<div class="col-md-9 col-9 col-sm-12 col-12">
		                <div class="card-header bg-info">
		                  <h4 class="card-title text-white">
		                    Confirm Booking
		                  </h4>
		                </div>
	                	<div class="row">
			                <form action="<%=request.getContextPath() %>/admin/confirmB2CBooking" id="booking-form"
			                	method="post" modelAttribute="booking"  enctype="multipart/form-data">
			                  <div class="">
			                    <div class="card-body">
			                      <!--/row-->
			                      <div class="row">
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Name</label>
			                            <div class="col-md-9">
			                              <input type="text" name="name" id="name" required
			                                class="form-control" value="${walkin.name }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Mobile</label>
			                            <div class="col-md-9">
			                              <input type="text" name="mobile" id="mobile" required
			                                class="form-control" value="${walkin.mobile }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Room</label>
			                            <div class="col-md-9">
			                              <input type="text" name="room_id" id="room_id" required
			                                class="form-control" value="${walkin.room.id }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Property</label>
			                            <div class="col-md-9">
			                              <input type="text" name="property_id" id="property_id" required
			                                class="form-control" value="${walkin.property.id }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Sharing</label>
			                            <div class="col-md-9">
			                              <input type="text" name="sharing" id="sharing" required
			                                class="form-control" value="${walkin.sharing }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Rent</label>
			                            <div class="col-md-9">
			                              <input type="text" name="rent" id="rent" required
			                                class="form-control" value="${walkin.rent }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label 
			                            	col-md-3">Booking Amount</label>
			                            <div class="col-md-9">
			                              <input type="text" name="booking_amount" id="booking_amount"
			                                class="form-control" required />
			                            </div>
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-12">
			                          <div class="mb-3 row">
			                            <label class="control-label col-md-3">Joining Date</label>
			                            <div class="col-md-9">
			                              <input type="date" name="joining_date" id="joining_date"
			                              	required class="form-control" value="${walkin.joining_date }" />
			                            </div>
			                          </div>
			                        </div>
			                        <div class="col-md-12">
			                          	<div class="mb-3 row">
				                    		<div class="col-md-3"></div>
					                    	<div class="col-md-9 col-sm-12 row controls">
						                    	<c:forEach items="${beds }" var="bed">
						                          <fieldset class="col-xs-6 col-md-2 col-sm-6 col-6 col-2">
						                            <div class="seat form-check ${bed.status } chooseFrom" style="margin: 2px;">
						                              <input type="radio" value="${bed.id }" name="bed" required
						                              	id="styled_radio_inline1${bed.id }" class="form-check-input" />
						                              <label class="form-check-label" for="styled_radio_inline1">
						                              	<i class="fa fa-bed"></i><br>
						                              	${bed.bed_no }
						                              </label>
						                            </div>
					                              	<c:if test="${bed.status eq 'Notice' }">
					                              		<div class="text-center" style="color: #ffb63c;">
					                              			
					                              		</div>
					                              	</c:if>
						                          </fieldset>
						                          <%-- <fieldset class="col-xs-6 col-6 chooseFrom">
						                            <div class="form-check">
						                              <input type="radio" value="${match.team_b }" name="winner"
						                                id="styled_radio_inline2${match.id }" class="form-check-input" />
						                              <label class="form-check-label" for="styled_radio_inline2">
						                              	<img src="<%=request.getContextPath() %>/assets/images/ipl/${match.team_b }.png" 
						                              		style="width: 48px; height: 48px;" /> ${match.team_b }</label>
						                            </div>
						                          </fieldset> --%>
						                    	</c:forEach>
					                        </div>
				                   		</div>
					              	</div>
			                      </div>
			                      <!--/row-->
			                      <div class="row">
									<input type="hidden" name="walkin_id" id="walkin_id" value="${walkin.id }" />
			                      </div>
			                       <!--/span-->
			                    </div>
			                    
			                    <div class="p-3 border-top">
			                      <div class="text-end">
			                        <button
			                          type="submit" class="btn btn-info
			                            rounded-pill px-4 waves-effect waves-light">
			                          Save
			                        </button>
			                        
			                      </div>
			                    </div>
			                  </div>
			                </form>
	               		</div>
            		</div>
            	
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
              <div
                class="
                  modal-content modal-filled
                  bg-light-success
                  text-success
                "
              >
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
			    $('.chooseFrom').not(this).removeClass("chechedClass chooseFrom");
			    $(this).addClass("chechedClass chooseFrom");
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
  </body>
</html>
