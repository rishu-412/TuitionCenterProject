package com.columbia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.columbia.model.Batch;
import com.columbia.model.Teacher;

public class BatchDB {
	Connection connection;
	PreparedStatement prstmt;
	public BatchDB() {
		
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
	
	public String addBatch(Batch batch) {
		String message = "NA";
		
		try {
			String sql = "insert into batch values(?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
		    prstmt = connection.prepareStatement(sql);
			prstmt.setInt(1, batch.id);
			prstmt.setString(2, batch.name);
			prstmt.setInt(3, batch.year);
			prstmt.setFloat(4, batch.fee);
			prstmt.setInt(5, batch.numberOfStudent);
			prstmt.setInt(6, batch.Tid);
			prstmt.setString(7,batch.Tname);
			
			int i = prstmt.executeUpdate();
				
			    if(i > 0) {message = "4. "+batch.name+" Added in DataBase :)";
				}else{
					message = "4. "+batch.name+" NOT Added in DataBase :(";}
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
	
	public int countBatch() {
		String sql = "select count(*) from batch";
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
	public int getBatchID(String name) {
		int id=0;
		try {
			String sql = "select id from batch where name=?";
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
	public String addStudentInBatch(int studentid, int batcid) {
		String message = "NA";
		try {
			String sql = "insert into studentandbatch values(?, ?, null)";
			System.out.println(sql);
		    prstmt = connection.prepareStatement(sql);
			prstmt.setInt(1, studentid);
			prstmt.setInt(2, batcid);
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
