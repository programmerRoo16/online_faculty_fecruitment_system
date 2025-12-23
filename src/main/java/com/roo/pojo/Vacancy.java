package com.roo.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Add_Vacancy")
public class Vacancy {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int vacancyId;
private String post;
private String subject;
private String location;
private String criteria;
private int noVacancy;
private String salary;
private String advDate;
private String lastDate;
private String email;
private String recruiter;
private String nameOfRecruiter;
public Vacancy() {
	super();
	// TODO Auto-generated constructor stub
}
public Vacancy(String post, String subject, String location, String criteria,int noVacancy, String salary, String advDate,
		String lastDate, String email, String recruiter, String nameOfRecruiter) {
	super();
	this.post = post;
	this.subject = subject;
	this.location = location;
	this.criteria = criteria;
	this.noVacancy=noVacancy;
	this.salary = salary;
	this.advDate = advDate;
	this.lastDate = lastDate;
	this.email = email;
	this.recruiter = recruiter;
	this.nameOfRecruiter = nameOfRecruiter;
}
public Vacancy( int vacancyId,String post, String subject, String location, String criteria,int noVacancy, String salary, String advDate,
		String lastDate, String email, String recruiter, String nameOfRecruiter) {
	super();
	this.vacancyId = vacancyId;
	this.post = post;
	this.subject = subject;
	this.location = location;
	this.criteria = criteria;
	this.noVacancy=noVacancy;
	this.salary = salary;
	this.advDate = advDate;
	this.lastDate = lastDate;
	this.email = email;
	this.recruiter = recruiter;
	this.nameOfRecruiter = nameOfRecruiter;
}
public int getVacancyId() {
	return vacancyId;
}
public void setVacancyId(int vacancyId) {
	this.vacancyId = vacancyId;
}
public String getPost() {
	return post;
}
public void setPost(String post) {
	this.post = post;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getCriteria() {
	return criteria;
}
public void setCriteria(String criteria) {
	this.criteria = criteria;
}

public int getNoVacancy() {
	return noVacancy;
}
public void setNoVacancy(int noVacancy) {
	this.noVacancy = noVacancy;
}
public String getSalary() {
	return salary;
}
public void setSalary(String salary) {
	this.salary = salary;
}
public String getAdvDate() {
	return advDate;
}
public void setAdvDate(String advDate) {
	this.advDate = advDate;
}
public String getLastDate() {
	return lastDate;
}
public void setLastDate(String lastDate) {
	this.lastDate = lastDate;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getRecruiter() {
	return recruiter;
}
public void setRecruiter(String recruiter) {
	this.recruiter = recruiter;
}
public String getNameOfRecruiter() {
	return nameOfRecruiter;
}
public void setNameOfRecruiter(String nameOfRecruiter) {
	this.nameOfRecruiter = nameOfRecruiter;
}


}
