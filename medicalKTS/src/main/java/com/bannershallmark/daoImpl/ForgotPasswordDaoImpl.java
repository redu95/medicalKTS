package com.bannershallmark.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bannershallmark.dao.ForgotPasswordDao;
import com.bannershallmark.entity.ForgotPassword;

@Repository
public class ForgotPasswordDaoImpl implements ForgotPasswordDao{

	
	 @Autowired
	 private SessionFactory sessionFactory;
	   
	@Override
	public List<ForgotPassword> findAll() {
		Session session=sessionFactory.getCurrentSession();
		Query<ForgotPassword> query=session.createQuery("from ForgotPassword", ForgotPassword.class);
		return query.getResultList();
	}

	@Override
	public void save(ForgotPassword forgotPassword) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(forgotPassword);
		
	}

	@Override
	public ForgotPassword findById(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		ForgotPassword forgotPassword=session.get(ForgotPassword.class, id);
		return forgotPassword;
	}

	@Override
	public void deleteById(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		ForgotPassword forgotPassword=findById(id);
		session.delete(forgotPassword);	
	}

	@Override
	public ForgotPassword getByRandomId(String randomId) {
		Session session = sessionFactory.getCurrentSession();
		Query<ForgotPassword> query = session.createQuery("from ForgotPassword where randomId=:randomId", ForgotPassword.class);
		query.setParameter("randomId", randomId);
		return query.getSingleResult();
	}

}
