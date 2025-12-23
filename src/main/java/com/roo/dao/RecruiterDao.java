package com.roo.dao;


import java.util.List;

import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;

public interface RecruiterDao {
public boolean registerRecruit(Recruiter recruiter);
public Recruiter checkRecruiter(String email, String Password);
public boolean updateProfile(Recruiter recruiter);
public boolean deleteProfile(Recruiter recruiter);
public boolean updatePassword(String oldPassword, String newPassword,String email);
public boolean addVacancy(Vacancy vacancy);
public boolean updateVacancy(Vacancy vacancy);
public boolean deleteVacancy(int vId,String post);
public List<Vacancy> viewVacancies(String email);
public List<AppliedVacancy> viewCandidate(Recruiter recruiter);
}
