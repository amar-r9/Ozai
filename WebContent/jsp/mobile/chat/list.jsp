<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- loader section -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- loader section ends -->

	<!-- Begin page -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<div class=" row card ps-1"
			style="z-index: 100; top: 63px; position: fixed; width: -webkit-fill-available !important; border-radius: unset; box-shadow: none; background: none; background: #2c3c4c;">
			<a href="#" onclick="history.back()"> <i
				class="bi bi-arrow-left fa-2x text-white"
				style="vertical-align: bottom;">&nbsp;</i></a>

		</div>
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 100px;">
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
				<div class="row search-container mb-2">
					<form>
						<div class="searchbar">
							<input onkeyup="searchFunction()" id="searchInput"
								class="form-control" type="text" placeholder="Search Contact" />
						</div>
					</form>
				</div>
				<div class="scrollable position-relative" style="height: 100%">
					<!-- <div class="p-3 border-bottom">
                		<h5 class="card-title">Search Contact</h5>
		                <form>
		                  <div class="searchbar">
		                    <input onkeyup="searchFunction()" id="searchInput"
		                      class="form-control" type="text"
		                      placeholder="Search Contact" />
		                  </div>
		                </form>
              		</div> -->
					<ul class="mailbox list-style-none app-chat">
						<li>
							<div class="message-center chat-scroll chat-users"
								id="messagesList">
								<c:choose>
									<c:when test="${not empty messages }">
										<c:forEach items="${messages }" var="message">
											<c:choose>
												<c:when test="${message.sender_id eq User.id }">
													<a
														href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.receiver_id }"
														class="chat-user message-item align-items-center
					                    				border-bottom px-3 ps-2"
														id="chat_user_1" data-user-id="1"> <span
														class="user-img position-relative d-inline-block">
															<img
															src="https://www.ozailiving.com/profile-user/image/${message.receiver_id }"
															onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
															alt="user" class="rounded-circle w-100"
															style="width: 50px !important;" /> <span
															class="profile-status online rounded-circle
					                            				pull-right"></span>
													</span>
														<div
															class="mail-contnet w-75 d-inline-block v-middle ps-3">
															<h5 class="message-title mb-0 mt-1 fs-3 fw-bold"
																data-username="${message.receiver.name }">
																${message.receiver.name }</h5>
															<div id="message-div${user.user_id}">
																<span
																	class="fs-2 text-nowrap d-block time text-truncate 
										                        	fw-normal text-muted mt-1"
																	id=""> No messages to show.</span> <span
																	class="fs-2 text-nowrap d-block 
										                        	subtext text-muted"></span>
															</div>
														</div>
													</a>
												</c:when>
												<c:otherwise>
													<a
														href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.sender_id }"
														class="chat-user message-item align-items-center
					                    				border-bottom px-3 ps-2"
														id="chat_user_1" data-user-id="1"> <span
														class="user-img position-relative d-inline-block">
															<img
															src="https://www.ozailiving.com/profile-user/image/${message.sender_id }"
															onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
															alt="user" class="rounded-circle w-100"
															style="width: 50px !important;" /> <span
															class="profile-status online rounded-circle
					                            				pull-right"></span>
													</span>
														<div
															class="mail-contnet w-75 d-inline-block v-middle ps-3">
															<h5 class="message-title mb-0 mt-1 fs-3 fw-bold"
																data-username="Pavan kumar">${message.sender.name }
															</h5>
															<div id="message-div${user.user_id}">
																<span
																	class="fs-2 text-nowrap d-block time text-truncate 
										                        	fw-normal text-muted mt-1"
																	id=""> No messages to show.</span> <span
																	class="fs-2 text-nowrap d-block 
										                        	subtext text-muted"></span>
															</div>
														</div>
													</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach items="${users }" var="user">
											<c:if test="${User.id ne user.user_id}">
												<a
													href="<%=request.getContextPath() %>/mobile/user/chat/message/${user.user_id }"
													class="chat-user message-item align-items-center border-bottom px-3 ps-2"
													id="chat_user_${user.user_id}"
													data-user-id="${user.user_id}"
													data-username="${user.user.name}"
													aria-label="Chat with ${user.user.name}"> <!-- User Image with Lazy Loading -->
													<span class="user-img position-relative d-inline-block">
														<img
														data-src="https://www.ozailiving.com/profile-user/image/${user.user_id }"
														src="https://www.ozailiving.com/assets/images/default-user.png"
														alt="${user.user.name}" class="lazy rounded-circle w-100"
														style="width: 50px !important;"
														onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'" />
														<span
														class="profile-status online rounded-circle pull-right"></span>
												</span> <!-- Message Content -->
													<div class="mail-contnet w-75 d-inline-block v-middle ps-3">
														<h5 class="message-title mb-0 mt-1 fs-3 fw-bold">${user.user.name}</h5>

														<!-- Message and Time Placeholder -->
														<div id="message-div${user.user_id}">
															<span
																class="fs-2 text-nowrap d-block time text-truncate fw-normal text-muted mt-1"
																id="last-message-${user.user_id}"> Loading
																messages... </span> <span
																class="fs-2 text-nowrap d-block subtext text-muted"></span>
														</div>
													</div>
												</a>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<!-- Message -->
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by
				Ozai. </footer>
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
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/chat/chat.js"></script>
	<script>
		$('document').ready(function() {
			$('#hideBack').hide();
		});
		function searchFunction() {
			var input, filter, ul, li, a, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			ul = document.getElementById("messagesList");
			li = ul.getElementsByTagName("li");
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				txtValue = a.textContent || a.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";
				}
			}
		}
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			let lazyImages = [].slice.call(document.querySelectorAll("img.lazy"));

			if ("IntersectionObserver" in window) {
				let lazyImageObserver = new IntersectionObserver(
						function(entries, observer) {
							entries.forEach(function(entry) {
								if (entry.isIntersecting) {
									let lazyImage = entry.target;
									lazyImage.src = lazyImage.dataset.src;
									lazyImage.classList
											.remove("lazy");
									lazyImageObserver
											.unobserve(lazyImage);
								}
							});
						});

				lazyImages.forEach(function(lazyImage) {
					lazyImageObserver.observe(lazyImage);
				});
			} else {
				// Fallback for older browsers
				let lazyLoadThrottleTimeout;
				function lazyLoad() {
					if (lazyLoadThrottleTimeout) {
						clearTimeout(lazyLoadThrottleTimeout);
					}
					lazyLoadThrottleTimeout = setTimeout(
					function() {
						let scrollTop = window.pageYOffset;
						lazyImages.forEach(function(img) {
							if (img.offsetTop < (window.innerHeight + scrollTop)) {
								img.src = img.dataset.src;
								img.classList
										.remove('lazy');
							}
						});
						if (lazyImages.length === 0) {
							document.removeEventListener("scroll", lazyLoad);
							window.removeEventListener("resize", lazyLoad);
							window.removeEventListener("orientationChange", lazyLoad);
						}
					}, 20);
				}

				document.addEventListener("scroll", lazyLoad);
				window.addEventListener("resize", lazyLoad);
				window.addEventListener("orientationChange",
						lazyLoad);
			}
		});
	</script>
</body>
</html>