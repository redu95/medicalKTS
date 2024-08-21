package com.bannershallmark.medicalHandler;


import java.util.Date;
import java.util.List;

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

public interface MedicDao{
	
	void save(MedicalInstitute institute); 
	void save(PatientData patient); 
	void save(PatientMedicalHistory medicalHistory); 
	void save(ExaminationData examination); 
	void save(QueueData queueData); 
	void save(Department department);
	void save(MedicService medicService);
	void save(MedicItem medicItem);
	void save(MedicItemService medicItemService);
	void save(MedicSales sales);
	void save(SalesReciet reciet);
	void save(DateTimeSchedule dateTimeSchedule);
	
//	void deleteMedicInstitute(Integer instituteId);
//	void deletePatient(Integer patientId);
	void deleteDepartment(Integer departmentId);
	void deleteMedicItem(Integer itemId);
	void deleteMedicService(Integer medicServiceId);


	MedicalInstitute findbyIdInstitute(Integer instituteId); 
	PatientData findbyIdPatient(Integer patientId); 
	PatientMedicalHistory findbyIdMedicHistory(Integer medicalHistoryId); 
	ExaminationData findbyIdExamination(Integer examinationId); 
	QueueData findbyIdQueue(Integer queueDataId); 
	Department findbyIdDepartment(Integer departmentId);
	MedicService findbyIdMedicService(Integer medicServiceId);
	MedicItem findbyIdMedicItem(Integer medicItemId);
	MedicItemService findbyIdMedicItemService(Integer medicItemServiceId);
	MedicSales findbyIdMedicSales(Integer medicSalesId);
	SalesReciet findbyIdSalesReciet(Integer recietId);
	DateTimeSchedule findbyIdDateTimeSchedule(Integer scheduleId);
	
	//Pagination section
	List<PatientMedicalHistory> getAppointmentList(Integer page, Date startDate, Date endDate, String value, String status, String assignedTo, String orderBy, String isLabratory, String isReception);	
	List<MedicService> getServiceList(Integer page, String value, String dept, String byType, String orderBy);	
	List<DateTimeSchedule> getDateTimeSchedule(Date startDate, Date endDate, Integer doctorId, Integer isFreeSlot);	
	List<ExaminationData> getAllExaminationByHistory(Integer medicalHistoryId);	
	List<PatientMedicalHistory> getMedicalHistoryByPatient(Integer patientId);	

	
	List<Department> allDepartment();	
	List<Department> allDepartmentByOrder(Integer page, String searchValue, String orderBy);
	List<MedicItem> allItemsByOrder(Integer page, String searchValue, String orderBy);	
	List<MedicService> allServices();
	List<MedicItem> allItems();

	PatientData checkByPhonePatient(String phoneNumber);
	MedicItem checkItemByItemName(String itemName);
	
	List<Object[]> getSalesListOrgTotalDate(Integer shopId, Date startDate, Date endDate, String orderBy);

	List<PatientData> getSex();
	List<PatientData> getAges();

	List<PatientMedicalHistory> getDepartmentDataForChart();
}
	
