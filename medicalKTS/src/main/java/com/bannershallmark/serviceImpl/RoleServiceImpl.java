package com.bannershallmark.serviceImpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.bannershallmark.dao.RoleDao;
import com.bannershallmark.entity.Role;
import com.bannershallmark.service.RoleService;

@Service
public class RoleServiceImpl  implements RoleService{

	    @Autowired
	    private RoleDao roleDao;
	
	 @Override
	 @Transactional
	public List<Role> findAll() {
		return roleDao.findAll();
	}

	 @Override
	 @Transactional
	public void save(Role role) {
		roleDao.save(role);
		
	}

	@Override
	@Transactional
	public Role findById(Integer roleId) {
		return roleDao.findById(roleId);
	}

	@Override
	  @Transactional
	public void deleteById(Integer roleId) {
		roleDao.deleteById(roleId);
		
	}

	@Override
    @Transactional
	public boolean isRoleByExist(String name) {
		return roleDao.isRoleByExist(name);
	}

}
