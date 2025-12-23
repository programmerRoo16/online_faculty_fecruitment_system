package com.roo.dao;

import java.util.List;

import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;

public interface AplliedVacancyDao {
public Candidate getCandidate(String email);
public Recruiter getRecruiter(String email);
public Vacancy getVacancy(int vacancyId);
public boolean saveAplliedVacancy(AppliedVacancy appliedVacancy);
public List<AppliedVacancy> viewCandidate(Recruiter recruiter);

public boolean updateStatus(AppliedVacancy appliedVacancy);
}
