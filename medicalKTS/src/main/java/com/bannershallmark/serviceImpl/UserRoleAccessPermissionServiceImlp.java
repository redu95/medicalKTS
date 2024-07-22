package com.bannershallmark.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.bannershallmark.dao.UserRoleAccessPermissionDao;
import com.bannershallmark.entity.UserRoleAccessPermission;
import com.bannershallmark.service.UserRoleAccessPermissionService;
@Service
public class UserRoleAccessPermissionServiceImlp implements UserRoleAccessPermissionService {

	 @Autowired
	 private UserRoleAccessPermissionDao userRoleAccessPermissionDao;
	
	@Override
	@Transactional
	public List<UserRoleAccessPermission> findAll() {
		return userRoleAccessPermissionDao.findAll();
	}

	@Override
	@Transactional
	public void save(Integer apId ,Integer roleId ) {
		userRoleAccessPermissionDao.save(apId,roleId);
	}

	@Override
	@Transactional
	public UserRoleAccessPermission findById(Integer Id) {
		return userRoleAccessPermissionDao.findById(Id);
	}

	@Override
    @Transactional
	public void deleteById(Integer Id) {
		userRoleAccessPermissionDao.deleteById(Id);
		
	}

	@Override
	@Transactional
	public boolean AccessPermissionExist(String urlPath) {
		return userRoleAccessPermissionDao.AccessPermissionExist(urlPath);
	}

	@Override
	public void saveGroup(String apGroupId, Integer roleId) {
		userRoleAccessPermissionDao.saveGroup(apGroupId,roleId);
	}

}
