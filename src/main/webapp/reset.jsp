<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password | COMP Portal</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<!-- Remix Icon -->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animation.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #0F172A, #1E293B, #312E81);
	overflow: hidden;
}

/* Background Glow */
body::before {
	content: "";
	position: absolute;
	width: 300px;
	height: 300px;
	background: #4F46E5;
	border-radius: 50%;
	top: -100px;
	left: -100px;
	filter: blur(100px);
}

body::after {
	content: "";
	position: absolute;
	width: 350px;
	height: 350px;
	background: #38BDF8;
	border-radius: 50%;
	bottom: -120px;
	right: -120px;
	filter: blur(100px);
}

/* Card */
.container {
	width: 100%;
	max-width: 450px;
	padding: 40px;
	position: relative;
	z-index: 1;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(15px);
	border: 1px solid rgba(255, 255, 255, 0.15);
	border-radius: 20px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, .3);
}

.title {
	text-align: center;
	color: #E2E8F0;
	margin-bottom: 10px;
	font-size: 2rem;
}

.subtitle {
	text-align: center;
	color: #CBD5E1;
	margin-bottom: 30px;
	font-size: 14px;
}

/* Input */
.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #E2E8F0;
}

input {
	width: 100%;
	padding: 14px;
	border: none;
	outline: none;
	border-radius: 10px;
	background: rgba(255, 255, 255, .08);
	color: white;
	border: 1px solid rgba(255, 255, 255, .1);
}

input::placeholder {
	color: #94A3B8;
}

/* Button */
.btn {
	width: 100%;
	padding: 14px;
	border: none;
	border-radius: 10px;
	background: linear-gradient(135deg, #4F46E5, #7C3AED);
	color: white;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: .3s;
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 10px 20px rgba(79, 70, 229, .4);
}

/* Message */
.error {
	text-align: center;
	margin-bottom: 20px;
	color: #fca5a5;
	background: rgba(239, 68, 68, .15);
	padding: 12px;
	border-radius: 8px;
}

/* Link */
.links {
	text-align: center;
	margin-top: 20px;
}

.links a {
	text-decoration: none;
	color: #38BDF8;
}

.links a:hover {
	text-decoration: underline;
}

/* Responsive */
@media ( max-width :500px) {
	.container {
		width: 90%;
		padding: 30px 20px;
	}
	.title {
		font-size: 1.6rem;
	}
}
</style>

</head>

<body>
<div class="nav-buttons">

    <a href="javascript:history.back()" class="back-btn">
        ← Back
    </a>

    <a href="home.jsp" class="home-btn">
        🏠 Home
    </a>

</div>
<jsp:include page="theme.jsp"/>
	<div class="container">

		<h1 class="title">Reset Password</h1>

		<p class="subtitle">Enter your registered email address and create
			a new password.</p>

		<c:if test="${errorMsg != null}">
			<div class="error">${errorMsg}</div>
		</c:if>

		<form action="reset">

			<div class="form-group">
				<label>Email Address</label> <input type="email" name="email"
					placeholder="Enter Existing Email ID" required>
			</div>

			<div class="form-group">
				<label>New Password</label> <input type="password" name="password"
					placeholder="Enter New Password" required>
			</div>

			<input type="submit" value="RESET PASSWORD" class="btn">

		</form>

		<div class="links">
			<a href="login.jsp">Back to Login</a>
		</div>

	</div>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<!-- GSAP -->

	<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

	<!-- PARTICLE BACKGROUND -->

	<script src="<%=request.getContextPath()%>/js/particles3d.js"></script>

	<!-- FINAL UI JS -->

	<script src="<%=request.getContextPath()%>/js/final.js"></script>
</body>
</html>