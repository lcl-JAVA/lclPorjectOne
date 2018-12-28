package com.example.demo.entity;

import java.io.Serializable;

public class Users  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4837562413440768670L;
	private String id;
	private String username;
	private int age;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String id, String username, int age) {
		super();
		this.id = id;
		this.username = username;
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
