package com.jsp.ojpms.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/theme")
public class ThemeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String mode = req.getParameter("mode");

		Cookie cookie = new Cookie("theme", mode);
		cookie.setMaxAge(60 * 60 * 24 * 365);

		resp.addCookie(cookie);

		String referer = req.getHeader("referer");

		if (referer != null) {
			resp.sendRedirect(referer);
		} else {
			resp.sendRedirect("home.jsp");
		}
	}
}