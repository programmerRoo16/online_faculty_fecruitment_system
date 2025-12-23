package com.roo.dao;

import java.util.List;

import com.roo.pojo.Vacancy;

public interface VacancyDao {

	public boolean addVacancy(Vacancy vacancy);
	public boolean updateVacancy(Vacancy vacancy);
	public boolean deleteVacancy(int vId);
	public List<Vacancy> viewVacancies(String email);
}
