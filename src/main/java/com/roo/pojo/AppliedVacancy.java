package com.roo.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

import javax.persistence.ManyToOne;

@Entity
public class AppliedVacancy {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private int id;
@ManyToOne
@JoinColumn(name = "vacancyId")
private Vacancy vacancy;
@ManyToOne
@JoinColumn(name ="candidate_email", referencedColumnName = "email")
private Candidate candidate;
@ManyToOne
@JoinColumn(name = "recruiter_email",referencedColumnName = "email")
private Recruiter recruiter;

private String statusByRecruiter;
public AppliedVacancy() {
	super();
	// TODO Auto-generated constructor stub
}

public AppliedVacancy(int id, Vacancy vacancy, Candidate candidate, Recruiter recruiter, String statusByRecruiter) {
	super();
	this.id = id;
	this.vacancy = vacancy;
	this.candidate = candidate;
	this.recruiter = recruiter;
	this.statusByRecruiter = statusByRecruiter;
}

public AppliedVacancy(Vacancy vacancy, Candidate candidate, Recruiter recruiter,
		String statusByRecruiter) {
	super();
	this.vacancy = vacancy;
	this.candidate = candidate;
	this.recruiter = recruiter;
	this.statusByRecruiter = statusByRecruiter;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Vacancy getVacancy() {
	return vacancy;
}
public void setVacancy(Vacancy vacancy) {
	this.vacancy = vacancy;
}
public Candidate getCandidate() {
	return candidate;
}
public void setCandidate(Candidate candidate) {
	this.candidate = candidate;
}
public Recruiter getRecruiter() {
	return recruiter;
}
public void setRecruiter(Recruiter recruiter) {
	this.recruiter = recruiter;
}

public String getStatusByRecruiter() {
	return statusByRecruiter;
}
public void setStatusByRecruiter(String statusByRecruiter) {
	this.statusByRecruiter = statusByRecruiter;
}


}
