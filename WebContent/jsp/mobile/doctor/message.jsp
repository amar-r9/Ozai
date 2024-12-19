<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Consult ${type} } | Ozai</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="MySuperBrain is an online platform that showcases the amazing talents in School Students. ">
<meta name="msapplication-tap-highlight" content="no">
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/assets/images/favicon.png" />
<!-- This page css -->
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.chatting-box, .chat-list, .chat-box, .chat {
	display: block !important;
}
</style>
</head>

<body>

	<!-- loader section -->

	<!-- loader section ends -->
	<!-- Begin page -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/backbutton.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->

		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper"
			style="background: #fff; margin-left: 0px !important;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- <div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="text-center">Messages</h4>
					</div>
				</div>
			</div> -->
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid p-0 m-0">
				<div class="card chatting-box mb-0">
					<div class="card-body">
						<div class="chat-meta-user pb-3 border-bottom">
							<div class="current-chat-user-name">
								<span> ${type } <span class="name fw-bold ms-2"></span>
								</span>
							</div>
						</div>
						<!-- <h4 class="card-title">Chat Messages</h4> -->
						<div class="chat-box scrollable"
							style="height: calc(100vh - 300px)">
							<!--User 1 -->
							<ul class="chat-list chat" id="message-div">
								<!--chat Row -->
								<c:forEach items="${messages }" var="message">
									<c:choose>
										<c:when test="${message.sent_by eq 'User' }">
											<li class="odd mt-1">
												<div class="chat-content ps-3 d-inline-block text-end">
													<div class="box mb-2 d-inline-block text-dark
						                            	message fw-normal fs-3 bg-light-inverse">
														${message.message }</div>
													<br />
												</div>
												<div class="chat-time d-inline-block
						                            text-end fs-2 font-weight-medium">
													<fmt:formatDate value="${message.message_time}" pattern="hh:mm aa"/></div>
											</li>
										</c:when>
										<c:otherwise>
											<li class="mt-1">
												<div class="chat-img d-inline-block align-top" style="width: 0px;">
													
												</div>
												<div class="chat-content ps-3 d-inline-block">
													<h5 class="text-muted fs-3 font-weight-medium">${type }</h5>
													<div class="box mb-2 d-inline-block text-dark
						                            	message fw-normal fs-3 bg-light-info">
														${message.message }</div>
												</div>
												<div class="chat-time d-inline-block text-end
                            						fs-2 font-weight-medium">
													<fmt:formatDate value="${message.message_time}" pattern="hh:mm aa"/></div>
											</li>
										</c:otherwise>
									</c:choose>
									<!--chat Row -->
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="card-body border-top border-bottom
                    	chat-send-message-footer">
						<form action="#" id="message-form" method="post">
							<div class="input-group">
								<input type="hidden" id="user_id" name="user_id" value="${User.id }">
		                    	<input type="hidden" id="type" name="type" value="${type }">
								<input name="message" id="message" type="text" class="message-type-box form-control type_msg" 
									placeholder="Type your message..." />
								<div class="input-group-append">
									<button class="input-group-text send_btn" id="send" type="submit"><i class="fas fa-location-arrow fa-2x"></i></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/app-style-switcher.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/notes/notes.js"></script>
    <script src="<%=request.getContextPath()%>/new/dist/js/pages/chat/chat.js"></script>
	<script>
		$('document').ready(function() {
			//$('#message-div').html("<div class=\"text-center\"><i class=\"fa fa-spinner w3-spin\" style=\"font-size: 48px; color: #f73563; \"></i></div>");
			$("#message-form").submit(function(event) {
				event.preventDefault();
				saveMessage();
			});
		});
		function saveMessage() {
		    var formData = $("#message-form").serialize();
		    var message = $('#message').val();
		    
		    $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/mobile/send-message",
		        data: formData,
		        timeout: 10000,
		        success: function(data) {
		            if (data == 'success') {
		                var date = new Date();
		                var time = date.toLocaleTimeString();
		                var commentString = 
		                    "<li class=\"odd mt-4\">"
							+"<div class=\"chat-content ps-3 d-inline-block text-end\">"
							+"<div class=\"box mb-2 d-inline-block text-dark "
                            +"	message fw-normal fs-3 bg-light-inverse\">"
							+message
							+"</div><br /></div>"
							+"<div class=\"chat-time d-inline-block"
                            +" text-end fs-2 font-weight-medium\">"
							+time
							+"</div></li>";

		                $('#message-div').append(commentString);
		                $("#message-form")[0].reset();
		                window.scrollTo(0, document.body.scrollHeight);
		            } else if (data == 'error') {
		                alert("Error occurred");
		            }
		            $("#send").button('reset');
		        },
		        error: function(e) {
		            console.error("AJAX Error:", e);
		            $("#send").button('reset');
		        }
		    });
		}
	</script>
	<script>
		$('document').ready(function() {
			setInterval(function () {
				getRealData();
			}, 5000);
		});
		function getRealData() {
			$.ajax({
				url : "${pageContext.request.contextPath}/chat/${type}/getMessages/${User.id}",
				type : "GET",
				timeout : 100000,
				beforeSend : function() {

				},
				success : function(data) {
					console.log("SUCCESS: ", data);
					$('#message-div').empty().html(data);
					scrollToBottom();
				},
				error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
					$('#loading').remove();

				}
			});
		}
		
		function scrollToBottom() {
	        // Scroll to the bottom of the chat box
	        var chatBox = $('.chat-box');
	        chatBox.scrollTop(chatBox[0].scrollHeight);
	    }
		
	</script>
</body>
</html>