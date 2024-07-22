package com.bannershallmark.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.AccessPermissionDao;
import com.bannershallmark.entity.AccessPermission;
import com.bannershallmark.entity.AccessPermissionsByGroup;
import com.bannershallmark.entity.UserRoleAccessPermission;

@Repository
public class AccessPermissionDaoImpl implements AccessPermissionDao {

	 @Autowired
	  private SessionFactory sessionFactory;
	
	@Override
	public List<AccessPermission> findAll() {
		Session session=sessionFactory.getCurrentSession();
		Query<AccessPermission> query=session.createQuery("from AccessPermission", AccessPermission.class);
		return query.getResultList();
	}

	@Override
	public void save(AccessPermission accessPermission) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(accessPermission);
		
	}

	@Override
	public AccessPermission findById(Integer accessPermissionId) {
		Session session=sessionFactory.getCurrentSession();
		AccessPermission accessPermission=session.get(AccessPermission.class, accessPermissionId);
		return accessPermission;
	}

	@Override
	public void deleteById(Integer accessPermissionId) {
		Session session=sessionFactory.getCurrentSession();
		AccessPermission accessPermission=findById(accessPermissionId);
		session.delete(accessPermission);
		
	}

	@Override
	public boolean AccessPermissionExist(String urlPath) {
		List<AccessPermission> accessPermission = null;
		try {
		Session session = sessionFactory.getCurrentSession();
		Query<AccessPermission> query = session.createQuery("from AccessPermission where urlPath= :urlPath ", AccessPermission.class);
		query.setParameter("urlPath", urlPath);
		accessPermission = query.getResultList();
		
		}catch (Exception e) {
			System.out.println("Exception In AccessPermission  Already exits: " +e.getMessage());
		}
		
		if(accessPermission.size()>=1) 
		return true;
		else
		return false ;
	}

	@Override
	public List<UserRoleAccessPermission> findAllData(Integer roleId) {
		
		Session session=sessionFactory.getCurrentSession();
		Query<UserRoleAccessPermission> query=session.createQuery("from UserRoleAccessPermission where userRoleId=:roleId", UserRoleAccessPermission.class);
		query.setParameter("roleId", roleId);
		return query.getResultList();
	}

	@Override
	public List<AccessPermissionsByGroup> findAllPermissionGroup() {
		Session session=sessionFactory.getCurrentSession();
		Query<AccessPermissionsByGroup> query=session.createQuery("from AccessPermissionsByGroup", AccessPermissionsByGroup.class);
		return query.getResultList();
	}

	@Override
	@Transactional
	public List<AccessPermissionsByGroup> findRolePermissionGroup(Integer roleId) {
		Session session = sessionFactory.getCurrentSession();
		Query<AccessPermissionsByGroup> query = session.createNativeQuery("SELECT apg.accessPermissionsByGroupID as accessPermissionsByGroupID "
						+ ", '' AS accessPermissionsByGroupName "
						+ "FROM accessPermissionsByGroup apg  "
						+ "WHERE apg.accessPermissionsByGroupID  "
						+ "NOT IN ( "
						+ "SELECT DISTINCT apgmap.accessPermissionsByGroupID "
						+ "FROM accessPermissionsByGroup_mapped_accessPermission apgmap "
						+ "WHERE apgmap.accessPermissionId "
						+ "NOT IN( SELECT urap.accessPermissionId "
						+ "FROM userroleaccesspermission urap "
						+ "WHERE urap.userRoleId=:userRoleId"
						+ "))",AccessPermissionsByGroup.class);
		query.setParameter("userRoleId", roleId);
		try {
			List<AccessPermissionsByGroup> resultList = query.getResultList();
			if(resultList != null && resultList.size() > 0) {
				return resultList;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
