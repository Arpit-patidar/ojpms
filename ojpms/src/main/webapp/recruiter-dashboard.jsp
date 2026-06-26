<%@ page language="java" contentType="text/html;
charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Recruiter Dashboard | COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/recruiter-dashboard.css">
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
<style type="text/css">
.apply-btn {
	background: linear-gradient(135deg, #10B981, #2563EB);
	color: white !important;
	padding: 10px 18px;
	border-radius: 12px;
	font-weight: 700;
	text-decoration: none;
	box-shadow: 0 8px 20px rgba(16, 185, 129, .25);
	transition: 0.3s ease;
}

.apply-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 12px 30px rgba(16, 185, 129, .35);
}
</style>
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
	<!-- Background Blur -->

	<div class="bg-blur blur1"></div>
	<div class="bg-blur blur2"></div>
	<div class="bg-blur blur3"></div>

	<!-- Navbar -->

	<header>

		<nav class="navbar">

			<div
				style="font-size: 28px; font-weight: 800; color: white; z-index: 1;">
				COMP <span style="color: #7C3AED;">Portal</span>
			</div>
			<div class="nav-links">

				<a href="post-job.jsp">Post Job</a> <a
					href="viewjob.jsp">View Jobs</a> <a
					href="viewApplicants" class="apply-btn"> View Applicants </a> <a
					href="profile?id=${user.id}">Profile</a> <a href="logout">Logout</a>

			</div>

		</nav>

	</header>

	<!-- Dashboard Hero -->

	<section class="dashboard">

		<div class="dashboard-left">

			<span class="tag"> Recruiter Panel </span>

			<h1>Welcome, ${user.name}</h1>

			<p>Manage job postings, find top candidates, and hire efficiently
				using OJPMS.</p>

			<div class="dashboard-buttons">

				<a href="post-job.jsp" class="btn"> Post New Job </a>

			</div>

		</div>

		<div class="dashboard-right">

			<div class="glass-card">

				<h3>Quick Overview</h3>

				<p>Total Jobs Posted</p>

				<h2>25+</h2>

				<p>Applications Received</p>

				<h2>120+</h2>

			</div>

		</div>

	</section>

	<!-- Quick Features -->

	<section class="features">

		<h2>Recruiter Features</h2>

		<div class="card-container">

			<div class="card">

				<h3>Post Jobs</h3>

				<p>Create and publish new job openings.</p>

			</div>

			<div class="card">

				<h3>Manage Jobs</h3>

				<p>Update or remove job listings easily.</p>

			</div>

			<div class="card">

				<h3>View Applicants</h3>

				<p>Check candidate applications quickly.</p>

			</div>

			<div class="card">

				<h3>Hiring Analytics</h3>

				<p>Track recruitment progress effectively.</p>

			</div>

		</div>

	</section>


	<!-- Footer -->

	<footer>

		<h3>OJPMS</h3>

		<p>Recruiter Dashboard</p>

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