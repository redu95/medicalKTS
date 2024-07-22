package com.bannershallmark.service;

import java.util.List;

import com.bannershallmark.entity.ForgotPassword;

public interface ForgotPasswordService {

	List<ForgotPassword> findAll();

	void save(ForgotPassword forgotPassword);

	ForgotPassword findById(Integer id);

	void deleteById(Integer id);
	
	ForgotPassword getByRandomId(String randomId);
}
