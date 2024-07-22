package com.bannershallmark.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bannershallmark.dao.StoreDao;
import com.bannershallmark.entity.Store;
import com.bannershallmark.service.StoreService;
@Service
public class StoreServiceImpl implements StoreService {
	
	private StoreDao storeDao;
	
	@Autowired
	public StoreServiceImpl(StoreDao storeDao) {
		this.storeDao = storeDao;
	}

	@Override
	@Transactional
	public List<Store> findAll() {
		return storeDao.findAll();
	}
	
	@Override
	@Transactional
	public List<Store> findStoreWithStoreNumber() {
		return storeDao.findStoreWithStoreNumber();
	}

	@Override
	@Transactional
	public Store findByStoreNumber(String storeNumber) {
		return storeDao.findByStoreNumber(storeNumber);
	}

	@Override
	@Transactional
	public void save(Store store) {
		storeDao.save(store);		
	}

	@Override
	@Transactional
	public Store findById(Integer storeId) {
		return storeDao.findById(storeId);
	}

	@Override
	@Transactional
	public void deleteById(Integer storeId) {
		storeDao.deleteById(storeId);		
	}

	@Override
	@Transactional
	public List<Store> findByIdAll(Integer storeId) {
		
		return storeDao.findByIdAll(storeId);
	}

	@Override
	@Transactional
	public boolean isStoreExist(Integer sotre,String storeName) {
		// TODO Auto-generated method stub
		return storeDao.isStoreExist(sotre,storeName);
	}

	@Override
	@Transactional
	public void updateStoreSyncStatus(Store store) {
		storeDao.updateStoreSyncStatus(store);
	}

	@Override
	@Transactional
	public void updateIsActive(Store store) {
		storeDao.updateIsActive(store);
		
	}

	@Override
	@Transactional
	public List<Store> findAllByIsActive(Boolean isActive) {
		// TODO Auto-generated method stub
		return storeDao.findAllByIsActive(isActive);
	}

	@Override
	@Transactional
	public boolean isSiteExist(Store store) {
		return storeDao.isSiteExist(store);
	}
	
	@Override
	@Transactional
	public List<Store> findByStoreNumberByPO(String vendorPO) {
		//System.out.println("in service implementation");
		return storeDao.findByStoreNumberByPO(vendorPO);
	}
	
	@Override
	@Transactional
	public List<Store> findByDM() {
		return storeDao.findByDM();
	}
}
