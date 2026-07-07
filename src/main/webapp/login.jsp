<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>COMP Portal | Gaming Login</title>

<!-- GOOGLE FONT -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<!-- REMIX ICON -->
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/theme.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animation.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css">

</head>

<body>


	<!-- ===========================
        BACKGROUND EFFECTS
============================ -->

	<div class="cursor-light"></div>

	<canvas id="matrixCanvas"></canvas>

	<div class="cyber-grid"></div>

	<div class="particles">

		<span></span> <span></span> <span></span> <span></span> <span></span>

		<span></span> <span></span> <span></span> <span></span> <span></span>

	</div>

	<!-- ===========================
          HEADER
============================ -->

	<header class="topbar">

		<!-- LOGO -->

		<a href="home.jsp" class="logo"> <span class="logo-icon"> <i
				class="ri-flashlight-fill"></i>
		</span> <span class="logo-text"> COMP PORTAL </span>

		</a>

		<!-- NAVIGATION -->

		<nav id="navbar">

			<ul>

				<li><a href="home.jsp" class="active"> Home </a></li>

				<li><a href="viewjob.jsp"> Jobs </a></li>

				<li><a href="#"> Companies </a></li>

				<li><a href="#"> Contact </a></li>

			</ul>

		</nav>

		<!-- LOGIN BADGE -->
<div class="login-status">
    <a href="register.jsp" class="register-btn">
        <i class="ri-user-3-line"></i>
        <span>Register</span>
    </a>
</div>
		<!-- MOBILE MENU -->

		<div class="menu-toggle">

			<i class="ri-menu-3-line"></i>

		</div>

	</header>

	<!-- ===========================
        MAIN WRAPPER START
============================ -->

	<div class="main-wrapper">
		<!-- ===========================
            LEFT PANEL
    ============================ -->

		<section class="left-panel">

			<div class="hero-badge">
				<i class="ri-rocket-2-fill"></i> NEXT GENERATION JOB PORTAL
			</div>

			<h1 class="hero-title">

				BUILD YOUR <span>CAREER</span><br> LIKE A <span>PRO
					GAMER</span>

			</h1>

			<p class="hero-desc">Discover premium job opportunities, connect
				with top recruiters, and build your future with India's next
				generation career platform.</p>

			<!-- FEATURES -->

			<div class="feature-grid">

				<div class="feature-card">

					<div class="feature-icon">🎯</div>

					<h3>Smart Search</h3>

					<p>AI based job recommendation system.</p>

				</div>

				<div class="feature-card">

					<div class="feature-icon">🚀</div>

					<h3>Quick Apply</h3>

					<p>Apply for jobs within seconds.</p>

				</div>

				<div class="feature-card">

					<div class="feature-icon">📈</div>

					<h3>Career Growth</h3>

					<p>Track your professional journey.</p>

				</div>

				<div class="feature-card">

					<div class="feature-icon">🏆</div>

					<h3>Top Companies</h3>

					<p>Work with India's leading companies.</p>

				</div>

			</div>

			<!-- STATS -->

			<div class="stats">

				<div class="stat-box">

					<h2>25K+</h2>

					<p>Jobs</p>

				</div>

				<div class="stat-box">

					<h2>12K+</h2>

					<p>Companies</p>

				</div>

				<div class="stat-box">

					<h2>1M+</h2>

					<p>Users</p>

				</div>

			</div>

		</section>

		<!-- ===========================
            RIGHT PANEL
    ============================ -->

		<section class="right-panel">

			<div class="login-card">

				<div class="login-top">

					<div class="login-icon">
						<i class="ri-shield-keyhole-fill"></i>
					</div>

					<h2>Welcome Back</h2>

					<p>Login to continue your career journey</p>

				</div>

				<!-- LOGIN FORM -->

				<form action="login" method="post">

					<div class="input-group">

						<label> <i class="ri-mail-line"></i> Email Address

						</label> <input type="email" name="email" placeholder="Enter your email"
							required>

					</div>

					<div class="input-group">

						<label> <i class="ri-lock-password-line"></i> Password

						</label> <input type="password" id="password" name="password"
							placeholder="Enter your password" required>

					</div>

					<div class="extra-options">

						<label> <input type="checkbox"> Remember Me

						</label> <a href="reset.jsp"> Forgot Password? </a>

					</div>

					<button class="login-btn" type="submit">

						<i class="ri-login-circle-line"></i> LOGIN NOW

					</button>

				</form>

				<p class="error">${error}</p>

				<p class="success">${successMsg}</p>

				<div class="login-footer">

					<span>Secure Login</span> <span>•</span> <span>256-bit
						Encryption</span>

				</div>

			</div>

		</section>

	</div>

	<!-- THREE JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<!-- GSAP -->

	<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

	<!-- GALAXY -->

	<script src="<%=request.getContextPath()%>/js/particles3d.js"></script>

	<!-- FINAL JS -->

	<script src="<%=request.getContextPath()%>/js/final.js"></script>
	<script>
const menu = document.querySelector(".menu-toggle");
const nav = document.getElementById("navbar");

menu.addEventListener("click", () => {
    nav.classList.toggle("active");
});
</script>
</body>
</html>