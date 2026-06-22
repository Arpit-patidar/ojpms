package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jsp.ojpms.dao.ApplicantDetailsDao;
import com.jsp.ojpms.entity.ApplicantDetails;

@WebServlet("/viewApplicants")
public class ViewApplicantsController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		List<ApplicantDetails> list = ApplicantDetailsDao.getAllCandidates();

		req.setAttribute("applicants", list);

		req.getRequestDispatcher("view-applicants.jsp")
		   .forward(req, resp);
	}
}