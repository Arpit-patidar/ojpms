package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.JobDao;
import com.jsp.ojpms.entity.Job;

@WebServlet("/viewjob")
public class ViewJobController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sortBy = req.getParameter("sortBy");

		List<Job> jobs;

		if ("salary".equals(sortBy)) {

			jobs = JobDao.getAllJobsSortedBySalary();

		} else if ("applied".equals(sortBy)) {

			jobs = JobDao.getAllJobsSortedByMostApplied();

		} else {

			jobs = JobDao.getAllJobsSortedByLatest();
		}

		req.setAttribute("jobs", jobs);
		req.setAttribute("sortBy", sortBy);

		req.getRequestDispatcher("viewjob.jsp").forward(req, resp);
	}
}