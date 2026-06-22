package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.EmailUtil;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/apply")
public class ApplyJobController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String jobIdString = req.getParameter("jobId");
		int jobId = Integer.parseInt(jobIdString);

//		System.out.println("\n Job ID :" + jobId);

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

//		System.out.println("\n User");
//		System.out.println(user);

		EntityManager em = JPAUtil.getEm();
		Job job = em.find(Job.class, jobId);

		Application application = new Application();

		application.setJob(job);
		application.setUser(user);

//		System.out.println(application.getJob().getId() + "   :   " + application.getUser());

		boolean applyAlready = ApplicationDao.isApplyAlready(user.getId(), job.getId());

		if (applyAlready) {

			System.out.println("apply");
			req.setAttribute("error", "Already Apply");
			req.setAttribute("appliedId", job.getId());

			List<Job> allJobs = JobDao.getAllJobs();

			req.setAttribute("jobs", allJobs);

			req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
		} else {

			ApplicationDao.saveApplication(application);

			EmailUtil.sendEmail(user.getEmail(), "You Applied For " + job.getTitle(),
					"You have successfully " + "applied for this role.");

			resp.sendRedirect("viewjob");
		}
	}
}
