package com.columbia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.columbia.model.Student;

public class StudentDB {
	Connection connection;
	PreparedStatement prstmt;
	public StudentDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("1. Driver Loaded :) ");
		} catch (Exception e) {
			System.out.println("Some Exception: "+e);
		}
	}
	
	public void createConnection() {
		
		try {
			String url = "jdbc:mysql://localhost/finalproject";
			String user = "root";
			String password = "";
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("2. Connection Created :) ");
		} catch (Exception e) {
			System.out.println("Some Exception: "+e);
		}
	}
	
	public String addStudent(Student student) {
		String message = "NA";
		
		try {
			String sql = "insert into student values( ?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
		    prstmt = connection.prepareStatement(sql);
			prstmt.setInt(1, student.id);
			prstmt.setString(2, student.name);
			prstmt.setString(3, student.email);
			prstmt.setString(4, student.mobile);
			prstmt.setString(5, student.dob);
			prstmt.setInt(6, student.rollNo);
			prstmt.setString(7, student.admissionDate);
			prstmt.setFloat(8, student.fee);
			
			int i = prstmt.executeUpdate();
				
			    if(i > 0) {message = "4. "+student.name+" Added in DataBase :)";
				}else{
					message = "4. "+student.name+" NOT Added in DataBase :(";}
			}catch (Exception e) {
				System.out.println("Some Exception: "+e);
	}
	
	return message;	
}
	public void closeConnection() {
		try {
			connection.close();
			System.out.println("4. Connection Closed");
		} catch (Exception e) {
			System.out.println("Some Exception: "+e);
		}
	}
	
	
	public int countStudent() {
		String sql = "select count(*) from Student";
		System.out.println(sql);
		int count = 0;
		try {
			prstmt = connection.prepareStatement(sql);
			ResultSet rs = prstmt.executeQuery();
			boolean message = rs.next();
			if(message) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("Some Exception: "+e);
			e.printStackTrace();
		}
		return count;
	}

}
