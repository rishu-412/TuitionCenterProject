package com.columbia.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.columbia.dao.TeacherDB;
import com.columbia.model.Teacher;

@WebServlet({ "/AddTeacher", "/newStaff" })
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherDB db;
	public AddTeacher(){
		db = new TeacherDB();
	}
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		db.createConnection();
	}

	public void destroy() {	
		db.closeConnection();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Teacher teacher = new Teacher();
		teacher.id = Integer.parseInt(request.getParameter("txtID"));
		teacher.name = request.getParameter("txtName");
		teacher.designation = request.getParameter("txtDesignation");
		teacher.department = request.getParameter("txtDepartment");
		teacher.email = request.getParameter("txtEmail");
		teacher.password = request.getParameter("txtPassword");
		teacher.mobile = request.getParameter("txtMoobile");
		teacher.dob = request.getParameter("txtdob");
		db.addTeacher(teacher);
		RequestDispatcher dispatch = request.getRequestDispatcher("staff.jsp");
		dispatch.forward(request, response);
		
		
	}

}
