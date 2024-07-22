package com.bannershallmark.service;

import java.util.List;

import com.bannershallmark.entity.UserRoleAccessPermission;

public interface UserRoleAccessPermissionService {

	 List<UserRoleAccessPermission> findAll();

		void save(Integer apId ,Integer roleId );

		UserRoleAccessPermission findById(Integer Id);

		void deleteById(Integer Id);
		
		boolean AccessPermissionExist(String urlPath );

		void saveGroup(String apGroupId, Integer roleId);
}
