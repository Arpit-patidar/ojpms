<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

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

<!-- Remix Icons -->

<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet">

<!-- CSS -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/theme.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animation.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css">

</head>

<body>

	<!-- Theme -->



	<!-- =========================
        LOADER
========================= -->

	<div id="loader">

		<div class="loader-logo">

			<h1>COMP PORTAL</h1>

			<div class="loader-line">

				<span></span>

			</div>

			<p>Loading Experience...</p>

		</div>

	</div>

	<!-- =========================
        THREE JS
========================= -->

	<div id="three-container"></div>

	<!-- =========================
        BACKGROUND
========================= -->

	<div class="bg-mesh">

		<div class="blob blob1"></div>

		<div class="blob blob2"></div>

		<div class="blob blob3"></div>

	</div>

	<div class="grid-bg"></div>

	<div class="noise"></div>

	<div class="aurora"></div>

	<div class="cursor-light"></div>

	<!-- =========================
        HEADER
========================= -->

	<header>

		<nav class="liquid-nav" id="nav">

			<div class="liquid-glare-container">

				<div class="liquid-glare" id="glare"></div>

			</div>

			<div class="logo">

				<h2>

					COMP <span>Portal</span>

				</h2>

			</div>

			<div class="nav-items">

				<div class="active-pill" id="active-pill"></div>

				<a href="#" class="nav-btn active">

					<div class="btn-content">

						<i class="ri-home-5-line"></i> <span>Home</span>

					</div>

				</a> <a href="#about" class="nav-btn">

					<div class="btn-content">

						<i class="ri-information-line"></i> <span>About</span>

					</div>

				</a> <a href="#features" class="nav-btn">

					<div class="btn-content">

						<i class="ri-star-line"></i> <span>Features</span>

					</div>

				</a> <a href="#workflow" class="nav-btn">

					<div class="btn-content">

						<i class="ri-flow-chart"></i> <span>Workflow</span>

					</div>

				</a> <a href="#stats" class="nav-btn">

					<div class="btn-content">

						<i class="ri-bar-chart-box-line"></i> <span>Stats</span>

					</div>

				</a> <a href="login.jsp" class="nav-btn">

					<div class="btn-content">

						<i class="ri-login-circle-line"></i> <span>Login</span>

					</div>

				</a> <a href="register.jsp" class="nav-btn">

					<div class="btn-content">

						<i class="ri-user-add-line"></i> <span>Register</span>

					</div>

				</a>

			</div>

			<div class="divider"></div>

			<button class="theme-btn" id="theme-btn">

				<div class="theme-icon-wrapper">

					<i class="ri-sun-line sun"></i> <i class="ri-moon-line moon"></i>

				</div>

			</button>

		</nav>

	</header>

	<!-- =========================
        HERO
========================= -->

	<section class="hero">

		<div class="hero-left">

			<div class="hero-tag">

				<i class="ri-verified-badge-fill"></i> #1 Smart Job Portal

			</div>

			<h1>

				Build Your <span>Dream Career</span> With Confidence

			</h1>

			<p>Discover thousands of verified jobs, connect with top
				recruiters, apply instantly, and build your future using COMP
				Portal.</p>

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

					<li>Spring Boot Developer</li>

					<li>Backend Developer</li>

					<li>Full Stack Developer</li>

					<li>Software Engineer</li>

					<li>UI Developer</li>

					<li>QA Engineer</li>

				</ul>

			</div>

		</div>

	</section>
	<!-- =========================
        COMPANIES
========================= -->

	<section class="companies">

		<h2>Trusted By Top Companies</h2>

		<div class="company-slider">

			<div class="company-track">

				<span>Google</span> <span>Microsoft</span> <span>Amazon</span> <span>Oracle</span>
				<span>IBM</span> <span>TCS</span> <span>Infosys</span> <span>Capgemini</span>
				<span>Accenture</span> <span>Wipro</span> <span>Google</span> <span>Microsoft</span>
				<span>Amazon</span> <span>Oracle</span> <span>IBM</span>

			</div>

		</div>

	</section>

	<!-- =========================
        ABOUT
========================= -->

	<section class="about" id="about">

		<h2>Why Choose COMP Portal?</h2>

		<p>COMP Portal is a modern placement management system designed
			for students, recruiters and administrators. Search jobs, apply
			instantly, manage applications, and build your professional career
			with confidence.</p>

	</section>

	<!-- =========================
        FEATURES
========================= -->

	<section class="features" id="features">

		<h2>Powerful Features</h2>

		<div class="card-container">

			<div class="card">

				<i class="ri-search-eye-line"></i>

				<h3>Smart Search</h3>

				<p>Find jobs based on skills, qualification and experience.</p>

			</div>

			<div class="card">

				<i class="ri-send-plane-fill"></i>

				<h3>Easy Apply</h3>

				<p>Apply to jobs with one click using a simple interface.</p>

			</div>

			<div class="card">

				<i class="ri-notification-4-fill"></i>

				<h3>Instant Alerts</h3>

				<p>Receive real time notifications for every opportunity.</p>

			</div>

			<div class="card">

				<i class="ri-briefcase-4-fill"></i>

				<h3>Recruiter Panel</h3>

				<p>Recruiters can manage jobs, applications and hiring easily.</p>

			</div>

		</div>

	</section>

	<!-- =========================
        WORKFLOW
========================= -->

	<section class="workflow" id="workflow">

		<h2>How It Works</h2>

		<div class="timeline">

			<div class="timeline-item">

				<div class="circle">1</div>

				<a href="register.jsp"><h3>Register</h3></a>

			</div>

			<div class="line"></div>

			<div class="timeline-item">

				<div class="circle">2</div>

				<a href="login.jsp"><h3>Login</h3></a>

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

	<!-- =========================
        STATS
========================= -->

	<section class="stats" id="stats">

		<div class="stat-box">

			<h2 class="counter" data-target="1500">0</h2>

			<p>Jobs Posted</p>

		</div>

		<div class="stat-box">

			<h2 class="counter" data-target="550">0</h2>

			<p>Companies</p>

		</div>

		<div class="stat-box">

			<h2 class="counter" data-target="3500">0</h2>

			<p>Registered Users</p>

		</div>

		<div class="stat-box">

			<h2 class="counter" data-target="98">0</h2>

			<p>Success Rate %</p>

		</div>

	</section>
	<!-- =========================
        CTA
========================= -->

	<section class="cta">

		<div class="glass-card">

			<h2>Ready To Build Your Career?</h2>

			<p>Join thousands of students and recruiters already using COMP
				Portal. Start your journey today.</p>

			<a href="register.jsp" class="btn"> Create Free Account </a>

		</div>

	</section>

	<!-- =========================
        FOOTER
========================= -->

	<footer>

		<div class="footer-container">

			<div class="footer-logo">

				<h2>

					COMP <span>Portal</span>

				</h2>

				<p>Build Your Career With Confidence.</p>

			</div>


			<div class="social">

				<a href="#"><i class="ri-facebook-fill"></i></a> <a href="#"><i
					class="ri-instagram-line"></i></a> <a href="#"><i
					class="ri-linkedin-fill"></i></a> <a href="#"><i
					class="ri-github-fill"></i></a> <a href="#"><i
					class="ri-twitter-x-line"></i></a>

			</div>

			<div class="copyright">© 2026 COMP Portal. All Rights Reserved.

			</div>

		</div>

	</footer>

	<!-- =========================
        JAVASCRIPT
========================= -->

	<!-- Three JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<!-- GSAP -->

	<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

	<!-- Galaxy Background -->

	<script src="<%=request.getContextPath()%>/js/particles3d.js"></script> 

	<!-- UI Animation -->

	<script src="<%=request.getContextPath()%>/js/final.js"></script>

</body>

</html>