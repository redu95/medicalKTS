package com.bannershallmark.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bannershallmark.bean.DateTime;
import com.bannershallmark.bean.RandomString;
import com.bannershallmark.bean.SendMail;
import com.bannershallmark.config.WebSecurityConfig;
import com.bannershallmark.dao.UsersDao;
import com.bannershallmark.entity.ForgotPassword;
import com.bannershallmark.entity.Users;
import com.bannershallmark.service.ForgotPasswordService;
import com.bannershallmark.service.UsersDetailsService;

@Controller
public class LoginController {
	private static Logger testNGlogger = Logger.getLogger(LoginController.class);

	@Autowired
	UsersDao usersDao;
	@Autowired
	ForgotPasswordService forgotPasswordService;
	@Autowired
	UsersDetailsService usersDetailsService;
	@Autowired
	WebSecurityConfig webSecurityConfig;

//	@GetMapping("/login")
//	@ResponseBod
//	public String stores(Model model) {
//
//		return "Please authenticate to proceed";
//	}
	
	
	@GetMapping("/login")
	public String stores(Model model) {

		return "login";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		try {
			session.removeAttribute("username");
		} catch (Exception e) {
			e.printStackTrace();
			testNGlogger.info("/logout" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "errorpage/error";
		}
		return "redirect:../login";
	}

}
