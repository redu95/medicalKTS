package com.bannershallmark.medicalHandler;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

@Service
public class MedicServiceImpl implements MedicalService {

	@Autowired
	private MedicDao medicDao;
	
	@Override
	@Transactional
	public void save(MedicalInstitute institute) {
		// TODO Auto-generated method stub
		medicDao.save(institute);		
	}
	
	@Override
	@Transactional
	public void save(PatientData patientData) {
		// TODO Auto-generated method stub
		medicDao.save(patientData);		
	}
	
	
	@Override
	@Transactional
	public void save(PatientMedicalHistory patientMedicalHistory) {
		// TODO Auto-generated method stub
		medicDao.save(patientMedicalHistory);		
	}
	
	@Override
	@Transactional
	public void save(ExaminationData examinationData) {
		// TODO Auto-generated method stub
		medicDao.save(examinationData);		
	}
	
	@Override
	@Transactional
	public void save(QueueData queueData) {
		// TODO Auto-generated method stub
		medicDao.save(queueData);		
	}
	
	
	@Override
	@Transactional
	public void save(Department department) {
		// TODO Auto-generated method stub
		medicDao.save(department);		
	}
	
	@Override
	@Transactional
	public void save(MedicService medicService) {
		// TODO Auto-generated method stub
		medicDao.save(medicService);		
	}
	
	@Override
	@Transactional
	public void save(MedicItem medicItem) {
		// TODO Auto-generated method stub
		medicDao.save(medicItem);		
	}
	
	
	@Override
	@Transactional
	public void save(MedicItemService medicItemService) {
		// TODO Auto-generated method stub
		medicDao.save(medicItemService);		
	}
	
	@Override
	@Transactional
	public void save(MedicSales sales) {
		// TODO Auto-generated method stub
		medicDao.save(sales);		
	}
	
	@Override
	@Transactional
	public void save(SalesReciet reciet) {
		// TODO Auto-generated method stub
		medicDao.save(reciet);		
	}
	
	@Override
	@Transactional
	public void save(DateTimeSchedule dateTimeSchedule) {
		// TODO Auto-generated method stub
		medicDao.save(dateTimeSchedule);		
	}
	
	
//	@Override
//	@Transactional
//	public void deleteMedicInstitute(Integer instituteId) {
//		// TODO Auto-generated method stub
//		medicDao.deleteMedicInstitute(instituteId);		
//	}
//	
//	@Override
//	@Transactional
//	public void deletePatient(Integer patientId) {
//		// TODO Auto-generated method stub
//		medicDao.deletePatient(patientId);		
//	}
//	
	@Override
	@Transactional
	public void deleteDepartment(Integer departmentId) {
		// TODO Auto-generated method stub
		medicDao.deleteDepartment(departmentId);		
	}
//	
//	@Override
//	@Transactional
//	public void deleteMedicItem(Integer medicItemId) {
//		// TODO Auto-generated method stub
//		medicDao.deleteMedicItem(medicItemId);		
//	}
//	
	@Override
	@Transactional
	public void deleteMedicService(Integer medicServiceId) {
		// TODO Auto-generated method stub
		medicDao.deleteMedicService(medicServiceId);		
	}
	
	
	@Override
	@Transactional
	public MedicalInstitute findbyIdInstitute(Integer instituteId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdInstitute(instituteId);		
	}
	
	@Override
	@Transactional
	public PatientData findbyIdPatient(Integer patientId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdPatient(patientId);		
	}
	
	
	@Override
	@Transactional
	public PatientMedicalHistory findbyIdMedicHistory(Integer medicHistoryId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdMedicHistory(medicHistoryId);		
	}
	
	@Override
	@Transactional
	public ExaminationData findbyIdExamination(Integer examinationDataId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdExamination(examinationDataId);		
	}
	
	@Override
	@Transactional
	public QueueData findbyIdQueue(Integer queueId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdQueue(queueId);		
	}
	
	@Override
	@Transactional
	public Department findbyIdDepartment(Integer departmentId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdDepartment(departmentId);		
	}
	
	@Override
	@Transactional
	public MedicService findbyIdMedicService(Integer serviceId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdMedicService(serviceId);		
	}
	
	@Override
	@Transactional
	public MedicItem findbyIdMedicItem(Integer itemId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdMedicItem(itemId);		
	}
	
	@Override
	@Transactional
	public MedicItemService findbyIdMedicItemService(Integer itemServiceId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdMedicItemService(itemServiceId);		
	}
	
	@Override
	@Transactional
	public MedicSales findbyIdMedicSales(Integer salesId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdMedicSales(salesId);		
	}
	
	@Override
	@Transactional
	public SalesReciet findbyIdSalesReciet(Integer recietId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdSalesReciet(recietId);		
	}
	
	@Override
	@Transactional
	public DateTimeSchedule findbyIdDateTimeSchedule(Integer scheduleId) {
		// TODO Auto-generated method stub
		return medicDao.findbyIdDateTimeSchedule(scheduleId);		
	}
	
	@Override
	@Transactional
	public List<PatientMedicalHistory> getAppointmentList(Integer page, Date startDate, Date endDate, String value, String status, String assignedTo, String orderBy, String isLabratory, String isReception) {
		// TODO Auto-generated method stub
		return medicDao.getAppointmentList(page, startDate, endDate, value, status, assignedTo, orderBy, isLabratory, isReception);		
	}
	
	@Override
	@Transactional
	public List<MedicService> getServiceList(Integer page, String value, String dept, String byType, String orderBy) {
		// TODO Auto-generated method stub
		return medicDao.getServiceList(page, value, dept, byType, orderBy);		
	}
	
	@Override
	@Transactional
	public List<DateTimeSchedule> getDateTimeSchedule(Date startDate, Date endDate, Integer doctorId, Integer isFreeSlot) {
		// TODO Auto-generated method stub
		return medicDao.getDateTimeSchedule(startDate,endDate,doctorId,isFreeSlot);		
	}
	
	@Override
	@Transactional
	public List<ExaminationData> getAllExaminationByHistory(Integer medicalHistoryid) {
		// TODO Auto-generated method stub
		return medicDao.getAllExaminationByHistory(medicalHistoryid);		
	}
	
	@Override
	@Transactional
	public List<PatientMedicalHistory> getMedicalHistoryByPatient(Integer patientId) {
		// TODO Auto-generated method stub
		return medicDao.getMedicalHistoryByPatient(patientId);		
	}
	
	@Override
	@Transactional
	public PatientData checkByPhonePatient(String phone) {
		// TODO Auto-generated method stub
		return medicDao.checkByPhonePatient(phone);		
	}
	
	@Override
	@Transactional
	public List<Department> allDepartment() {
		// TODO Auto-generated method stub
		return medicDao.allDepartment();		
	}
	
	@Override
	@Transactional
	public List<MedicService> allServices() {
		// TODO Auto-generated method stub
		return medicDao.allServices();		
	}
	
	@Override
	@Transactional
	public List<MedicItem> allItems() {
		// TODO Auto-generated method stub
		return medicDao.allItems();		
	}
	
	@Override
	@Transactional
	public List<Object[]> getSalesListOrgTotalDate(Integer shopId, Date startDate, Date endDate, String orderBy) {
		// TODO Auto-generated method stub
		return medicDao.getSalesListOrgTotalDate(shopId,startDate,endDate,orderBy);
	}
}
