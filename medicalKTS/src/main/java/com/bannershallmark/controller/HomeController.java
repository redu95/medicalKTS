package com.bannershallmark.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bannershallmark.dao.UserRoleAccessPermissionDao;
import com.bannershallmark.service.MyUserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	UserRoleAccessPermissionDao userRoleAccessPermissionDao;

	private static Logger testNGlogger = Logger.getLogger(HomeController.class);

	@RequestMapping(value = "/")
	public String home(Locale locale, Model model, HttpSession session) {

		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String n = auth.getName();
			String r = auth.getAuthorities().toString();

			MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);

			model.addAttribute("serverTime", formattedDate);
			session.setAttribute("user", n);
			session.setAttribute("role", r);
			if (user.getFirstname() != null)
				session.setAttribute("userName", user.getFirstname() + " " + user.getLastname());
			session.setAttribute("id", user.getId());
			session.setAttribute("userNameId", user.getUsername());
			session.setAttribute("path", userRoleAccessPermissionDao.findAccessPermissionByRole(r));

		} catch (Exception e) {
			e.printStackTrace();
			testNGlogger.info("/" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "errorpage/error";
		}
		return "redirect:" + "/dashboard/duplicatesAll";
	}

	// apps/pages/forms/general.html

	@RequestMapping(value = "/pages/{type}/{page}", method = RequestMethod.GET)
	public String pagesOfTypes(Locale locale, Model model, @PathVariable(value = "type") String type,
			@PathVariable(value = "page") String page) {

		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
		} catch (Exception e) {
			e.printStackTrace();
			testNGlogger.info("/pages" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "errorpage/error";
		}

		return "pages/" + type + "/" + page;
	}

	@RequestMapping(value = "/pages/{page}", method = RequestMethod.GET)
	public String pages(Locale locale, Model model, @PathVariable(value = "page") String page) {

		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
		} catch (Exception e) {
			e.printStackTrace();
			testNGlogger.info("/pages" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "errorpage/error";
		}
		return "pages/" + page;
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errotpages() {
		return "errorpage/error";
	}
}
