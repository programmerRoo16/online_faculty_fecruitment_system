package com.roo.dao;

import java.util.List;

import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Vacancy;

public interface CandidateDao {
public boolean registerCandidate(Candidate candidate);
public boolean deleteProfile(Candidate candidate);
public boolean updateCandidate(Candidate candidate);
public Candidate checkCandidate(String email, String password);
public boolean updatePassword(String oldpassword,String newPassword,String email);
public List<AppliedVacancy> appliedStetus(Candidate candidate);
public List<Vacancy> viewVacancies(String email);
public List<Vacancy> getVacancy();
}
