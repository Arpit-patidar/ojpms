<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Post Job - COMP Portal</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/post-job.css">
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
<jsp:include page="theme.jsp"/>
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

			<a href="recruiter-dashboard.jsp"> Dashboard </a> 
			<a href="logout">
				Logout </a>

		</div>

	</nav>

	<!-- Main Section -->

	<section class="post-job-container">

		<!-- Left Content -->

		<div class="left-panel">

			<span class="tag"> Recruiter Portal </span>

			<h1>Post New Job</h1>

			<p>Create professional job postings and hire the best candidates
				faster using OJPMS.</p>

			<div class="info-card">

				<h3>Quick Tips</h3>

				<ul>
					<li>Use clear job title</li>
					<li>Add required skills</li>
					<li>Mention salary details</li>
					<li>Provide deadline</li>
				</ul>

			</div>

		</div>

		<!-- Form Card -->

		<div class="post-job-card">

			<h2>Create Job Posting</h2>

			<form action="postjob" method="post">

				<div class="row">

					<div class="input-group">

						<label> Job Title </label> <input type="text" name="title"
							placeholder="Java Developer" required>

					</div>

					<!-- <div class="input-group">

						<label>
							Company Name
						</label>

						<input
						type="text"
						name="company"

						placeholder=
						"ABC Pvt Ltd"

						required>

					</div> -->

				</div>

				<div class="input-group">

					<label> Description </label>

					<textarea name="description" rows="5"
						placeholder="Enter job description" required>

					</textarea>

				</div>

				<div class="row">

					<div class="input-group">

						<label> Location </label> <input type="text" name="location"
							placeholder="Pune" required>

					</div>

					<div class="input-group">

						<label> Salary </label> <input type="number" name="salary"
							placeholder="500000" required>

					</div>

				</div>

				<!-- <div class="row">

					<div class="input-group">

						<label>
							Experience
						</label>

						<input
						type="text"
						name="experience"

						placeholder=
						"0-2 Years">

					</div>

					<div class="input-group">

						<label>
							Job Type
						</label>

						<select
						name="jobType">

							<option>
								Full Time
							</option>

							<option>
								Internship
							</option>

							<option>
								Remote
							</option>

						</select>

					</div>

				</div> -->

				<!-- <div class="input-group">

					<label>
						Required Skills
					</label>

					<input
					type="text"
					name="skills"

					placeholder=
					"Java, SQL, Spring Boot">

				</div> -->

				<!-- <div class="input-group">

					<label>
						Application Deadline
					</label>

					<input
					type="date"
					name="deadline">

				</div> -->

				<button type="submit" class="btn">Post Job</button>

			</form>

		</div>

	</section>
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