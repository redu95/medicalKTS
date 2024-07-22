package com.bannershallmark.dao;

import java.util.List;

import com.bannershallmark.entity.ForgotPassword;
import com.bannershallmark.entity.Users;

public interface ForgotPasswordDao {

	   List<ForgotPassword> findAll();

		void save(ForgotPassword forgotPassword);

		ForgotPassword findById(Integer id);

		void deleteById(Integer id);
		
		ForgotPassword getByRandomId(String randomId);
}
