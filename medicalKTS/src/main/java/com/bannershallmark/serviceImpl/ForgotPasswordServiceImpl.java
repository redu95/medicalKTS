package com.bannershallmark.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.ForgotPasswordDao;
import com.bannershallmark.entity.ForgotPassword;
import com.bannershallmark.service.ForgotPasswordService;
@Service
public class ForgotPasswordServiceImpl implements ForgotPasswordService{

	

    @Autowired
    private ForgotPasswordDao forgotPasswordDao;
    
	@Override
    @Transactional
	public List<ForgotPassword> findAll() {
		// TODO Auto-generated method stub
		return forgotPasswordDao.findAll();
	}

	@Override
	 @Transactional
	public void save(ForgotPassword forgotPassword) {
		forgotPasswordDao.save(forgotPassword);
	}

	@Override
    @Transactional
	public ForgotPassword findById(Integer id) {
		return forgotPasswordDao.findById(id);
	}

	@Override
    @Transactional
	public void deleteById(Integer id) {
		forgotPasswordDao.deleteById(id);
		
	}

	@Override
	 @Transactional
	public ForgotPassword getByRandomId(String randomId) {
		return forgotPasswordDao.getByRandomId(randomId);
	}

}
