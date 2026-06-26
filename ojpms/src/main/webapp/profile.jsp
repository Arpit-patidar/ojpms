
<%@ page language="java" contentType="text/html;
charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Profile | OJPMS</title>
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
	background: linear-gradient(135deg, var(- -bg-dark), var(- -bg-second),
		var(- -bg-third));
	min-height: 100vh;
	padding: 50px 20px;
	color: var(- -text);
}

/* CONTAINER */
.recruiter-container {
	max-width: 1200px;
	margin: auto;
	background: rgba(17, 24, 39, .92);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, .08);
	border-radius: 28px;
	overflow: hidden;
	box-shadow: 0 20px 60px rgba(0, 0, 0, .45);
}

/* HEADER */
.recruiter-cover {
	padding: 50px;
	background: linear-gradient(135deg, #312E81, #111827, #0B1120);
}

/* PROFILE INFO */
.profile-info h1 {
	font-size: 42px;
	font-weight: 700;
	color: var(- -text);
}

.profile-info p {
	color: var(- -light);
	margin-top: 10px;
	font-size: 16px;
}

/* STATS */
.stat-card {
	padding: 30px;
	background: #1E293B;
	border: 1px solid rgba(255, 255, 255, .08);
	border-radius: 22px;
	text-align: center;
	transition: .3s;
}

.stat-card h2 {
	color: #38BDF8;
	font-size: 34px;
}

.stat-card p {
	color: var(- -light);
	font-size: 15px;
}

/* MAIN CARD */
.card {
	background: #111827;
	border: 1px solid rgba(255, 255, 255, .08);
	border-radius: 22px;
	padding: 30px;
	color: var(- -text);
}

.card h2 {
	color: white;
	margin-bottom: 25px;
}

/* DETAIL ROW */
.detail-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 0;
	border-bottom: 1px solid rgba(255, 255, 255, .08);
}

.detail-row span {
	color: var(- -muted);
	font-size: 15px;
}

.detail-row strong {
	color: var(- -text);
	font-size: 15px;
}

/* INSIGHT BOX */
.insight-box {
	background: #1E293B;
	padding: 20px;
	border-radius: 18px;
	margin-bottom: 16px;
	border: 1px solid rgba(255, 255, 255, .08);
}

.insight-box span {
	color: var(- -muted);
	font-size: 14px;
}

.insight-box h3 {
	margin-top: 10px;
	color: white;
}

/* BUTTONS */
.primary-btn {
	background: linear-gradient(135deg, #4F46E5, #7C3AED);
	color: white;
	border: none;
	padding: 16px 32px;
	border-radius: 14px;
	font-weight: 700;
}

.secondary-btn {
	background: #1E293B;
	border: 1px solid rgba(255, 255, 255, .08);
	color: var(- -text);
	padding: 16px 32px;
	border-radius: 14px;
}

/* HOVER */
.stat-card:hover, .card:hover, .insight-box:hover {
	transform: translateY(-5px);
	transition: .3s;
}

:root { -
	-bg-dark: #0B1120; -
	-bg-second: #111827; -
	-bg-third: #1E293B; -
	-text: #F8FAFC; -
	-light: #CBD5E1; -
	-muted: #94A3B8; -
	-primary: #4F46E5; -
	-secondary: #7C3AED; -
	-accent: #38BDF8; -
	-border: rgba(255, 255, 255, .08); -
	-glass: rgba(255, 255, 255, .04);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: linear-gradient(135deg, var(- -bg-dark), var(- -bg-second),
		var(- -bg-third));
	min-height: 100vh;
	padding: 50px 20px;
	position: relative;
	overflow-x: hidden;
	color: var(- -text);
}

/* ==========================
   BACKGROUND ANIMATION
========================== */
.background-blur {
	position: fixed;
	border-radius: 50%;
	filter: blur(120px);
	z-index: -1;
	animation: floatBlob 8s infinite alternate;
}

.blur1 {
	width: 350px;
	height: 350px;
	background: rgba(79, 70, 229, .22);
	top: -120px;
	left: -120px;
}

.blur2 {
	width: 320px;
	height: 320px;
	background: rgba(56, 189, 248, .16);
	right: -100px;
	bottom: -100px;
}

@
keyframes floatBlob {from { transform:translateY(0);
	
}

to {
	transform: translateY(-35px);
}

}

/* ==========================
   CONTAINER
========================== */
.recruiter-container {
	max-width: 1200px;
	margin: auto;
	background: rgba(17, 24, 39, .88);
	backdrop-filter: blur(20px);
	border: 1px solid var(- -border);
	border-radius: 30px;
	overflow: hidden;
	box-shadow: 0 20px 60px rgba(0, 0, 0, .45);
}

/* ==========================
   HEADER / COVER
========================== */
.recruiter-cover {
	padding: 55px;
	background: linear-gradient(135deg, #312E81, #1E293B, #0B1120);
	border-bottom: 1px solid var(- -border);
}

.avatar-section {
	display: flex;
	align-items: center;
	gap: 30px;
}

.avatar {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 58px;
	font-weight: 700;
	color: white;
	background: linear-gradient(135deg, var(- -primary), var(- -accent));
	border: 6px solid rgba(255, 255, 255, .08);
	box-shadow: 0 0 40px rgba(79, 70, 229, .30);
}

/* ==========================
   PROFILE INFO
========================== */
.profile-info h1 {
	font-size: 42px;
	font-weight: 700;
	color: var(- -text);
}

.profile-info p {
	color: var(- -light);
	margin-top: 10px;
	font-size: 16px;
}

.recruiter-badge {
	display: inline-block;
	margin-top: 14px;
	padding: 10px 20px;
	border-radius: 30px;
	background: rgba(79, 70, 229, .18);
	border: 1px solid rgba(79, 70, 229, .25);
	color: #A5B4FC;
	font-size: 14px;
	font-weight: 700;
	letter-spacing: .5px;
}

/* ==========================
   CONTENT
========================== */
.dashboard-content {
	padding: 40px;
}

/* ==========================
   STATS
========================== */
.stats-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 22px;
}

.stat-card {
	padding: 30px;
	background: var(- -bg-third);
	border: 1px solid var(- -border);
	border-radius: 22px;
	text-align: center;
	transition: .35s;
}

.stat-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 12px 35px rgba(79, 70, 229, .18);
}

.stat-card h2 {
	font-size: 36px;
	color: var(- -accent);
	margin-bottom: 8px;
}

.stat-card p {
	color: var(- -muted);
}

/* ==========================
   MAIN GRID
========================== */
.main-grid {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 25px;
	margin-top: 35px;
}

/* ==========================
   CARD
========================== */
.card {
	background: var(- -bg-third);
	border: 1px solid var(- -border);
	border-radius: 26px;
	padding: 30px;
}

.card h2 {
	color: var(- -text);
	margin-bottom: 28px;
}

/* ==========================
   DETAIL ROW
========================== */
.detail-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 0;
	border-bottom: 1px solid rgba(255, 255, 255, .06);
}

.detail-row:last-child {
	border: none;
}

.detail-row span {
	color: var(- -muted);
}

.detail-row strong {
	color: var(- -text);
}

/* ==========================
   INSIGHTS
========================== */
.insight-box {
	background: var(- -bg-second);
	padding: 20px;
	border-radius: 18px;
	border: 1px solid var(- -border);
	margin-bottom: 16px;
	transition: .3s;
}

.insight-box:hover {
	transform: translateY(-5px);
}

.insight-box span {
	color: var(- -muted);
	font-size: 14px;
}

.insight-box h3 {
	margin-top: 10px;
	color: var(- -text);
}

/* ==========================
   BUTTONS
========================== */
.action-buttons {
	display: flex;
	gap: 18px;
	margin-top: 35px;
}

.primary-btn, .secondary-btn {
	padding: 16px 32px;
	border: none;
	border-radius: 14px;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	text-decoration: none;
	transition: .3s;
}

.primary-btn {
	background: linear-gradient(135deg, var(- -primary), var(- -secondary));
	color: white;
}

.secondary-btn {
	background: var(- -bg-third);
	border: 1px solid var(- -border);
	color: var(- -light);
}

.primary-btn:hover, .secondary-btn:hover {
	transform: translateY(-4px);
}

/* ==========================
   RESPONSIVE
========================== */
@media ( max-width :900px) {
	.avatar-section {
		flex-direction: column;
		text-align: center;
	}
	.stats-grid {
		grid-template-columns: 1fr 1fr;
	}
	.main-grid {
		grid-template-columns: 1fr;
	}
	.action-buttons {
		flex-direction: column;
	}
}

@media ( max-width :600px) {
	.stats-grid {
		grid-template-columns: 1fr;
	}
	.profile-info h1 {
		font-size: 30px;
	}
	.avatar {
		width: 120px;
		height: 120px;
		font-size: 44px;
	}
}
</style>

</head>

<body>
<jsp:include page="theme.jsp"/>
<div class="nav-buttons">

    <a href="javascript:history.back()" class="back-btn">
        ← Back
    </a>

    <a href="home.jsp" class="home-btn">
        🏠 Home
    </a>

</div>
	<div class="background-blur blur1"></div>
	<div class="background-blur blur2"></div>

	<div class="recruiter-container">

		<!-- HEADER -->
		<div class="recruiter-cover">

			<div class="avatar-section">

				<div class="avatar">${user.name.charAt(0)}</div>

				<div class="profile-info">

					<h1>${user.name}</h1>

					<div class="recruiter-badge">RECRUITER</div>

					<p>${user.email}</p>

					<!-- 	<span class="status">
					● Active Hiring
				</span> -->

				</div>

			</div>

		</div>

		<!-- DASHBOARD -->
		<div class="dashboard-content">

			<!-- QUICK STATS -->
			<div class="stats-grid">

				<div class="stat-card">

					<h2>25+</h2>

					<p>Jobs Posted</p>

				</div>

				<div class="stat-card">

					<h2>180+</h2>

					<p>Candidates</p>

				</div>

				<div class="stat-card">

					<h2>45</h2>

					<p>Interviews Scheduled</p>

				</div>

				<div class="stat-card">

					<h2>12</h2>

					<p>Open Positions</p>

				</div>

			</div>

			<!-- MAIN GRID -->
			<div class="main-grid">

				<!-- PROFILE INFO -->
				<div class="card">

					<h2>Recruiter Information</h2>

					<div class="detail-row">

						<span>User ID</span> <strong> #${user.id} </strong>

					</div>

					<div class="detail-row">

						<span>Full Name</span> <strong> ${user.name} </strong>

					</div>

					<div class="detail-row">

						<span>Email</span> <strong> ${user.email} </strong>

					</div>

					<div class="detail-row">

						<span>Password</span> <strong> ******** </strong>

					</div>

					<div class="detail-row">

						<span>Role</span> <strong> ${user.role} </strong>

					</div>

				</div>

				<!-- HIRING INSIGHTS -->
				<div class="card">

					<h2>Hiring Insights</h2>

					<div class="insight-box">

						<span> Most Hiring Role </span>

						<h3>Software Engineer</h3>

					</div>

					<div class="insight-box">

						<span> Candidate Response Rate </span>

						<h3>84%</h3>

					</div>

					<div class="insight-box">

						<span> Recruitment Efficiency </span>

						<h3>Excellent</h3>

					</div>

				</div>

			</div>

			<!-- ACTIONS -->
			<div class="action-buttons">

				<form action="editProfile">

					<input type="hidden" name="id" value="${user.id}">

					<button class="primary-btn">Edit Profile</button>

				</form>

				<!-- <a
			href="post-job.jsp"
			class="secondary-btn">

				Post Job

			</a> -->

			</div>

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