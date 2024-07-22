package com.bannershallmark.daoImpl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.UserRoleAccessPermissionDao;
import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.UserRoleAccessPermission;

@Repository
public class UserRoleAccessPermissionDaoImpl implements UserRoleAccessPermissionDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<String> findAccessPermissionByRole(String role) {
		
		String rolee = role.replaceAll("[^a-zA-Z0-9]", "");
		
		System.out.println( "Rolee ::" + rolee);
		Session session = sessionFactory.getCurrentSession();
//		Query<String> query = session.createQuery("SELECT t3.urlPath FROM " + 
//				"	UserRoleAccessPermission t1 INNER JOIN Role t2 ON t2.id = t1.userRoleId " + 
//				"	INNER JOIN AccessPermission t3  ON t3.id = t1.accessPermissionId " + 
//				"WHERE " + 
//				"	t2.name = :role ", String.class);
//		query.setParameter("role", role);
//		return query.getResultList();
//		
		String sql = "SELECT	accessPermissionDesc FROM userroleaccesspermission t1 "
				+ "INNER JOIN userrole t2 ON t2.userRoleId = t1.userRoleId 	"
				+ "INNER JOIN accesspermission t3  ON t3.accessPermissionId = t1.accessPermissionId "
				+ "WHERE 	t2.roleName =:role";
		
		Query query= (Query) session.createNativeQuery(sql);
		//.setResultTransformer(new AliasToBeanResultTransformer(String.class));
		query.setParameter("role", rolee);
		List<String> list = query.list();
		
		System.out.println(list.toString());
		return list;
	}

	@Override
	public List<UserRoleAccessPermission> findAll() {
		Session session=sessionFactory.getCurrentSession();
		Query<UserRoleAccessPermission> query=session.createQuery("from UserRoleAccessPermission", UserRoleAccessPermission.class);
		return query.getResultList();
	}

	@Override
	public void save(Integer apId ,Integer roleId ) {
		//Session session = sessionFactory.getCurrentSession();
		
		
		//session.saveOrUpdate(userRoleAccessPermission);
		
//		INSERT INTO table_name
//		VALUES (value1, value2, value3, ...);
		String str="insert into userroleaccesspermission (accessPermissionId,userRoleId) values ("+apId+" ,"+roleId +")";
		Session session = sessionFactory.getCurrentSession();
		Query query  = session.createSQLQuery(str) ;
		query.executeUpdate();
	}

	@Override
	public UserRoleAccessPermission findById(Integer Id) {
		Session session=sessionFactory.getCurrentSession();
		UserRoleAccessPermission userRoleAccessPermission=session.get(UserRoleAccessPermission.class, Id);
		return userRoleAccessPermission;
	}

	@Override
	public void deleteById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query  = session.createSQLQuery("delete from userroleaccesspermission where userRoleId=:userRoleId");
		query.setParameter("userRoleId", id);
		query.executeUpdate();
	}

	@Override
	public boolean AccessPermissionExist(String urlPath) {
		List<UserRoleAccessPermission> userRoleAccessPermission = null;
		try {
		Session session = sessionFactory.getCurrentSession();
		Query<UserRoleAccessPermission> query = session.createQuery("from UserRoleAccessPermission where urlPath= :urlPath ", UserRoleAccessPermission.class);
		query.setParameter("urlPath", urlPath);
		userRoleAccessPermission = query.getResultList();
		
		}catch (Exception e) {
			System.out.println("Exception In isPayByExist : " +e.getMessage());
		}
		if(userRoleAccessPermission.size()>=1) 
		return true;
		else
		return false ;
	}
	
	@Override
	@Transactional
	public void saveGroup(String apGroupIds, Integer roleId) {
		String str="INSERT INTO userroleaccesspermission (accessPermissionId,userRoleId) "
				+ "SELECT DISTINCT apgmap.accessPermissionId ,:roleId FROM accessPermissionsByGroup_mapped_accessPermission apgmap "
				+ "WHERE apgmap.accessPermissionsByGroupID IN ("+ apGroupIds +")";
		Session session = sessionFactory.getCurrentSession();
		Query query  = session.createNativeQuery(str);
		query.setParameter("roleId", roleId);
		query.executeUpdate();
	}
	
}
