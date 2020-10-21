package com.columbia.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.columbia.dao.BatchDB;
import com.columbia.dao.StudentDB;
import com.columbia.model.Student;

@WebServlet({ "/AddStudent", "/newStudent" })
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    StudentDB db;
    BatchDB db1;
    public AddStudent() {
    	db = new StudentDB();
    	db1 =new BatchDB();
    }

	public void init(ServletConfig config) throws ServletException {
		db.createConnection();
		db1.createConnection();
	}

	public void destroy() {
		db.closeConnection();
		db1.closeConnection();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		Student student = new Student();
		student.id = Integer.parseInt(request.getParameter("txtID"));
		student.name = request.getParameter("txtName");
		student.email = request.getParameter("txtEmail");
		student.mobile = request.getParameter("txtMoobile");
		student.dob = request.getParameter("txtdob");
		student.admissionDate = request.getParameter("txtAdmission");
		student.fee = Float.parseFloat(request.getParameter("txtFee"));
		student.rollNo = Integer.parseInt(request.getParameter("txtRollNo"));
		db.addStudent(student);
		String batchName = request.getParameter("txtBatch");
		int batchid= db1.getBatchID(batchName);
		db1.addStudentInBatch(student.id, batchid);
		RequestDispatcher dispatch = request.getRequestDispatcher("student.jsp");
		dispatch.forward(request, response);
	}

}
