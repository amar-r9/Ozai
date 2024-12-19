<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Tikaana admin dashboard for finacne module" />
<meta name="robots" content="noindex,nofollow" />
<title>Residents | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- This page plugin CSS -->
<link href="https://nightly.datatables.net/css/jquery.dataTables.css"
	rel="stylesheet" type="text/css" />

<link
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
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
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="background: #FFF;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="text-center">
						<h5 style="font-weight: 800; color: #000;">Residents</h5>
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
				<div class="row search-container">
					<div class="col position-relative align-self-center">
						<div class="form-group form-floating mb-3 is-valid" style="height: 44px;">
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
								<c:forEach items="${tenants }" var="user">
									<li class="list-group-item">
										<div class="row">
											<div class="col-3">
												<div class="card text-center mb-0">
													<div class="p-1">
														<figure class="avatar avatar-44">
															<img
																src="<%=request.getContextPath() %>/profile-user/image/${user.user_id}"
																onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
																style="height: 50px;" alt="">
														</figure>
													</div>
												</div>
											</div>
											<div class="col-6">
												<p><span class="admin-name">${user.user.name }</span><br> <small
														class="text-secondary">Room - ${user.room.room_no } ,  <i
														class="nav-icon bi bi-building text-info"></i> <span class="admin-unit">${user.property.name }</span>
													</small>
												</p>
											</div>
											<div class="col-3 ps-0">
												<br>
												<i class="bi bi-patch-check text-success size-22"></i> Verified
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
		<footer class="footer">All right reserved by Ozai.</footer>
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
	<!--This page JavaScript -->
	<script>
		$('document').ready(function() {
			//$('.sidebartoggler').toggle();
		});
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
</body>
</html>