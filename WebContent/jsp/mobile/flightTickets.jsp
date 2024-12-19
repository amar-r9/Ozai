<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
    <meta name="description" content="Tikaana Admin Dashboard" />
    <meta name="robots" content="noindex,nofollow" />
    <title>Book Flight Ticket | Ozai</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin/" />
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
    <link href="<%=request.getContextPath()%>/new/dist/css/style.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/new/assets/libs/select2/dist/css/select2.min.css" />
    <style type="text/css">
        body {
            font-size: 0.9rem;
        }
        small {
            font-size: .775em;
        }
    </style>
    <style>
    	#from,
		#to,
		#date,
		#number_of_tickets {
	    border: none; /* Remove border */
	    border-radius: 0; /* Remove border radius */
	    box-shadow: none; /* Remove box shadow */
	}
    </style>
</head>

<body>
    <jsp:include page="/common/preloader.jsp"></jsp:include>
    <div id="main-wrapper">
		<jsp:include page="/common/backbutton.jsp"></jsp:include>
        <div class="page-wrapper" style="background: #c7d8e1;">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 text-center">
                        <h4 class="text-center" style="font-weight: 800; color: #000;">BOOK YOUR FLIGHT</h4>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-12">
                        <div class="card" style="background: #eeeeee; box-shadow: 5px 5px 5px #c7c4d7; border-radius: 10px;">
                            <div class="card-body">
                                <h4 class="card-title"><i class=" fas fa-angle-double-right"></i> Flight Details</h4>
                            </div>
                            <form action="<%=request.getContextPath()%>/mobile/book-flight-ticket" method="post" modelAttribute="flight_tickets" role="form" id="ticket-form" class="php-email-form">
                                <div class="card-body">
                                    <div class="card card-body mt-n4 mb-n2 p-2" style="border-radius: 10px;">
                                        <small class="text-muted">From</small>
                                        <div class="row">
                                            <div class="col-12">
                                                <input type="text" id="from" name="from" required class="form-control" />
                                            </div>
                                        </div>
                                    </div><br>
                                    <div class="card card-body mt-n2 mb-n2 p-2" style="border-radius: 10px;">
                                        <small class="text-muted">Going to</small>
                                        <div class="row mb-0">
                                            <div class="col-12">
                                                <input type="text" id="to" name="to" required class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body row mb-n1 mt-n4">
                                    <div class="col-6">
                                        <div class="card card-body p-2 mb-n1" style="border-radius: 10px; padding-bottom: 0px !important;">
                                            <small class="text-muted">Departure</small>
                                            <div class="row">
                                                <div class="col-12">
                                                    <input type="date" id="date" name="date" required class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card card-body p-2 mb-n1" style="border-radius: 10px; padding-bottom: 0px !important;">
                                            <small class="text-muted">Number of Tickets</small>
                                            <div class="row">
                                                <div class="col-12">
                                                    <select id="number_of_tickets" name="number_of_tickets" required class="form-control" style="background-color: white;">
                                                        <option value="">Select</option>
                                                        <c:forEach var="i" begin="1" end="10">
                                                            <option value="${i}">${i}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body text-center mt-n3">
								    <div id="saveButtonContainer">
								        <button type="button" class="btn btn-success btn-rounded w-100" onclick="submitForm()">Save</button>
								    </div>
								    <div id="successMsg" style="display: none;">
								        <i class="fas fa-check-circle text-success"></i> Saved
								    </div>
								</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer text-center"> All Rights Reserved by Ozai Living Private Limited. </footer>
        </div>
    </div>

    <!-- Import JSTL Core Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstl/1.2/jstl.min.js"></script>

		<script>
			function submitForm() {
			    var form = document.getElementById('ticket-form');
			    var formData = new FormData(form);
	
			    var xhr = new XMLHttpRequest();
			    console.log("1");
			    xhr.open('POST', '<%=request.getContextPath()%>/mobile/book-flight-ticket', true);
			    console.log("2");
	
			    // Add this line to set the Content-Type header for URL-encoded data
			    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	
			    xhr.onload = function () {
			        console.log("3");
			        if (xhr.status === 200) {
			            // Handle success response
			            console.log("Response Text:", xhr.responseText);
			            if (xhr.responseText.trim() === "success") {
			                // If the response is "success", hide save button and show "Saved" message
			                document.getElementById("saveButtonContainer").style.display = 'none'; // Hide save button
			                document.getElementById("successMsg").style.display = 'block'; // Show success message
			            } else {
			                // Handle other responses
			                console.error('Error:', xhr.responseText);
			            }
			        } else {
			            // Handle error response
			            console.error('Error:', xhr.statusText);
			        }
			    };
	
			    console.log("4");
			    xhr.onerror = function () {
			        console.error('Request failed');
			    };
			    console.log("5");
	
			    // Convert FormData to URL-encoded string
			    var formDataString = new URLSearchParams(formData).toString();
			    xhr.send(formDataString);
			}
		</script>


    <div class="chat-windows"></div>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/forms/select2/select2.init.js"></script>

<script>
    $('document').ready(function() {
        $('.sidebartoggler').toggle();
    });
    $(function() {
        "use strict";
        $("#main-wrapper").AdminSettings({
            Theme: true,
            Layout: "horizontal",
            LogoBg: "skin5",
            NavbarBg: "skin5",
            SidebarType: "overlay",
            SidebarColor: "skin5",
            SidebarPosition: false,
            HeaderPosition: false,
            BoxedLayout: false,
        });
    });
</script>
</body>
</html>