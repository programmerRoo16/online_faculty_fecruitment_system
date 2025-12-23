package com.roo.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.roo.dao.RecruiterDao;
import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;
@Component
public class RecruiterDaoImpl implements RecruiterDao{
	@Autowired
	private SessionFactory fectory;
    @Autowired
	private HibernateTemplate hibernateTemplate;
	@Override
	@Transactional
	public boolean registerRecruit(Recruiter recruiter) {
		hibernateTemplate.save(recruiter);
		return true;
	}
    
	
	@Override
	@Transactional
	public Recruiter checkRecruiter(String email, String password) {
		try {
			Session session=fectory.getCurrentSession();
			String hql="from Recruiter r where r.email=:email and r.password=:password";
			Query<Recruiter> query=session.createQuery(hql,Recruiter.class);
			query.setParameter("email",email);
			query.setParameter("password",password);
			Recruiter recruiter=query.list().get(0);
			if(recruiter!=null)
				return recruiter;
			else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	@Override
	@Transactional
	public boolean updateProfile(Recruiter recruiter) {
		hibernateTemplate.update(recruiter);
		return true;
	}

	@Override
	@Transactional
	public boolean deleteProfile(Recruiter recruiter) {
		 try {
        	 hibernateTemplate.delete(recruiter);
    		 return true;
		} catch (Exception e) {
			return false;
		}
	 }
	

	@Override
	@Transactional
	public boolean updatePassword(String oldPassword, String newPassword,String email){
		 Recruiter recruiter=hibernateTemplate.get(Recruiter.class, email);
		 if(recruiter !=null && recruiter.getPassword().equals(oldPassword)) {
			 recruiter.setPassword(newPassword);
			 hibernateTemplate.update(recruiter);
			 return true;
		 }else {
		 return false;
		 }
	 }
	


	@Override
	@Transactional
	public boolean addVacancy(Vacancy vacancy) {
		hibernateTemplate.save(vacancy);
		return true;
	}
    
	@Transactional
	public Vacancy findVacancy(int vid,String post)
	{
		Session session=fectory.getCurrentSession();
		String hql="from Vacancy v where v.vacancyId=:vacancyId and v.post=:post";
		Query<Vacancy> query = session.createQuery(hql,Vacancy.class);
		query.setParameter("vacancyId",vid);
		query.setParameter("post", post);
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
	public boolean deleteVacancy(int vId,String post){
		Vacancy vacancy=hibernateTemplate.get(Vacancy.class, vId);
	    if(vacancy!=null) {
		hibernateTemplate.delete(vacancy);
		return true;
	}
	 else { return false;}
	}	


	@Override
	@Transactional
	public List<Vacancy> viewVacancies(String email) {
        Session session=fectory.getCurrentSession();
		
		Query<Vacancy> query=session.createQuery("from Vacancy v where v.email!=:email",Vacancy.class).setParameter("email", email);
		
		List<Vacancy> list=query.list();
		
		return list;
	}

    @Override
    @Transactional
	public List<AppliedVacancy> viewCandidate(Recruiter recruiter) {
    	Session session = fectory.getCurrentSession();
		Query<AppliedVacancy> query=session.createQuery("from AppliedVacancy a where a.recruiter=:recruiter",AppliedVacancy.class);
		query.setParameter("recruiter", recruiter);
		List<AppliedVacancy> list=query.list();
		return list;
	}


	
    
	
}
