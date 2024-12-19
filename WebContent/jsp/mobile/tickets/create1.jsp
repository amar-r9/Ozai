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
    <title>Ticket | Ozai</title>
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
    <!-- This page css -->
    <link
      href="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
      rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.file-upload {
  background-color: #ffffff;
  /*width: 600px;*/
  margin: 0 auto;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #15824B;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #1FB264;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #15824B;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 100%;
  max-width: 100%;
  margin: auto;
  border: 2px dashed #1FB264;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

.stepwizard-step p {
    margin-top: 10px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
body{ 
    margin-top:40px; 
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
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title text-center">CREATE TICKET</h4>
                  <div class="row mt-4">
                    <div class="">
						<c:if test="${not empty User }">							
							
							<div class="stepwizard">
							    <div class="stepwizard-row setup-panel">
							        <div class="stepwizard-step">
							            <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
							            <p>Step 1</p>
							        </div>
							        <div class="stepwizard-step">
							            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
							            <p>Step 2</p>
							        </div>
							        <div class="stepwizard-step">
							            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
							            <p>Step 3</p>
							        </div>
							    </div>
							</div>
							<form role="form">
							    <div class="row setup-content" id="step-1">
							        <div class="col-xs-12">
							            <div class="col-md-12">
							                <h3> Choose Category</h3>
							                <div class="form-group row">
							                	<div class="col-2">
								                    <input type="radio" required class="form-control" 
								                    	name="category" id="category1"  />
								                    	<label for="category1">
								                    		<img src="<%=request.getContextPath() %>/assets/img/Electrical.png" 
								                    			style="width: 44px; height: 44px;" />
								                    	</label>
								                  </div>
								                  <div class="col-2">							                    	
								                    <input type="radio" required class="form-control" 
								                    	name="category" id="category2"  />
								                    	<label for="category2">
								                    		<img src="<%=request.getContextPath() %>/assets/img/Plumbing.png" 
								                    		style="width: 44px; height: 44px;" />
								                    	</label>
								                   </div>
								                   <div class="col-2">							                    	
								                    	<input type="radio" required" class="form-control" 
								                    		name="category" id="category3"  />
								                    	<label for="category3">
								                    		<img src="<%=request.getContextPath() %>/assets/img/House Keeping.png" 
								                    		style="width: 44px; height: 44px;" />
								                    	</label>
							                    	</div>
							                    	<div class="col-2">
								                    	<input type="radio" required class="form-control" 
								                    		name="category" id="category4"  />
								                    	<label for="category4">
								                    		<img src="<%=request.getContextPath() %>/assets/img/Common Area.png" 
								                    		style="width: 44px; height: 44px;" />
								                    	</label>
								                    </div>
								                    <div class="col-2">							                    	
							                    		<input type="radio" required class="form-control" 
							                    			name="category" id="category5"  />
								                    	<label for="category5">
								                    		<img src="<%=request.getContextPath() %>/assets/img/Other.png" 
								                    		style="width: 44px; height: 44px;" />
								                    	</label>
								                    </div>
								                    
							                </div>
							                <div class="pull-right">
							                	<button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
							            	</div>
							            </div>
							        </div>
							    </div>
							    <div class="row setup-content" id="step-2">
							        <div class="col-xs-12">
							            <div class="col-md-12">
							                <h3> Describe the issue</h3>
							                <div class="form-group">
							                    <label class="control-label">Issue</label>
							                    <input maxlength="200" type="text" required class="form-control" name="title" id="title" />
							                </div>
							                <div class="form-group">
							                    <label class="control-label">Describe</label>
							                    <textarea required class="form-control"></textarea>
							                </div>
							                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
							            </div>
							        </div>
							    </div>
							    <div class="row setup-content" id="step-3">
							        <div class="col-xs-12">
							            <div class="col-md-12">
							                <h3> Upload an image</h3>
							                <div class="file-upload">
											  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>
											
											  <div class="image-upload-wrap">
											    <input class="file-upload-input" name="ticket_file" id="ticket_file" type='file' onchange="readURL(this);" accept="image/*" />
											    <div class="drag-text">
											     
											    </div>
											  </div>
											  <div class="file-upload-content">
											    <img class="file-upload-image" src="#" alt="your image" />
											    <div class="image-title-wrap">
											      <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded Image</span></button>
											    </div>
											  </div>
											</div>
							                <button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
							            </div>
							        </div>
							    </div>
							</form>
							
							
							
							
							<%-- <form action="<%=request.getContextPath()%>/mobile/save-ticket" method="post" 
								role="form" modelAttribute="ticket" 
								enctype="multipart/form-data" id="tickect-form" class="php-email-form">
								<div class="row">
									<div class="col-md-6">
                          				<div class="mb-3">
                          					<label>Title</label>
											 <input type="text" name="title" id="title" required
												class="form-control border border-dark" />
											<div class="validate"></div>
										</div>
									</div>
									<div class="col-md-6">
                          				<div class="mb-3">
                          					<label>Category</label>
											 <select name="category" id="category" required
												class="form-control form-control-lg custom-select border border-dark">
												<option value="">Select</option>
												<option value="Electrical">Electrical</option>
												<option value="Plumbing">Plumbing</option>
												<option value="House Keeping">House Keeping</option>
												<option value="Amenities">Amenities</option>
												<option value="Common Area">Common Area</option>
												<option value="Other">Other</option>
											</select>
											<div class="validate"></div>
										</div>
									</div>									
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<input type="hidden" name="user_id" id="user_id" value="${User.id }" />
										</div>
									</div>
									<div class="col-md-6">
                          				<div class="mb-3">
                          					<label>Describe</label>
											<textarea name="summary" class="form-control" id="summary"
												cols="45" rows="8"
												data-msg="Please write something(Optional)"
												placeholder="Description"></textarea>
											<div class="validate"></div>
										</div>
									</div>
									<input type="hidden" name="status" id="status" value="Raised" />
	                               <div class="file-upload">
									  <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add Image</button>
									
									  <div class="image-upload-wrap">
									    <input class="file-upload-input" name="ticket_file" id="ticket_file" type='file' onchange="readURL(this);" accept="image/*" />
									    <div class="drag-text">
									     
									    </div>
									  </div>
									  <div class="file-upload-content">
									    <img class="file-upload-image" src="#" alt="your image" />
									    <div class="image-title-wrap">
									      <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded Image</span></button>
									    </div>
									  </div>
									</div>
	                               
									<div class="form-actions">
				                      <div class="card-body border-top text-center">
				                        <button
				                          type="submit" id="send"
				                          class="btn btn-dark btn-lg rounded-pill px-4">
				                          <div class="d-flex align-items-center">
				                            <i data-feather="save"
				                              class="feather-sm me-1 fill-icon"
				                            ></i>
				                            Save
				                          </div>
				                        </button>
				                      </div>
				                    </div><br><br><br>
								</div>
							</form> --%><br><br><br>
						</c:if>
						<c:if test="${empty User }">
							<div class="col-md-12 text-center">
								<a href="<%=request.getContextPath() %>/mobile" class="btn btn-a" id="send">Login</a>
							</div>
						</c:if>
						<div class="col-md-12 mb-3"><br>
							<div class="col-md-4 col-xl-2 
								d-flex align-items-stretch" id="success-list" style="display: none !important;">
								<a href="<%=request.getContextPath() %>/mobile/user/tickets/list"
				                	class="card bg-success text-white w-100 card-hover">
									<div class="card-body">
										<div class="d-flex align-items-center">
					                    	Ticket created.
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
    <script src="<%=request.getContextPath() %>/assets/ticket-category.js"></script>
	
	<script>
		$('document').ready(function () {
	
		    var navListItems = $('div.setup-panel div a'),
		            allWells = $('.setup-content'),
		            allNextBtn = $('.nextBtn');
	
		    allWells.hide();
	
		    navListItems.click(function (e) {
		        e.preventDefault();
		        var $target = $($(this).attr('href')),
		                $item = $(this);
	
		        if (!$item.hasClass('disabled')) {
		            navListItems.removeClass('btn-primary').addClass('btn-default');
		            $item.addClass('btn-primary');
		            allWells.hide();
		            $target.show();
		            $target.find('input:eq(0)').focus();
		        }
		    });
	
		    allNextBtn.click(function(){
		        var curStep = $(this).closest(".setup-content"),
		            curStepBtn = curStep.attr("id"),
		            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
		            curInputs = curStep.find("input[type='text'],input[type='url']"),
		            isValid = true;
	
		        $(".form-group").removeClass("has-error");
		        for(var i=0; i<curInputs.length; i++){
		            if (!curInputs[i].validity.valid){
		                isValid = false;
		                $(curInputs[i]).closest(".form-group").addClass("has-error");
		            }
		        }
	
		        if (isValid)
		            nextStepWizard.removeAttr('disabled').trigger('click');
		    });
	
		    $('div.setup-panel div a.btn-primary').trigger('click');
		});
	</script>
	
	<script>
	
		function readURL(input) {
		  if (input.files && input.files[0]) {

		    var reader = new FileReader();

		    reader.onload = function(e) {
		      $('.image-upload-wrap').hide();

		      $('.file-upload-image').attr('src', e.target.result);
		      $('.file-upload-content').show();

		      $('.image-title').html(input.files[0].name);
		    };

		    reader.readAsDataURL(input.files[0]);

		  } else {
		    removeUpload();
		  }
		}

		function removeUpload() {
		  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
		  $('.file-upload-content').hide();
		  $('.image-upload-wrap').show();
		}
		$('.image-upload-wrap').bind('dragover', function () {
		        $('.image-upload-wrap').addClass('image-dropping');
		    });
		    $('.image-upload-wrap').bind('dragleave', function () {
		        $('.image-upload-wrap').removeClass('image-dropping');
		});
	
		$('document').ready(function(){
		
		populateCategories("category", "sub", "issue");
		populateSub("category", "sub","issue");
		//$('#country option:contains("India")').prop('selected',true);
		populateIssue("category", "issue");
		
		$("#success-alert").on("click", function () {
		    toastr.success(
		      "Your ticket has been created",
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
		/* $("#contact-form2").submit(function(event) {
			event.preventDefault();
			saveEnquiry();
		}); */
	});	
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