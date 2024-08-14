package com.bannershallmark.medicalHandler;


import java.time.DateTimeException;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bannershallmark.entity.DateTimeSchedule;
import com.bannershallmark.entity.Department;
import com.bannershallmark.entity.ExaminationData;
import com.bannershallmark.entity.MedicItem;
import com.bannershallmark.entity.MedicItemService;
import com.bannershallmark.entity.MedicSales;
import com.bannershallmark.entity.MedicService;
import com.bannershallmark.entity.MedicalInstitute;
import com.bannershallmark.entity.PatientData;
import com.bannershallmark.entity.PatientMedicalHistory;
import com.bannershallmark.entity.QueueData;
import com.bannershallmark.entity.SalesReciet;
import com.bannershallmark.entity.Users;

@Repository
public class MedicDaoImpl implements MedicDao  {

	@Autowired
	private SessionFactory sessionFactory;
	 
	@Override
	public void save(MedicalInstitute medicalInstitute) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(medicalInstitute);
	}

	@Override
	public void save(PatientData patientData) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(patientData);
	}
	
	@Override
	public void save(PatientMedicalHistory patientMedicalHistory) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(patientMedicalHistory);
	}
	
	@Override
	public void save(ExaminationData examinationData) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(examinationData);
	}
	
	@Override
	public void save(QueueData queueData) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(queueData);
	}
	
	@Override
	public void save(Department department) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(department);
	}
	
	@Override
	public void save(MedicItem medicItem) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(medicItem);
	}
	
	@Override
	public void save(MedicService medicService) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(medicService);
	}
	
	@Override
	public void save(MedicItemService medicItemService) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(medicItemService);
	}
	
	@Override
	public void save(MedicSales sales) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(sales);
	}
	
	@Override
	public void save(SalesReciet reciet) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(reciet);
	}
	
	@Override
	public void save(DateTimeSchedule dateTimeSchedule) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(dateTimeSchedule);
	}
	
	
	//Delete Section
	@Override
	public void deleteDepartment(Integer deptId) {
		Session session = sessionFactory.getCurrentSession();
		Department department= session.get(Department.class, deptId);
		department.setIsActive(0);
		session.saveOrUpdate(department);
	}
	
	@Override
	public void deleteMedicService(Integer serviceId) {
		Session session = sessionFactory.getCurrentSession();
		MedicService service= session.get(MedicService.class, serviceId);
		service.setIsActive(0);
		session.saveOrUpdate(service);
	}
	
	
	
	//Find by id institute
	@Override
	public MedicalInstitute findbyIdInstitute(Integer instituteId) {
		Session session = sessionFactory.getCurrentSession();
		MedicalInstitute institute= session.get(MedicalInstitute.class, instituteId);
		return institute;
	}

	@Override
	public PatientData findbyIdPatient(Integer patientid) {
		Session session = sessionFactory.getCurrentSession();
		PatientData patient= session.get(PatientData.class, patientid);
		return patient;
	}

	@Override
	public PatientMedicalHistory findbyIdMedicHistory(Integer medicalId) {
		Session session = sessionFactory.getCurrentSession();
		PatientMedicalHistory medicHistory= session.get(PatientMedicalHistory.class, medicalId);
		return medicHistory;
	}
	
	@Override
	public ExaminationData findbyIdExamination(Integer examinationId) {
		Session session = sessionFactory.getCurrentSession();
		ExaminationData examination= session.get(ExaminationData.class, examinationId);
		return examination;
	}
	
	@Override
	public QueueData findbyIdQueue(Integer queueId) {
		Session session = sessionFactory.getCurrentSession();
		QueueData queueData= session.get(QueueData.class, queueId);
		return queueData;
	}
	
	@Override
	public Department findbyIdDepartment(Integer departmentId) {
		Session session = sessionFactory.getCurrentSession();
		Department department= session.get(Department.class, departmentId);
		return department;
	}
	
	@Override
	public MedicService findbyIdMedicService(Integer medicServiceId) {
		Session session = sessionFactory.getCurrentSession();
		MedicService medicService= session.get(MedicService.class, medicServiceId);
		return medicService;
	}
	
	@Override
	public MedicItem findbyIdMedicItem(Integer medicItemId) {
		Session session = sessionFactory.getCurrentSession();
		MedicItem medicItem= session.get(MedicItem.class, medicItemId);
		return medicItem;
	}
		
	@Override
	public MedicItemService findbyIdMedicItemService(Integer medicItemServiceId) {
		Session session = sessionFactory.getCurrentSession();
		MedicItemService medicItemService= session.get(MedicItemService.class, medicItemServiceId);
		return medicItemService;
	}
	
	@Override
	public MedicSales findbyIdMedicSales(Integer medicSalesId) {
		Session session = sessionFactory.getCurrentSession();
		MedicSales medicSales= session.get(MedicSales.class, medicSalesId);
		return medicSales;
	}
	
	@Override
	public SalesReciet findbyIdSalesReciet(Integer recietId) {
		Session session = sessionFactory.getCurrentSession();
		SalesReciet salesReciet= session.get(SalesReciet.class, recietId);
		return salesReciet;
	}
	
	@Override
	public DateTimeSchedule findbyIdDateTimeSchedule(Integer scheduleId) {
		Session session = sessionFactory.getCurrentSession();
		DateTimeSchedule dateTimeSchedule= session.get(DateTimeSchedule.class, scheduleId);
		return dateTimeSchedule;
	}
	
	@Override
	public List<PatientMedicalHistory> getAppointmentList(Integer page, Date startDate, Date endDate, String value, String presentStatus, String assignedTo, String orderBy, String isLabratory, String isReception) {
		 Session session = sessionFactory.getCurrentSession();
		 if (!page.equals(1)) {
				page --;
				page = page*25;
				//page ++;
		 } else {
			 	page=0;
		 }
		
		 StringBuilder hql = new StringBuilder("from PatientMedicalHistory where eventStartDate>=:startDate and eventStartDate<=:endDate");
		 StringBuilder countHql = new StringBuilder("select count(*) from PatientMedicalHistory where eventStartDate>=:startDate and eventStartDate<=:endDate");
		 // Add conditions for non-empty parameters
		 
		 if (StringUtils.isNotBlank(presentStatus)) {
		     hql.append(" and presentStatus=:presentStatus");
		     countHql.append(" and presentStatus=:presentStatus");
		 }
		 
		 if (StringUtils.isNotBlank(value)) {
		     hql.append(" and (patientData.name like concat(concat('%', :value), '%') or patientData.phoneNumber like concat(concat('%', :value), '%') )");
		     countHql.append(" and (patientData.name like concat(concat('%', :value), '%') or patientData.phoneNumber like concat(concat('%', :value), '%') )");
		 }
		
		 if (StringUtils.isNotBlank(assignedTo)) {
		     hql.append(" and assignedTo=:assignedTo");
		     countHql.append(" and assignedTo=:assignedTo");
		 }
		 
		 if (StringUtils.isNotBlank(isLabratory)) {
		     hql.append(" and examinationCount>1");
		     countHql.append(" and examinationCount>1");
		 }
		 //hql.append(orderBy);
		 //countHql.append(orderBy);
		 if (StringUtils.isNotBlank(isReception)) {
				//Nothing to do
		 } else {
				hql.append(" AND (patientData.id,eventStartDate) IN (SELECT pmh2.patientData.id, MAX(pmh2.eventStartDate) FROM PatientMedicalHistory pmh2 WHERE pmh2.eventStartDate >= :startDate AND pmh2.eventStartDate <= :endDate GROUP BY pmh2.patientData.id)");
				countHql.append(" AND (patientData.id,eventStartDate) IN (SELECT pmh2.patientData.id, MAX(pmh2.eventStartDate) FROM PatientMedicalHistory pmh2 WHERE pmh2.eventStartDate >= :startDate AND pmh2.eventStartDate <= :endDate GROUP BY pmh2.patientData.id)");
		 }

		 System.out.println("HQL is " + hql.toString());
		 Query<PatientMedicalHistory> query = session.createQuery(hql.toString(), PatientMedicalHistory.class);
		 Query<Long> countQuery = session.createQuery(countHql.toString(), Long.class);

			
		if (StringUtils.isNotBlank(presentStatus)) {
			query.setParameter("presentStatus", presentStatus);
			countQuery.setParameter("presentStatus", presentStatus);
		}
		if (StringUtils.isNotBlank(value)) {
			query.setParameter("value", value);		 
			countQuery.setParameter("value", value);		 
		}
		
		if (StringUtils.isNotBlank(assignedTo)) {
			query.setParameter("assignedTo", assignedTo);		 
			countQuery.setParameter("assignedTo", assignedTo);		 
		}
		
		query.setParameter("startDate", startDate);		 
		countQuery.setParameter("startDate", startDate);	
		
		query.setParameter("endDate", endDate);		 
		countQuery.setParameter("endDate", endDate);	
		
		query.setFirstResult(page);
		query.setMaxResults(25);
		
		List<PatientMedicalHistory> medicHistory = query.getResultList();
	    Long totalSize = countQuery.uniqueResult();
	    
	    PatientMedicalHistory medHist = new PatientMedicalHistory();
	    medHist.setId(totalSize.intValue());
	    medicHistory.add(medHist);
		
		return medicHistory;
	}
	
	
	@Override
	public List<MedicService> getServiceList(Integer page, String value, String departmentName, String servictType, String orderBy) {
		 Session session = sessionFactory.getCurrentSession();
		 if (!page.equals(1)) {
				page --;
				page = page*25;
				//page ++;
		 } else {
			 	page=0;
		 }
		
		 StringBuilder hql = new StringBuilder("from MedicService where isActive=1 ");
		 StringBuilder countHql = new StringBuilder("select count(*) from MedicService where isActive=1 ");
		 // Add conditions for non-empty parameters
		 
		 if (StringUtils.isNotBlank(value)) {
		     hql.append(" and (serviceName like concat(concat('%', :value), '%') or serviceDescription like concat(concat('%', :value), '%') )");
		     countHql.append(" and (serviceName like concat(concat('%', :value), '%') or serviceDescription like concat(concat('%', :value), '%') )");
		 }
		 
		 if (StringUtils.isNotBlank(departmentName)) {
		     hql.append(" and departmentName=:departmentName");
		     countHql.append(" and departmentName=:departmentName");
		 }
		 
		 if (StringUtils.isNotBlank(servictType)) {
		     hql.append(" and servictType=:servictType");
		     countHql.append(" and servictType=:servictType");
		 }
		
//		 if (StringUtils.isNotBlank(byType)) {
//		     hql.append(" and (serviceName like concat(concat('%', :value), '%') or serviceDescription like concat(concat('%', :value), '%') )");
//		     countHql.append(" and (serviceName like concat(concat('%', :value), '%') or serviceDescription like concat(concat('%', :value), '%') )");
//		 }
		
		 hql.append(orderBy);
		 //countHql.append(orderBy);
		 Query<MedicService> query = session.createQuery(hql.toString(), MedicService.class);
		 Query<Long> countQuery = session.createQuery(countHql.toString(), Long.class);

		if (StringUtils.isNotBlank(departmentName)) {
			query.setParameter("departmentName", departmentName);
			countQuery.setParameter("departmentName", departmentName);
		}
		 
		if (StringUtils.isNotBlank(servictType)) {
			query.setParameter("servictType", servictType);
			countQuery.setParameter("servictType", servictType);
		}
		if (StringUtils.isNotBlank(value)) {
			query.setParameter("value", value);		 
			countQuery.setParameter("value", value);		 
		}
		
		
		query.setFirstResult(page);
		query.setMaxResults(25);
		
		List<MedicService> serviceList = query.getResultList();
	    Long totalSize = countQuery.uniqueResult();
	    
	    MedicService serviceHist = new MedicService();
	    serviceHist.setId(totalSize.intValue());
	    serviceList.add(serviceHist);
		
		return serviceList;
	}
	
	@Override
	public List<DateTimeSchedule> getDateTimeSchedule(Date eventDate, Date startDate, Integer doctorId, Integer isFreeSlot) {
		 Session session = sessionFactory.getCurrentSession();
	 	 Query<DateTimeSchedule> query=session.createQuery("from DateTimeSchedule where startDate>:startDate and eventDate=:eventDate and isAssigned=0 and doctorId=22", DateTimeSchedule.class);
	 	 if(isFreeSlot.equals(0)){
	 		query=session.createQuery("from DateTimeSchedule where startDate>:startDate and eventDate=:eventDate and isAssigned=0 and doctorId=22 and isFreeSlot=:isFreeSlot", DateTimeSchedule.class);
		 	query.setParameter("isFreeSlot", isFreeSlot);
	 	 }
	 	 query.setParameter("startDate", startDate);
	 	 query.setParameter("eventDate", eventDate);
		 return query.getResultList();
		
	}
	
	@Override
	public List<ExaminationData> getAllExaminationByHistory(Integer medicalHistoryId) {
		 Session session = sessionFactory.getCurrentSession();
	 	 Query<ExaminationData> query=session.createQuery("from ExaminationData where patientMedicalHistory.id=:medicalHistoryId", ExaminationData.class);
	 	 query.setParameter("medicalHistoryId", medicalHistoryId);
		 return query.getResultList();
		
	}
	
	@Override
	public List<PatientMedicalHistory> getMedicalHistoryByPatient(Integer patientId) {
		 Session session = sessionFactory.getCurrentSession();
	 	 Query<PatientMedicalHistory> query=session.createQuery("from PatientMedicalHistory where patientData.id=:patientId order by eventStartDate desc", PatientMedicalHistory.class);
	 	 query.setParameter("patientId", patientId);
		 return query.getResultList();
		
	}
	
	@Override
	public PatientData checkByPhonePatient(String phoneNumber) {
		Session session = sessionFactory.getCurrentSession();
		PatientData patient =null;
		try {
			Query<PatientData> query = session.createQuery("from PatientData where phoneNumber=:phoneNumber", PatientData.class);
			query.setParameter("phoneNumber", phoneNumber);
			patient = query.getSingleResult();
			return patient;
		}catch (Exception e) {
			System.out.println(" Exception in getUserByPhone :: " + e.getMessage());
			return patient;
		}
	}
	
	@Override
	public List<Department> allDepartment() {
		Session session = sessionFactory.getCurrentSession();
		Query<Department> query=session.createQuery("from Department where isActive=1", Department.class);
		return query.getResultList();
	}
	
	@Override
	public List<MedicService> allServices() {
		Session session = sessionFactory.getCurrentSession();
		Query<MedicService> query=session.createQuery("from MedicService", MedicService.class);
		return query.getResultList();
	}
	
	@Override
	public List<MedicItem> allItems() {
		Session session = sessionFactory.getCurrentSession();
		Query<MedicItem> query=session.createQuery("from MedicItem", MedicItem.class);
		return query.getResultList();
	}
	
	@Override
	public List<Object[]> getSalesListOrgTotalDate(Integer orgId, Date startDate, Date endDate, String orderBy) {
		Session session = sessionFactory.getCurrentSession();
		Query<Object[]> query = session.createQuery("Select sum(totalSalePrice),sum(quantity),count(quantity) from InventorySales where storeId.storeOrgId=:orgId and salesDate>=:startDate and salesDate<=:endDate group by storeId.storeOrgId "+orderBy, Object[].class);
		query.setParameter("orgId", orgId);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		return query.getResultList();
	}

}
