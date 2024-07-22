package com.bannershallmark.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.UsersDetailsDao;
import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.Users;

@Repository
public class UsersDetailsDaoImpl implements UsersDetailsDao{

	 @Autowired
	  private SessionFactory sessionFactory;
	
	
	
	 @Override
	public void save(Users users) {
		    Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(users);
	}

	
	@Override
	public List<Users> findAll() {
		Session session=sessionFactory.getCurrentSession();
		Query<Users> query=session.createQuery("from Users", Users.class);
		return query.getResultList();
	}

	@Override
	public void deleteById(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		Users users=findById(id);
		session.delete(users);
		
	}

	@Override
	public Users findById(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		Users users=session.get(Users.class, id);
		return users;
	}


	@Override
	public List<Role> findAllRole() {
		Session session=sessionFactory.getCurrentSession();
		Query<Role> query=session.createQuery("from Role", Role.class);
		return query.getResultList();
	}


	@Override
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
	public List<Users> findAllByRole(Integer roleId) {
		Session session=sessionFactory.getCurrentSession();
		Query<Users> query=session.createQuery("from Users where role.id=:roleId", Users.class);
		query.setParameter("roleId", roleId);
		return query.getResultList();
	}

}
