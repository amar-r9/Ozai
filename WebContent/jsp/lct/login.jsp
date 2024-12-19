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
<meta name="keywords"
	content="Ozai Admin Dashboard" />
<meta name="description"
	content="Ozai Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Admin Dashboard Login | Ozai</title>
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
<style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 150px;
  height: 150px;
  top: 200px;
  left: 33%;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>

<body id="bodyShow">
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
			style="background: url(<%=request.getContextPath() %>/assets/images/background/active-bg.jpg) no-repeat center center; background-size: cover;">
			<div class="auth-box p-4 bg-white rounded">
				<div id="loginform">
					<div class="logo">
						<h3 class="box-title mb-3">Sign In ${localStorage.username}</h3>
					</div>
					<!-- Form -->
					<div class="row">
						<div class="col-12">
							<c:if test="${param.invalidsession eq true }">
								<div class="toast mb-2 d-flex
	                        		align-items-center text-white bg-dark border-0">
	                        		<div class="toast-body">
		                        		 <p>Session Expired!/Login Required.</p>
		                        		 <p>Please login below</p>
		                        	</div>
	                        	</div>
							</c:if>
							<c:if test="${AuthError != null}">
								<div class="alert alert-warning"> ${AuthError }</div>
							</c:if>	
							<form method="POST" action="<%=request.getContextPath() %>/validateClientUserLogin" id="login-form"
								modelAttribute="user"
								class="form-horizontal mt-3 form-material" id="loginform">
								<div class="form-group mb-3">
									<div class="">
										<input class="form-control" type="text" required
											placeholder="Username" name="username" id="username" />
									</div>
								</div>
								<input type="hidden" name="next" value="${param.next }">
								<div class="form-group mb-4">
									<div class="">
										<input class="form-control" type="password" required
											placeholder="Password" name="password" id="password" />
									</div>
								</div>
								<input type="checkbox" onclick="myFunction()" value="show-password" id="checkbox2"> Show Password
								
								<div class="form-group text-center mt-4 mb-3">
									<div class="col-xs-12">
										<button
											class="btn btn-info d-block w-100 waves-effect waves-light"
											type="submit">Log In</button>
									</div>
								</div>
								<!-- <div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 mt-2 text-center">
										<div class="social mb-3">
											<a href="javascript:void(0)" class="btn btn-facebook"
												data-bs-toggle="tooltip" title="Login with Facebook">
												<i aria-hidden="true" class="ri-facebook-box-fill fs-4"></i>
											</a> <a href="javascript:void(0)" class="btn btn-googleplus"
												data-bs-toggle="tooltip" title="Login with Google">
												<i aria-hidden="true" class="ri-google-fill fs-4"></i>
											</a>
										</div>
									</div>
								</div> -->
								<!-- <div class="form-group mb-0 mt-4">
									<div class="col-sm-12 justify-content-center d-flex">
										<p>
											Don't have an account? <a
												href="authentication-register1.html"
												class="text-info font-weight-medium ms-1">Sign
												Up</a>
										</p>
									</div>
								</div> -->
							</form>
						</div>
					</div>
				</div>
				<%-- <div id="recoverform">
					<div class="logo">
						<h3 class="font-weight-medium mb-3">Recover Password</h3>
						<span class="text-muted">Enter your Email
							and instructions will be sent to you!</span>
					</div>
					<div class="row mt-3 form-material">
						<!-- Form -->
						<form class="col-12" action="index.html">
							<!-- email -->
							<div class="form-group row">
								<div class="col-12">
									<input class="form-control" type="email" required=""
										placeholder="Username" />
								</div>
							</div>
							<!-- pwd -->
							<div class="row mt-3">
								<div class="col-12">
									<button class="btn d-block w-100 btn-primary text-uppercase"
										type="submit" name="action">
										Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div> --%><br><br><br>
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
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	
    <script>
		$('document').ready(function(){
			if(localStorage.username != null) {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/restoreSession/"+localStorage.username+"",
					data : {'next': '${session}'},
					mimeType: "multipart/form-data",
					//contentType: "text/json; charset=utf-8",
					//dataType: "json",
					timeout : 100000,
					beforeSend:function(){
						$("#bodyShow").empty();
						$("#bodyShow").addClass('loader');
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data=="success"){
							window.location.href = '${pageContext.request.contextPath}/lct';
						} else {
							localStorage.clear();
							window.location.href = '${pageContext.request.contextPath}/lctlogin';
						}
					},
					error : function(e) {
						console.log("ERROR: ", e);
					},
					done : function(e) {
						console.log("DONE");						
					}
				});
			}
		});
	</script>
	<script>
	    function myFunction() {
	  	  var x = document.getElementById("password");
	  	  if (x.type === "password") {
	  	    x.type = "text";
	  	  document.getElementById("showPassword").innerHTML ="<i class=\"bi bi-eye-fill\"></i>";
	  	  } else {
	  	    x.type = "password";
	  	    document.getElementById("showPassword").innerHTML ="<i class=\"bi bi-eye\"></i>";
	  	  }
	  	}
		$(".preloader").fadeOut();
    </script>
	
	
</body>
</html>