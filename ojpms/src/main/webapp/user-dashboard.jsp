<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>User Dashboard | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/user-dashboard.css">
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
</head>

<body>
	<jsp:include page="theme.jsp" />
	<%
	if (session.getAttribute("user") == null)
		response.sendRedirect("login.jsp");
	%>
<div class="nav-buttons">

    <a href="javascript:history.back()" class="back-btn">
        ← Back
    </a>

    <a href="home.jsp" class="home-btn">
        🏠 Home
    </a>

</div>
	<!-- Background Effects -->

	<div class="bg-blur blur1"></div>
	<div class="bg-blur blur2"></div>
	<div class="bg-blur blur3"></div>

	<!-- Navbar -->

	<nav class="navbar">

		<div
			style="font-size: 28px; font-weight: 800; color: white; z-index: 1;">
			COMP <span style="color: #7C3AED;">Portal</span>
		</div>

		<div class="nav-links">

			<a href="viewjob"> View Jobs </a> <a href="logout"> Logout </a> <a
				href="profile?id=${user.id}"> Profile </a>

		</div>


	</nav>

	<!-- Dashboard -->

	<section class="dashboard">

		<!-- Left Side -->

		<div class="dashboard-left">

			<span class="tag"> Job Seeker Portal </span>

			<h1>Welcome, ${user.name}</h1>

			<p>Explore top job opportunities, apply instantly, and track your
				career journey with COMP Portal.</p>

			<div class="dashboard-buttons">

				<a href="viewjob" class="btn"> View Jobs </a>

			</div>

		</div>

		<!-- Right Side -->

		<div class="dashboard-right">

			<div class="glass-card">

				<h3>Quick Overview</h3>

				<p>Available Jobs</p>

				<h2>100+</h2>

				<p>Top Companies</p>

				<h2>50+</h2>

				<p>Career Growth</p>

				<h2>Unlimited</h2>

			</div>

		</div>

	</section>

	<!-- Features -->

	<section class="features">

		<h2>Why Choose COMP Portal?</h2>

		<div class="card-container">

			<div class="card">

				<h3>Explore Jobs</h3>

				<p>Find jobs based on skills, experience and location.</p>

			</div>

			<div class="card">

				<h3>Easy Apply</h3>

				<p>Apply instantly with one click process.</p>

			</div>

			<div class="card">

				<h3>Top Recruiters</h3>

				<p>Connect with trusted companies and recruiters.</p>

			</div>

			<div class="card">

				<h3>Career Growth</h3>

				<p>Build your future with better opportunities.</p>

			</div>

		</div>

	</section>

	<!-- Footer -->

	<footer>

		<h3>COMP Portal</h3>

		<p>Build Your Career With Confidence</p>

	</footer>
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