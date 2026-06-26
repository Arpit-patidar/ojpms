<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<%@ page import="javax.servlet.http.Cookie"%>

	<%
	String currentTheme = "light";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {

		for (Cookie c : cookies) {

			if ("theme".equals(c.getName())) {

		currentTheme = c.getValue();
		break;
			}
		}
	}
	%>

	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/theme.css">

	<div class="theme-switcher">

		<form action="theme" method="post">

			<select name="mode" onchange="this.form.submit()">

				<option value="light"
					<%=currentTheme.equals("light") ? "selected" : ""%>>Light</option>

				<option value="dark"
					<%=currentTheme.equals("dark") ? "selected" : ""%>>Dark</option>

				<option value="classic"
					<%=currentTheme.equals("classic") ? "selected" : ""%>>
					Classic</option>

				<option value="system"
					<%=currentTheme.equals("system") ? "selected" : ""%>>System
				</option>

			</select>

		</form>

	</div>

	<script>

document.documentElement.setAttribute(
	'data-theme',
	'<%=currentTheme%>'
		);
	</script>
</body>
</html>