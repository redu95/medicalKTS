package com.bannershallmark.controller;




import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bannershallmark.entity.DateTimeSchedule;
import com.bannershallmark.entity.Department;
import com.bannershallmark.entity.MedicItem;
import com.bannershallmark.entity.MedicService;
import com.bannershallmark.entity.MedicalInstitute;
import com.bannershallmark.entity.PatientData;
import com.bannershallmark.entity.PatientMedicalHistory;
import com.bannershallmark.entity.Users;
import com.bannershallmark.medicalHandler.MedicalService;
import com.bannershallmark.service.MyUserDetails;
import com.bannershallmark.service.UsersDetailsService;
import com.bannershallmark.vo.ServiceListAjax;
import com.bannershallmark.vo.SmsModel;

@Controller
@RequestMapping("/Institute")
public class MedicInstituteController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private MedicalService medicalService;
	
	@Autowired
	private UsersDetailsService usersDetailsService;
	
	//Administration side
	@GetMapping("/dashboard")
	public String dashboard(Model model) throws Exception {
		return "medicInstitute/dashboard";
	}
	
	@GetMapping("/allSchedule")
	public String allSchedule(Model model) throws Exception {
		return "medicInstitute/scheduleList";
	}
	
	@GetMapping("/institutionData")
	public String institutionData(Model model) throws Exception {
		return "medicInstitute/institutionData";
	}
	
	@GetMapping("/addInstitution")
	public String addInstitution(Model model) throws Exception {
		MedicalInstitute institute = new MedicalInstitute();
		model.addAttribute("institute", institute);
		return "medicInstitute/addInstitute";
	}
	
	@GetMapping("/editInstitution")
	public String editInstitution(Model model) throws Exception {
		MedicalInstitute institute = new MedicalInstitute();
		model.addAttribute("institute", institute);
		return "medicInstitute/editInstitute";
	}
	
	@GetMapping("/medicItems")
	public String medicItems(Model model) throws Exception {
		List<MedicItem> items = medicalService.allItems();
	    model.addAttribute("items", items);
	    MedicItem item = new MedicItem();
		model.addAttribute("item", item);
		return "medicInstitute/items";
	}
	
	@GetMapping("/addMedicItems")
	public String addMedicItems(Model model) throws Exception {
		MedicItem item = new MedicItem();
		model.addAttribute("item", item);
		return "medicInstitute/addItems";
	}
	
	@PostMapping("/addItemsData")
	public String addItemsData( @ModelAttribute MedicItem item) throws Exception {
		
		
		item.setInstituteId(1);
		item.setIsActive(1);
		
		medicalService.save(item);
		return "redirect:/Institute/medicItems";
	}
	
	@GetMapping("/editMedicItems")
	public String editMedicItems(Model model) throws Exception {
		MedicItem item = new MedicItem();
		model.addAttribute("item", item);
		return "medicInstitute/editItems";
	}
	
	@GetMapping("/departmentsData")
	  public String departmentsData(Model model) throws Exception {
	    List<Department> departments = medicalService.allDepartment();
	    model.addAttribute("departments", departments);
	    Department department = new Department();
	    List<Users> users = usersDetailsService.findAll();
	    
	    
	    for(Department d: departments) {
	    	byte[] imageByte = d.getDocData();
			String base64Image = Base64.getEncoder().encodeToString(imageByte);
			d.setDepartmentHead(base64Image);
			System.out.println();			System.out.println("Image data is not null");
	    }
		
	    model.addAttribute("department", department);
	    model.addAttribute("users", users);
	    return "medicInstitute/department";
	  }
	
	@GetMapping("/addDepartment")
	public String addDepartment(Model model) throws Exception {
		Department department = new Department();
		List<Users> users = usersDetailsService.findAll();
		
		model.addAttribute("department", department);
		model.addAttribute("users", users);
		//

		return "medicInstitute/addDepartment";
	}
	
	@PostMapping("/addDepartmentData")
	public String addDepartmentData(@RequestParam(value = "file", required = false) MultipartFile file, @ModelAttribute Department department) throws Exception {
		
		System.out.println(department.getId());
		System.out.println(department.getDepartmentName());
		System.out.println(department.getDescription());
		System.out.println(department.getDepartmentHead());
		System.out.println(department.getExtraNote());
		department.setStuffNumber(0);
		department.setRegisteredServices(0);
		department.setIsActive(1);
		
		if(file!=null) {
			System.out.println(file.getName());			
			System.out.println(file.getBytes());			
			System.out.println(file.getContentType());			
			
			department.setDocName(file.getName());
			department.setDocType(file.getContentType());
			department.setDocData(file.getBytes());
		}
		
	
		
		medicalService.save(department);
		return "redirect:/Institute/departmentsData";
	}
	

	
	@RequestMapping(value = "/deleteDepartment/{id}")
	@ResponseBody
	public String deleteDepartment(@PathVariable("id") Integer id) throws Exception {
		medicalService.deleteDepartment(id);
		return "redirect:/Institute/departmentsData";
	}
	
	@GetMapping("/editDepartment/{id}")
	public String editDepartmentData(@PathVariable("id") Integer id, Model model) throws Exception {
		Department department = medicalService.findbyIdDepartment(id);
		List<Users> users = usersDetailsService.findAll();
		
		model.addAttribute("users", users);
		model.addAttribute("department", department);
		return "medicInstitute/editDepartment";
	}
	
	@GetMapping("/serviceData")
	public String serviceData(Model model) throws Exception {
		List<Department> departments = medicalService.allDepartment();
		MedicService service = new MedicService();
		
		model.addAttribute("departments", departments);
		model.addAttribute("service", service);
		return "medicInstitute/serviceData";
	}
	
	@GetMapping("/addService")
	public String addService(Model model) throws Exception {
		MedicService service = new MedicService();
		List<Department> departments = medicalService.allDepartment();
		
		model.addAttribute("departments", departments);
		model.addAttribute("service", service);
		return "medicInstitute/addService";
	}
	
	@GetMapping("/editService/{id}")
	public String editService(@PathVariable("id") Integer id, Model model) throws Exception {
		MedicService service = medicalService.findbyIdMedicService(id);
		List<Department> departments = medicalService.allDepartment();
		
		model.addAttribute("departments", departments);
		model.addAttribute("service", service);
		return "medicInstitute/editService";
	}
	
	@PostMapping("/addServiceData")
	public String addServiceData(@ModelAttribute MedicService medicService) throws Exception {
		
		System.out.println(medicService.getId());
		System.out.println(medicService.getDepartmentName());
		System.out.println(medicService.getServiceName());
		System.out.println(medicService.getServiceDescription());
		System.out.println(medicService.getServictType());
		System.out.println(medicService.getPrice());
		medicService.setInstituteId(1);
		medicService.setIsActive(1);
		
		medicalService.save(medicService);
		return "redirect:/Institute/serviceData";
	}
	
	@GetMapping("/scheduleDate")
	public String scheduleDate(Model model) throws Exception {
		List<Department> departments = medicalService.allDepartment();
		model.addAttribute("departments", departments);
		return "medicInstitute/scheduleDate";
	}
	
	@GetMapping("/salesSummary")
	public String salesSummary(Model model) throws Exception {
		return "medicInstitute/salesSummary";
	}
	
	@GetMapping("/monthlyReport")
	public String monthlyReport(Model model) throws Exception {
		return "medicInstitute/monthlyReport";
	}
	
	@RequestMapping(value = "/sendScheduledDate")
	@ResponseBody
	public String sendScheduledDate(Model model) throws Exception {
		JSONObject jooo = new JSONObject(request.getParameter("json"));
		JSONObject joooDay = new JSONObject(request.getParameter("jsonDay"));
		
		      
		String[] weekDatesNames = {" ","SUNDAY","MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY"};

		Integer lng=jooo.length();
		Integer lngDay=joooDay.length();
		
		List<String> dayList = new ArrayList<String>();
		List<Integer> hourList = new ArrayList<Integer>();
		List<Integer> minuteList = new ArrayList<Integer>();
		List<String> checkStatList = new ArrayList<String>();
		
		for (int i = 0; i < lng; i++) {
			String Key=String.valueOf(i);
			JSONObject joooo=jooo.getJSONObject(Key);
			
			Integer hour=joooo.getInt("hour");
			hourList.add(hour);
			Integer minute=joooo.getInt("minute");
			minuteList.add(minute);
			Boolean checkStat=joooo.getBoolean("checkStat");
			checkStatList.add(checkStat.toString());
			
			System.out.println("Hour is " + hour);
			System.out.println("Minute is " + minute);
			System.out.println("checkStat is " + checkStat);

		}
		for (int i = 0; i < lngDay; i++) {
			String Key=String.valueOf(i);
			JSONObject joooo=joooDay.getJSONObject(Key);
			
			String day=joooo.getString("day");
			dayList.add(day.toLowerCase());
			System.out.println("Day is " + day);
		}
		
		Calendar currentDate = Calendar.getInstance();
		currentDate.set(Calendar.HOUR_OF_DAY, 0);
		currentDate.clear(Calendar.MINUTE);
		currentDate.clear(Calendar.SECOND);
		currentDate.clear(Calendar.MILLISECOND);
		currentDate.add(Calendar.DATE, 1);

        // Get the last day of the year
        Calendar lastDayOfYear = Calendar.getInstance();
        lastDayOfYear.set(Calendar.MONTH, Calendar.DECEMBER);
        lastDayOfYear.set(Calendar.DAY_OF_MONTH, 31);

        System.out.println("List size hour" + hourList.size());
        System.out.println("List size Minute" + minuteList.size());
        System.out.println("List size check" + checkStatList.size());
        System.out.println("List size day" + dayList.size());

        
        for (Calendar currentDateIterator = (Calendar) currentDate.clone();!currentDateIterator.after(lastDayOfYear); currentDateIterator.add(Calendar.DAY_OF_MONTH, 1)) {
        	int dayInt = currentDateIterator.get(Calendar.DAY_OF_WEEK);
    		String day = weekDatesNames[Integer.valueOf(dayInt)];
    		if(dayList.contains(day.toLowerCase())) {
    			//System.out.println(currentDateIterator.getTime());
    			//System.out.println(day);
    			for (int i = 0; i < lng; i++) {
    				Integer hour = hourList.get(i);
    				Integer minute = minuteList.get(i);
    				String stat = checkStatList.get(i);
    				
//    				System.out.println(hour);
//    				System.out.println(minute);
//    				System.out.println(stat);
    				
    				Calendar currentStartDate =currentDateIterator;
    				currentStartDate.set(Calendar.HOUR_OF_DAY, hour);
    				currentStartDate.set(Calendar.MINUTE, minute);
    				Date startDate = currentStartDate.getTime();
    				
    				Calendar currentEndtDate =currentStartDate;
    				currentEndtDate.add(Calendar.MINUTE, 15);
    				Date endDate = currentEndtDate.getTime();
    				
    				Calendar eventDate = currentDateIterator;
    				eventDate.set(Calendar.HOUR_OF_DAY, 0);
    				eventDate.clear(Calendar.MINUTE);
    				eventDate.clear(Calendar.SECOND);
    				eventDate.clear(Calendar.MILLISECOND);
    				//PatientData patientData, Date eventDate, Date eventStartDate, String cheifCompliant,String pastMedicalHistory, Integer queueId,  String assignedBy,  String assignedTo, String assignedToDepartment, String presentStatus, String treatement, String prescription, String extraNote
    				if(stat.equals("true")) {
    					PatientData patientData = medicalService.findbyIdPatient(1);
    					
        				DateTimeSchedule dateTimeSchedule = new DateTimeSchedule(eventDate.getTime(), startDate, endDate, 1, 0, 22, "Dr.Tadyos");
        				PatientMedicalHistory patientMedicalHistory = new PatientMedicalHistory(patientData, currentDateIterator.getTime(), startDate, null, null, null, null, null, null, null, null, null, null,0);
        				medicalService.save(dateTimeSchedule);
        				medicalService.save(patientMedicalHistory);
	   				} else {
	        			DateTimeSchedule dateTimeSchedule = new DateTimeSchedule(eventDate.getTime(), startDate, endDate, 0, 0, 22, "Dr.Tadyos");
	        			medicalService.save(dateTimeSchedule);
	    				}
	    			}
    		}
    		
        }
        
		return "success";
		
	}
	
	@RequestMapping(value = "/getScheduledDate/{startDate}")
	@ResponseBody
	public List<String[]> getScheduledDate(@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @PathVariable("startDate") Date startDate) throws Exception {
		String isFreeSlot = request.getParameter("isFreeSlot");
		Integer freeSlot = 0;
		try {
			freeSlot = Integer.parseInt(isFreeSlot);
		} catch (Exception e) {
			freeSlot = 0;
		}
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(startDate);
		cal1.set(Calendar.HOUR_OF_DAY, 0);
		cal1.clear(Calendar.MINUTE);
		cal1.clear(Calendar.SECOND);
		cal1.clear(Calendar.MILLISECOND);
		Date eventDate = cal1.getTime();

		
		Date currentDate = new Date();
		Calendar currentCal = Calendar.getInstance();
		currentCal.setTime(currentDate);
		currentCal.set(Calendar.HOUR_OF_DAY, 0);
		currentCal.clear(Calendar.MINUTE);
		currentCal.clear(Calendar.SECOND);
		currentCal.clear(Calendar.MILLISECOND);
		currentDate = currentCal.getTime();
		
		if(eventDate.equals(currentDate)) {
			System.out.println("Same day");
			Calendar cal2 = Calendar.getInstance();
			cal2.setTime(startDate);

			Date currentDateNew = new Date();
			Calendar currentCalender = Calendar.getInstance();
			currentCalender.setTime(currentDateNew);

			cal2.set(Calendar.HOUR_OF_DAY, currentCalender.get(Calendar.HOUR_OF_DAY));
			cal2.set(Calendar.MINUTE, currentCalender.get(Calendar.MINUTE));
			cal2.set(Calendar.SECOND, currentCalender.get(Calendar.SECOND));
			startDate = cal2.getTime();
		} else {
			System.out.println("Not in Same day");
			startDate=eventDate;
		}
		
		List<DateTimeSchedule> scheduleList = medicalService.getDateTimeSchedule(eventDate,startDate,22,freeSlot);
		List<String[]> dateTimeList = new ArrayList<String[]>();
		
		System.out.println("Event date is " + eventDate);
		System.out.println("Start date is " + startDate);
		System.out.println("size is " + scheduleList.size());
		for(DateTimeSchedule d: scheduleList) {
			System.out.println("Date is " + d.getEventDate());
			System.out.println("Date is " + d.getStartDate());
			System.out.println("Date is " + d.getEndDate());
			System.out.println("Date is " + d.getId());
			DateFormat dateFormat = new SimpleDateFormat("HH-mm");
			String formattedDateStart = dateFormat.format(d.getStartDate());
			String formattedDateEnd = dateFormat.format(d.getEndDate());
			
			String[] dateScheduleArray = {d.getId().toString(),formattedDateStart,formattedDateEnd};
			dateTimeList.add(dateScheduleArray);
			
		}
		return dateTimeList;
	}
	
	@RequestMapping(value = "/deleteService/{id}")
	@ResponseBody
	public String deleteService(@PathVariable("id") Integer id) throws Exception {
		medicalService.deleteMedicService(id);
		return "redirect:/Institute/serviceData";
	}
	
	@RequestMapping(value = "/sendServiceData")
	@ResponseBody
	public ServiceListAjax sendPatientTableData() throws ParseException {
			
			MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			InventoryStore store = user.getStore();
			Integer storeId = 0;
			Boolean isAdmin = true;
			
			String storeRequest = request.getParameter("inv");
//			if(storeRequest==null) {
//				if(store==null) {
//					storeId = 0;
//				} else {
//					storeId = store.getId();
//					isAdmin=false;
//				}
//			} else {
//				storeId=Integer.parseInt(storeRequest);
//				if(storeId.equals(0)) {
//					isAdmin=true;
//				} else {
//					isAdmin=false;
//				}
//			}
			
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
			
			
			System.out.println(dept + "???????????????????????????/");

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
	
	@RequestMapping(value = "/monthlyGraphData")
	@ResponseBody
	public List<SmsModel> monthlyGraphData() throws ParseException {
		MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		InventoryStore store = user.getStore();
		Integer storeId = 0;
		Boolean isAdmin = true;
		
		String storeRequest = request.getParameter("inv");
		if(storeRequest==null) {
				storeId = 0;
		} else {
			
				isAdmin=true;
		}
		
		List<SmsModel> graphData = new ArrayList<SmsModel>();
		String monthReq = request.getParameter("monthInt");
		String yearReq = request.getParameter("yearInt");
		
		Date startMonth = new Date();
		Calendar currentCal = Calendar.getInstance();
		Integer monthEndDate = Integer.valueOf(currentCal.get(Calendar.DAY_OF_MONTH));

		if (monthReq==null || yearReq==null) {
			startMonth = getStartOfMonth();
		} else {
			Calendar calender = Calendar.getInstance();
			Integer year = Integer.parseInt(yearReq);
			Integer month = Integer.parseInt(monthReq);
			Integer day = 1;
			calender.set(year.intValue(), month.intValue(), day.intValue());
			calender.set(Calendar.HOUR_OF_DAY, 0);
		    calender.clear(Calendar.MINUTE);
		    calender.clear(Calendar.SECOND);
		    calender.clear(Calendar.MILLISECOND);
		    
		    int maxDaysInMonth = calender.getActualMaximum(Calendar.DAY_OF_MONTH);
		    monthEndDate = maxDaysInMonth;
		    startMonth = calender.getTime();
		}
				
		Integer monthCounter = 0;
		for (int i = 1; i <= monthEndDate; i++) {
			Date currentDate = decrementDate(startMonth,1);
			monthCounter = Integer.valueOf(i);
			List<Object[]> dailyResult =  new ArrayList<Object[]>();

			dailyResult =  medicalService.getSalesListOrgTotalDate(1,startMonth,currentDate,"");
			
			startMonth=currentDate;
			Object[] dailyObjectSale = null;
			Double formattedSalesInt = 0.0;

			try {
				dailyObjectSale = dailyResult.get(0);
				formattedSalesInt = Double.parseDouble(dailyObjectSale[0].toString());
				
			} catch (Exception e) {
				formattedSalesInt = 0.0;
			}
			
			SmsModel sm = new SmsModel();
			sm.setTitle(monthCounter.toString());
			sm.setMessage(formattedSalesInt.toString());
			graphData.add(sm);
		}
		
		
		return graphData;
	}
	
	public Date getStartOfMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.clear(Calendar.MINUTE);
        calendar.clear(Calendar.SECOND);
        calendar.clear(Calendar.MILLISECOND);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return calendar.getTime();
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
		
		@RequestMapping(value = "/getDepartmentDetails/{id}", method = RequestMethod.GET, produces = "application/json")
		@ResponseBody
		public Department getDepartmentData(@PathVariable("id") Integer id) throws Exception {
		    Department department = medicalService.findbyIdDepartment(id);
		    return department;
		}

		
}
