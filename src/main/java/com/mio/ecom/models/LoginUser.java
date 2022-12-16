package com.mio.ecom.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class LoginUser {
	@NotBlank
	@Email
	private String email;
	
	@NotBlank
	private String password;
	
	// constructor
	public LoginUser() {}

	// getters, setters
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
