package com.bannershallmark.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.entity.AccessPermission;
import com.bannershallmark.entity.UserRoleAccessPermission;

public interface UserRoleAccessPermissionDao {

	@Transactional
	List<String> findAccessPermissionByRole(String role);
	
	        List<UserRoleAccessPermission> findAll();

			void save(Integer apId, Integer roleId);

			UserRoleAccessPermission findById(Integer Id);

			void deleteById(Integer Id);
			
			boolean AccessPermissionExist(String urlPath );

			void saveGroup(String apGroupId, Integer roleId);
}
