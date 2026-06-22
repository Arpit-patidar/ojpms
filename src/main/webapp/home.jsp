
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>COMP Portal | Build Your Career</title>

<!-- Google Font -->
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
	<!--================ LOADER ================-->

	<div id="loader">

		<div class="loader-logo">

			<h1>COMP PORTAL</h1>

			<div class="loader-line">
				<span></span>
			</div>

			<p>Loading Experience...</p>

		</div>

	</div>

	<!--================ BACKGROUND ================-->

	<canvas id="bgCanvas"></canvas>

	<div class="cursor-light"></div>

	<div class="aurora"></div>

	<div class="blob blob1"></div>

	<div class="blob blob2"></div>

	<div class="blob blob3"></div>

	<div class="grid-bg"></div>

	<div class="noise"></div>

	<!--================ HEADER ================-->

	<header>

		<nav class="navbar">

			<div class="logo">

				<h1>
					COMP <span>Portal</span>
				</h1>

			</div>

			<div class="nav-links">

				<a href="#">Home</a> <a href="#about">About</a> <a href="#features">Features</a>

				<a href="#workflow">Workflow</a> <a href="#stats">Stats</a> <a
					href="login.jsp">Login</a> <a href="register.jsp" class="nav-btn">

					Register </a>

			</div>

			<div class="menu-btn">

				<i class="ri-menu-3-line"></i>

			</div>

		</nav>

	</header>

	<!--================ HERO ================-->

	<section class="hero">

		<div class="hero-left">

			<div class="hero-tag">

				<i class="ri-verified-badge-fill"></i> #1 Smart Job Portal

			</div>

			<h1>

				Build Your <span>Career</span> With Confidence

			</h1>

			<p>Discover thousands of jobs from trusted companies. Connect
				with recruiters. Apply instantly. Track your applications. Build
				your future.</p>

			<div class="hero-buttons">

				<a href="register.jsp" class="btn"> Get Started </a> <a
					href="login.jsp" class="btn-outline"> Explore Jobs </a> <a
					href="application-form.jsp" class="btn"> Apply Now </a>

			</div>

		</div>

		<div class="hero-right">

			<div class="glass-card floating">

				<h3>Trending Jobs</h3>

				<ul>

					<li>Java Developer</li>

					<li>Backend Developer</li>

					<li>Spring Boot</li>

					<li>Full Stack Developer</li>

					<li>Software Engineer</li>

					<li>QA Engineer</li>

					<li>UI Developer</li>

				</ul>

			</div>

		</div>

	</section>

	<!--================ COMPANY ================-->

	<section class="companies">

		<h2>Trusted By</h2>

		<div class="company-slider">

			<div class="company-track">

				<span>Google</span> <span>Amazon</span> <span>Microsoft</span> <span>Oracle</span>

				<span>Infosys</span> <span>TCS</span> <span>Accenture</span> <span>Capgemini</span>

				<span>IBM</span> <span>QSpiders</span> <span>JSpiders</span> <span>Google</span>

				<span>Amazon</span> <span>Microsoft</span> <span>Oracle</span> <span>Infosys</span>

				<span>TCS</span> <span>Accenture</span> <span>Capgemini</span> <span>IBM</span>

			</div>

		</div>

	</section>

	<!--================ ABOUT ================-->

	<section class="about" id="about">

		<h2>Why Choose COMP Portal?</h2>

		<p>COMP Portal connects talented candidates with top recruiters
			through a modern hiring platform designed for speed, transparency and
			growth.</p>

	</section>

	<!--================ FEATURES ================-->

	<section class="features" id="features">

		<h2>Powerful Features</h2>

		<div class="card-container">

			<div class="card">

				<i class="ri-search-eye-line"></i>

				<h3>Smart Search</h3>

				<p>Find jobs based on skills and experience.</p>

			</div>

			<div class="card">

				<i class="ri-send-plane-fill"></i>

				<h3>Easy Apply</h3>

				<p>One click application process.</p>

			</div>

			<div class="card">

				<i class="ri-mail-send-fill"></i>

				<h3>Email Alerts</h3>

				<p>Receive instant notifications.</p>

			</div>

			<div class="card">

				<i class="ri-briefcase-fill"></i>

				<h3>Recruiter Panel</h3>

				<p>Manage jobs and applications.</p>

			</div>

		</div>

	</section>

	<!--================ WORKFLOW ================-->

	<section class="workflow" id="workflow">

		<h2>How It Works</h2>

		<div class="timeline">

			<div class="timeline-item">

				<div class="circle">1</div>

				<h3>Register</h3>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">2</div>

				<h3>Login</h3>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">3</div>

				<h3>Search Jobs</h3>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">4</div>

				<h3>Apply</h3>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">5</div>

				<h3>Get Hired</h3>

			</div>

		</div>

	</section>

	<!--================ STATS ================-->

	<section class="stats" id="stats">

		<div class="stat-box">

			<h2 class="counter" data-target="1000">0</h2>

			<p>Jobs Posted</p>

		</div>

		<div class="stat-box">

			<h2 class="counter" data-target="500">0</h2>

			<p>Companies</p>

		</div>

		<div class="stat-box">

			<h2 class="counter" data-target="2000">0</h2>

			<p>Registered Users</p>

		</div>

		<div class="stat-box">

			<h2 class="counter" data-target="98">0</h2>

			<p>Success Rate %</p>

		</div>

	</section>

	<!--================ CTA ================-->

	<section class="cta">

		<h2>Ready To Build Your Career?</h2>

		<p>Join thousands of professionals and start your journey today.</p>

		<a href="register.jsp" class="btn"> Create Free Account </a>

	</section>

	<!--================ FOOTER ================-->

	<footer>

		<h2>COMP Portal</h2>

		<p>Build Your Career With Confidence</p>

		<div class="social">

			<i class="ri-facebook-fill"></i> <i class="ri-instagram-line"></i> <i
				class="ri-linkedin-fill"></i> <i class="ri-github-fill"></i>

		</div>

		<p>© 2026 COMP Portal</p>

	</footer>

	<!--================ JS ================-->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

	<script src="<%=request.getContextPath()%>/js/galaxy.js"></script>

	<script src="<%=request.getContextPath()%>/js/ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/final.js"></script>
	<%--<script src="<%=request.getContextPath()%>/js/matrix.js"></script> 

<script src="<%=request.getContextPath()%>/js/effects.js"></script> --%>
</body>

</html>

