package com.columbia.model;

public class Student {
	
	public int id;
	public int rollNo;
	public String name;
	public String email;
	public String mobile;
	public String dob;
	public String admissionDate;
	public float fee;
	
	public Student() {
		
	}
	public Student(int id, int rollNo, String name, String email, String mobile, String dob,
			String admissionDate, float fee) {
		this.id = id;
		this.rollNo = rollNo;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.dob = dob;
		this.admissionDate = admissionDate;
		this.fee = fee;
	}

	public String toString() {
		return "Student [id=" + id + ", rollNo=" + rollNo + ", name=" + name + ", email=" + email + ", mobile=" + mobile
				+", dob=" + dob + ", admissionDate=" + admissionDate + ", fee=" + fee+ "]";
	}
	

}
