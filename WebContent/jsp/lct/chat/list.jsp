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
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Chat List | Ozai</title>
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
            <%-- <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/admin">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Events
                    </li>
                  </ol>
                </nav>
              </div>
            </div> --%>
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid note-has-grid">
			<div class="row">
                <div class="col-12 px-0">
                    <c:choose>
                    	<c:when test="${not empty messages }">
                    		<div class="list-group list-group-flush rounded-0 bg-none">
                    			<c:forEach items="${messages }" var="message">		                    				
                                 			<a href="<%=request.getContextPath() %>/lct/chat/messages/${type}/${message.user_id }" class="list-group-item">
			                            <div class="card alert">
											<div class="row">
				                                <div class="col-2 ">
				                                    <div class="avatar avatar-50 text-center rounded-15 p-1 bg-white">
				                                    	<img src="https://www.ozailiving.com/profile-user/image/${message.details.user_id }"
															onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"  
															alt="" style="width: 50px;" class="rounded-12">
				                                    </div>
				                                </div>
				                                <div class="col-10 mt-2">
				                                	<p class="mb-0">${message.details.user.name } 
				                                	<span class="size-12 text-muted" style="float: right;"><fmt:formatDate value="${message.message_time }" pattern="dd MMM, yyyy"/>, 
				                                		<fmt:formatDate value="${message.message_time }" pattern="hh:mm a"/></span></p>
				                                    <p class="text-secondary"><i class="bi bi-check-all text-primary"></i> ${message.message }</p>
				                                </div>
			                            	</div>
			                            </div>
			                        </a>
                    			</c:forEach>
                    		</div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="list-group list-group-flush rounded-0 bg-none">
	                    		No messages
			                </div>
                    	</c:otherwise>
                    </c:choose>
                </div>
          	</div>
		</div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Ozai Living Private Limited.
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
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/notes/notes.js"></script>
	<c:forEach items="${users }" var="user">
		<script>
			$('document').ready(function() {
				$('#message-div${user.id }').html("<div class=\"text-center\"><i class=\"fa fa-spinner w3-spin\" style=\"color: #f73563; \"></i></div>");
			});
			$('document').ready(function() {
				setInterval(function () {getLatestMessage${user.id}()}, 1000);
	 		});
		 	function getLatestMessage${user.id}(){
		 		
	       		$.ajax({
	   				type : "GET",
	   				//url : "${pageContext.request.contextPath}/admin/getMessages/"+type+"/"+user_id+"",
	   				timeout : 100000,
	   				beforeSend:function(){
	   					//$('#message-div${user.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
	   				},
	   				success : function(data) {
	   					console.log("SUCCESS: ", data);
	   					$('#message-div${user.id }').empty();
	    				$('#message-div${user.id }').html(data);										    					
	   				},
	   				error : function(e) {
	   					$('#message-div${user.id }').empty();
	   					console.log("ERROR: ", e);	
	   				},
	   				done : function(e) {
	   					console.log("DONE");
	   					$('#loading').remove();										    					
	   				}
	   			});
		 	}
		</script>
	</c:forEach>
</body>

</html>