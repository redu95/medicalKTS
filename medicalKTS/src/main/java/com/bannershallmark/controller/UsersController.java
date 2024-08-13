package com.bannershallmark.controller;

import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.telegram.telegrambots.meta.api.objects.File;

import com.bannershallmark.bean.DateTime;
import com.bannershallmark.bean.RandomString;
import com.bannershallmark.bean.SendMail;
import com.bannershallmark.config.WebSecurityConfig;
import com.bannershallmark.dao.UsersDao;
import com.bannershallmark.entity.Department;
import com.bannershallmark.entity.ForgotPassword;
import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.Store;
import com.bannershallmark.entity.Users;
import com.bannershallmark.medicalHandler.MedicalService;
import com.bannershallmark.service.ForgotPasswordService;
import com.bannershallmark.service.StoreService;
import com.bannershallmark.service.UsersDetailsService;
import com.bannershallmark.util.AccessPermissionUtil;
import com.bannershallmark.util.Constants;

@Controller
@RequestMapping("/users")
public class UsersController {

	@Value("${fromEmail}")
	private String fromEmail;
	@Value("${frompassword}")
	private String frompassword;
	@Value("${smtp}")
	private String smtp;
	@Value("${port}")
	private String port;
	@Value("${status}")
	private String status;

	@Autowired
	private UsersDetailsService usersDetailsService;

	@Autowired
	private MedicalService medicalService;
	
	@Autowired
	AccessPermissionUtil accessPermissionUtil;

	@Autowired
	UsersDao usersDao;
	
	@Autowired
	ForgotPasswordService forgotPasswordService;
	
	@Autowired
	HttpServletRequest request;

	private static Logger testNGlogger = Logger.getLogger(ForgotPasswordService.class);

//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	WebSecurityConfig webSecurityConfig;


	@GetMapping("/usersData")
	public String Paybys(Model model, RedirectAttributes redirectAttributes) throws Exception {

		try {
				try {

					List<Users> users = usersDetailsService.findAll();
					model.addAttribute("users", users);
					Users user = new Users();
					model.addAttribute("user", user);
					Users userEdit = new Users();
					model.addAttribute("userEdit", userEdit);
					List<Role> role = usersDetailsService.findAllRole();
					//List<InventoryStore> stores = inventoryService.findAllStore();
					List<Department> departments = medicalService.allDepartment();
					model.addAttribute("users", users);
					model.addAttribute("departments", departments);
					model.addAttribute("role", role);
				} catch (Exception e) {
					testNGlogger.info("users/usersData" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
				return "users/usersData";
			
		} catch (Exception e) {
			testNGlogger.info("users/usersData" + ",ERROR MESSAGES : " + e.getMessage());
			return "errorpage/error";
		}

	}

	@GetMapping("/addUsers")
	public String addPayby(Model model, RedirectAttributes redirectAttributes) throws Exception {

			try {
				Users users = new Users();
				model.addAttribute("users", users);
				List<Role> role = usersDetailsService.findAllRole();
				//List<InventoryStore> stores = inventoryService.findAllStore();
				List<Department> departments = medicalService.allDepartment();
				model.addAttribute("departments", departments);
				model.addAttribute("role", role);
				//model.addAttribute("stores", stores);
			} catch (Exception e) {

				testNGlogger.info("users/usersData" + ",ERROR MESSAGES : " + e.getMessage());

				return "errorpage/error";
			}
			return "users/addUsers";
		
	}

	@PostMapping("/addNewUsers")
	public String addNewPayby(@RequestParam(value = "file", required = false) MultipartFile file, @ModelAttribute Users users, RedirectAttributes redirectAttributes) throws Exception {

			try {

				// Users user = usersDetailsService.getUserByUsername(users.getUsername());
				// System.out.println("============"+user);

				// if(user.getUsername().equals(users.getUsername()) ||
				// user.getEmail().equals(users.getEmail()))

				if (usersDetailsService.getUserByUsername(users.getUsername()) != null){
					System.out.println("IN here");
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Username  already exists");
					return "redirect:/users/usersData";
				} else {
					System.out.println("IN here here here");
					BCryptPasswordEncoder encryptPwd = webSecurityConfig.passwordEncoder();
					if(file!=null) {
						System.out.println(file.getName());			
						System.out.println(file.getBytes());			
						System.out.println(file.getContentType());			
						
						users.setDocName(file.getName());
						users.setDocType(file.getContentType());
						users.setDocData(file.getBytes());
					}
					
					System.out.println(users.getFirstname());			
					System.out.println(users.getLastname());			
					System.out.println(users.getAddressLine1());		
					System.out.println(users.getPassword());
					
					users.setPassword(encryptPwd.encode(users.getPassword()));
					
					usersDetailsService.save(users);
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE,
							"New user successfully added");
					return "redirect:/users/usersData";
				}

			} catch (Exception e) {

				testNGlogger.info("payby/addNewPayby" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());

				return "errorpage/error";
			}
		

	}

	@GetMapping("/downloadFile")
	public ResponseEntity<ByteArrayResource> downloadFile(){
		String id  = request.getParameter("id");
		Users user = usersDetailsService.findById(Integer.parseInt(id));
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(user.getDocType()))
				.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+user.getDocName()+"\"")
				.body(new ByteArrayResource(user.getDocData()));
	}


	
	@RequestMapping(value = "/getUsersDetails/{id}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Users getUsersData(@PathVariable("id") Integer id) throws Exception {
		Users users = usersDetailsService.findById(id);
	    return users;
	}

	@GetMapping("/getUsers")
	public String getPayby(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes)
			throws Exception {

				try {
					String id = request.getParameter("id");
					if (!id.equals("")) {
						System.out.println(Integer.parseInt(id) + "IDD");
						Users users = usersDetailsService.findById(Integer.parseInt(id));
						model.addAttribute("users", users);
						List<Role> role = usersDetailsService.findAllRole();
						//List<InventoryStore> stores = inventoryService.findAllStore();
						model.addAttribute("role", role);
						//model.addAttribute("stores", stores);
					} else {
						return "redirect:" + "/";
					}

				} catch (Exception e) {
					testNGlogger.info("users/getUses" + ",ERROR MESSAGES : " + e.getMessage());
					return "redirect:" + "/";
				}
				return "users/editUsers";

			
		

	}

	@PostMapping("/updateUsers")
	public String updatePayby(@RequestParam(value = "file", required = false) MultipartFile file,@ModelAttribute Users users, RedirectAttributes redirectAttributes) throws Exception {

			try {
//				if(users.getRole().getId().equals(1)) {
//					users.setStore(null);
//				} else {
//					if (users.getStore().getId() == null) {
//						redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Select a store to assign for the manager");
//						return "redirect:/users/usersData";
//					}
//				}
				System.out.println(users.getId());
				System.out.println(users.getFirstname());
				
				HttpSession session = request.getSession();
				
				Integer id = users.getId();
				Users dbUser = usersDetailsService.findById(id);
				dbUser.setFirstname(users.getFirstname());
				dbUser.setLastname(users.getLastname());
				dbUser.setEmail(users.getEmail());
				dbUser.setAddressLine1(users.getAddressLine1());
				dbUser.setPhoneNumber(users.getPhoneNumber());
				dbUser.setRole(users.getRole());
				dbUser.setDepartmentId(users.getDepartmentId());
				
				if(file!=null) {
					if(file.getContentType().equals("image/jpeg")) {
						System.out.println("IS JPEG");
					}
					
					
					if(file.getContentType().equals("image/jpeg") || file.getContentType().equals("image/png") || file.getContentType().equals("image/jpg")) {
						System.out.println(file.getName());			
						System.out.println(file.getBytes());			
						System.out.println(file.getContentType());			
						
						dbUser.setDocName(file.getName());
						dbUser.setDocType(file.getContentType());
						dbUser.setDocData(file.getBytes());
					} else {
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE,
								"Please enter the correct data type.");
						return "redirect:/users/usersData";
					}
					
					
					
					long fileSizeInBytes = file.getBytes().length;
					long fileSizeInMB = fileSizeInBytes / (1024 * 1024);

					System.out.println("Size in byte is " + fileSizeInBytes);
					System.out.println("Size in mb is " + fileSizeInMB);
					if (fileSizeInBytes >= 2000000) {
					    redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE,
					            "File size should not exceed 2 MB.");
					    return "redirect:/users/usersData";
					}
					
					
				}
				
				
				usersDetailsService.save(dbUser);
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE,
						"Users info updated successfully.");
				String base64Image = Base64.getEncoder().encodeToString(file.getBytes());
			    session.setAttribute("logoImg", base64Image);
				return "redirect:/users/usersData";

			} catch (Exception e) {

				testNGlogger.info("users/updatePayby" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());
				return "errorpage/error";
			}

		

	}

	@GetMapping("/deleteUsers/{id}")
	public String deletePayby(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) throws Exception {

			try {
				usersDetailsService.deleteById(id);
			} catch (Exception e) {
				testNGlogger.info("users/deleteUsers" + ",ERROR MESSAGES : " + e.getMessage());
				return "errorpage/error";
			}
			return "redirect:/users/usersData";
		

	}
	
	@GetMapping("/storeData")
	public String storeData(Model model) throws Exception {

//			List<InventoryStore> store = inventoryService.findAllStore();
//			model.addAttribute("store", store);
			return "store/stores";
		

	}
	
	@GetMapping("/addStore")
	public String addStore(Model model) throws Exception {
//			InventoryStore store = new InventoryStore();
//			model.addAttribute("store", store);
			return "store/addStore";
	}

	@PostMapping("/updateStore")
	public String updateStore(RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "Store added successfully.");
				return "redirect:/users/storeData";
	}
	
	@GetMapping("/changepassword")
	public String Changepass(Model model, RedirectAttributes redirectAttributes) throws Exception {
		try {
				try {
					Users users = new Users();
					model.addAttribute("users", users);
				} catch (Exception e) {
					testNGlogger.info("users/changepassword" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
				return "users/changepass";

			
		} catch (Exception e) {
			testNGlogger.info("users/changepassword" + ",ERROR MESSAGES : " + e.getMessage());
			return "/";
		}

	}

	@PostMapping("/updatepassword")
	public String UpadatePassword(@ModelAttribute Users users, Model model, RedirectAttributes redirectAttributes)
			throws Exception {

				try {
					Users byIddata = usersDetailsService.findById(users.getId());
					if (byIddata.getUsername().equals(users.getUsername()) && byIddata.getId() == users.getId()) {
						BCryptPasswordEncoder encryptPwd = webSecurityConfig.passwordEncoder();
						// System.out.println("================="+users.getPassword());
						byIddata.setPassword(encryptPwd.encode(users.getPassword()));
						usersDetailsService.save(byIddata);
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE,
								"Password changed successfully.");
						return "redirect:" + "/";
					} else {
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Invalid password.");
						return "redirect:" + "/";
					}

				} catch (Exception e) {
					testNGlogger.info("users/updatepassword" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
			

		

	}

	//////////////////// from login page for forgot password/////////////////

	@GetMapping("/reset/forgot")
	public String forgotpage(Model model, RedirectAttributes redirectAttributes) {

		return "forgotpage";
	}

	@GetMapping("/reset/forgotpassword/{userName}")
	public String Forgotpassword(@PathVariable("userName") String userName, Model model,
			RedirectAttributes redirectAttributes) throws Exception {

		try {

			Users byIddata = usersDao.getUserByUsername(userName);
			if (byIddata != null) {
				System.out.println("=======================" + byIddata.getEmail());
				System.out.println("=======================" + byIddata.getPassword());
				RandomString randomString = new RandomString();

				String randomId = randomString.getRandomId();
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
				Date date = new Date();
				System.out.println(formatter.format(date));

				ForgotPassword forgotPassword = new ForgotPassword();
				forgotPassword.setUserId(userName);
				forgotPassword.setRandomId(randomId);
				forgotPassword.setDataAndTime(formatter.format(date));
				forgotPasswordService.save(forgotPassword);

				// SendMail.sendMail(fromEmail,frompassword ,byIddata.getEmail(),randomId,smtp,
				// port, status) ;

				SendMail SendMail = new SendMail();

				SendMail.sendMail(fromEmail, frompassword, byIddata.getEmail(), randomId, smtp, port, status);

				// SendMail.sendMail(byIddata.getEmail(), randomId);
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE,
						"Please check your email and click the link to reset password.");
				return "redirect:/login";
			} else {

				/*
				 * System.out.println("==============error");
				 * redirectAttributes.addFlashAttribute("msg", "Invalid Username."); return
				 * "redirect:/login" ;
				 */

				System.out.println("==============error");
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Invalid Username.");
				// System.out.println(" 1 :: " + request.getHeader("referer"));
				// System.out.println(" 2 :: " + request.getRequestURI());
				// return "redirect:"+ request.getHeader("referer");
				if (request.getHeader("referer").indexOf("/users/reset/forgot") >= 0) {
					return "redirect:" + request.getHeader("referer");
				} else {
					return "redirect:" + request.getHeader("referer") + "Bannershallmark/users/reset/forgot";
				}

			}

		} catch (Exception e) {
			testNGlogger.info("users/reset/forgotpassword/" + ",ERROR MESSAGES : " + e.getMessage());
			return "redirect:/login";
		}
	}

	@GetMapping("/reset/resetPassword/{randomId}")
	public String ChangetPassword(@PathVariable("randomId") String randomId, Model model,
			RedirectAttributes redirectAttributes) {

		try {
			ForgotPassword forgotPassword = forgotPasswordService.getByRandomId(randomId);
			System.out.println("=========forgotPassword======" + forgotPassword);
			Users users = new Users();
			model.addAttribute("users", users);
			model.addAttribute("randomId", randomId);
			return "changepass";
		} catch (Exception e) {
			testNGlogger.info("users/reset/resetPassword/" + ",ERROR MESSAGES : " + e.getMessage());
			return "redirect:/login";
		}
	}

	@PostMapping("/reset/newResetPassword/{randomId}")
	public String newChangetPassword(@ModelAttribute Users users, @PathVariable("randomId") String randomId,
			Model model, RedirectAttributes redirectAttributes) {

		try {

			ForgotPassword forgotPassword = forgotPasswordService.getByRandomId(randomId);

			forgotPassword.getDataAndTime();

			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Date curretdate = new Date();

			DateTime dateTime = new DateTime();

			long minutes = dateTime.findDifference(forgotPassword.getDataAndTime(), formatter.format(curretdate));

			System.out.println("=============minutes ===========" + minutes);

			if (minutes <= 15) {
				Users byuserId = usersDao.getUserByUsername(forgotPassword.getUserId());
				Users byIddata = usersDetailsService.findById(byuserId.getId());

				if (byIddata.getUsername().equals(forgotPassword.getUserId()) && byIddata.getId() == byuserId.getId()) {
					BCryptPasswordEncoder encryptPwd = webSecurityConfig.passwordEncoder();
					// System.out.println("================="+users.getPassword());
					byIddata.setPassword(encryptPwd.encode(users.getPassword()));
					usersDetailsService.save(byIddata);
					forgotPasswordService.deleteById(forgotPassword.getId());
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE,
							"Password changed successfully.");
					return "redirect:/login";
				} else {
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Invalid password.");
					return "redirect:/login";
				}
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Session timed out.");
				return "redirect:/login";
			}
		} catch (Exception e) {
			testNGlogger.info("users/reset/newResetPassword" + ",ERROR MESSAGES : " + e.getMessage());
			return "redirect:/login";
		}

	}

}
