<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>COMP Portal | Gaming Login</title>

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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/login.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animation.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css">

<style type="text/css">

/* =========================================
   COMP PORTAL LOGIN CSS - PART 1
========================================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

:root{
    --bg:#050816;
    --card:#0d1224;
    --cyan:#00ffff;
    --purple:#a855f7;
    --green:#00ff88;
    --white:#ffffff;
    --text:#cbd5e1;
}

body{
    min-height:100vh;
    background:
    linear-gradient(
        135deg,
        #050816,
        #071426,
        #050816
    );
    color:white;
    overflow-x:hidden;
    position:relative;
}

/* MATRIX */

#matrixCanvas{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:-10;
}

/* CYBER GRID */

.cyber-grid{
    position:fixed;
    inset:0;
    background-image:
    linear-gradient(
        rgba(0,255,255,.05) 1px,
        transparent 1px
    ),
    linear-gradient(
        90deg,
        rgba(0,255,255,.05) 1px,
        transparent 1px
    );
    background-size:40px 40px;
    z-index:-9;
}

/* CURSOR GLOW */

.cursor-light{
    position:fixed;
    width:400px;
    height:400px;
    border-radius:50%;

    background:
    radial-gradient(
        circle,
        rgba(0,255,255,.15),
        transparent 70%
    );

    transform:translate(-50%,-50%);
    pointer-events:none;
    filter:blur(20px);
    z-index:-8;
}

/* FLOATING PARTICLES */

.particles{
    position:fixed;
    inset:0;
    overflow:hidden;
    z-index:-7;
}

.particles span{
    position:absolute;
    width:6px;
    height:6px;
    border-radius:50%;
    background:#00ffff;

    box-shadow:
    0 0 10px #00ffff;

    animation:
    floatParticle 15s linear infinite;
}

.particles span:nth-child(1){left:10%;}
.particles span:nth-child(2){left:20%;}
.particles span:nth-child(3){left:30%;}
.particles span:nth-child(4){left:40%;}
.particles span:nth-child(5){left:50%;}
.particles span:nth-child(6){left:60%;}
.particles span:nth-child(7){left:70%;}
.particles span:nth-child(8){left:80%;}
.particles span:nth-child(9){left:90%;}
.particles span:nth-child(10){left:95%;}

@keyframes floatParticle{

    from{
        transform:translateY(100vh);
        opacity:0;
    }

    20%{
        opacity:1;
    }

    to{
        transform:translateY(-120px);
        opacity:0;
    }
}

/* HEADER */

.topbar{
    height:80px;
    padding:0 60px;

    display:flex;
    justify-content:space-between;
    align-items:center;

    position:sticky;
    top:0;

    z-index:999;

    background:
    rgba(5,8,22,.6);

    backdrop-filter:blur(15px);

    border-bottom:
    1px solid rgba(255,255,255,.08);
}

.topbar-scroll{
    background:
    rgba(5,8,22,.9);

    backdrop-filter:
    blur(25px);

    border-bottom:
    1px solid rgba(0,255,255,.25);

    box-shadow:
    0 0 30px rgba(0,255,255,.15);
}

.logo{
    display:flex;
    align-items:center;
    gap:10px;
}

.logo-icon{
    font-size:28px;
    color:#00ffff;
}

.logo-text{
    font-size:22px;
    font-weight:700;
}

.topbar ul{
    display:flex;
    gap:30px;
    list-style:none;
}

.topbar a{
    text-decoration:none;
    color:white;
    transition:.3s;
}

.topbar a:hover{
    color:#00ffff;
}

/* MAIN */

.main-wrapper{
    width:90%;
    margin:auto;

    min-height:
    calc(100vh - 80px);

    display:flex;
    align-items:center;
}

/* LEFT PANEL */

.left-panel{
    width:55%;
    padding:40px;
}

.badge{
    display:inline-block;

    padding:10px 25px;

    border:
    1px solid #00ffff;

    border-radius:50px;

    color:#00ffff;

    margin-bottom:25px;

    box-shadow:
    0 0 15px #00ffff;
}

.left-panel h1{
    font-size:60px;
    line-height:1.1;
    margin-bottom:20px;
}

.neon-text{
    text-shadow:
    0 0 10px #00ffff,
    0 0 20px #00ffff,
    0 0 40px #00ffff;
}

.left-panel p{
    color:#cbd5e1;
    line-height:1.8;
}
/* =========================================
   COMP PORTAL LOGIN CSS - PART 2
========================================= */

/* FEATURE GRID */

.feature-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
    margin-top:35px;
}

.feature-card{
    position:relative;

    padding:20px;

    border-radius:18px;

    background:
    rgba(255,255,255,.04);

    border:
    1px solid rgba(255,255,255,.08);

    overflow:hidden;

    transition:.4s;
}

.feature-card:hover{

    transform:
    translateY(-8px)
    scale(1.03);

    border-color:#00ffff;

    box-shadow:
    0 0 30px rgba(0,255,255,.35);
}

.feature-card::before{

    content:"";

    position:absolute;

    inset:0;

    background:
    linear-gradient(
        90deg,
        transparent,
        rgba(255,255,255,.08),
        transparent
    );

    transform:
    translateX(-100%);

    transition:.7s;
}

.feature-card:hover::before{
    transform:translateX(100%);
}

.feature-card .icon{
    font-size:32px;
    margin-bottom:10px;
}

.feature-card h3{
    margin-bottom:10px;
}

/* STATS */

.stats{
    display:flex;
    gap:20px;
    margin-top:40px;
}

.stat-box{
    flex:1;

    padding:20px;

    text-align:center;

    border-radius:18px;

    background:
    rgba(255,255,255,.05);

    border:
    1px solid rgba(255,255,255,.08);

    transition:.4s;
}

.stat-box:hover{

    transform:
    translateY(-6px);

    box-shadow:
    0 0 25px rgba(0,255,255,.25);
}

.stat-box h2{
    color:#00ffff;
    margin-bottom:8px;
}

/* RIGHT PANEL */

.right-panel{
    width:45%;
    display:flex;
    justify-content:center;
}

/* LOGIN CARD */

.login-card{

    width:450px;

    padding:40px;

    position:relative;

    overflow:hidden;

    border-radius:28px;

    backdrop-filter:blur(25px);

    background:
    rgba(255,255,255,.05);

    border:
    1px solid rgba(255,255,255,.08);

    box-shadow:
    0 0 40px rgba(0,255,255,.15),
    0 0 80px rgba(168,85,247,.08);
}

.login-card::before{

    content:"";

    position:absolute;

    inset:-2px;

    background:
    linear-gradient(
        90deg,
        #00ffff,
        #a855f7,
        #00ff88,
        #00ffff
    );

    background-size:400%;

    animation:
    borderMove 8s linear infinite;

    z-index:-2;
}

.login-card::after{

    content:"";

    position:absolute;

    inset:2px;

    border-radius:26px;

    background:#0d1224;

    z-index:-1;
}

@keyframes borderMove{

    0%{
        background-position:0%;
    }

    100%{
        background-position:400%;
    }
}

.login-card h2{
    text-align:center;
    margin-bottom:10px;
}

.subtitle{
    text-align:center;
    color:#94a3b8;
    margin-bottom:30px;
}

/* FORM */

.input-group{
    margin-bottom:18px;
}

.input-group label{
    display:block;
    margin-bottom:8px;
}

.input-group input{

    width:100%;

    padding:14px;

    border:none;

    outline:none;

    color:white;

    border-radius:12px;

    background:#111827;

    border:
    1px solid rgba(255,255,255,.08);

    transition:.3s;
}

.input-group input:focus{

    border-color:#00ffff;

    box-shadow:
    0 0 15px #00ffff;
}

/* EXTRA OPTIONS */

.extra-options{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:20px;

    font-size:13px;
}

.extra-options a{

    text-decoration:none;

    color:#00ffff;
}

/* BUTTON */

.login-btn{

    width:100%;

    padding:15px;

    border:none;

    cursor:pointer;

    color:white;

    font-weight:700;

    border-radius:12px;

    position:relative;

    overflow:hidden;

    background:
    linear-gradient(
        135deg,
        #00ffff,
        #7c3aed
    );

    transition:.35s;
}

.login-btn:hover{

    transform:
    translateY(-3px);

    box-shadow:
    0 0 25px #00ffff;
}

.login-btn::before{

    content:"";

    position:absolute;

    top:0;
    left:-120%;

    width:100%;
    height:100%;

    background:
    linear-gradient(
        90deg,
        transparent,
        rgba(255,255,255,.4),
        transparent
    );

    transition:.8s;
}

.login-btn:hover::before{
    left:120%;
}

/* MESSAGE */

.error{
    color:#ff4d6d;
    text-align:center;
    margin-top:15px;
}

.success{
    color:#00ff88;
    text-align:center;
    margin-top:15px;
}

/* SCROLLBAR */

::-webkit-scrollbar{
    width:10px;
}

::-webkit-scrollbar-track{
    background:#050816;
}

::-webkit-scrollbar-thumb{
    border-radius:50px;

    background:
    linear-gradient(
        180deg,
        #00ffff,
        #a855f7
    );
}

/* RESPONSIVE */

@media(max-width:992px){

    .main-wrapper{
        flex-direction:column;
        padding:40px 0;
    }

    .left-panel,
    .right-panel{
        width:100%;
    }
}

@media(max-width:768px){

    .topbar{
        flex-direction:column;
        height:auto;
        padding:20px;
        gap:15px;
    }

    .topbar ul{
        flex-wrap:wrap;
        justify-content:center;
    }

    .left-panel h1{
        font-size:38px;
    }

    .feature-grid{
        grid-template-columns:1fr;
    }

    .stats{
        flex-direction:column;
    }

    .login-card{
        width:100%;
    }
}
/* ==========================
   TOP ACTION BUTTONS
========================== */

.top-actions{
    display:flex;
    align-items:center;
    gap:10px;
}

.theme-btn{
    padding:10px 18px;
    border:none;
    border-radius:12px;
    cursor:pointer;
    font-size:14px;
    font-weight:600;

    color:#fff;

    background:
    rgba(255,255,255,.08);

    border:
    1px solid rgba(255,255,255,.12);

    backdrop-filter:
    blur(15px);

    transition:.3s;
}

.theme-btn:hover{

    transform:
    translateY(-2px);

    border-color:#00ffff;

    box-shadow:
    0 0 15px rgba(0,255,255,.4);
}

.theme-btn:active{

    transform:
    scale(.96);
}

/* MOBILE */

@media(max-width:768px){

    .top-actions{

        flex-wrap:wrap;

        justify-content:center;

        margin-top:10px;
    }

    .theme-btn{

        padding:8px 14px;
        font-size:13px;
    }

}
.theme-menu{
    position:fixed;
    top:20px;
    right:20px;
    z-index:9999;
}

.theme-main-btn{
    padding:12px 20px;
    border:none;
    border-radius:12px;
    cursor:pointer;
    color:#fff;
    font-weight:600;
    background:rgba(0,255,255,.15);
    border:1px solid rgba(0,255,255,.3);
    backdrop-filter:blur(15px);
}

.theme-dropdown{
    position:absolute;
    top:55px;
    right:0;
    width:170px;

    display:none;

    background:#0d1224;
    border-radius:12px;
    overflow:hidden;

    border:1px solid rgba(255,255,255,.1);
}

.theme-menu:hover .theme-dropdown{
    display:block;
}

.theme-dropdown button{
    width:100%;
    padding:12px;
    border:none;
    cursor:pointer;
    color:white;
    text-align:left;
    background:transparent;
}

.theme-dropdown button:hover{
    background:rgba(0,255,255,.15);
}
/* ==========================
   THEME MENU
========================== */

.theme-menu{
    position:fixed;
    top:20px;
    right:20px;
    z-index:99999;
}

.theme-main-btn{
    padding:12px 18px;
    border:none;
    border-radius:12px;
    color:#fff;
    cursor:pointer;
    background:rgba(0,255,255,.15);
    border:1px solid rgba(0,255,255,.3);
    backdrop-filter:blur(15px);
}

.theme-dropdown{
    display:none;
    position:absolute;
    top:55px;
    right:0;
    width:180px;
    background:#0d1224;
    border-radius:12px;
    overflow:hidden;
    border:1px solid rgba(255,255,255,.1);
}

.theme-menu:hover .theme-dropdown{
    display:block;
}

.theme-dropdown button{
    width:100%;
    padding:12px;
    border:none;
    text-align:left;
    cursor:pointer;
    background:transparent;
    color:white;
}

.theme-dropdown button:hover{
    background:rgba(0,255,255,.15);
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
	<!-- CURSOR LIGHT -->

	<div class="cursor-light"></div>

	<!-- MATRIX BACKGROUND -->

	<canvas id="matrixCanvas"></canvas>

	<!-- CYBER GRID -->

	<div class="cyber-grid"></div>

	<!-- FLOATING PARTICLES -->

	<div class="particles">

		<span></span> <span></span> <span></span> <span></span> <span></span>
		<span></span> <span></span> <span></span> <span></span> <span></span>

	</div>

	<!-- TOP ACTION BUTTON -->

	<div class="theme-dropdown">

		<button class="theme-main-btn">☰ Menu</button>

		<div class="theme-menu">

			<button onclick="history.back()">← Back</button>

			<button onclick="setTheme('light')">☀ Light</button>

			<button onclick="setTheme('dark')">🌙 Dark</button>

			<button onclick="setTheme('classic')">🎮 Classic</button>

		</div>

	</div>

	<!-- HEADER -->

	<header class="topbar">

		<div class="logo">

			<span class="logo-icon">⚡</span> <span class="logo-text"> COMP
				PORTAL </span>

		</div>

		<nav>

			<ul>

				<li><a href="home.jsp">Home</a></li>

				<li><a href="viewjob.jsp">Jobs</a></li>

				<li><a href="#">Companies</a></li>

				<li><a href="#">Contact</a></li>

			</ul>

		</nav>

	</header>

	<!-- MAIN WRAPPER -->

	<div class="main-wrapper">

		<!-- LEFT PANEL -->

		<section class="left-panel">

			<div class="badge">NEXT GENERATION JOB PORTAL</div>

			<h1 class="neon-text">
				BUILD YOUR CAREER <br> LIKE A PRO GAMER
			</h1>

			<p>Explore thousands of opportunities, connect with recruiters,
				and level-up your professional journey.</p>

			<!-- FEATURES -->

			<div class="feature-grid">

				<div class="feature-card">

					<div class="icon">🎯</div>

					<h3>Smart Search</h3>

					<p>AI based recommendations.</p>

				</div>

				<div class="feature-card">

					<div class="icon">🚀</div>

					<h3>Fast Apply</h3>

					<p>One click applications.</p>

				</div>

				<div class="feature-card">

					<div class="icon">📩</div>

					<h3>Alerts</h3>

					<p>Email notifications.</p>

				</div>

				<div class="feature-card">

					<div class="icon">🏆</div>

					<h3>Career Growth</h3>

					<p>Track milestones.</p>

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
		<!-- RIGHT PANEL -->

		<section class="right-panel">

			<div class="login-card">

				<h2>LOGIN</h2>

				<p class="subtitle">Enter The Career Arena</p>

				<form action="login" method="post">

					<div class="input-group">

						<label>Email</label> <input type="email" name="email"
							placeholder="Enter Email" required>

					</div>

					<div class="input-group">

						<label>Password</label> <input type="password" id="password"
							name="password" placeholder="Enter Password" required>

					</div>

					<div class="extra-options">

						<label> <input type="checkbox"> Remember Me

						</label> <a href="reset.jsp"> Forgot Password? </a>

					</div>

					<button class="login-btn" type="submit">ENTER SYSTEM</button>

				</form>

				<p class="error">${error}</p>

				<p class="success">${successMsg}</p>

			</div>

		</section>

	</div>

	<!-- THREE JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

	<!-- GSAP -->

	<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

	<!-- PARTICLE BACKGROUND -->

	<script src="<%=request.getContextPath()%>/js/particles3d.js"></script>

	<!-- FINAL UI JS -->

	<script src="<%=request.getContextPath()%>/js/final.js"></script>

	<!-- THEME JS -->



</body>
</html>