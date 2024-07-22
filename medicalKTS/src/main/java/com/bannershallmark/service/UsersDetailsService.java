package com.bannershallmark.service;

import java.util.List;

import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.Users;

public interface UsersDetailsService {

	  Users getUserByUsername(String username);
	  
	 List<Users> findAll();
     
     void save(Users users);
   
     void deleteById(Integer id);
 
     Users findById(Integer id);
     
     List<Role> findAllRole();
     
     List<Users> findAllByRole(Integer roleId);

}
