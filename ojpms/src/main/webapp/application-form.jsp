<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Job Application Form</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/application-form.css">
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
<div class="nav-buttons">

    <a href="javascript:history.back()" class="back-btn">
        ← Back
    </a>

    <a href="home.jsp" class="home-btn">
        🏠 Home
    </a>

</div>
<jsp:include page="theme.jsp"/>
<div class="container">

<h2>Apply For Job</h2>

<form action="saveApplication"
method="post"
enctype="multipart/form-data">

<input type="hidden"
name="jobId"
value="<%=request.getParameter("jobId")%>">

<div class="form-group">

<label>Full Name</label>

<input type="text"
name="fullName"
required>

</div>

<div class="form-group">

<label>Email</label>

<input type="email"
name="email"
required>

</div>

<div class="form-group">

<label>Mobile Number</label>

<input type="text"
name="mobile"
required>

</div>

<div class="form-group">

<label>Address</label>

<textarea
name="address"
required></textarea>

</div>

<div class="form-group">

<label>Skills</label>

<textarea
name="skills"
required></textarea>

</div>

<div class="form-group">

<label>Experience</label>

<input type="text"
name="experience"
placeholder="Example : 2 Years">

</div>

<div class="form-group">

<label>10th Percentage</label>

<input type="text"
name="tenth">

</div>

<div class="form-group">

<label>12th Percentage</label>

<input type="text"
name="twelfth">

</div>

<div class="form-group">

<label>Graduation Percentage</label>

<input type="text"
name="graduation">

</div>

<div class="form-group">

<label>College Name</label>

<input type="text"
name="college">

</div>

<div class="form-group">

<label>Passing Year</label>

<input type="text"
name="passingYear">

</div>

<div class="form-group">

<label>Resume (PDF)</label>

<input type="file"
name="resume"
required>

</div>

<div class="form-group">

<label>Certificate</label>

<input type="file"
name="certificate">

</div>

<div class="form-group">

<label>Cover Letter</label>

<textarea
name="coverLetter"></textarea>

</div>

<button type="submit">

Apply Now

</button>

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