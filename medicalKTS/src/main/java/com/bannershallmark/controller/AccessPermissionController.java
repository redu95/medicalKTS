package com.bannershallmark.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bannershallmark.entity.AccessPermission;
import com.bannershallmark.entity.AccessPermissionsByGroup;
import com.bannershallmark.entity.UserRoleAccessPermission;
import com.bannershallmark.service.AccessPermissionService;
import com.bannershallmark.util.AccessPermissionUtil;
import com.bannershallmark.util.Constants;

@Controller
@RequestMapping("/accessPermission")
public class AccessPermissionController {

	@Autowired
	private AccessPermissionService accessPermissionService;
	@Autowired
	AccessPermissionUtil accessPermissionUtil;

	private static Logger testNGlogger = Logger.getLogger(AccessPermissionController.class);

	@GetMapping("/accessPermissionData")
	public String getAllData(Model model, RedirectAttributes redirectAttributes) {

		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/accessPermissionData");
		if (accessStatus) {
			try {

				List<AccessPermission> accessPermission = accessPermissionService.findAll();
				model.addAttribute("accessPermission", accessPermission);
			} catch (Exception e) {

				testNGlogger.info("accessPermission/accessPermissionData" + ",ERROR MESSAGES : " + e.getMessage());
				return "errorpage/error";
			}
			return "apPage/appage";
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}

	}

	@GetMapping("/getRole/{roleId}")
	public String getRoles(@PathVariable("roleId") Integer roleId, Model model, RedirectAttributes redirectAttributes) {

		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/getRole");
		if (accessStatus) {
			try {
				if (roleId != 1) {
//					List<AccessPermission> accessPermission = accessPermissionService.findAll();
					List<AccessPermissionsByGroup> accessPermissionGroup = accessPermissionService
							.findAllPermissionGroup();

					List<Integer> accessId = null;
					List<AccessPermissionsByGroup> userRoleAccessPermission = accessPermissionService
							.findRolePermissionGroup(roleId);
					if (userRoleAccessPermission != null) {
						accessId = userRoleAccessPermission.stream().map(s -> s.getAccessPermissionsByGroupID())
								.collect(Collectors.toList());
					}

//					model.addAttribute("accessPermission", accessPermission);
					model.addAttribute("accessPermissionGroup", accessPermissionGroup);
					model.addAttribute("roleId", roleId);
					model.addAttribute("accessId", accessId);
					return "apPage/apViewByGroup";
				} else {
					return "redirect:/role/roleData";
				}
			} catch (Exception e) {
				testNGlogger.info("accessPermission/getRole" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());
				return "errorpage/error";
			}
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}
	}

	@GetMapping("/getAccessPermission/{accessPermissionId}")
	public String getData(@PathVariable("accessPermissionId") Integer accessPermissionId, Model model,
			RedirectAttributes redirectAttributes) throws Exception {

		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/getAccessPermission");

		if (accessStatus) {
			try {
				AccessPermission accessPermission = accessPermissionService.findById(accessPermissionId);
				model.addAttribute("accessPermission", accessPermission);
			} catch (Exception e) {

				testNGlogger.info("accessPermission/getAccessPermission" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());

				return "errorpage/error";
			}
			return "apPage/editAp";
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}

	}

	@GetMapping("/addAccessPermission")
	public String addData(Model model, RedirectAttributes redirectAttributes) throws Exception {
		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/addAccessPermission");

		if (accessStatus) {
			AccessPermission accessPermission = new AccessPermission();
			model.addAttribute("accessPermission", accessPermission);
			return "apPage/addAp";
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}
	}

	@PostMapping("/addNewAccessPermission")
	public String saveData(@ModelAttribute AccessPermission accessPermission, RedirectAttributes redirectAttributes)
			throws Exception {

		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/addNewAccessPermission");
		if (accessStatus) {
			try {
				if (accessPermissionService.AccessPermissionExist(accessPermission.getUrlPath())) {
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Access Permission already exists ");
					return "redirect:/apPage/apviews";
				} else {
					accessPermissionService.save(accessPermission);
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "New Access Permission successfully added");
					return "redirect:/apPage/apviews";
				}
			} catch (Exception e) {

				testNGlogger.info("accessPermission/addNewAccessPermission" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());

				return "errorpage/error";
			}
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}
	}

	@PostMapping("/updateAccessPermission")
	public String updateData(@ModelAttribute AccessPermission accessPermission, RedirectAttributes redirectAttributes)
			throws Exception {

		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/updateAccessPermission");

		if (accessStatus) {
			try {
				if (accessPermissionService.AccessPermissionExist(accessPermission.getUrlPath())) {
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "AccessPermission already exists ");
					return "redirect:/apPage/apviews";
				} else {
					accessPermissionService.save(accessPermission);
					redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "Payby info updated successfully ");
					return "redirect:/apPage/apviews";
				}
			} catch (Exception e) {

				testNGlogger.info("accessPermission/updateAccessPermission" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());
				return "errorpage/error";
			}
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}
	}

	@GetMapping("/deleteAccessPermission/{accessPermissionId}")
	public String deleteData(@PathVariable("accessPermissionId") Integer accessPermissionId,
			RedirectAttributes redirectAttributes) throws Exception {

		boolean accessStatus = accessPermissionUtil.isAccessPermission("accessPermission/deleteAccessPermission");

		if (accessStatus) {
			try {
				accessPermissionService.deleteById(accessPermissionId);
			} catch (Exception e) {
				testNGlogger.info("accessPermission/deleteAccessPermission" + ",ERROR MESSAGES : " + e.getMessage());
				// testNGlogger.error(e.getMessage());
				return "errorpage/error";
			}
			return "redirect:/apPage/apviews";
		} else {
			redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
			return "redirect:" + "/";
		}

	}

	private final Integer getAccessId(Integer accessId) {

		Integer accessIdValue = 0;

		List<UserRoleAccessPermission> userRoleAccessPermission = accessPermissionService.findAllData(accessId);

		for (UserRoleAccessPermission accessdata : userRoleAccessPermission) {
			accessIdValue = accessdata.getAccessPermission().getId();
		}
		return accessIdValue;
	}
}
