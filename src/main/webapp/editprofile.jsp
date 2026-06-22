<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Profile | COMP Portal</title>
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
:root { -
	-bg-dark: #0B1120; -
	-bg-second: #111827; -
	-bg-third: #1E293B; -
	-text: #F8FAFC; -
	-light: #CBD5E1; -
	-muted: #94A3B8; -
	-primary: #4F46E5; -
	-secondary: #7C3AED; -
	-accent: #38BDF8;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 40px 20px;
	background: linear-gradient(135deg, var(- -bg-dark), var(- -bg-second),
		var(- -bg-third));
	color: var(- -text);
	position: relative;
	overflow: hidden;
}

/* ==========================
   ANIMATED BACKGROUND
========================== */
body::before {
	content: "";
	position: absolute;
	width: 420px;
	height: 420px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(79, 70, 229, .18), transparent
		70%);
	top: -120px;
	left: -120px;
	animation: floatBlob 8s ease-in-out infinite alternate;
}

body::after {
	content: "";
	position: absolute;
	width: 380px;
	height: 380px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(56, 189, 248, .15), transparent
		70%);
	right: -100px;
	bottom: -100px;
	animation: floatBlob 10s ease-in-out infinite alternate;
}

@
keyframes floatBlob {from { transform:translateY(0px)translateX(0px);
	
}

to {
	transform: translateY(-40px) translateX(20px);
}

}

/* ==========================
   TOP LINKS
========================== */
.top-links {
	position: absolute;
	top: 20px;
	right: 30px;
	display: flex;
	gap: 15px;
	z-index: 10;
}

.top-links a {
	text-decoration: none;
	color: var(- -light);
	padding: 12px 20px;
	border-radius: 14px;
	background: rgba(255, 255, 255, .05);
	border: 1px solid rgba(255, 255, 255, .08);
	transition: .3s;
}

.top-links a:hover {
	color: var(- -accent);
	transform: translateY(-2px);
	background: rgba(255, 255, 255, .08);
}

/* ==========================
   CARD
========================== */
.edit-card {
	width: 100%;
	max-width: 560px;
	padding: 42px;
	background: rgba(17, 24, 39, .92);
	backdrop-filter: blur(22px);
	border: 1px solid rgba(255, 255, 255, .08);
	border-radius: 28px;
	box-shadow: 0 20px 60px rgba(0, 0, 0, .45);
	position: relative;
	z-index: 1;
	animation: fadeUp .8s ease;
}

/* ==========================
   HEADER
========================== */
.edit-header {
	text-align: center;
	margin-bottom: 35px;
}

.edit-avatar {
	width: 95px;
	height: 95px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: auto;
	margin-bottom: 20px;
	font-size: 38px;
	font-weight: 700;
	color: white;
	background: linear-gradient(135deg, var(- -primary), var(- -accent));
	box-shadow: 0 0 30px rgba(79, 70, 229, .35);
}

.edit-header h1 {
	font-size: 30px;
	color: var(- -text);
	margin-bottom: 8px;
}

.edit-header p {
	color: var(- -muted);
}

/* ==========================
   FORM
========================== */
.form-group {
	margin-bottom: 22px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-size: 14px;
	font-weight: 600;
	color: var(- -accent);
}

input {
	width: 100%;
	padding: 16px 18px;
	border-radius: 16px;
	border: 1px solid rgba(255, 255, 255, .08);
	background: var(- -bg-third);
	color: var(- -text);
	font-size: 15px;
	outline: none;
	transition: .3s;
}

input:focus {
	border: 1px solid var(- -accent);
	box-shadow: 0 0 18px rgba(56, 189, 248, .18);
}

input[readonly] {
	background: rgba(255, 255, 255, .03);
	color: var(- -muted);
	cursor: not-allowed;
}

/* ==========================
   BUTTON
========================== */
.btn {
	width: 100%;
	padding: 17px;
	border: none;
	border-radius: 16px;
	background: linear-gradient(135deg, var(- -primary), var(- -secondary));
	color: white;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	transition: .3s;
}

.btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 14px 30px rgba(124, 58, 237, .28);
}

/* ==========================
   ANIMATION
========================== */
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* ==========================
   RESPONSIVE
========================== */
@media ( max-width :600px) {
	.edit-card {
		width: 95%;
		padding: 30px 22px;
	}
	.top-links {
		right: 15px;
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
	<div class="top-links">

		<a href="home.jsp"> Home </a> <a href="profile?id=${user.id}">
			Profile </a>

	</div>

	<div class="edit-card">

		<div class="edit-header">

			<div class="edit-avatar">${user.name.charAt(0)}</div>

			<h1>Edit Profile</h1>

			<p>Update your account information</p>

		</div>

		<form action="updateProfile" method="post">

			<div class="form-group">

				<label> User ID </label> <input type="text" name="id"
					value="${user.id}" readonly>

			</div>

			<div class="form-group">

				<label> Full Name </label> <input type="text" name="name"
					value="${user.name}" required>

			</div>

			<div class="form-group">

				<label> Email Address </label> <input type="email" name="email"
					value="${user.email}" required>

			</div>

			<div class="form-group">

				<label> Password </label> <input type="password" name="password"
					value="${user.password}" required>

			</div>

			<div class="form-group">

				<label> Role </label> <input type="text" name="role"
					value="${user.role}" readonly>

			</div>

			<button type="submit" class="btn">Update Profile</button>

		</form>

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
