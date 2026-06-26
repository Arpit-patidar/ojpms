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

@WebServlet(value = "/search")
public class SearchController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");

		List<Job> allJob = JobDao.getAllJob(search);

		if (!allJob.isEmpty()) {

			req.setAttribute("jobs", allJob);

		} else {

			req.setAttribute("msg", "No Job Found...");
		}

		req.getRequestDispatcher("viewjob.jsp").forward(req, resp);

	}

}
