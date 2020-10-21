package com.columbia.model;

public class Teacher {
	
	public int id;
	public String name;
	public String designation;
	public String department;
	public String email;
	public String password;
	public String mobile;
	public String dob;
	public Teacher() {}
	public Teacher(int id, String name, String designation, String department, String email, String password,
			String mobile, String dob) {
		
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.department = department;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.dob = dob;
	}
	
	
	public String toString() {
		return "Teacher [id=" + id + ", name=" + name + ", designation=" + designation + ", department=" + department
				+ ", email=" + email + ", password=" + password + ", mobile=" + mobile  + ", dob="
				+ dob + "]";
	}
	
}
