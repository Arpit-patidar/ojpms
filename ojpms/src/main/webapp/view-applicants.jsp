<%@ page import="java.util.*,com.jsp.ojpms.entity.ApplicantDetails"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applicants Dashboard</title>

<style>
table {
	width: 95%;
	margin: auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

th {
	background: #2563eb;
	color: white;
}

.btn {
	padding: 6px 10px;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}

.approve {
	background: green;
}

.reject {
	background: red;
}
</style>
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

    <a href="javascript:history.back()" class="back-btn">
        ← Back
    </a>

    <a href="home.jsp" class="home-btn">
        🏠 Home
    </a>

</div>
	<h2 style="text-align: center;">All Applicants</h2>

	<table>

		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Job ID</th>
			<th>Status</th>
			<th>Resume</th>
			<th>Action</th>
		</tr>

		<%
		List<ApplicantDetails> list = (List<ApplicantDetails>) request.getAttribute("applicants");

		if (list != null && !list.isEmpty()) {

			for (ApplicantDetails a : list) {
		%>

		<tr>
			<td><%=a.getId()%></td>
			<td><%=a.getFullName()%></td>
			<td><%=a.getEmail()%></td>
			<td><%=a.getMobile()%></td>
			<td><%=a.getJobId()%></td>
			<td><%=a.getStatus()%></td>

			<td><a href="<%=a.getResumeFile()%>" target="_blank">View</a></td>

			<td><a class="btn approve"
				href="updateStatus?id=<%=a.getId()%>&status=APPROVED">Approve</a> <a
				class="btn reject"
				href="updateStatus?id=<%=a.getId()%>&status=REJECTED">Reject</a></td>

		</tr>

		<%
		}
		} else {
		%>

		<tr>
			<td colspan="8">No Applicants Found</td>
		</tr>

		<%
		}
		%>

	</table>
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