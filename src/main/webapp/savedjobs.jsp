<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page import="com.jsp.ojpms.entity.User"%>
<%@ page import="com.jsp.ojpms.entity.Job"%>
<%@ page import="java.util.List"%>

<%
User user = (User) session.getAttribute("user");
List<Job> savedJobs = user.getSavedJobs();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Saved Jobs</title>
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
body {
	font-family: Arial, sans-serif;
	background: #f4f4f4;
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
	color: #333;
}

.container {
	width: 90%;
	margin: auto;
}

.job-card {
	background: white;
	padding: 20px;
	margin: 15px 0;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.job-card h2 {
	color: #007bff;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.apply-btn {
	background: green;
	color: white;
}

.remove-btn {
	background: red;
	color: white;
}

.top-btn {
	background: #007bff;
	color: white;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}
</style>

</head>
<body>





	<jsp:include page="theme.jsp" />
<div class="nav-buttons">

    <a href="javascript:history.back()" class="back-btn">
        ← Back
    </a>

    <a href="home.jsp" class="home-btn">
        🏠 Home
    </a>

</div>

	<div class="container">

		<h1>Saved Jobs</h1>

		<a href="viewjob" class="top-btn">Back To Jobs</a> <br>
		<br>

		<%
		if (savedJobs == null || savedJobs.isEmpty()) {
		%>

		<h3>No Saved Jobs Found</h3>

		<%
		} else {

		for (Job job : savedJobs) {
		%>

		<div class="job-card">

			<h2><%=job.getTitle()%></h2>

			<p>
				<b>Description:</b>
				<%=job.getDescription()%>
			</p>

			<p>
				<b>Location:</b>
				<%=job.getLocation()%>
			</p>

			<p>
				<b>Salary:</b> ₹
				<%=job.getSalary()%>
			</p>

			<form action="application-form.jsp" method="post">

				<input type="hidden" name="jobId" value="<%=job.getId()%>">

				<button class="btn apply-btn">Apply Now</button>

			</form>

			<br>

			<form action="unsavejob" method="post">

				<input type="hidden" name="jobId" value="<%=job.getId()%>">

				<button class="btn remove-btn">Remove</button>

			</form>

		</div>

		<%
		}
		}
		%>

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