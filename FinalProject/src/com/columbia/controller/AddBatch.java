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
import com.columbia.dao.TeacherDB;
import com.columbia.model.Batch;
@WebServlet({ "/AddBatch", "/newBatch" })
public class AddBatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BatchDB db;
    TeacherDB db1;
    public AddBatch() {
    	db = new BatchDB();
    	db1 = new TeacherDB();
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
		
		Batch batch = new Batch();
		batch.id = Integer.parseInt(request.getParameter("txtID"));
		batch.name = request.getParameter("txtName");
		batch.year = Integer.parseInt(request.getParameter("txtYear"));
		batch.fee = Float.parseFloat(request.getParameter("txtFee"));
		batch.numberOfStudent = Integer.parseInt(request.getParameter("txtNo"));
		

		String TeacherName = request.getParameter("txtTeacher");
		int teacherid= db1.getTeacherID(TeacherName);
		batch.Tid = teacherid;
		batch.Tname = TeacherName;
		db.addBatch(batch);
		db1.addTeacherInBatch(teacherid, batch.id);	
		RequestDispatcher dispatch = request.getRequestDispatcher("batch.jsp");
		dispatch.forward(request, response);
		
		
		
	}

}
