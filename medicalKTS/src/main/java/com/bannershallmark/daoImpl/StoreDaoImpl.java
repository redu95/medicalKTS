package com.bannershallmark.daoImpl;

import java.util.ArrayList;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.bannershallmark.dao.StoreDao;
import com.bannershallmark.entity.Store;
import com.bannershallmark.service.MyUserDetails;

@Repository
public class StoreDaoImpl implements StoreDao {

	private SessionFactory sessionFactory;

	@Autowired
	public StoreDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Override
	public List<Store> findAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("from Store", Store.class);
		return query.getResultList();
	}

	@Override
	public List<Store> findStoreWithStoreNumber() {
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("from Store where isnull(store)=0", Store.class);
		return query.getResultList();
	}

	@Override
	public List<Store> findAllByIsActive(Boolean isActive) {
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("from Store where isActive=:isActive", Store.class);
		query.setParameter("isActive",isActive);
		return query.getResultList();
	}
	
	@Override
	public Store findByStoreNumber(String storeNumber) {
		Store store = null;
		try {
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("from Store where store= :storeNumber AND isActive=1", Store.class);
		query.setParameter("storeNumber", Integer.parseInt(storeNumber));
		store = query.getSingleResult();
		return store;
		} catch (Exception e) {
			return store;
		}
		
	}

	@Override
	public void save(Store store) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(store);
	}
	
	@Override
	public Store saveUpdate(Store store) {
		Session session = sessionFactory.getCurrentSession();
		return (Store) session.save(store);
		
	}

	@Override
	public Store findById(Integer storeId) {
		Session session = sessionFactory.getCurrentSession();
		Store store = session.get(Store.class, storeId);
		return store;
	}

	@Override
	public void deleteById(Integer storeId) {
		Session session = sessionFactory.getCurrentSession();
		Store store = findById(storeId);
		session.delete(store);
	}

	@Override
	public Store findStoreAutoIdByLikeClouase(String storeDetails) {
		Session session=sessionFactory.getCurrentSession();
		//Query<Store> query=session.createQuery("from stores s where s.storeName like %:storeName");
		Query<Store> query=session.createQuery("from Store where 1 != 1");
		//query.setParameter("storeName", "%" + storeDetails);
		if(query.getSingleResult() != null) {
			return query.getSingleResult();
		}
		return null;
	}

	@Override
	public List<Store> findByIdAll(Integer storeId) {
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("from Store where store_Id=:storeId", Store.class);
		query.setParameter("storeId", storeId);
		return query.getResultList();
	}

	@Override
	public boolean isStoreExist(Integer sotre,String storeName ) {
		List<Store> store = null;
		try {
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("from Store where store= :sotre OR storeName=:storeName", Store.class);
		query.setParameter("sotre", sotre);
		query.setParameter("storeName", storeName);
		store = query.getResultList();
	
		
		}catch (Exception e) {
			System.out.println("Exception In isStoreExist : " +e.getMessage());
		}
		
		if(store.size()>=1) 
		{	System.out.println(store.toString());
		return true;}
		else
		return false ;
	}

	@Override
	public void updateStoreSyncStatus(Store store) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("UPDATE Store set isSynchronized=:isSynchronized where id=:id");
			query.setParameter("isSynchronized", store.isSynchronized());
			query.setParameter("id", store.getId());
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateIsActive(Store store) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("UPDATE Store set isActive=:isActive where id=:id");
			query.setParameter("isActive", store.getIsActive());
			query.setParameter("id", store.getId());
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean isSiteExist(Store store) {
		List<Store> resultList = new ArrayList<Store>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query<Store> query = session.createQuery("FROM Store where site= :site", Store.class);
			query.setParameter("site", store.getSite());
			resultList = query.getResultList();
		} catch (Exception e) {
			System.out.println("Exception In isStoreExist : " + e.getMessage());
		}
		return resultList.size() >= 1;
	}
	
	@Override
	public List<Store> findByStoreNumberByPO(String vendorPO) {
		Session session = sessionFactory.getCurrentSession();
		System.out.println("it reach hereerthgn");
		Query<Store> query = session.createQuery(
				 "Select sto from Store sto where isActive=1 AND sto.id in (Select pos.store.id from POStores pos where pos.vendorPO.id in (Select vpo.id from VendorPO vpo where vpo.poNumber =:poNumber))",
				Store.class);
		query.setParameter("poNumber", vendorPO);
		System.out.println("from new"+query.getResultList());
		return query.getResultList();
	}
	
	@Override
	public List<Store> findByDM() {
		MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String CurrentUser=user.getFirstname() + " " + user.getLastname();
		List<Store> resultList = new ArrayList<Store>();
		Session session = sessionFactory.getCurrentSession();
		Query<Store> query = session.createQuery("FROM Store where dm= :dm", Store.class);
		query.setParameter("dm",CurrentUser);
		resultList = query.getResultList();
		return query.getResultList();
	}
	
}
