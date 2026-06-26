package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;

@WebServlet("/reset")
public class ForgetPasswordController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		System.out.println(email + " : " + password);
		boolean updatePassword = UserDao.updatePassword(email, password);

		if (updatePassword) {

			req.setAttribute("successMsg", "Password Updated Successfully");

			req.getRequestDispatcher("login.jsp").forward(req, resp);

		} else {

			req.setAttribute("errorMsg", "Email Not Registered...!");

			req.getRequestDispatcher("reset.jsp").forward(req, resp);
		}
	}

}
