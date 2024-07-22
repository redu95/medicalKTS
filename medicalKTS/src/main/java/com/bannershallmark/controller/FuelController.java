package com.bannershallmark.controller;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bannershallmark.entity.MedicService;
import com.bannershallmark.medicalHandler.MedicalService;
import com.bannershallmark.service.MyUserDetails;
import com.bannershallmark.service.UsersDetailsService;
import com.bannershallmark.vo.ServiceListAjax;

@Controller
@RequestMapping("/api")
public class FuelController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private UsersDetailsService usersDetailsService;
	
	@Autowired
	private MedicalService medicalService;
	
	//Doctor Side
	@GetMapping("/assetData")
	public String patientData(Model model) throws Exception {
		return "fuel/assetData";
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
	
	}
