package com.bannershallmark.daoImpl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bannershallmark.dao.RoleDao;
import com.bannershallmark.entity.Role;

@Repository
public class RoleDaoImpl implements RoleDao {

	 @Autowired
	  private SessionFactory sessionFactory;
	
	@Override
	public List<Role> findAll() {
		Session session=sessionFactory.getCurrentSession();
		Query<Role> query=session.createQuery("from Role", Role.class);
		return query.getResultList();
	}

	@Override
	public void save(Role role) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(role);
		
	}

	@Override
	public Role findById(Integer roleId) {
		Session session=sessionFactory.getCurrentSession();
		Role role=session.get(Role.class, roleId);
		return role;
	}

	@Override
	public void deleteById(Integer roleId) {
		Session session=sessionFactory.getCurrentSession();
		Role role=findById(roleId);
		session.delete(role);
		
	}

	@Override
	public boolean isRoleByExist(String name) {
		List<Role> role = null;
		try {
		Session session = sessionFactory.getCurrentSession();
		Query<Role> query = session.createQuery("from Role where name= :name ", Role.class);
		query.setParameter("name", name);
		role = query.getResultList();
		
		}catch (Exception e) {
			System.out.println("Exception In isPayByExist : " +e.getMessage());
		}
		
		if(role.size()>=1) 
		return true;
		else
		return false ;
	}

	

}
