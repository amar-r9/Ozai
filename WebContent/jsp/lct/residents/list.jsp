<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	content="Tikaana admin dashboard for finacne module" />
<meta name="robots" content="noindex,nofollow" />
<title>Residents-List | ${ClientUser.client} @ Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- This page plugin CSS -->
<link
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
	rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
 <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
#selectProperty {
	font-family: monospace;
	color: #fff;
	font-size: 1em;
	font-weight: bold;
	margin-left: 15px;
	margin-bottom: 5px;
}

#property_id {
	margin-left: 15px;
}

#submitThis2 {
	height: 2.1rem !important; /* Adjust the height as needed */
	padding: 0.2rem 1rem !important;
	margin-right: 20px;
}

#type {
	margin-left: 2px;
	height: 3rem !important; /* Adjust the height as needed */
	padding: 0.2rem 1rem !important;
	font-size: 1.3rem !important; /* Adjust the font size as needed */
	border-radius: 5px !important;
	background: #fff !important;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* custom width for choose dropdown */
.custom-width {
	width: 96%;
}

.btn-pill {
	border-radius: 50px;
	float: right;
}

.img-circle {
	width: 100% !important;
}

.rating {
	float: left;
}

/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
  follow these rules. Every browser that supports :checked also supports :not(), so
  it doesn’t make the test unnecessarily selective */
.rating:not (:checked ) >input {
	position: absolute;
	top: -9999px;
	clip: rect(0, 0, 0, 0);
}

.rating:not (:checked ) >label {
	float: right;
	width: 1em;
	/* padding:0 .1em; */
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	font-size: 200%;
	/* line-height:1.2; */
	color: #ddd;
}

.rating:not (:checked ) >label:before {
	content: '★ ';
}

.rating>input:checked ~ label {
	color: dodgerblue;
}

.rating:not (:checked ) >label:hover, .rating:not (:checked ) >label:hover 
	~ label {
	color: dodgerblue;
}

.rating>input:checked+label:hover, .rating>input:checked+label:hover ~
	label, .rating>input:checked ~ label:hover, .rating>input:checked ~
	label:hover ~ label, .rating>label:hover ~ input:checked ~ label {
	color: dodgerblue;
}

.rating>label:active {
	position: relative;
	top: 2px;
	left: 2px;
}

.search-container {
	display: flex;
	align-items: center;
	position: relative;
	margin-bottom: 1rem;
}

.search-input {
	flex: 1;
	padding: 0.5rem 1rem;
	border: none;
	border-bottom: 2px solid #00c897;
	font-size: 1rem;
}

.search-button {
	background: #fff;
	border: none;
	padding: 0.5rem;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-left: 0.5rem;
	cursor: pointer;
}

.search-button i {
	font-size: 1.2rem;
}

.filter-btn {
	position: relative;
}

.btn-44 {
	height: 44px;
	line-height: 42px;
	width: 44px;
	padding: 0 !important;
}

#sortMenu {
	position: absolute;
	right: 0;
	top: 100%;
	background: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 0.5rem;
	overflow: hidden;
	z-index: 1000;
}

.dropdown-item {
	padding: 10px 20px;
	cursor: pointer;
}

.dropdown-item:hover {
	background: #f8f9fa;
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
		<div class="d-block d-sm-none row card ps-2"
			style="z-index: 0; top: 63px; position: fixed; width: -webkit-fill-available !important; border-radius: unset; box-shadow: none; background: linear-gradient(360deg, #3c536a, #233242); width: 100%;">
			<a href="<%=request.getContextPath()%>/lct"> <i
				class="bi bi-arrow-left fa-2x text-white"
				style="vertical-align: bottom;">&nbsp;</i></a>
			<c:if test="${not empty properties }">
				<form id="month-form"
					action="<%=request.getContextPath()%>/lct/residents/by-property"
					role="form" method="post">
					<div class="row">
						<div class="col-12">
							<label id="selectProperty">Select property</label>
						</div>
						<div class="col-12 d-flex flex-nowrap"">
							<div class="flex-grow-1 me-3">
								<select name="property_id" id="property_id"
									class="form-control form-select custom-width" required>
									<option value="">Choose</option>
									<c:forEach items="${properties}" var="property">
										<option value="${property.id}">${property.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="flex-shrink-0">
								<input class="btn btn-secondary font-medium" type="submit"
									id="submitThis2" value="Go!" />
							</div>
						</div>
					</div>
				</form>
				<br>
			</c:if>
		</div>
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
		<div class="page-wrapper" style="margin-top: 180px; background: #fff;">

			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->

				<!-- Row selection (multiple rows) -->
				<div class="row">
					<div class="col-md-12 col-12">
						<!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
						<div class="">
							<div class="row search-container">
								<div class="col position-relative align-self-center">
									<div class="form-group form-floating mb-3 is-valid"
										style="height: 44px;">
										<input type="text" id="searchInput" class="form-control"
											onkeyup="filterList()" placeholder="Search"> <label
											class="form-control-label" for="searchInput">Search</label>
									</div>
								</div>
								<div class="col-auto align-self-center">
									<button class="search-button btn btn-light btn-44 filter-btn"
										onclick="toggleSortMenu()">
										<i class="bi bi-filter size-22"></i>
									</button>
									<div id="sortMenu" style="display: none;">
										<button class="dropdown-item" onclick="sortList('name')">Sort
											by Name</button>
										<button class="dropdown-item" onclick="sortList('unit')">Sort
											by Property</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="card shadow-sm mb-4 ">
										<ul id="userList" class="list-group list-group-flush bg-none">
											<c:forEach items="${tenants }" var="tenant">
												<li class="list-group-item">
													<div class="row">
														<div class="col-3">
															<div class="text-center mb-0">
																<div class="p-1">
																	<figure class="avatar avatar-44">
																		<img
																			src="<%=request.getContextPath() %>/profile-user/image/${tenant.user_id}"
																			onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
																			style="height: 50px;" alt="">
																	</figure>
																</div>
															</div>
														</div>
														<div class="col-7">
															<p class="mb-0 mt-2">
																<b class="admin-name">${tenant.user.name }</b><br>
																<span class="text-secondary">Room -
																	${tenant.room.room_no } , <i
																	class="nav-icon bi bi-building text-info"></i> <span
																	class="admin-unit">${tenant.property.name }</span>
																</span>
															</p>
														</div>
														<div class="col-2 ps-0 mt-3">
															<span data-bs-toggle="modal" data-bs-target="#use${tenant.user_id }"><i
																class="fa fa-bars fa-2x text-primary"></i></span>
															<div id="use${tenant.user_id }" class="modal fade" tabindex="-1"
										                        aria-labelledby="bs-example-modal-md" aria-hidden="true"
										                        style="top: 25%;">
										                        <div class="modal-dialog">
										                          	<div class="modal-content">
										                            	<div class="modal-header d-flex align-items-center">
										                              		<h4 class="modal-title" id="myModalLabel">
										                                		${tenant.user.name }
										                              		</h4>
										                              		<button type="button" class="btn-close"
										                                		data-bs-dismiss="modal" aria-label="Close"></button>
										                            	</div>
										                            	<div class="modal-body">
										                              		<div class="row">
																				<div class="col-6">
																					<small class="text-muted mb-0">PROPERTY</small>
																					<p class="text-dark">${tenant.property.name }</p>
																					<small class="text-muted mb-0">ROOM</small>
																					<p class="text-dark">${tenant.room.room_no }</p>
																					<small class="text-muted mb-0">BED</small>
																					<p class="text-dark">${tenant.bed.bed_no }</p>
																				</div>
																				<div class="col-6">
																					<small class="text-muted mb-0">EMPLOY ID</small>
																					<p class="text-dark">
																						<c:choose>
																							<c:when test="${not empty tenant.employ_id }">
																								${tenant.employ_id }
																							</c:when>
																							<c:otherwise>
																								---
																							</c:otherwise>
																						</c:choose>
																					</p>
																					<small class="text-muted mb-0">WORK SITE</small>
																					<p class="text-dark">
																						<c:choose>
																							<c:when test="${not empty tenant.work_site }">
																								${tenant.work_site }
																							</c:when>
																							<c:otherwise>
																								---
																							</c:otherwise>
																						</c:choose>
																					</p>
																					<small class="text-muted mb-0">JOIN DATE</small>
																					<p class="text-dark">
																						<c:choose>
																							<c:when test="${not empty tenant.joining_date }">
																								${tenant.joining_date }
																							</c:when>
																							<c:otherwise>
																								---
																							</c:otherwise>
																						</c:choose>
																					</p>
																				</div>
																			</div>
										                            	</div>
										                            	<div class="modal-footer">
																			<a class="btn btn-danger"
																				href="<%=request.getContextPath() %>/lct/residents/report-user/${tenant.user.id }"
																				data-toggle="tooltip"
																				data-original-title="Feedback">
																				Monthly Review
																			</a>
																			
																			<a href="<%=request.getContextPath() %>/lct/residents/assign-badge/${tenant.user.id }"
																				class="btn btn-primary">
																				Assign Badge
																			</a>
																			<a class="btn btn-warning"
																				href="<%=request.getContextPath() %>/lct/residents/edit/${tenant.user.id }"
																				data-toggle="tooltip" data-original-title="Edit details">
																					<i class="fas fa-edit"></i>
																			</a>
											                              	<button type="button" class="btn btn-light-danger
											                                  text-danger font-weight-medium
											                                  waves-effect" data-bs-dismiss="modal">
											                                	Close
											                              	</button>
										                            	</div>
										                          	</div>
										                          	<!-- /.modal-content -->
										                        </div>
										                        <!-- /.modal-dialog -->
										                	</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">All right reserved by Ozai.</footer>
		</div>
	</div>
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
	<!--This page plugins -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<!-- start - This is for export functionality only -->
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<script>
		function filterList() {
            let input = document.getElementById('searchInput');
            let filter = input.value.toLowerCase();
            let ul = document.getElementById('userList');
            let li = ul.getElementsByTagName('li');

            for (let i = 0; i < li.length; i++) {
                let name = li[i].getElementsByTagName('p')[0].innerText.toLowerCase();
                let unit = li[i].getElementsByTagName('small')[0].innerText.toLowerCase();
                if (name.includes(filter) || unit.includes(filter)) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";
                }
            }
        }
		
		function toggleSortMenu() {
            const sortMenu = document.getElementById('sortMenu');
            sortMenu.style.display = sortMenu.style.display === 'none' ? 'block' : 'none';
        }

        function sortList(sortCriterion) {
            const ul = document.getElementById('userList');
            const liArr = Array.from(ul.querySelectorAll('.list-group-item'));

            liArr.sort((a, b) => {
                let textA, textB;
                if (sortCriterion === 'name') {
                    textA = a.querySelector('.admin-name').innerText.toLowerCase();
                    textB = b.querySelector('.admin-name').innerText.toLowerCase();
                } else {
                    textA = a.querySelector('.admin-unit').innerText.toLowerCase();
                    textB = b.querySelector('.admin-unit').innerText.toLowerCase();
                }

                if (textA < textB) return -1;
                if (textA > textB) return 1;
                return 0;
            });

            liArr.forEach(li => ul.appendChild(li));
            toggleSortMenu(); // Hide the sort menu after sorting
        }
	</script>

	<script>
		$('document').ready(function() {
		    var panels = $('.user-infos');
		    var panelsButton = $('.dropdown-user');
		    panels.hide();

		    //Click dropdown
		    panelsButton.click(function() {
		        //get data-for attribute
		        var dataFor = $(this).attr('data-for');
		        var idFor = $(dataFor);

		        //current button
		        var currentButton = $(this);
		        idFor.slideToggle(400, function() {
		            //Completed slidetoggle
		            if(idFor.is(':visible'))
		            {
		                currentButton.html('<i class="fas fa-window-close fa-2x text-muted"></i>');
		            }
		            else
		            {
		                currentButton.html('<i class="fas fa-plus-circle fa-2x text-dark"></i>');
		            }
		        })
		    });

		    $('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	<script>
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
		$('document').ready(function(){
			
			$('#tenants_wrapper').addClass("text-center");
			
			$('#type').change(function(){
				if($('#type').val() == "All") {
					$('#b2b_data').show();
					$('#b2c_data').show();
				} else if($('#type').val() == "B2C") {
					$('#b2b_data').hide();
					$('#b2c_data').show();					
				} else if($('#type').val() == "B2B") {
					$('#b2b_data').show();
					$('#b2c_data').hide();					
				}
			});
			
			
			$('#hideBack').hide();
    		$('.sidebartoggler').toggle();
    		$('#tenants').DataTable({
 		       "paging":   true,
 				dom: "B",
 				buttons: ["copy", "csv", "excel", "pdf", "print"],
 				initComplete: function() {
  		      		$('table.dataTable').hide();
  		    	}
 			});
 			$(".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel"
 			).addClass("btn btn-warning btn-sm mr-1");
    		
    	});
    </script>
</body>
</html>