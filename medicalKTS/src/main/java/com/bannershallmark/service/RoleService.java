package com.bannershallmark.service;

import java.util.List;

import com.bannershallmark.entity.Role;

public interface RoleService {

    List<Role> findAll();

	void save(Role role);

	Role findById(Integer roleId);

	void deleteById(Integer roleId);
	boolean isRoleByExist(String name );
	
}
