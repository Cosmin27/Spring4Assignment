package com.cgm.assignment4spring.entities;

public class ServiceResponse {
	private String message = "Operation successful!";
	private int code = 200;
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
}
