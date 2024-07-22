package com.bannershallmark.service;

import java.util.List;

import com.bannershallmark.entity.Store;

public interface StoreService {

	List<Store> findAll();

	Store findByStoreNumber(String storeNumber);

	void save(Store store);

	Store findById(Integer storeId);

	void deleteById(Integer storeId);
	
	List<Store> findByIdAll(Integer storeId);
	
	boolean isStoreExist(Integer sotre,String storeName);

	void updateStoreSyncStatus(Store store);
	
	void updateIsActive(Store store);
	
	List<Store> findAllByIsActive(Boolean isActive);

	List<Store> findStoreWithStoreNumber();

	boolean isSiteExist(Store store);
	
	List<Store> findByStoreNumberByPO(String vendorPO);
	
	List<Store> findByDM();
}
