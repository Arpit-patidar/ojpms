
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Account | COMP Portal</title>

<!-- Google Fonts -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<!-- Remix Icons -->

<link
	href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
	rel="stylesheet">

<!-- Custom CSS -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/register-pro.css">

</head>

<body>

	<jsp:include page="theme.jsp" />

	<!-- Animated Background -->
	<div class="nav-buttons">

		<a href="javascript:history.back()" class="back-btn"> ← Back </a> <a
			href="home.jsp" class="home-btn"> 🏠 Home </a>

	</div>

	<div class="bg-wrapper">

		<div class="orb orb1"></div>

		<div class="orb orb2"></div>

		<div class="orb orb3"></div>

	</div>

	<!-- Main Container -->

	<div class="register-container">

		<!-- LEFT SECTION -->

		<div class="left-panel">

			<div class="logo">

				<i class="ri-briefcase-4-fill"></i> <span>COMP</span> Portal

			</div>

			<div class="hero-content">

				<div class="hero-badge">AI Powered Recruitment Platform</div>

				<h1>

					Build Your Career With <span>Confidence</span>

				</h1>

				<p>Join thousands of recruiters and job seekers. Discover
					opportunities, apply instantly and manage your professional
					journey.</p>

				<div class="feature-list">

					<div class="feature-card">

						<i class="ri-search-eye-line"></i>

						<div>

							<h4>Smart Job Search</h4>

							<p>Find relevant opportunities instantly.</p>

						</div>

					</div>

					<div class="feature-card">

						<i class="ri-send-plane-fill"></i>

						<div>

							<h4>One Click Apply</h4>

							<p>Apply to jobs with ease.</p>

						</div>

					</div>

					<div class="feature-card">

						<i class="ri-user-star-fill"></i>

						<div>

							<h4>Recruiter Access</h4>

							<p>Connect with top companies.</p>

						</div>

					</div>

				</div>

			</div>

			<div class="left-footer">© 2026 COMP Portal • All Rights
				Reserved</div>

		</div>

		<!-- RIGHT SECTION -->

		<div class="right-panel">

			<div class="register-card">

				<div class="card-glow"></div>

				<h2>Create Account</h2>

				<p class="subtitle">Create your account and start your journey.

				</p>

				<form action="register" method="post" id="registerForm">

					<!-- Name -->

					<div class="input-group">

						<label>Full Name</label>

						<div class="input-box">

							<i class="ri-user-3-line"></i> <input type="text" name="name"
								placeholder="Enter your full name" required>

						</div>

					</div>

					<!-- Email -->

					<div class="input-group">

						<label>Email Address</label>

						<div class="input-box">

							<i class="ri-mail-line"></i> <input type="email" name="email"
								placeholder="your@email.com" required>

						</div>

					</div>

					<!-- Password -->

					<div class="input-group">

						<label>Password</label>

						<div class="input-box password-box">

							<i class="ri-lock-line"></i> <input type="password" id="password"
								name="password" placeholder="Create strong password" required>
							<i class="ri-eye-line toggle-password" onclick="togglePassword()"></i>

						</div>

						<!-- Password Strength -->

						<div class="strength-container">

							<div class="strength-bar" id="strengthBar"></div>

						</div>

						<small id="strengthText"> Password Strength </small>

					</div>

					<!-- Confirm Password -->

					<div class="input-group">

						<label>Confirm Password</label>

						<div class="input-box">

							<i class="ri-shield-check-line"></i> <input type="password"
								id="confirmPassword" placeholder="Confirm password" required>

						</div>

						<small id="matchText"></small>

					</div>

					<!-- Role -->

					<div class="input-group">

						<label>Select Role</label>

						<div class="input-box">

							<i class="ri-briefcase-line"></i> <select name="role" required>

								<option value="">Choose Role</option>

								<option value="JOB_SEEKER">Job Seeker</option>

								<option value="RECRUITER">Recruiter</option>

							</select>

						</div>

					</div>

					<!-- Terms -->

					<div class="terms-box">

						<input type="checkbox" id="terms" required> <label
							for="terms"> I agree to the <a href="#">Terms &
								Conditions</a>

						</label>

					</div>

					<!-- Error Message -->

					<c:if test="${not empty error}">

						<div class="error-msg">${error}</div>

					</c:if>

					<!-- Success Message -->

					<c:if test="${not empty successMsg}">

						<div class="success-msg">${successMsg}</div>

					</c:if>

					<!-- Submit -->

					<button type="submit" class="register-btn">


						<i class="ri-user-add-line"></i> Create Account

					</button>

				</form>

				<div class="bottom-link">

					Already have an account? <a href="login.jsp"> Sign In </a>

				</div>
			</div>

		</div>

	</div>

	<!-- Three JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<!-- GSAP -->

	<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

	<!-- Custom JS -->

	<script>

    /* ==========================
       Page Animation
    ========================== */

    gsap.from(".left-panel",{
        x:-100,
        opacity:0,
        duration:1
    });

    gsap.from(".register-card",{
        x:100,
        opacity:0,
        duration:1
    });

    gsap.from(".feature-card",{
        opacity:0,
        y:40,
        stagger:.2,
        duration:1,
        delay:.5
    });

    /* ==========================
       Toggle Password
    ========================== */

    function togglePassword(){

        const password =
            document.getElementById("password");

        const icon =
            document.querySelector(".toggle-password");

        if(password.type==="password"){

            password.type="text";

            icon.classList.remove("ri-eye-line");

            icon.classList.add("ri-eye-off-line");

        }else{

            password.type="password";

            icon.classList.remove("ri-eye-off-line");

            icon.classList.add("ri-eye-line");
        }
    }

    /* ==========================
       Password Strength
    ========================== */

    const password =
        document.getElementById("password");

    const strengthBar =
        document.getElementById("strengthBar");

    const strengthText =
        document.getElementById("strengthText");

    password.addEventListener("keyup",function(){

        let value = password.value;

        let strength = 0;

        if(value.length >= 8) strength++;

        if(/[A-Z]/.test(value)) strength++;

        if(/[0-9]/.test(value)) strength++;

        if(/[^A-Za-z0-9]/.test(value)) strength++;

        if(strength === 1){

            strengthBar.style.width="25%";
            strengthBar.style.background="#ef4444";

            strengthText.innerText="Weak Password";
        }

        else if(strength === 2){

            strengthBar.style.width="50%";
            strengthBar.style.background="#f59e0b";

            strengthText.innerText="Medium Password";
        }

        else if(strength === 3){

            strengthBar.style.width="75%";
            strengthBar.style.background="#38bdf8";

            strengthText.innerText="Good Password";
        }

        else if(strength === 4){

            strengthBar.style.width="100%";
            strengthBar.style.background="#22c55e";

            strengthText.innerText="Strong Password";
        }

        else{

            strengthBar.style.width="0%";

            strengthText.innerText=
                "Password Strength";
        }

    });

    /* ==========================
       Confirm Password
    ========================== */

    const confirmPassword =
        document.getElementById("confirmPassword");

    const matchText =
        document.getElementById("matchText");

    confirmPassword.addEventListener("keyup",()=>{

        if(confirmPassword.value===""){

            matchText.innerHTML="";

            return;
        }

        if(password.value===confirmPassword.value){

            matchText.innerHTML=
            "✓ Password Matched";

            matchText.style.color="#22c55e";

        }else{

            matchText.innerHTML=
            "✗ Password Not Matched";

            matchText.style.color="#ef4444";
        }

    });

    /* ==========================
       Loading Button
    ========================== */

    document.getElementById("registerForm")
    .addEventListener("submit",function(){

        const btn =
        document.querySelector(".register-btn");

        btn.innerHTML=
        '<i class="ri-loader-4-line"></i> Creating Account...';

        btn.disabled=true;
    });

</script>

	<!-- Optional Particle Background -->

	<script src="<%=request.getContextPath()%>/js/particles3d.js"></script>

	<!-- Final JS -->

	<script src="<%=request.getContextPath()%>/js/final.js"></script>

</body>

</html>


