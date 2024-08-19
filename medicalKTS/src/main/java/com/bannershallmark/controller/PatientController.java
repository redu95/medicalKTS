package com.bannershallmark.controller;


import com.bannershallmark.entity.*;
import com.bannershallmark.medicalHandler.MedicalService;
import com.bannershallmark.service.MyUserDetails;
import com.bannershallmark.service.UsersDetailsService;
import com.bannershallmark.util.Constants;
import com.bannershallmark.vo.NewPatientVo;
import com.bannershallmark.vo.PatientListAjax;
import com.bannershallmark.vo.ServiceListAjax;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.FileResolver;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Patient")
public class PatientController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private MedicalService medicalService;
	
	@Autowired
	private UsersDetailsService usersDetailsService;
	
	//Doctor Side
	@GetMapping("/patientData")
	public String patientData(Model model) throws Exception {
		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.HOUR_OF_DAY, 0);
		cal1.clear(Calendar.MINUTE);
		cal1.clear(Calendar.SECOND);
		cal1.clear(Calendar.MILLISECOND);
		
		Date endDate = cal1.getTime();
		Date startDate = decrementDate(endDate,-7);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(startDate);
		String formattedDateEnd = dateFormat.format(endDate);

		model.addAttribute("startDate", formattedDateStart);
		model.addAttribute("endDate", formattedDateEnd);
		
		return "patient/allPatient";
	}
	
	@GetMapping("/patientDataLabratory")
	public String patientDataLabratory(Model model) throws Exception {
		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.HOUR_OF_DAY, 0);
		cal1.clear(Calendar.MINUTE);
		cal1.clear(Calendar.SECOND);
		cal1.clear(Calendar.MILLISECOND);
		
		Date endDate = cal1.getTime();
		Date startDate = decrementDate(endDate,-7);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(startDate);
		String formattedDateEnd = dateFormat.format(endDate);

		model.addAttribute("startDate", formattedDateStart);
		model.addAttribute("endDate", formattedDateEnd);
		
		return "patient/allPatientLabratory";
	}
	
	@GetMapping("/patientHistory/{id}")
	public String patientMedicalHistory(@PathVariable("id") Integer id , Model model) throws Exception {
		PatientMedicalHistory medicalHistoryy = medicalService.findbyIdMedicHistory(id);
		List<PatientMedicalHistory> medicalHistoryList = medicalService.getMedicalHistoryByPatient(medicalHistoryy.getPatientData().getId());
		List<List<ExaminationData>> examnationList = new ArrayList<List<ExaminationData>>();
		
		System.out.println("SIZE IS " + medicalHistoryList.size());
		for(PatientMedicalHistory p: medicalHistoryList) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDateStart = dateFormat.format(p.getEventDate());
			p.setExtraNote(formattedDateStart);
			List<ExaminationData> examinationData = medicalService.getAllExaminationByHistory(p.getId());
			List<ExaminationData> examination = new ArrayList<ExaminationData>();
			for(ExaminationData exam: examinationData) {
				
				try {
					if(!exam.getMedicService().getServictType().equals("Common")) {
						examination.add(exam);
					}
				} catch (Exception e) {
						examination.add(exam);
				}
				System.out.println("EXAM NAME IS " + exam.getExamination() + "For patient history id " + p.getId());
				System.out.println("EXAM Result IS " + exam.getResult() + "For patient history id " + p.getId());
			}
			examnationList.add(examination);
			examination =  new ArrayList<ExaminationData>();
			

			//odel.addAttribute("examinationData", examination);
			//model.addAttribute("medicalHistory", p);	
		}
		
//		Integer counterExam = 0;
//		System.out.println("SIZE EXAM IS " + examnationList.size());
//		for(List<ExaminationData> exam: examnationList) {
//			
//			for(ExaminationData eee: exam) {
//				System.out.println("EXAM NAME IS " + eee.getExamination() + "For patient history id " +  eee.getId());
//				System.out.println("EXAM RESULT IS " + eee.getResult() + "For patient history id " +  eee.getId());
//			}
//			System.out.println("EXAM RESULT IS ///////////////");
//			System.out.println("EXAM NAME IS " + exam.get(counterExam).getExamination() + "For patient history id " +  exam.get(counterExam).getId());
//			System.out.println("EXAM RESULT IS " + exam.get(counterExam).getResult() + "For patient history id " +  exam.get(counterExam).getId());
//			counterExam++;
//		}
		model.addAttribute("examinationData", examnationList);
		model.addAttribute("medicalHistory", medicalHistoryList);	
			
		return "patient/medicalHistory";
	}
	
	@GetMapping("/recordMedicHistory")
	public String recordHistory(Model model) throws Exception {
		return "patient/recordHistory";
	}
		
	@GetMapping("/editMedicHistory/{id}")
	public String editMedicHistory(@PathVariable("id") Integer id , Model model) throws Exception {
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(id);
		List<PatientMedicalHistory> medicalHistoryList = medicalService.getMedicalHistoryByPatient(medicalHistory.getPatientData().getId());
		Integer isActive = 0;
		
		PatientMedicalHistory firstMedicHistory = medicalHistoryList.get(0);
		if(firstMedicHistory.getId().equals(medicalHistory.getId())) {
			isActive=1;
		}
		
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(medicalHistory.getEventDate());
		String formattedDateStartDate = dateFormat.format(medicalHistory.getEventStartDate());
		medicalHistory.setExtraNote(formattedDateStart);
		List<ExaminationData> examinationData = medicalService.getAllExaminationByHistory(id);
		List<ExaminationData> examination = new ArrayList<ExaminationData>();
		for(ExaminationData exam: examinationData) {
			try {
				if(!exam.getMedicService().getServictType().equals("Common")) {
					examination.add(exam);
				}
			} catch (Exception e) {
				examination.add(exam);
			}
			
		}
		
		List<Department> allDepartments = medicalService.allDepartment();
		List<MedicService> allServices = medicalService.allServices();
		List<MedicService> allServicesData = new ArrayList<MedicService>();
		
		for(MedicService service: allServices) {
			if(!service.getServictType().equals("Common")) {
				allServicesData.add(service);
			}
		}
		
		model.addAttribute("examinationData", examination);
		model.addAttribute("medicalHistory", medicalHistory);		
		model.addAttribute("allDepartments", allDepartments);	
		model.addAttribute("allServices", allServicesData);
		model.addAttribute("isActive", isActive);
		model.addAttribute("formattedDateStartDate", formattedDateStartDate);

		return "patient/editRecordHistory";
	}
	
	@GetMapping("/editMedicHistorylabratory/{id}")
	public String editMedicHistorylabratory(@PathVariable("id") Integer id , Model model) throws Exception {
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(id);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(medicalHistory.getEventDate());
		String formattedDateStartDate = dateFormat.format(medicalHistory.getEventStartDate());
		medicalHistory.setExtraNote(formattedDateStart);
		List<ExaminationData> examinationData = medicalService.getAllExaminationByHistory(id);
		List<ExaminationData> examination = new ArrayList<ExaminationData>();
		for(ExaminationData exam: examinationData) {
			try {
				if(!exam.getMedicService().getServictType().equals("Common")) {
					examination.add(exam);
				}
			} catch (Exception e) {
				examination.add(exam);
			}
			
		}
		
		List<Department> allDepartments = medicalService.allDepartment();
		List<MedicService> allServices = medicalService.allServices();
		List<MedicService> allServicesData = new ArrayList<MedicService>();
		
		for(MedicService service: allServices) {
			if(!service.getServictType().equals("Common")) {
				allServicesData.add(service);
			}
		}
		
		model.addAttribute("examinationData", examination);
		model.addAttribute("medicalHistory", medicalHistory);		
		model.addAttribute("allDepartments", allDepartments);	
		model.addAttribute("allServices", allServicesData);	
		model.addAttribute("formattedDateStartDate", formattedDateStartDate);

		return "patient/editRecordHistoryLabratory";
	}
	
	@PostMapping("/editMedicalRecordHistory")
	@ResponseBody
	public String editMedicalRecordHistory() throws Exception {
		JSONObject jooo = new JSONObject(request.getParameter("json"));
		JSONObject joooResult = new JSONObject(request.getParameter("jsonResult"));
		String medicalHistoryIdStr = request.getParameter("medicalHistoryId");
		
		String scheduledHour = request.getParameter("scheduledHour");
		
		String cheifComplaint = request.getParameter("cheifComplaint");
		String pastMedicalHistory = request.getParameter("pastMedicalHistory");
		String presentStatus = request.getParameter("presentStatus");
		String treatment = request.getParameter("treatment");
		String prescription = request.getParameter("prescription");
		
		
		Integer medicalHistoryId = Integer.parseInt(medicalHistoryIdStr);
		if(scheduledHour==null) {
			scheduledHour="";
		}
		if(cheifComplaint==null) {
			cheifComplaint="";
		}
		if(pastMedicalHistory==null) {
			pastMedicalHistory="";
		}
		if(presentStatus==null) {
			presentStatus="";
		}
		if(treatment==null) {
			treatment="";
		}
		if(prescription==null) {
			prescription="";
		}
		
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(medicalHistoryId);
		medicalHistory.setCheifCompliant(cheifComplaint);
		medicalHistory.setPastMedicalHistory(pastMedicalHistory);
		medicalHistory.setPresentStatus(presentStatus);
		medicalHistory.setTreatement(treatment);
		medicalHistory.setPrescription(prescription);
		
		
		System.out.println(medicalHistoryIdStr);
		System.out.println(scheduledHour);
		System.out.println(cheifComplaint);
		System.out.println(pastMedicalHistory);
		System.out.println(presentStatus);
		System.out.println(treatment);
		System.out.println(prescription);
				
		
		if(!scheduledHour.isEmpty()) {
			Integer dateTimeScheduleId = Integer.parseInt(scheduledHour);
			DateTimeSchedule dateTimeSchedule = medicalService.findbyIdDateTimeSchedule(dateTimeScheduleId);
					

			Date medicalHistoryEventDate = medicalHistory.getEventDate();
			Date dateTimeEventDate = dateTimeSchedule.getEventDate();
			Date dateTimeStartDate = dateTimeSchedule.getStartDate();
					
			Calendar medicalHistoryCalendar = Calendar.getInstance();
			medicalHistoryCalendar.setTime(medicalHistoryEventDate);

			Calendar dateTimeCalendar = Calendar.getInstance();
			dateTimeCalendar.setTime(dateTimeEventDate);

			long medicalHistoryMillis = medicalHistoryCalendar.getTimeInMillis();
			long dateTimeMillis = dateTimeCalendar.getTimeInMillis();

			long diffMillis = Math.abs(dateTimeMillis - medicalHistoryMillis);
			long diffDays = diffMillis / (24 * 60 * 60 * 1000);

			System.out.println("Difference in days: " + diffDays);
			if (diffDays > 7) {
				System.out.println("The dates are more than 7 days apart.");
				PatientMedicalHistory medicalHistoryNew = new PatientMedicalHistory();
				medicalHistoryNew.setPatientData(medicalHistory.getPatientData());
				medicalHistoryNew.setEventDate(dateTimeEventDate);
				medicalHistoryNew.setEventStartDate(dateTimeStartDate);
				medicalHistoryNew.setAssignedBy(medicalHistory.getAssignedTo());
				medicalHistoryNew.setAssignedTo(medicalHistory.getAssignedTo());
				medicalHistoryNew.setAssignedToDepartment(medicalHistory.getAssignedToDepartment());
				medicalHistoryNew.setExaminationCount(0);
				medicalService.save(medicalHistoryNew);

				MedicService medicService = medicalService.findbyIdMedicService(1);

				ExaminationData examinationData = new ExaminationData();
				examinationData.setPatientMedicalHistory(medicalHistoryNew);
				examinationData.setEventDate(dateTimeEventDate);
				examinationData.setExamination("Card service");
				examinationData.setPatientId(medicalHistory.getPatientData().getId());
				examinationData.setPaymentStatus(0);
				examinationData.setMedicService(medicService);
				medicalService.save(examinationData);

				dateTimeSchedule.setIsAssigned(1);
				medicalService.save(dateTimeSchedule);
			} else {
				System.out.println("The dates are less or exactly 7 days apart.");
				medicalHistory.setEventStartDate(dateTimeStartDate);
				medicalService.save(medicalHistory);

				dateTimeSchedule.setIsAssigned(1);
				medicalService.save(dateTimeSchedule);
			}
		} else {
			medicalService.save(medicalHistory);
		}
		
		Integer lng=jooo.length();
		Integer lng2=joooResult.length();
		
		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.HOUR_OF_DAY, 0);
		cal1.clear(Calendar.MINUTE);
		cal1.clear(Calendar.SECOND);
		cal1.clear(Calendar.MILLISECOND);
		
		Date examinationDate = cal1.getTime();
		for (int i = 0; i < lng; i++) {
			String Key=String.valueOf(i);
			JSONObject joooo=jooo.getJSONObject(Key);
			
			String  dept=joooo.getString("dept");
			Integer service=joooo.getInt("service");
			String  customService=joooo.getString("customService");
			String  result=joooo.getString("result");
			
			System.out.println("Dept is " + dept);
			System.out.println("Service is " + service);
			System.out.println("CustomService is " + customService);
			System.out.println("Result is " + result);
			
			if (customService.isEmpty()) {
				MedicService medicService = medicalService.findbyIdMedicService(service);
				ExaminationData examination = new ExaminationData();
				examination.setPatientMedicalHistory(medicalHistory);
				examination.setEventDate(examinationDate);
				examination.setPatientId(medicalHistory.getPatientData().getId());
				examination.setPaymentStatus(0);
				examination.setMedicService(medicService);
				examination.setExamination(medicService.getServiceName());
				examination.setResult(result);
				medicalService.save(examination);
			} else {
				ExaminationData examination = new ExaminationData();
				examination.setPatientMedicalHistory(medicalHistory);
				examination.setEventDate(examinationDate);
				examination.setPatientId(medicalHistory.getPatientData().getId());
				examination.setPaymentStatus(0);
				examination.setExamination(customService);
				examination.setResult(result);
				medicalService.save(examination);
			}
		}	
		
		for (int i = 0; i < lng2; i++) {
			String Key=String.valueOf(i);
			JSONObject joooo=joooResult.getJSONObject(Key);
			
			String  result=joooo.getString("result");
			Integer examId=joooo.getInt("id");
			
			System.out.println("Result is " + result);
			System.out.println("Exam Id is " + examId);
			
			
			ExaminationData examination = medicalService.findbyIdExamination(examId);
			examination.setResult(result);	
			medicalService.save(examination);
			
		}
		
		
		return "success";
			
	}
	
	//Reception side
	@GetMapping("/patientDataReception")
	public String patientDataReception(Model model) throws Exception {
		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.HOUR_OF_DAY, 0);
		cal1.clear(Calendar.MINUTE);
		cal1.clear(Calendar.SECOND);
		cal1.clear(Calendar.MILLISECOND);
		
		Date endDate = cal1.getTime();
		Date startDate = decrementDate(endDate,-7);
		List<Users> allDoctors = usersDetailsService.findAllByRole(3);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(startDate);
		String formattedDateEnd = dateFormat.format(endDate);

		model.addAttribute("startDate", formattedDateStart);
		model.addAttribute("endDate", formattedDateEnd);
		model.addAttribute("doctors", allDoctors);

		
		return "patient/allPatientReception";
	}
	
	@GetMapping("/addNewPatient")
	public String addNewPatientData(Model model) throws Exception {
		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.HOUR_OF_DAY, 0);
		cal1.clear(Calendar.MINUTE);
		cal1.clear(Calendar.SECOND);
		cal1.clear(Calendar.MILLISECOND);
		
		Date startDate = cal1.getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(startDate);
		
		NewPatientVo patient = new NewPatientVo();
		patient.setRegistryDate(formattedDateStart);
		
		List<Users> allDoctors = usersDetailsService.findAllByRole(3);
		List<Department> allDepartments = medicalService.allDepartment();
		
		

		List<DateTimeSchedule> scheduleList = medicalService.getDateTimeSchedule(startDate,startDate,22,0);
		List<String> dateTimeList = new ArrayList<String>();
		List<Integer> idList = new ArrayList<Integer>();
		
		System.out.println("size is " + scheduleList.size());
		for(DateTimeSchedule d: scheduleList) {
			DateFormat dateFormatHour = new SimpleDateFormat("HH:mm");
			String formattedDateStartHour = dateFormatHour.format(d.getStartDate());
			String formattedDateEndHour = dateFormatHour.format(d.getEndDate());
			
			String finalSchedule = formattedDateStartHour + " to " + formattedDateEndHour;
			dateTimeList.add(finalSchedule);
			idList.add(d.getId());
			
		}
		
		model.addAttribute("doctors", allDoctors);
		model.addAttribute("departments", allDepartments);
		model.addAttribute("patient", patient);
		model.addAttribute("dateTimeList", dateTimeList);
		model.addAttribute("idList", idList);
		model.addAttribute("formattedDateStart", formattedDateStart);
		
		return "patient/addNewPatient";
	}
	
	
	@PostMapping("/editExistingPatient")
	@ResponseBody
	public String addNewPayby(@ModelAttribute NewPatientVo patient, RedirectAttributes redirectAttributes) throws Exception {
		PatientData newPatient = new PatientData();

		String name = patient.getName();
		String lastname = patient.getLastName();
		String phoneNumber = patient.getPhoneNumber();
		String sex = patient.getSex();
		Integer age = patient.getAge();
		String address = patient.getAddress();
		String note = patient.getNote();
		String dateStr = patient.getRegistryDate();
		String assignedTo = patient.getAssignedTo();
		String doctorId = patient.getDoctorId();
		Integer instituteId = patient.getInstituteId();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date eventDate = new Date();
		Date startDate = new Date();
		DateTimeSchedule dateTimeSchedule = medicalService.findbyIdDateTimeSchedule(instituteId);
		
	   

	    //Start Date
	    eventDate = dateTimeSchedule.getEventDate();
	    startDate = dateTimeSchedule.getStartDate();
	    	 
	    PatientData isUnique = null;
	    try {
	    	isUnique = medicalService.checkByPhonePatient(phoneNumber);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(isUnique == null) {
			newPatient.setName(name);
			newPatient.setLastName(lastname);
			newPatient.setPhoneNumber(phoneNumber);
			newPatient.setSex(sex);
			newPatient.setAge(age);
			newPatient.setAddress(address);
			newPatient.setNote(note);
			newPatient.setRegistryDate(startDate);
			newPatient.setIsActive(1);
			newPatient.setInstituteId(1);
			medicalService.save(newPatient);
			
			PatientMedicalHistory medicalHistory = new PatientMedicalHistory();
			medicalHistory.setPatientData(newPatient);
			medicalHistory.setEventDate(eventDate);
			medicalHistory.setEventStartDate(startDate);
			medicalHistory.setAssignedBy("Reception");
			medicalHistory.setAssignedTo(doctorId);
			medicalHistory.setAssignedToDepartment(assignedTo);
			medicalHistory.setExaminationCount(0);
			medicalService.save(medicalHistory);
			
			MedicService medicService = medicalService.findbyIdMedicService(1);
			
			ExaminationData examinationData = new ExaminationData();
			examinationData.setPatientMedicalHistory(medicalHistory);
			examinationData.setEventDate(eventDate);
			examinationData.setExamination("Card service");
			examinationData.setPatientId(newPatient.getId());
			examinationData.setPaymentStatus(0);
			examinationData.setMedicService(medicService);
			medicalService.save(examinationData);
			
			dateTimeSchedule.setIsAssigned(1);
			medicalService.save(dateTimeSchedule);
			
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Phone Number already exists");
			return "Patient phone Number already exists";
		}
		
		redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "Patient data entered successfully");
		return "success";
			
	}
	
	@GetMapping("/editExistingPatientData/{id}")
	public String editExistingPatient(@PathVariable("id") Integer id ,Model model) throws Exception {
		//PatientData patient = medicalService.findbyIdPatient(id);
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(id);
		PatientData patientData = medicalHistory.getPatientData();
		List<ExaminationData> examinationData = medicalService.getAllExaminationByHistory(id);
		model.addAttribute("patient", patientData);
		model.addAttribute("examinationData", examinationData);
		return "patient/editPatient";
	}
	
	@PostMapping("/updateExistingPatientData")
	@ResponseBody
	public String updateExistingPatientData(@ModelAttribute NewPatientVo patient, RedirectAttributes redirectAttributes) throws Exception {
		//new JSONObject(request.getParameter("json"));
		JSONObject jooo =patient.getJsonObj();
		System.out.println("Joo is " + jooo);
		Integer lng=0;
		if (jooo!=null || !jooo.isEmpty()) {
			lng=jooo.length();
		}
		
		String medicalId = patient.getAssignedTo();
		Integer medicId = Integer.parseInt(medicalId);
		
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(medicId);
		Integer patientid = medicalHistory.getPatientData().getId();
		PatientData existingPatient = medicalService.findbyIdPatient(patientid);
		
		
		
		String name = patient.getName();
		String lastname = patient.getLastName();
		String phoneNumber = patient.getPhoneNumber();
		String phoneNumberOriginal = medicalHistory.getPatientData().getPhoneNumber();
		String sex = patient.getSex();
		Integer age = patient.getAge();
		String address = patient.getAddress();
		String note = patient.getNote();
		
		if(!phoneNumber.equals(phoneNumberOriginal)) {
			PatientData isUnique = null;
		    try {
		    	isUnique = medicalService.checkByPhonePatient(phoneNumber);
			} catch (Exception e) {
				// TODO: handle exception
			}
		    
		    if(isUnique != null) {
		    	return "Patient phone Number already exists";
			}
		}
		
		
	    
	    
		System.out.println(name);
		System.out.println(phoneNumber);
		existingPatient.setName(name);
		existingPatient.setLastName(lastname);
		existingPatient.setPhoneNumber(phoneNumber);
		existingPatient.setSex(sex);
		existingPatient.setAge(age);
		existingPatient.setAddress(address);
		existingPatient.setNote(note);
		
		medicalService.save(existingPatient);
		
		Calendar eventDate = Calendar.getInstance();
		eventDate.set(Calendar.HOUR_OF_DAY, 0);
		eventDate.clear(Calendar.MINUTE);
		eventDate.clear(Calendar.SECOND);
		eventDate.clear(Calendar.MILLISECOND);
		
		for (int i = 0; i < lng; i++) {
			String Key=String.valueOf(i);
			JSONObject joooo=jooo.getJSONObject(Key);
			Integer id=joooo.getInt("id");
			ExaminationData examinationData = medicalService.findbyIdExamination(id);
			examinationData.setPaymentStatus(1);
			medicalService.save(examinationData);
			System.out.println("Id is " + id);
			
			Integer serviceId = examinationData.getMedicService().getId();
//			private Integer serviceId;
			
			Date salesDate = eventDate.getTime();
//			private Date salesDate;
			
			Double servicePrice = examinationData.getMedicService().getPrice();
//			private Double servicePrice;
			
			Double serviceSalePrice = examinationData.getMedicService().getPrice();
//			private Double serviceSalePrice;
			
			Double totalSalePrice = examinationData.getMedicService().getPrice();
//			private Double totalSalePrice;
			
			Integer quantity = 1;
//			private Integer quantity;
			
			String serviceName = examinationData.getMedicService().getServiceName();
//			private String serviceName;
			
			String serviceType =  examinationData.getMedicService().getServictType();
//			private String serviceType;
			
//			private String vendorName;
//			private String sellerName;
//			private Integer instituteId;
//			private Integer salesReciet;
			
			String departmentId = examinationData.getMedicService().getDepartmentName();
//			private Integer departmentId;
			
			MedicSales medicSales = new MedicSales(serviceId, salesDate, servicePrice, serviceSalePrice, totalSalePrice, quantity, serviceName, serviceType, null, null, null, null, departmentId);
			medicalService.save(medicSales);
		}
		
		Integer examinationCount = medicalHistory.getExaminationCount();
		examinationCount = examinationCount + lng;
		System.out.println("Lng count is " + lng);
		medicalHistory.setExaminationCount(examinationCount);
		System.out.println("Exam count is " + examinationCount);
		medicalService.save(medicalHistory);
		
		return "success";
			
	}
	
	@GetMapping("/editExistingPatientSchedule/{id}")
	public String editExistingPatientSchedule(Model model, @PathVariable("id") Integer id) throws Exception {
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(id);
		Date startDate = medicalHistory.getEventStartDate();
		Date eventDate = medicalHistory.getEventDate();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = dateFormat.format(startDate);
		String formattedDateEvent = dateFormat.format(eventDate);
		
		List<Users> allDoctors = usersDetailsService.findAllByRole(3);
		List<Department> allDepartments = medicalService.allDepartment();
		
		model.addAttribute("doctors", allDoctors);
		model.addAttribute("departments", allDepartments);
		model.addAttribute("formattedDateStart", formattedDateStart);
		model.addAttribute("formattedDateEvent", formattedDateEvent);
		model.addAttribute("medicalHistory", medicalHistory);
		return "patient/editPatientSchedule";
	}
	
	@PostMapping("/editExistingPatientScheduleData")
	@ResponseBody
	public String editExistingPatientScheduleData() throws Exception {
		//new JSONObject(request.getParameter("json"));
		String scheduledHourId = request.getParameter("scheduledHour");
		String doctorId = request.getParameter("doctorId");
		String department = request.getParameter("department");
		String medicalHistoryId = request.getParameter("medicalHistoryId");
		
		Integer scheduleIdInt = Integer.parseInt(scheduledHourId);
		Integer medicalIdInt = Integer.parseInt(medicalHistoryId);
		
		PatientMedicalHistory medicalHistory = medicalService.findbyIdMedicHistory(medicalIdInt);
		DateTimeSchedule dateTimeSchedule = medicalService.findbyIdDateTimeSchedule(scheduleIdInt);

		Date medicalHistoryEventDate = medicalHistory.getEventDate();
		Date dateTimeEventDate = dateTimeSchedule.getEventDate();
		Date dateTimeStartDate = dateTimeSchedule.getStartDate();
		
		Calendar medicalHistoryCalendar = Calendar.getInstance();
		medicalHistoryCalendar.setTime(medicalHistoryEventDate);

		Calendar dateTimeCalendar = Calendar.getInstance();
		dateTimeCalendar.setTime(dateTimeEventDate);

		long medicalHistoryMillis = medicalHistoryCalendar.getTimeInMillis();
		long dateTimeMillis = dateTimeCalendar.getTimeInMillis();

		long diffMillis = Math.abs(dateTimeMillis - medicalHistoryMillis);
		long diffDays = diffMillis / (24 * 60 * 60 * 1000);

		System.out.println("Difference in days: " + diffDays);
		if (diffDays > 7) {
		    System.out.println("The dates are more than 7 days apart.");
		    PatientMedicalHistory medicalHistoryNew = new PatientMedicalHistory();
		    medicalHistoryNew.setPatientData(medicalHistory.getPatientData());
		    medicalHistoryNew.setEventDate(dateTimeEventDate);
		    medicalHistoryNew.setEventStartDate(dateTimeStartDate);
		    medicalHistoryNew.setAssignedBy("Reception");
		    medicalHistoryNew.setAssignedTo(doctorId);
		    medicalHistoryNew.setAssignedToDepartment(department);
		    medicalHistoryNew.setExaminationCount(0);
			medicalService.save(medicalHistoryNew);
			
			MedicService medicService = medicalService.findbyIdMedicService(1);
			
			ExaminationData examinationData = new ExaminationData();
			examinationData.setPatientMedicalHistory(medicalHistoryNew);
			examinationData.setEventDate(dateTimeEventDate);
			examinationData.setExamination("Card service");
			examinationData.setPatientId(medicalHistory.getPatientData().getId());
			examinationData.setPaymentStatus(0);
			examinationData.setMedicService(medicService);
			medicalService.save(examinationData);
			
			dateTimeSchedule.setIsAssigned(1);
			medicalService.save(dateTimeSchedule);
		} else {
		    System.out.println("The dates are less or exactly 7 days apart.");
		    medicalHistory.setAssignedTo(doctorId);
			medicalHistory.setAssignedToDepartment(department);
			medicalHistory.setEventStartDate(dateTimeStartDate);
			medicalService.save(medicalHistory);
			
			dateTimeSchedule.setIsAssigned(1);
			medicalService.save(dateTimeSchedule);
		}
		
		
		
		return "success";
			
	}
	
	@GetMapping("/patientMedicalHistory/{id}")
	public String editExistingPatientHistory(Model model, @PathVariable("id") Integer id) throws Exception {
		List<PatientMedicalHistory> medicalHistory = medicalService.getMedicalHistoryByPatient(id);
		PatientData patient = new PatientData();
		List<List<ExaminationData>> allexamination = new ArrayList<List<ExaminationData>>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateStart = "";
		
		for(PatientMedicalHistory history: medicalHistory) {
			Integer historyId = history.getId();
			List<ExaminationData> examinationData = medicalService.getAllExaminationByHistory(historyId);
			allexamination.add(examinationData);
			formattedDateStart = dateFormat.format(history.getEventDate());
			history.setExtraNote(formattedDateStart);
		}
		
		model.addAttribute("patient", patient);
		model.addAttribute("medicalHistory", medicalHistory);
		model.addAttribute("allexamination", allexamination);
		
		return "patient/editPatientHistory";
	}

	@GetMapping("/invoicePage/{id}")
	public String showInvoicePage(@PathVariable("id") Integer id, Model model) throws Exception {
		System.out.println("==============="+id);
		PatientMedicalHistory patientData = medicalService.findbyIdMedicHistory(id);
		System.out.println("==============="+patientData.getPatientData());
		List<ExaminationData> examinationData = medicalService.getAllExaminationByHistory(id);
		System.out.println("==============="+examinationData);

		examinationData.removeIf(examination -> examination.getPaymentStatus() == 0);

		SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd,yyyy");
		double total = 0.0;
		for (ExaminationData examination : examinationData) {
			if (examination.getEventDate() != null) {
				String formattedDate = dateFormat.format(examination.getEventDate());
//				examination.setEventDate(dateFormat.parse(formattedDate));  // Update eventDate with formatted date
				examination.setExtraNote(formattedDate);
			}
			if (examination.getMedicService() != null && examination.getMedicService().getPrice() != null) {
				total += examination.getMedicService().getPrice();
			}


		}


		model.addAttribute("patient", patientData);
		model.addAttribute("examinationData", examinationData);
        model.addAttribute("total", total);
        model.addAttribute("id", id);



		return "patient/invoicePage";
	}

    @GetMapping("/getReport2/{id}")
    public void getReport2(@PathVariable("id") Integer id, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
        System.out.println(id);

        boolean accessStatus = true;
        if (accessStatus) {
            String reportFormat = "pdf";
            ArrayList<InvoiceVo> testArrayVO = new ArrayList<InvoiceVo>();

            InvoiceVo invoice = new InvoiceVo();
            invoice.setInvoiceDate("10/11/2024");
            invoice.setService("Card service");
            invoice.setMeasurmentUnit("Per unit");
            invoice.setUnitPrice(100.00);
            invoice.setDiscount(0.00);
            invoice.setSubTotalPrice(100.00);


            InvoiceVo invoice2 = new InvoiceVo();
            invoice2.setInvoiceDate("19/04/2024");
            invoice2.setService("x-ray");
            invoice2.setMeasurmentUnit("Per unit");
            invoice2.setUnitPrice(840.00);
            invoice2.setDiscount(0.00);
            invoice2.setSubTotalPrice(840.00);

            testArrayVO.add(invoice);
            testArrayVO.add(invoice2);

            File file = ResourceUtils.getFile("classpath:invoice.jrxml");



            FileResolver fileResolver = new FileResolver() {

                @Override
                public File resolveFile(String fileName) {
                    URI uri;
                    try {
                        uri = new URI(this.getClass().getResource(fileName).getPath());
                        return new File(uri.getPath());
                    } catch (URISyntaxException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                        return null;
                    }
                }
            };

            JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
            JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(testArrayVO);


            System.out.println("Got the file");

            HashMap<String, Object> parameters = new HashMap<String, Object>();
            invoice.setIssueDate("10/11/2024");
            invoice.setAddress("Addis Ababa");
            invoice.setBilledTo("Ermias Ashebr");
            invoice.setTotalPrice(150.00);

            parameters.put("REPORT_FILE_RESOLVER", fileResolver);
            parameters.put("issueDate", "10/11/2024");
            parameters.put("address", "Addis Ababa");
            parameters.put("billedTo", "Ermias Ashebr");
            parameters.put("totalPrice", 150.00);
            parameters.put("invoiceNumber", "150.00");
            parameters.put("companyContact", "150.00");
            parameters.put("companyEmail", "150.00");


            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);
            System.out.println("Got the file in hererere VOVOVOVO");

            try {
                if (reportFormat.equalsIgnoreCase("pdf")) {
                    //JasperExportManager.exportReportToPdfFile(jasperPrint, finalPath + "\\test.pdf");
                    response.setContentType("application/pdf");
                    response.addHeader("Content-Disposition", "attachment; filename=invoice.pdf;");
                    JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

                    System.out.println("Got the file in hererere");
                }
            } catch (Exception e) {
                //
                //
            }





        }

    }

	@RequestMapping(value = "/sendPatientTableData/{startDate}/{endDate}")
	@ResponseBody
	public PatientListAjax sendPatientTableData(@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @PathVariable("startDate") Date startDate ,@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @PathVariable("endDate") Date endDate) throws ParseException {
			Calendar cal1 = Calendar.getInstance();
			cal1.setTime(startDate);
			cal1.set(Calendar.HOUR_OF_DAY, 0);
			cal1.clear(Calendar.MINUTE);
			cal1.clear(Calendar.SECOND);
			cal1.clear(Calendar.MILLISECOND);
			startDate = cal1.getTime();
			
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(endDate);
			cal2.set(Calendar.HOUR_OF_DAY, 23);
			cal2.set(Calendar.MINUTE, 59);
			cal2.set(Calendar.SECOND, 59);
			endDate = cal2.getTime();
			
			MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Integer roleId = user.getRole().getId();
			
			
			
			PatientListAjax itemListAjax = new PatientListAjax();
			String page = "";
			String searchValue = "";
			String orderBy = "";
			String status = "";
			String assignedTo = "";
			String isLabratory = "";
			String isReception = "";

			
			try {
				page = request.getParameter("page");
			} catch (Exception e) {
				page = "1";
			}
			
			try {
				searchValue = request.getParameter("search");
			} catch (Exception e) {
				searchValue = "";
			}
			
			try {
				orderBy = request.getParameter("orderBy");
			} catch (Exception e) {
				orderBy = "0";
			}
			
			try {
				status = request.getParameter("status");
			} catch (Exception e) {
				status = "";
			}
			
			if(roleId.equals(3)) {
				assignedTo=user.getFirstname();
			} else {
				try {
					assignedTo = request.getParameter("assignedTo");
				} catch (Exception e) {
					assignedTo = "";
				}
			}
			
			try {
				isLabratory = request.getParameter("isLabratory");
			} catch (Exception e) {
				isLabratory = "";
			}
			
			try {
				isReception = request.getParameter("isReception");
			} catch (Exception e) {
				isReception = "";
			}
			
			if (page==null) {
				page = "1";
			}
			
			if (searchValue==null) {
				searchValue = "";
			}
			
			if (orderBy==null) {
				orderBy = "0";
			}
			
			if (status==null || status.equals("0")) {
				status = "";
			}
			
			if (assignedTo==null || assignedTo.equals("0")) {
				assignedTo = "";
			}
			
			if (isLabratory==null || isLabratory.equals("0")) {
				isLabratory = "";
			}
			
			if (isReception==null || isReception.equals("0")) {
				isReception = "";
			}
			
			
			String orderByQuery = " order by eventStartDate asc";
			if(orderBy.equals("0")) {
				orderByQuery = " order by eventStartDate asc";
			} else if (orderBy.equals("1")) {
				orderByQuery = " order by eventStartDate asc";
			} else {
				orderByQuery = " order by id desc";
			}
			
			Date date = new Date();
			Integer pageFinal = Integer.parseInt(page);
			
			List<PatientMedicalHistory> patients = medicalService.getAppointmentList(pageFinal, startDate, endDate, searchValue, status, assignedTo, orderByQuery,isLabratory,isReception);			
			for(PatientMedicalHistory medicalHistory: patients) {
				System.out.println(medicalHistory.getEventStartDate());
			}
			
			Integer totalListSize = 1;
			if (!patients.isEmpty()) {
				PatientMedicalHistory lastItem = patients.get(patients.size() - 1);
			    totalListSize = lastItem.getId();
			    totalListSize = (totalListSize/25);
			    patients.remove(patients.size() - 1);
			}
			
			Integer size = patients.size();
			if (pageFinal.equals(1) || pageFinal.equals(2)) {
				itemListAjax.setPage2(1);
				itemListAjax.setPage3(2);
				itemListAjax.setPage1(3);
				itemListAjax.setPage4(4);
				itemListAjax.setPage5(5);
			} else {
				itemListAjax.setPage1(pageFinal);
				itemListAjax.setPage2(pageFinal-2);
				itemListAjax.setPage3(pageFinal-1);
				itemListAjax.setPage4(pageFinal+1);
				itemListAjax.setPage5(pageFinal+2);
			}
			
			if (size.equals(0)) {
				itemListAjax.setPageLimit(1);
			} else if (size < 25 && size > 0) {
				itemListAjax.setPageLimit(2);
			} else {
				itemListAjax.setPageLimit(0);
			}
			
			itemListAjax.setItem(patients);
			itemListAjax.setSearchVal(searchValue);
			itemListAjax.setPage(pageFinal);
			
			itemListAjax.setCountItem(totalListSize);
			
			return itemListAjax;
	        
		}
	
		public Date decrementDate(Date date, int i) {
			int daysToDecrement = i;
			Calendar calender = Calendar.getInstance();
			calender.setTime(date);
			calender.add(Calendar.DATE, daysToDecrement);
			return calender.getTime();
		}
		
		public Date decrementDateHour(Date date) {
			int daysToDecrement = -1;
			Calendar calender = Calendar.getInstance();
			calender.setTime(date);
			calender.add(Calendar.HOUR_OF_DAY, daysToDecrement);
			return calender.getTime();
		}
		
		
		@RequestMapping(value = "/sendReceptionTableData")
		@ResponseBody
		public ServiceListAjax sendReceptionTableData() throws ParseException {
				
				MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				//InventoryStore store = user.getStore();
				Integer storeId = 0;
				Boolean isAdmin = true;
				
				String storeRequest = request.getParameter("inv");
				
				ServiceListAjax itemListAjax = new ServiceListAjax();
				String page = "";
				String searchValue = "";
				String orderBy = "";
				String dept = "";
				String byType = "";
				String assignedTo = "";
				
				try {
					page = request.getParameter("page");
				} catch (Exception e) {
					page = "1";
				}
				
				try {
					searchValue = request.getParameter("search");
				} catch (Exception e) {
					searchValue = "";
				}
				
				try {
					orderBy = request.getParameter("orderBy");
				} catch (Exception e) {
					orderBy = "0";
				}
				
				try {
					dept = request.getParameter("dept");
				} catch (Exception e) {
					dept = "";
				}
				
				try {
					byType = request.getParameter("byType");
				} catch (Exception e) {
					byType = "";
				}
				
				try {
					assignedTo = request.getParameter("assignedTo");
				} catch (Exception e) {
					assignedTo = "";
				}
				
				if (page==null) {
					page = "1";
				}
				
				if (searchValue==null) {
					searchValue = "";
				}
				
				if (orderBy==null) {
					orderBy = "0";
				}
				
				if (dept==null || dept.equals("0")) {
					dept = "";
				}
				
				if (byType==null || byType.equals("0")) {
					byType = "";
				}
				
				if (assignedTo==null || assignedTo.equals("0")) {
					assignedTo = "";
				}
				
				
				String orderByQuery = "";
				if(orderBy.equals("0")) {
					orderByQuery = " order by id desc";
				} else if (orderBy.equals("1")) {
					orderByQuery = " order by itemName asc";
				} else if (orderBy.equals("2")) {
					orderByQuery = " order by itemName desc";
				} else if (orderBy.equals("3")) {
					orderByQuery = " order by salePrice asc";
				} else if (orderBy.equals("4")) {
					orderByQuery = " order by salePrice desc";
				} else if (orderBy.equals("5")) {
					orderByQuery = " order by onHand asc";
				} else if (orderBy.equals("6")) {
					orderByQuery = " order by onHand desc";
				} else {
					orderByQuery = " order by id desc";
				}
				
				Integer pageFinal = Integer.parseInt(page);
				
				List<MedicService> service = medicalService.getServiceList(pageFinal, searchValue,dept, byType, orderByQuery);			
				
				
				Integer totalListSize = 1;
				if (!service.isEmpty()) {
					MedicService lastItem = service.get(service.size() - 1);
				    totalListSize = lastItem.getId();
				    totalListSize = (totalListSize/25);
				    service.remove(service.size() - 1);
				}
				
				Integer size = service.size();
				if (pageFinal.equals(1) || pageFinal.equals(2)) {
					itemListAjax.setPage2(1);
					itemListAjax.setPage3(2);
					itemListAjax.setPage1(3);
					itemListAjax.setPage4(4);
					itemListAjax.setPage5(5);
				} else {
					itemListAjax.setPage1(pageFinal);
					itemListAjax.setPage2(pageFinal-2);
					itemListAjax.setPage3(pageFinal-1);
					itemListAjax.setPage4(pageFinal+1);
					itemListAjax.setPage5(pageFinal+2);
				}
				
				if (size.equals(0)) {
					itemListAjax.setPageLimit(1);
				} else if (size < 25 && size > 0) {
					itemListAjax.setPageLimit(2);
				} else {
					itemListAjax.setPageLimit(0);
				}
				
				itemListAjax.setMedicServices(service);
				itemListAjax.setSearchVal(searchValue);
				itemListAjax.setPage(pageFinal);
				
				itemListAjax.setCountItem(totalListSize);
				
				return itemListAjax;
		        
			}

}
