package com.roo.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Recruiter {
private String name;
private String recruiter;
@Id
private String email;
private String password;
private String contact;
private String address;
private boolean verified;
public Recruiter() {
	super();
	// TODO Auto-generated constructor stub
}

public Recruiter(String name, String recruiter, String email, String password, String contact, String address,
		boolean verified) {
	super();
	this.name = name;
	this.recruiter = recruiter;
	this.email = email;
	this.password = password;
	this.contact = contact;
	this.address = address;
	this.verified = verified;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRecruiter() {
	return recruiter;
}
public void setRecruiter(String recruiter) {
	this.recruiter = recruiter;
}
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
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

public boolean isVerified() {
	return verified;
}

public void setVerified(boolean verified) {
	this.verified = verified;
}

}
