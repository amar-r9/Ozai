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
      content="Loan, Loan application, easy loan, tikaana" />
    <meta
      name="description"
      content="Please fill out the details below to apply."
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Schedule Visit | Ozai</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png" />
    <!-- This page css -->
    <link
      href="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
      rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.card{
    border-radius: 3vh;
    margin: auto;
    max-width: 380px;
    padding: 7vh 6vh;
    align-items: center;
    box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

@media(max-width:767px){
    .card{
        width: 90vw;
    }
}
.card-img{
    padding: 20px 0; 
    width: 40%;  
}

.card-img img{
    opacity: 0.7;
}
.card-title{
    margin-bottom: unset;
}
.card-title p{
    color: rgb(29, 226, 226);
    font-weight: 900;
    font-size: 30px;
    margin-bottom: unset;
}
.card-text p{
    color: grey;
    font-size: 25px;
    text-align: center;
    padding: 3vh 0;
    font-weight: lighter;
}
.btns{
    width: 100%;
    background-color: rgb(29, 226, 226);
    border-color: rgb(29, 226, 226);
    border-radius: 25px;
    color: white;
    font-size: 20px;
}
.btns:focus{
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    -webkit-user-select: none;
    transition: none; 
}
.btns:hover{
    color: white;
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
      
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      
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
          <div class="card" style="display: none;" id="successScreen">
			<div class="card-img">
				<img class ="img-fluid" src="<%=request.getContextPath() %>/assets/img/success.gif">
			</div>
			<div class="card-title text-center">
				<p>YOUR VISIT IS SCHEDULED.</p>
			</div>
			<div class="card-text">
				<p>You can visit directly on scheduled time.</p>
			</div>
			<button class="btns">Thank you.</button>
		  </div>
          <c:choose>
			<c:when test="${exist eq true }">
				<div class="card">
					<div class="card-img">
						<img class ="img-fluid" src="<%=request.getContextPath() %>/assets/img/done.gif">
					</div>
					<div class="card-title text-center">
						<p>YOUR VISIT IS ALREADY SCHEDULED.</p>
					</div>
					<div class="card-text">
						<p>You can visit directly on scheduled time.</p>
					</div>
					<button class="btns">Thank you.</button>
				</div>
			</c:when>
			<c:otherwise>
	          <div class="row" id="formScreen">
	            <div class="col-12">
	              <div class="card" style="padding: 5vh 2vh; width: 100%;">
	                <div class="card-body" style="padding: 0;">
	                	
	                  <div class="row mt-4">
                    	<c:if test="${empty User }">
	                    	<div class=" d-flex align-items-stretch">
	                    		<div class="row alert alert-warning">
	                    			<h3>You can schedule only after signing in.</h3>
	                    			<h5>Please login and come back.</h5>
	                    		</div>
                    		</div>
	                    		<div class="col-md-12 mb-3"><br>
									<div class="col-md-4 col-xl-2 
										d-flex align-items-stretch">
										<a href="<%=request.getContextPath() %>/mobile/signin?next=/mobile/schedule-visit/${propertyDetails.id}" class="card bg-success text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">Signin
													<div class="ms-auto">
							                      		<i data-feather="arrow-right" class="fill-white"></i>
							                    	</div>
							                	</div>
							                </div>
							            </a>
									</div>
								</div>
	                    	</c:if>
							<c:if test="${not empty User }">
	                    		<h4 class="card-title">Schedule your visit</h4>
								<small>Please fill out the details below to apply.</small>
								<br>								
		                    	<div class=" d-flex align-items-stretch">
									<form action="#" method="post" role="form"
										id="visit-form" class="php-email-form">
										<div class="row">											
											<div class="col-md-6">
		                          				<div class="mb-3">
		                          					<label>Name</label>
													<input type="text" name="name" id="name" required
														class="form-control form-control-lg form-control-a"
														placeholder="Name" data-rule="minlen:4"
														data-msg="Please enter your least 4 chars">
													<div class="validate"></div>
												</div>
											</div>
											<div class="col-md-6">
		                          				<div class="mb-3">
		                          					<label>Property</label>
													<input type="text" name="property" id="property" required
														class="form-control form-control-lg form-control-a"
														value="${propertyDetails.name }" readonly>
													<div class="validate"></div>
												</div>
											</div>
											<div class="col-md-6">
		                          				<div class="mb-3">
		                          					<label>Mobile</label>
													<input type="text" name="mobile" id="mobile" required
														class="form-control form-control-lg form-control-a"
														placeholder="Mobile" minlength="10" maxlength="10"
														data-msg="Please enter 10 digits">
													<div class="validate"></div>
												</div>
											</div>
											<div class="col-md-6">
		                          				<div class="mb-3">
		                          					<label>Schedule Date</label>
													<input type="date" name="schedule_date" id="schedule_date" required
														class="form-control form-control-lg form-control-a">
													<div class="validate"></div>
												</div>
											</div>
											<div class="col-md-6">
		                          				<div class="mb-3">
		                          					<label>Schedule Time</label>
													<input type="time" name="schedule_time" id="schedule_time" required
														class="form-control form-control-lg form-control-a">
													<div class="validate"></div>
												</div>
											</div>
											<div class="col-md-6">
		                          				<div class="mb-3">
		                          					<label>Joining Date</label>
													<input type="date" name="joining_date" id="joining_date" required
														class="form-control form-control-lg form-control-a">
													<div class="validate"></div>
												</div>
											</div>
											<input type="hidden" name="user_id" id="user_id" value="${User.id }" />
											
											<div class="form-actions text-center">
						                      <div class="card-body border-top">
						                        <button
						                          type="submit" id="send"
						                          class="btn btn-dark btn-lg" style="border-radius: 0px;">
						                            <i
						                              class="fa fa-calendar-alt"></i>&nbsp;
						                            Schedule
						                        </button>
						                        <div class="loading text-center" style="color: GREEN; display: none;">
						                        	<h4>
						                        		<i class="fas fa-spinner fa-3x w3-spin"></i></h4>
						                        </div>
						                      </div>
						                    </div>
											<!-- <div class="col-md-6 mb-3">
												<div class="form-group">
													<div class="position-relative form-group">
														<label for="exampleFile" class="">Select Your Video Attachment</label>
														<input name="talent_file" id="talent_file" type="file" class="form-control-file" onchange="readURL(this)" />
				                                        <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
				                                    </div>
				                           		</div>
			                               </div> -->
										</div>
									</form>
								</div>
								<div class="col-md-12 mb-3"><br>
									<div class="col-md-4 col-xl-2 
										d-flex align-items-stretch" id="success-list" style="display: none !important;">
										<a href="#"
						                	class="card bg-success text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">
							                    	Submitted successfully.
							                    <div class="ms-auto">
							                      <i data-feather="arrow-right" class="fill-white"></i>
							                    </div>
							                  </div>
											</div>
										</a>
									</div>
									<button type="button" class=" btn btn-lg px-4
				                        fs-4 btn-light-primary text-primary font-weight-medium"
				                      id="success-alert" style="display: none;">
				                      slideDown - slideUp
				                    </button>
				                    <button type="button" class=" btn btn-lg px-4
				                        fs-4 btn-light-primary text-primary font-weight-medium"
				                      id="empty-alert" style="display: none;">
				                      slideDown - slideUp
				                    </button>
				                    <button type="button" class=" btn btn-lg px-4
				                        fs-4 btn-light-primary text-primary font-weight-medium"
				                      id="error-alert" style="display: none;">
				                      slideDown - slideUp
				                    </button>
								</div>
							</c:if>
							
						</div>
					</div>
	              </div>
	            </div>
	          </div>
	         </c:otherwise>
	        </c:choose>
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        
        <!-- footer -->
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
    <!--This page JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/notes/notes.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/toastr-init.js"></script>
	<script>
	$('document').ready(function(){
		$("#success-alert").on("click", function () {
		    toastr.success(
		      "Message sent",
		      { showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
		    );
		  });
		$("#error-alert").on("click", function () {
		    toastr.error(
		      "Error, Please try again later.",
		      { showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
		    );
		  });
		$("#empty-alert").on("click", function () {
		    toastr.warning(
		      "Please fill in all the details.",
		      { showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
		    );
		  });
		$("#visit-form").submit(function(event) {
			event.preventDefault();
			saveEnquiry();
		});
	});	
	function saveEnquiry(){
		var formData=$("#visit-form").serialize();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/scheduleVisit",
			data : formData,
			//contentType: "text/json; charset=utf-8",
            //dataType: "json",
			timeout : 100000,
			beforeSend:function(){
				$(".loading").show();
				$("#send").hide();
			},
			success : function(data) {
				
				console.log("SUCCESS: ", data);
				
				if(data=='success'){
					$('#successScreen').show();
					$('#formScreen').hide();
				}else
				if(data=='error'){
					$('#error-alert').click();
				} else if(data=='empty'){
					$('#empty-alert').click();
				} 
				$("#send").button('reset');
			},
			error : function(e) {
				console.log("ERROR: ", e);
				bootbox.alert(e);
				$("#send").button('reset');
			},
			done : function(e) {
				console.log("DONE");
				$("#send").button('reset');
				
			}
		});
	}
	</script>
	<script>
    	$('document').ready(function(){
    		//$('.sidebartoggler').toggle();
    	});
      $(function () {
        "use strict";
        $("#main-wrapper").AdminSettings({
          LogoBg: "skin6",
		  HeaderPosition: true,
		  Theme: false,
        });
      });
    </script>
</body>

</html>