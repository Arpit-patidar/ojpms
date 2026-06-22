<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Available Jobs</title>

<link rel="stylesheet" href="<c:url value='/css/viewjob.css'/>">
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
	<div class="nav-buttons">

		<a href="javascript:history.back()" class="back-btn"> < Back </a> 🏠
		Home </a>

	</div>


	<div class="container">

		<header class="jobs-header">

			<h1>Available Jobs</h1>

			<a href="<c:url value='/viewjob'/>" class="refresh-btn"> Refresh
				Jobs </a>

		</header>

		<section class="search-section">

			<form action="<c:url value='/search'/>" method="get"
				class="search-box">

				<input type="text" name="search"
					placeholder="Search jobs by title, skill, location...">

				<button type="submit" class="search-btn">Search</button>

			</form>

		</section>
		<section class="sort-section">

			<span class="sort-label"> Sort Jobs: </span>

			<div class="sort-buttons">

				<a href="viewjob?sortBy=latest" class="sort-btn"> Latest Jobs </a> <a
					href="viewjob?sortBy=salary" class="sort-btn"> Highest Salary </a>

				<a href="viewjob?sortBy=applied" class="sort-btn"> Most Applied
				</a>

			</div>

		</section>
		<section class="jobs-section">

			<c:choose>

				<c:when test="${empty jobs}">

					<div class="no-jobs-message">

						<p>No jobs found matching your criteria.</p>

					</div>

				</c:when>

				<c:otherwise>

					<div class="jobs-grid">

						<c:forEach var="job" items="${jobs}">

							<article class="job-card">

								<div class="job-header">

									<h2 class="job-title">${job.title}</h2>

								</div>

								<div class="job-details">

									<div class="job-info">

										<span class="info-label"> Description: </span>

										<p class="info-value">${job.description}</p>

									</div>

									<div class="job-info">

										<span class="info-label"> Location: </span> <span
											class="info-value"> ${job.location} </span>

									</div>

									<div class="job-info">

										<span class="info-label"> Salary: </span> <span
											class="info-value"> ${job.salary} </span>

									</div>

								</div>

								<div class="job-actions">

									<!-- APPLY JOB -->

									<form action="application-form.jsp" method="post">

										<input type="hidden" name="jobId" value="${job.id}">

										<button type="submit" class="apply-btn">Apply Now</button>

									</form>

									<!-- SAVE JOB -->

									<form action="savejob" method="post">

										<input type="hidden" name="jobId" value="${job.id}">

										<button type="submit" class="save-btn">Save Job</button>

									</form>

									<c:if test="${appliedId == job.id && not empty error}">

										<div class="error-message">

											<span class="error-icon">⚠</span>

											<p>${error}</p>

										</div>

									</c:if>

								</div>

							</article>

						</c:forEach>

					</div>

				</c:otherwise>

			</c:choose>

		</section>

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