package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;
import com.jsp.ojpms.entity.User;

@WebServlet(value = "/register")
public class RegisterController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		String password= req.getParameter("password");
		String role= req.getParameter("role");
		
		System.out.println("name: "+name);
		System.out.println("email: "+email);
		System.out.println("password: "+password);
		System.out.println("role: "+role);
		
		User user=new User(name,email,password,role);
		UserDao.save(user);
		
		resp.sendRedirect("home.jsp");
	}
}
