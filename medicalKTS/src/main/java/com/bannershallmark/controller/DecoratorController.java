package com.bannershallmark.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DecoratorController {

	private static Logger testNGlogger = Logger.getLogger(DecoratorController.class);

	@RequestMapping(value = "/decorators/{decorator}", method = RequestMethod.GET)
	public String pages(Locale locale, Model model, @PathVariable(value = "decorator") String decorator) {
		try {

			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

			String formattedDate = dateFormat.format(date);

			model.addAttribute("serverTime", formattedDate);
		} catch (Exception e) {
			e.printStackTrace();
			testNGlogger.info("/decorators" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "errorpage/error";
		}
		return "decorators/" + decorator;
	}
}
