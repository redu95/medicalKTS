package com.bannershallmark.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.UsersDao;

import com.bannershallmark.entity.Users;

@Repository
@Service
public class UsersDaoImpl implements UsersDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	 @Transactional
	public Users getUserByUsername(String username) {
		Users user = null;
		try {
		Session session = sessionFactory.getCurrentSession();
		Query<Users> query = session.createQuery("from Users where username=:username", Users.class);
		query.setParameter("username", username);
		user = query.getSingleResult();
		return user;
		}catch (Exception e) {
			System.out.println(" Exception in getUserByUsername :: " + e.getMessage());
			return user;
		}
		
	}
	@Override
	 @Transactional
	public void saveNewUser(Users users) {
		Session session = sessionFactory.getCurrentSession();		
		session.saveOrUpdate(users);
		
		
		
	}

	
	@Override
	 @Transactional
	public List<Users> findAll() {
		Session session=sessionFactory.getCurrentSession();
		Query<Users> query=session.createQuery("from Users", Users.class);
		return query.getResultList();
	}

	@Override
	 @Transactional
	public void deleteById(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		Users users=findById(id);
		session.delete(users);
		
	}

	@Override
	@Transactional
	public Users findById(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		Users users=session.get(Users.class, id);
		return users;
	}

	
}
