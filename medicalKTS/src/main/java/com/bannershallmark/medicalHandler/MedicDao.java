package com.bannershallmark.medicalHandler;


import java.util.Date;
import java.util.List;

import com.bannershallmark.entity.*;

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
	void save(ExaminationDocuments docs);

	
//	void deleteMedicInstitute(Integer instituteId);
//	void deletePatient(Integer patientId);
	void deleteDepartment(Integer departmentId);
	void deleteMedicItem(Integer itemId);
	void deleteMedicService(Integer medicServiceId);
	void deleteExaminationDocs(Integer docId);


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
	ExaminationDocuments findbyIdExamDocs(Integer docId);
	
	//Pagination section
	List<PatientMedicalHistory> getAppointmentList(Integer page, Date startDate, Date endDate, String value, String status, String assignedTo, String orderBy, String isLabratory, String isReception);	
	List<MedicService> getServiceList(Integer page, String value, String dept, String byType, String orderBy);	
	List<DateTimeSchedule> getDateTimeSchedule(Date startDate, Date endDate, Integer doctorId, Integer isFreeSlot);	
	List<ExaminationData> getAllExaminationByHistory(Integer medicalHistoryId);	
	List<PatientMedicalHistory> getMedicalHistoryByPatient(Integer patientId);
	List<ExaminationDocuments> getDocsByExaminationId(Integer examinationId);
	
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
	
