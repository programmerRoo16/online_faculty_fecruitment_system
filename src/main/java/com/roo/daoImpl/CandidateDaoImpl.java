package com.roo.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.roo.dao.CandidateDao;
import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Vacancy;

@Component
public class CandidateDaoImpl implements CandidateDao{
	 @Autowired
	 private HibernateTemplate hibernateTemplate;
     
	 @Autowired
	 private SessionFactory factory;
	 
	 @Override
	 @Transactional
	 public boolean registerCandidate(Candidate candidate) {
		  hibernateTemplate.save(candidate);	
		  return true;
	 }
	 
     public Candidate getAllCandidate(String Email){
    	 try {
    		 Session session=factory.getCurrentSession();
        	 String hql="from candidate where email=: email";
        	 
        	 Query<Candidate> query=session.createQuery(hql, Candidate.class).setParameter("email", Email);
        	 Candidate candidate=query.list().get(0);
        	 if(candidate != null)
        	 return candidate;
        	 else
        		 return null;
        				

		} catch (Exception e) {
			return null;
		}     }

	 @Override
	 @Transactional
	public boolean updateCandidate(Candidate candidate) {
		hibernateTemplate.update(candidate);
		return true;
	}

	 @Override
	 @Transactional
	 public boolean deleteProfile(Candidate candidate) {
         try {
        	 hibernateTemplate.delete(candidate);
    		 return true;
		} catch (Exception e) {
			return false;
		}
	 }
      
	 
	 @Override
	 @Transactional
	 public Candidate checkCandidate(String email, String password) {
		 try {
    		 Session session=factory.getCurrentSession();
        	 String hql="from Candidate c where c.email=: email and c.password=:password";
        	 
        	 Query<Candidate> query=session.createQuery(hql, Candidate.class);
        	 query.setParameter("email", email);
        	 query.setParameter("password", password);
        	 Candidate candidate=query.list().get(0);
        	 if(candidate != null)
        	 return candidate;
        	 else
        		 return null;
        				

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}     }

	 @Override
	 @Transactional
	 public boolean updatePassword(String oldpassword, String newPassword, String email) {
		 Candidate candidate=hibernateTemplate.get(Candidate.class, email);
		 if(candidate !=null && candidate.getPassword().equals(oldpassword)) {
			 candidate.setPassword(newPassword);
			 hibernateTemplate.update(candidate);
			 return true;
		 }
		 return false;
	 }
	 
	    @Override
		@Transactional
		public List<Vacancy> getVacancy() {
			Session session=factory.getCurrentSession();
			String hql="from Vacancy";
			Query<Vacancy> query=session.createQuery(hql,Vacancy.class);
			if(query.list().size()>0)
			return query.list();
			else
				return null;
		}
       
	    @Override
	    @Transactional
		public List<Vacancy> viewVacancies(String email) {
			Session session=factory.getCurrentSession();
			
			Query<Vacancy> query=session.createQuery("from Vacancy v where v.email!=:email",Vacancy.class).setParameter("email", email);
			
			List<Vacancy> list=query.list();
			
			return list;
		}
	    
	    @Override
		@Transactional
		public List<AppliedVacancy> appliedStetus(Candidate candidate) {
			Session session = factory.getCurrentSession();
			Query<AppliedVacancy> query=session.createQuery("from AppliedVacancy a where a.candidate=:candidate",AppliedVacancy.class);
			query.setParameter("candidate", candidate);
			List<AppliedVacancy> list=query.list();
			return list;
		}

}