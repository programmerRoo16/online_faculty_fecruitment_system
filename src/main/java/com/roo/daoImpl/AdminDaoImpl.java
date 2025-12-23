package com.roo.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.roo.dao.AdminDao;
import com.roo.pojo.Admin;
import com.roo.pojo.AppliedVacancy;
import com.roo.pojo.Candidate;
import com.roo.pojo.Recruiter;
import com.roo.pojo.Vacancy;

@Component
public class AdminDaoImpl implements AdminDao{
    @Autowired
	private SessionFactory factory;
    @Autowired
    private HibernateTemplate hibernateTemplate;
	@Override
	@Transactional
	public List<Candidate> getCandidate() {
		Session session=factory.getCurrentSession();
		String hql="from Candidate";
		Query<Candidate> query=session.createQuery(hql,Candidate.class);
		if(query.list().size()>0)
		return query.list();
		else
			return null;
	}

	@Override
	@Transactional
	public List<Recruiter> getRecruiter() {
		Session session=factory.getCurrentSession();
		String hql="from Recruiter";
		Query<Recruiter> query=session.createQuery(hql,Recruiter.class);
		if(query.list().size()>0)
		return query.list();
		else
			return null;
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
	public List<AppliedVacancy> getAppliedVacancy() {
		Session session = factory.getCurrentSession();
		Query<AppliedVacancy> query=session.createQuery("from AppliedVacancy",AppliedVacancy.class);
		List<AppliedVacancy> list=query.list();
		return list;
	}
	@Override
	@Transactional
	public boolean updatePassword(String password) {
		Session session = factory.getCurrentSession();
		Query<Admin> query=session.createQuery("from Admin",Admin.class);
		Admin admin=query.list().get(0);
		if(admin!=null) {
			admin.setUsername(admin.getUsername());
			admin.setPassword(password);
			return true;
		}
		else {
		return false;
		}
	}

	@Override
	@Transactional
	public boolean checkAdmin(String username, String password) {
		Session session = factory.getCurrentSession();
		String hql="From Admin a where a.username=username and a.password=password";
		Query<Admin> query=session.createQuery(hql, Admin.class);
		Admin admin=query.list().get(0);
		if(admin!=null)
			return true;
		else
			return false;
	}

	@Override
	@Transactional
	public boolean approveCandidate(String email) {
		Session session=factory.getCurrentSession();
		Query<Candidate> query=session.createQuery("from Candidate c where c.email=:email",Candidate.class).setParameter("email",email);
		Candidate candidate=query.getSingleResult();
		if(candidate!=null) {
		candidate.setVerified(true);
		hibernateTemplate.update(candidate);
		return true;
		}else {
		return false;
		}
	}

	@Override
	@Transactional
	public Candidate viewCandidate(String email) {
		Session session=factory.getCurrentSession();
		Query<Candidate> query=session.createQuery("from Candidate c where c.email=:email",Candidate.class).setParameter("email",email);
		Candidate candidate=query.getSingleResult();
		if(candidate!=null)
		    return candidate;
		else
			return null;
	}

	@Override
	@Transactional
	public boolean deleteCandidate(String email) {
		Session session=factory.getCurrentSession();
		Query<Candidate> query=session.createQuery("from Candidate c where c.email=:email",Candidate.class).setParameter("email",email);
		Candidate candidate=query.getSingleResult();
		if(candidate!=null) {
		hibernateTemplate.delete(candidate);
		return true;
		}else {
		return false;
		}
	}

	@Override
	@Transactional
	public boolean approveRecruiter(String email) {
		Session session=factory.getCurrentSession();
		Query<Recruiter> query=session.createQuery("from Recruiter r where r.email=:email",Recruiter.class).setParameter("email",email);
		Recruiter recruiter=query.getSingleResult();
		if(recruiter!=null) {
		recruiter.setVerified(true);
		hibernateTemplate.update(recruiter);
		return true;
		}else {
		return false;
		}
	}

	@Override
	@Transactional
	public Recruiter viewRecruiter(String email) {
		    Session session=factory.getCurrentSession();
			Query<Recruiter> query=session.createQuery("from Recruiter r where r.email=:email",Recruiter.class).setParameter("email",email);
			Recruiter recruiter=query.getSingleResult();
			if(recruiter!=null)
			    return recruiter;
			else
				return null;
		}
	

	@Override
	@Transactional
	public boolean deleteRecruiter(String email) {
		Session session=factory.getCurrentSession();
		Query<Recruiter> query=session.createQuery("from Recruiter r where r.email=:email",Recruiter.class).setParameter("email",email);
		Recruiter recruiter=query.getSingleResult();
		if(recruiter!=null) {
		hibernateTemplate.delete(recruiter);
		return true;
		}else {
		return false;
		}
	}

	@Override
	@Transactional
	public Vacancy viewVacancy(int vid) {
		Session session=factory.getCurrentSession();
		Query<Vacancy> query=session.createQuery("from Vacancy v where v.vacancyId=:vid",Vacancy.class).setParameter("vid",vid);
		Vacancy vacancy=query.getSingleResult();
		if(vacancy!=null)
		    return vacancy;
		else
			return null;
	}

	@Override
	@Transactional
	public boolean deleteVacancy(int vid) {
		Session session=factory.getCurrentSession();
		Query<Vacancy> query=session.createQuery("from Vacancy v where v.vacancyId=:vid",Vacancy.class).setParameter("vid",vid);
		Vacancy vacancy=query.getSingleResult();
		if(vacancy!=null) {
			hibernateTemplate.delete(vacancy);
		    return true;
		}
		else {
			return false;
		}
	}
   	
}
