package com.bannershallmark.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bannershallmark.service.MyUserDetails;
import com.bannershallmark.util.AccessPermissionUtil;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	
	
	@Autowired
	AccessPermissionUtil accessPermissionUtil;
		
	@GetMapping("/duplicatesAll")
	public String unverifiedDuplicates (HttpServletRequest request,Model model, RedirectAttributes redirectAttributes) throws Exception {
	            
				MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				Integer userRole = user.getRole().getId();
				
				if(userRole.equals(1)) {
					return "redirect:/Institute/dashboard";
				} else if (userRole.equals(2)) {
					return "redirect:/Patient/patientDataReception";
				} else if (userRole.equals(3)) {
					return "redirect:/Patient/patientData";
				} else {
					return "redirect:/Patient/patientDataLabratory";
				}
		
				
	}

	


}
