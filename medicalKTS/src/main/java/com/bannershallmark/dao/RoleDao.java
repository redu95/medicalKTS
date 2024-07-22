package com.bannershallmark.dao;

import java.util.List;

import com.bannershallmark.entity.Role;


public interface RoleDao {

	
	    List<Role> findAll();

		void save(Role role);

		Role findById(Integer roleId);

		void deleteById(Integer roleId);
		boolean isRoleByExist(String Name );
}
