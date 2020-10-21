package com.columbia.model;

public class Batch {
	public int id;
	public String name;
	public int year;
	public float fee;
	public int numberOfStudent;
	public int Tid;
	public String Tname;
	public Batch() {
		
	}
	public Batch(int id, String name, int year, float fee, int numberOfStudent, int tid, String tname) {
		super();
		this.id = id;
		this.name = name;
		this.year = year;
		this.fee = fee;
		this.numberOfStudent = numberOfStudent;
		Tid = tid;
		Tname = tname;
	}

	@Override
	public String toString() {
		return "Batch [id=" + id + ", name=" + name + ", year=" + year + ", fee=" + fee + ", numberOfStudent="
				+ numberOfStudent + ", Tid=" + Tid + ", Tname=" + Tname + "]";
	}	
	
}
