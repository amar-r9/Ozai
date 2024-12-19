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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Chat List | Ozai</title>
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
.chatting-box, .chat {
	display: block !important;
}
.s-1 {
	background: teal;
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
		<div class="page-wrapper" style="background: #fff ; margin-left: 0px !important;">
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
				<div class="card chatting-box" style="box-shadow: unset;">
                	<div class="">
                  		<div class="card p-2 chat-meta-user border-bottom" style="box-shadow: unset; z-index: 10; top: 60px; position: fixed; width: -webkit-fill-available;">
                    		<div class="current-chat-user-name">
                      			<span>
	                        		<img src="https://www.ozailiving.com/profile-user/image/${senderUser.id }" width="45"
										onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
	                          			alt="dynamic-image" class="rounded-circle" />
                        			<span class="name fw-bold ms-2">${senderUser.name }</span>
                      			</span>
                    		</div>
                  		</div>			
						<div class="chat-box " style="margin-top: 100px; margin-bottom: 80px;">
							<!-- calc(100vh - 200px) -->
							<ul class="chat-list chat" data-user-id="2" id="message-div">
		                    	<!--chat Row -->
		                    	
								<c:if test="${not empty messages }">
									<c:forEach items="${messages }" var="message">
										<c:choose>
			               					<c:when test="${message.sender_id eq User.id }">
						                      	<li class="odd mt-4">
						                        	<div class="chat-content ps-3 d-inline-block text-end">
						                          		<div class="box mb-2 d-inline-block text-dark
						                              		message fw-normal fs-3 bg-light-inverse">
						                            		${message.message }
						                          		</div>
						                          		<br />
						                        	</div>
						                        	<div class="chat-time d-inline-block text-end
						                            	fs-2 font-weight-medium">
						                          		<fmt:formatDate value="${message.message_time}" pattern="MMMM dd, yyyy"/>
						                        	</div>
						                      	</li>				                      	
		                      					<!--chat Row -->
		                      				</c:when>
		                      				<c:otherwise>
		                      					<li class="mt-4">
						                        	<div class="chat-img d-inline-block align-top">
						                          		<img
						                            		src="https://www.ozailiving.com/profile-user/image/${message.sender_id }" 
															onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
						                            		alt="user" class="rounded-circle" />
						                        	</div>
						                        	<div class="chat-content ps-3 d-inline-block">
						                          		<h5 class="text-muted fs-3 font-weight-medium">
						                            		${message.sender.name }
						                          		</h5>
						                          		<div class="box mb-2 d-inline-block text-dark
						                              		message fw-normal fs-3 bg-light-info">
								                            ${message.message }
						                          		</div>
						                        	</div>
						                        	<div class="chat-time d-inline-block text-end
						                            	fs-2 font-weight-medium">
						                          		<fmt:formatDate value="${message.message_time}" pattern="MMMM dd, yyyy"/>
						                        	</div>
						                      	</li>
						                  	</c:otherwise>
						              	</c:choose>
						          	</c:forEach>
						      	</c:if>
		               		</ul>
		               	</div>
		          	</div>
			
					<%-- <div class="card-body border-top border-bottom
                    	chat-send-message-footer">
                  		<div class="row">
                    		<div class="col-12">
                    			<form action="#" id="message-form" method="post">
	                      			<div class="input-field mt-0 mb-0">
										<input type="hidden" id="sender_id" name="sender_id" value="${User.id }">
			                    		<input type="hidden" id="receiver_id" name="receiver_id" value="${otherUser }">
	                        			<input id="message" name="message" placeholder="Type and hit enter"
	                          				class="message-type-box form-control border-0 type_msg"
	                          				type="text" />
	                      			</div>
								</form>
                    		</div>
                  		</div>
                	</div> --%>
                	<div class="card p-2 mb-0" style="z-index: 10; bottom: 0px; position: fixed; 
                		width: -webkit-fill-available;">
						<form action="#" id="message-form" method="post">
							<div class="input-group">
								<input type="hidden" id="sender_id" name="sender_id" value="${User.id }">
		                    	<input type="hidden" id="receiver_id" name="receiver_id" value="${otherUser }">
								<input name="message" id="message" type="text" class="form-control type_msg" 
									placeholder="Type your message..." />
								<div class="input-group-append">
									<button class="input-group-text send_btn" id="send" type="submit"><i class="fas fa-location-arrow fa-2x"></i></button>
								</div>
							</div>
						</form>
					</div>
			
			     	
	        	<%-- <div class="card" style="min-height: 80vh">
					<div class="card-header msg_head">
						<div class="d-flex bd-highlight">
							<div class="img_cont">
								<img src="https://www.ozailiving.com/profile-user/image/${senderUser.id }" 
									onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'" class="rounded-circle user_img">
								<span class="online_icon"></span>
							</div>
							<div class="user_info">
								<span>Chat with ${senderUser.name }</span>
								<p>${senderUser.company }</p>
							</div>
						</div>
						<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
						<div class="action_menu">
							<ul>
								<li><i class="fas fa-user-circle"></i> View profile</li>
								<li><i class="fas fa-users"></i> Add to close friends</li>
								<li><i class="fas fa-plus"></i> Add to group</li>
								<li><i class="fas fa-ban"></i> Block</li>
							</ul>
						</div>
					</div>
					<div class="card-body msg_card_body" id="message-div">
						<c:if test="${not empty messages }">
							<c:forEach items="${messages }" var="message">
								<c:choose>
	               					<c:when test="${message.sender_id eq User.id }">
	               						<div class="d-flex justify-content-end mb-4">
											<div class="msg_cotainer_send">
												${message.message }
												
											</div>
											<div class="img_cont_msg">
												<img src="https://www.ozailiving.com/profile-user/image/${message.sender_id }" class="rounded-circle user_img_msg">
											</div>
										</div>
										<div class="d-flex justify-content-end mb-4">
											<small><fmt:formatDate value="${message.message_time}" pattern="MMMM dd, yyyy"/></small>
										</div>
	               					</c:when>
	               					<c:otherwise>
	               						<div class="d-flex justify-content-start mb-4">
											<div class="img_cont_msg">
												<img src="https://www.ozailiving.com/profile-user/image/${message.sender_id }" class="rounded-circle user_img_msg">
											</div>
											<div class="msg_cotainer">
												${message.message }
											</div>
										</div>
										<div class="d-flex justify-content-start mb-4">
											<small><fmt:formatDate value="${message.message_time}" pattern="MMMM dd, yyyy"/></small>
										</div>
	               					</c:otherwise>
	               				</c:choose>									
							</c:forEach>
						</c:if>
					</div>
					<div class="card-footer">
						<form action="#" id="message-form" method="post">
							<div class="input-group">
								<!-- <div class="input-group-append">
									<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
								</div> -->
								<input type="hidden" id="sender_id" name="sender_id" value="${User.id }">
		                    	<input type="hidden" id="receiver_id" name="receiver_id" value="${otherUser }">
								<input name="message" id="message" type="text" class="form-control type_msg" 
									placeholder="Type your message..." />
								<div class="input-group-append">
									<button class="input-group-text send_btn" id="send" type="submit"><i class="fas fa-location-arrow fa-2x"></i></button>
								</div>
							</div>
						</form>
					</div>
	            </div> --%>
	        </div>
	        </div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- customizer Panel -->
	<!-- ============================================================== -->
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

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/mobile/user/send-message",
				data : formData,
				timeout : 100000,
				beforeSend : function(request) {
					//request.setRequestHeader("Access-Control-Allow-Origin", "*");
				},
				success : function(data) {

					console.log("SUCCESS: ", data);

					if (data == 'success') {
						var date = new Date();
						var n = date.toDateString();
						var time = date.toLocaleTimeString();
						var commentString="<li class=\"odd mt-4\">"+
                    					  "<div class=\"chat-content ps-3 d-inline-block text-end\">"+
                  						  "<div class=\"box mb-2 d-inline-block text-dark message fw-normal fs-3 bg-light-inverse\">"
                    					  +$('#message').val()+
                  						  "</div> <br /> </div>"+
					                	  "<div class=\"chat-time d-inline-block text-end fs-2 font-weight-medium\">"
					                	  +time+
					                	  "</div></li>";
						$('#message-div').append(commentString);
						$("#message-form")[0].reset();
						window.scrollTo(0, document.body.scrollHeight);
					} else if (data == 'error') {
						alert("Error");
					}
					$("#send").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
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
			setInterval(function () {
				getRealData();
			}, 2000);
		});
		function getRealData() {
			$.ajax({
		    	url: "${pageContext.request.contextPath}/mobile/user/chat/getMessages/${otherUser}",
		        type: "GET",
		        timeout : 100000,
				beforeSend:function(){
						
				},
		         success : function(data) {
					console.log("SUCCESS: ", data);
					$('#message-div').empty();
					$('#message-div').html(data);
					window.scrollTo(0, document.body.scrollHeight);
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
	</script>

</body>
</html>