package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet("/savedjobs")
public class ViewSavedJobsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User sessionUser = (User) session.getAttribute("user");

		if(sessionUser == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		EntityManager em = JPAUtil.getEm();

		User user = em.find(User.class, sessionUser.getId());

		req.setAttribute("savedJobs", user.getSavedJobs());

		req.getRequestDispatcher("savedjobs.jsp")
		   .forward(req, resp);
	}
}