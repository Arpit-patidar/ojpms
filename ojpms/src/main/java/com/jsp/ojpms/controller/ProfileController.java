package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet(value = "/profile")
public class ProfileController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String parameter = req.getParameter("id");
		
		int id = Integer.parseInt(parameter);
		
		System.out.println(id);
		
		EntityManager em = JPAUtil.getEm();
		
		User user = em.find(User.class,id );
		
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("profile.jsp").forward(req, resp);
	}

}
