package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet("/savejob")
public class SaveJobController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String jobIdStr = req.getParameter("jobId");

		if (jobIdStr == null || jobIdStr.trim().isEmpty()) {
			resp.getWriter().println("Job ID Missing");
			return;
		}

		int jobId = Integer.parseInt(jobIdStr);

		HttpSession session = req.getSession();
		User sessionUser = (User) session.getAttribute("user");

		if (sessionUser == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		User user = em.find(User.class, sessionUser.getId());
		Job job = em.find(Job.class, jobId);

		et.begin();

		if (!user.getSavedJobs().contains(job)) {
			user.getSavedJobs().add(job);
		}

		em.merge(user);

		et.commit();

		session.setAttribute("user", user);

		resp.sendRedirect("savedjobs.jsp");
	}
}