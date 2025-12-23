package com.roo.dao;

import java.util.List;

import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;

public interface AdminDao {
public List<Candidate> getCandidate();
public List<Recruiter> getRecruiter();
public List<Vacancy> getVacancy();
public List<AppliedVacancy> getAppliedVacancy();
public boolean updatePassword(String password);
public boolean checkAdmin(String username,String password);
public boolean approveCandidate(String email);
public Candidate viewCandidate(String email);
public boolean deleteCandidate(String email);
public boolean approveRecruiter(String email);
public Recruiter viewRecruiter(String email);
public boolean deleteRecruiter(String email);
public Vacancy viewVacancy(int vid);
public boolean deleteVacancy(int vid); 
}
