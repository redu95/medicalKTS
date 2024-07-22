package com.bannershallmark.service;

import java.util.List;

import com.bannershallmark.entity.Users;

public interface UsersService {

	
    Users getUserByUsername(String username);
	
    void saveNewUser(Users newUser);

    List<Users> findAll();
   
    void deleteById(Integer id);
 
    Users findById(Integer id);
}
