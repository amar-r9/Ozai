<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords" content="Tikaana Admin Dashboard" />
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Smart Life Admin | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="main-wrapper">
		<!-- -------------------------------------------------------------- -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- -------------------------------------------------------------- -->
		<jsp:include page="/common/preloader.jsp"></jsp:include>
		<!-- -------------------------------------------------------------- -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- -------------------------------------------------------------- -->
		<!-- -------------------------------------------------------------- -->
		<!-- Login box.scss -->
		<!-- -------------------------------------------------------------- -->
		<div
			class="
          auth-wrapper
          d-flex
          no-block
          justify-content-center
          align-items-center
        "
			style="background: url(<%=request.getContextPath()%>/assets/images/background/active-bg.jpg) no-repeat center center; background-size: cover;">
			<div class="auth-box p-4 bg-white rounded">
				<div id="loginform">
					<div class="logo">
						<h3 class="box-title mb-3">Sign In</h3>
					</div>
					<!-- Form -->
					<div class="row">
						<div class="col-12">
							<c:if test="${param.invalidsession eq true }">
								<div
									class="toast mb-2 d-flex
	                        		align-items-center text-white bg-dark border-0">
									<div class="toast-body">
										<p>Session Expired!/Login Required.</p>
										<p>Please login below</p>
									</div>
								</div>
							</c:if>
							<c:if test="${AuthError != null}">
								<div class="alert alert-warning">${AuthError }</div>
							</c:if>
							<form method="POST" action="validateSmartLogin"
								modelAttribute="admin"
								class="form-horizontal mt-3 form-material" id="loginform">
								<div class="form-group mb-3">
									<div class="">
										<input class="form-control" type="text" required
											placeholder="Username" name="username" />
									</div>
								</div>
								<input type="hidden" name="next" value="${param.next }">
								<div class="form-group mb-4">
									<div class="">
										<input class="form-control" type="password" required
											placeholder="Password" name="password" id="password" />
									</div>
								</div>
								<div class="form-group text-center mt-4 mb-3">
									<div class="col-xs-12">
										<button
											class="
                          btn btn-info
                          d-block
                          w-100
                          waves-effect waves-light
                        "
											type="submit">Log In</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- -------------------------------------------------------------- -->
		<!-- Login box.scss -->
		<!-- -------------------------------------------------------------- -->
	</div>
	<!-- -------------------------------------------------------------- -->
	<!-- All Required js -->
	<!-- -------------------------------------------------------------- -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(".preloader").fadeOut();
		// ==============================================================
		// Login and Recover Password
		// ==============================================================
	</script>
</body>
</html>