package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet("/unsavejob")
public class UnsaveJobController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		int jobId = Integer.parseInt(req.getParameter("jobId"));

		HttpSession session = req.getSession();
		User sessionUser = (User) session.getAttribute("user");

		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();

		User user = em.find(User.class, sessionUser.getId());
		Job job = em.find(Job.class, jobId);

		et.begin();

		user.getSavedJobs().remove(job);

		em.merge(user);

		et.commit();

		session.setAttribute("user", user);

		resp.sendRedirect("savedjobs.jsp");
	}
}