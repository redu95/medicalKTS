package com.bannershallmark.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.RoleDao;
import com.bannershallmark.dao.UsersDetailsDao;
import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.Users;
import com.bannershallmark.service.UsersDetailsService;

@Service
public class UsersDetailsServiceImpl implements UsersDetailsService{

	 @Autowired
	 private UsersDetailsDao usersDetailsDao;
	
	@Override
	@Transactional
	public List<Users> findAll() {
		return usersDetailsDao.findAll();
	}

	@Override
	@Transactional
	public void save(Users users) {
		usersDetailsDao.save(users);
		
	}

	@Override
	@Transactional
	public void deleteById(Integer id) {
	
	 usersDetailsDao.deleteById(id);
		
	}

	@Override
	@Transactional
	public Users findById(Integer id) {
		 Users users= usersDetailsDao.findById(id);
		return users;
	}

	@Override
	@Transactional
	public List<Role> findAllRole() {
		return usersDetailsDao.findAllRole();
	}

	@Override
	@Transactional
	public Users getUserByUsername(String username) {
		return usersDetailsDao.getUserByUsername(username);
	}

	@Override
	@Transactional
	public List<Users> findAllByRole(Integer roleId) {
		return usersDetailsDao.findAllByRole(roleId);
	}
	
}
