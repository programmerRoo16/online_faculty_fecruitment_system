package com.roo.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.roo.dao.VacancyDao;
import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Vacancy;

@Component
public class VacancyDaoImpl implements VacancyDao {
    @Autowired
	private SessionFactory factory;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	
	@Override
	@Transactional
	public boolean addVacancy(Vacancy vacancy) {
		hibernateTemplate.save(vacancy);
		return true;
	}

	@Transactional
	public Vacancy findVacancy(int vid)
	{
		Session session=factory.getCurrentSession();
		String hql="from Vacancy v where v.vacancyId=:vacancyId";
		Query<Vacancy> query = session.createQuery(hql,Vacancy.class);
		query.setParameter("vacancyId",vid);
		return query.uniqueResult();
	}


	@Override
	@Transactional
	public boolean updateVacancy(Vacancy vacancy) {
		hibernateTemplate.update(vacancy);
		return true;
	}


	@Override
	@Transactional
	public boolean deleteVacancy(int vId){
		Session session=factory.getCurrentSession();
		Vacancy vacancy=hibernateTemplate.get(Vacancy.class, vId);
		Query<AppliedVacancy> query=session.createQuery("from AppliedVacancy av where av.vacancy=:vacancy", AppliedVacancy.class).setParameter("vacancy", vacancy);
		List<AppliedVacancy> list=query.list();
		if(list.size()>0) {
			for(AppliedVacancy appliedVacancy:list) {
				hibernateTemplate.delete(appliedVacancy);
			}
		}
	    if(vacancy!=null) {
		hibernateTemplate.delete(vacancy);
		return true;
	}
	 else { return false;}
	}	


	@Override
	@Transactional
	public List<Vacancy> viewVacancies(String email){
		Session session=factory.getCurrentSession();
		
		Query<Vacancy> query=session.createQuery("from Vacancy v where v.email=: email",Vacancy.class);
		query.setParameter("email", email);
		
		List<Vacancy> list=query.list();
		
		return list;
	}

}
