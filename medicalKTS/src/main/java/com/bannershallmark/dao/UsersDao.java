package com.bannershallmark.dao;

import java.util.List;

import com.bannershallmark.entity.Users;


public interface UsersDao {

	    Users getUserByUsername(String username);
	
	    void saveNewUser(Users users);
	
	    List<Users> findAll();
	   
	    void deleteById(Integer id);
	 
	    Users findById(Integer id);
	
}
