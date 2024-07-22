package com.bannershallmark.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.AccessPermissionDao;
import com.bannershallmark.entity.AccessPermission;
import com.bannershallmark.entity.AccessPermissionsByGroup;
import com.bannershallmark.entity.UserRoleAccessPermission;
import com.bannershallmark.service.AccessPermissionService;

@Service
public class AccessPermissionServiceImpl implements  AccessPermissionService{

	 @Autowired
	 private AccessPermissionDao accessPermissionDao;
	
	@Override
	@Transactional
	public List<AccessPermission> findAll() {
		return accessPermissionDao.findAll();
	}

	@Override
	@Transactional
	public void save(AccessPermission accessPermission) {
		accessPermissionDao.save(accessPermission);
		
	}

	@Override
	@Transactional
	public AccessPermission findById(Integer accessPermissionId) {
		return accessPermissionDao.findById(accessPermissionId);
	}

	@Override
	@Transactional
	public void deleteById(Integer accessPermissionId) {
		accessPermissionDao.deleteById(accessPermissionId);
		
	}

	@Override
	@Transactional
	public boolean AccessPermissionExist(String urlPath) {
		// TODO Auto-generated method stub
		return accessPermissionDao.AccessPermissionExist(urlPath);
	}

	@Override
	@Transactional
	public List<UserRoleAccessPermission> findAllData(Integer roleId) {
		// TODO Auto-generated method stub
		return accessPermissionDao. findAllData(roleId);
	}

	@Transactional
	@Override
	public List<AccessPermissionsByGroup> findAllPermissionGroup() {
		return accessPermissionDao.findAllPermissionGroup();
	}

	@Override
	public List<AccessPermissionsByGroup> findRolePermissionGroup(Integer roleId) {
		return accessPermissionDao.findRolePermissionGroup(roleId);
	}
}
