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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Gate Request | Ozai</title>
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
.slider-container {
	position: relative;
	width: 80%;
	margin: 10px auto;
	background: #c9c8c8;
	border-radius: 50px;
	overflow: hidden;
	height: 50px;
}

.slider-label {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 1.5em;
	color: #007bff;
	z-index: -1;
	white-space: nowrap;
}

.slider {
	-webkit-appearance: none;
	appearance: none;
	width: 100%;
	height: 50px;
	background: transparent;
	outline: none;
	opacity: 0.7;
	transition: opacity .2s;
	cursor: pointer;
}

.slider::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 50px;
	height: 50px;
	background: #007bff;
	border-radius: 50%;
	cursor: pointer;
	transition: background-color 0.3s;
}

.slider::-moz-range-thumb {
	width: 50px;
	height: 50px;
	background: #007bff;
	border-radius: 50%;
	cursor: pointer;
	transition: background-color 0.3s;
}

.slider-container.unlocked .slider::-webkit-slider-thumb {
	background: #28a745;
}

.slider-container.unlocked .slider::-moz-range-thumb {
	background: #28a745;
}

.slider-container.unlocked .slider-label {
	color: #28a745;
}

body {
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	text-align: center;
	width: 100%;
	max-width: 400px;
	padding: 20px;
}

.headers {
	margin-top: 20px;
	margin-bottom: 10px;
}

.headers h4, .headers h5 {
	margin: 0;
}

.profile-pic {
	width: 180px;
	height: 180px;
	border-radius: 50%;
	object-fit: cover;
	margin: 20px auto;
	background-color: #ccc;
}

.swipe-up {
	position: relative;
	width: 60px;
	height: 150px;
	margin: 20px auto;
	background-color: white;
	border-radius: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	touch-action: none;
	overflow: hidden;
}

.swipe-up input[type="range"] {
	position: absolute;
	width: 100%;
	height: 100%;
	opacity: 0;
	z-index: 1;
}

.swipe-up .arrows {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
}

.swipe-up .arrows .bi {
	font-size: 16px;
}

.swipe-up .arrow {
	position: absolute;
	width: 40px;
	height: 40px;
	background-color: #28a745;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	bottom: 10px;
	/* Initial position */
	transition: bottom 0.3s ease;
}

.swipe-up .arrow .bi {
	color: white;
	font-size: 24px;
}

.action-buttons {
	display: flex;
	justify-content: space-around;
	margin-top: 30px;
}

.action-buttons .btn {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
	color: white;
	flex-direction: column;
}

.swipe-up .arrows {
	animation: moveUp 1.5s infinite;
}

.call-animation {
	animation: call 1.5s ease infinite;
	color: aliceblue;
	font-size: 35px;
	font-weight: bold;
	position: relative;
}

.caller-img {
	position: absolute;
	height: 50px;
	width: 50px;
	top: 35px;
	left: 35px;
}

@
keyframes call { 15% {
	box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.5);
}

25%
{
box-shadow
:
 
0
0
0
8
px
 
#007bff
,
0
0
0
16
px
 
#007bff
;

            
}
30%
{
box-shadow
:
 
0
0
0
12
px
 
#007bff
,
0
0
0
24
px
 
#007bff
;

            
}
}
.spinner {
	border: 4px solid rgba(0, 0, 0, 0.1);
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border-left-color: #007bff;
	animation: spin 1s ease infinite;
	display: inline-block;
}

@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100%
{
transform
:
 
rotate
(360deg);

            
}
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

			<div class="container text-center">
				<div class="headers">
					<h4 class="text-muted">${req.bdetails.user.name }</h4>
					<h5 class="text-muted">Resident</h5>
				</div>
				<img
					src="<%=request.getContextPath()%>/assets/images/default-user.png"
					class="profile-pic" />
				<h3>${req.name }</h3>				
				<c:choose>
					<c:when test="${req.status eq 'Pending' }">
						<p class="text-muted">${req.type }is waiting at gate</p>
						<div
							class="mt-4 pt-4 justify-content-between align-items-center"
							id="${req.id }">
							<div class="slider-container call-animation">
								<input type="range" min="0" max="100" value="0" class="slider"
									id="slider${req.id }" data-id="${req.id }"> <label
									for="slider1" class="slider-label">Swipe to Accept</label>
							</div>
						</div>
						<p class="text-muted mb-4 pb-4">Swipe right to accept</p>
						<div class="row pt-4">
							<div class="col-6 pe-4">
								<button
									class="btn btn-sm btn-44 rounded-circle shadow-sm shadow-success text-white bg-success">
									<i class="bi bi-telephone"></i>
								</button>
								<br>
								<p>Call gate</p>
							</div>
							<div class="col-6 ps-4">
								<button
									class="btn btn-sm btn-44 rounded-circle shadow-sm shadow-danger 
                                  	text-white bg-danger"
									onclick="denyRequest(${req.id })">
									<i class="bi bi-x"></i>
								</button>
								<br>
								<p>Deny</p>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-body">
							<a href="<%=request.getContextPath()%>/mobile"
								class="btn btn-info">Go Home</a> <img
								src="https://dwellite.com/assets/images/success.gif"
								style="width: 100%;" />
							<h5>${req.status }</h5>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- Required jquery and libraries -->
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
	    $(document).ready(function () {
	        $('.slider').on('input', function () {
	            let slider = $(this);
	            let value = slider.val();
	            let requestId = slider.data('id'); // Get the req.id
	
	            if (value == 100) {
	                slider.next('label').text('Accepted').css('color', '#28a745');
	                slider.prop('disabled', true);
	
	                // Show loader
	                $('#loader').show();
	
	                // Perform the AJAX call
	                $.ajax({
	                    url: "${pageContext.request.contextPath}/mobile/approveGateRequest/" + requestId, // URL with requestId as path variable
	                    type: 'POST',
	                    success: function(response) {
		                    console.log('Request accepted:', response);
		                    // Optionally fade out the request card
		                    $("#"+requestId+"").removeClass();
		                    $("#"+requestId+"").addClass("bg-white alert text-center");
		                    $("#"+requestId+"").html("<img src='https://dwellite.com/assets/images/success.gif' style='width: 50%;' /><br><h5>Approved.</h5>");
		                    slider.closest('div').fadeOut(1000); // Adjust as needed
		                    $("#"+requestId+"").fadeOut(5000);
		                    //window.location.href = '${pageContext.request.contextPath}/mobile';
		                },
		                error: function(xhr, status, error) {
		                    console.error('Error:', error);
		                }
	                });
	            }
	        });
	    });
	    function denyRequest(id) {
            $.ajax({
                url: '<%=request.getContextPath()%>/mobile/denyGateRequest/' + id,
                type: 'POST',
                success: function(result) {
                    if (result === "Success") {
                        alert("Request denied successfully.");
                        window.location.href = '<%=request.getContextPath()%>/mobile/user/gaterequests/list';
                    } else {
                        alert("Failed to deny the request.");
                    }
                },
                error: function() {
                    alert("An error occurred while denying the request.");
                }
            });
        }
	</script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            var socket = new WebSocket('ws://' + window.location.host + '<%=request.getContextPath()%>/ws/gaterequests');

            socket.onopen = function() {
                console.log("WebSocket connection established:", socket);
            };

            socket.onmessage = function(event) {
                console.log("Received WebSocket message:", event.data);
                try {
                    var message = JSON.parse(event.data);
                    if (message.status === "Approved") {
                        console.log("Message status is Approved");
                        const requestElement = document.getElementById(message.id);
                        if (requestElement) {
                            requestElement.classList.remove();
                            requestElement.classList.add('bg-white', 'alert', 'text-center');
                            requestElement.innerHTML = "<img src='https://dwellite.com/assets/images/success.gif' style='width: 50%;' /><br><h5>Approved.</h5>";
                        }
 	                    
                    } else {
                        console.log("Message status is not Approved");
                    }
                } catch (e) {
                    console.error("Failed to parse message:", e);
                }
            };

            socket.onclose = function() {
                console.log("WebSocket connection closed.");
            };

            socket.onerror = function(error) {
                console.error("WebSocket error:", error);
            };
        });
    </script>
</body>
</html>