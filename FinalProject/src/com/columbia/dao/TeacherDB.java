package com.columbia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.columbia.model.Student;
import com.columbia.model.Teacher;

public class TeacherDB {
	Connection connection;
	PreparedStatement prstmt;
	public TeacherDB() {
		
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
	public String addTeacher(Teacher teacher) {
		String message = "NA";
		
		try {
			String sql = "insert into teacher values(?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
		    prstmt = connection.prepareStatement(sql);
			prstmt.setInt(1, teacher.id);
			prstmt.setString(2, teacher.name);
			prstmt.setString(3, teacher.designation);
			prstmt.setString(4, teacher.department);
			prstmt.setString(5, teacher.email);
			prstmt.setString(6, teacher.password);
			prstmt.setString(7, teacher.mobile);
			prstmt.setString(8, teacher.dob);
			
			
			int i = prstmt.executeUpdate();
				
			    if(i > 0) {message = "4. "+teacher.name+" Added in DataBase :)";
				}else{
					message = "4. "+teacher.name+" NOT Added in DataBase :(";}
			}catch (Exception e) {
				System.out.println("Some Exception: "+e);
	}
	return message;	
}
	
	public boolean Authenticate(Teacher teacher) {
		boolean message = false; 
		try {
			String sql = "select * from teacher where email = ? and password = ?";
			System.out.println(sql);
		    prstmt = connection.prepareStatement(sql);
		    
			prstmt.setString(1, teacher.email);
			prstmt.setString(2, teacher.password);
			ResultSet rs = prstmt.executeQuery();
			
			message = rs.next();
			if(message) {
				
				teacher.id = rs.getInt(1);
				teacher.name = rs.getString(2);
				teacher.designation = rs.getString(3);
				teacher.department =rs.getString(4);
				teacher.mobile = rs.getString(7);
				teacher.dob = rs.getString(8);
				System.out.println(teacher);
			}
		}catch (Exception e) {
		
			System.out.println("Some Exception: "+e);
		}
		return message;	
	}
	
	public int countStaff() {
		String sql = "select count(*) from teacher";
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
			// TODO Auto-generated catch block
			System.out.println("Some Exception: "+e);
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	public void closeConnection() {
		try {
			connection.close();
			System.out.println("4. Connection Closed");
		} catch (Exception e) {
			System.out.println("Some Exception: "+e);
		}
	}
	
	
	public int getTeacherID(String name) {
		int id=0;
		try {
			String sql = "select id from teacher where name=?";
			System.out.println(sql);
			prstmt = connection.prepareStatement(sql);
			prstmt.setString(1, name);
			ResultSet rs = prstmt.executeQuery();
			boolean message = rs.next();
			if(message) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Some Exception: "+e);
			//e.printStackTrace();
		}
		
		return id;
	}
	public String addTeacherInBatch(int teacherid, int batchid) {
		String message = "NA";
		try {
			String sql = "insert into teacherandbatch values(?, ?,null)";
			System.out.println(sql);
		    prstmt = connection.prepareStatement(sql);
			prstmt.setInt(1, teacherid);
			prstmt.setInt(2, batchid);
			int i = prstmt.executeUpdate();
			
		    if(i > 0) {message = "4. Added in DataBase studentBatch :)";
			}else{
				message = "4. NOT Added in DataBase studentBatch :( :( ";}

		}catch (SQLException e) {
			System.out.println("Some Exception: "+e);
			e.printStackTrace();
		}
		
		
		return message;
	}

}
