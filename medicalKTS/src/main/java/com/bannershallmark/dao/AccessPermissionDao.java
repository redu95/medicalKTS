package com.bannershallmark.dao;

import java.util.List;

import com.bannershallmark.entity.AccessPermission;
import com.bannershallmark.entity.AccessPermissionsByGroup;
import com.bannershallmark.entity.UserRoleAccessPermission;

public interface AccessPermissionDao {

	    List<AccessPermission> findAll();
	    
	    List<UserRoleAccessPermission> findAllData(Integer roleId);

		void save(AccessPermission accessPermission);

		AccessPermission findById(Integer AccessPermissionId);

		void deleteById(Integer AccessPermissionId);
		
		boolean AccessPermissionExist(String urlPath );

		List<AccessPermissionsByGroup> findAllPermissionGroup();

		List<AccessPermissionsByGroup> findRolePermissionGroup(Integer roleId);
}
