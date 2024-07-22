package com.bannershallmark.controller;

import java.util.Arrays;
import java.util.List;

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

import com.bannershallmark.entity.Role;
import com.bannershallmark.service.RoleService;
import com.bannershallmark.service.UserRoleAccessPermissionService;
import com.bannershallmark.util.AccessPermissionUtil;
import com.bannershallmark.util.Constants;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	@Autowired
	AccessPermissionUtil accessPermissionUtil;

	@Autowired
	private UserRoleAccessPermissionService userRoleAccessPermissionService;

	private static Logger testNGlogger = Logger.getLogger(RoleController.class);

	@GetMapping("/roleData")
	public String Role(Model model, RedirectAttributes redirectAttributes) throws Exception {

		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/roleData");
			if (accessStatus) {
				try {
					List<Role> role = roleService.findAll();
					model.addAttribute("role", role);
				} catch (Exception e) {
					testNGlogger.info("role/roleData" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
				return "role/roleData";
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}
		} catch (Exception e) {
			testNGlogger.info("role/roleData" + ",ERROR MESSAGES : " + e.getMessage());
			return "/";
		}

	}

	@PostMapping("/deleteUrl/{roleId}/accessId/{urlData}")
	public String addNewPay(@PathVariable("urlData") String[] urlData, @PathVariable("roleId") Integer roleId,
			RedirectAttributes redirectAttributes) throws Exception {
		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/deleteUrl");
			if (accessStatus) {
				try {
					if (roleId != 1) {
						userRoleAccessPermissionService.deleteById(roleId);
						String groupIds = Arrays.toString(urlData);
						groupIds = groupIds.substring(1);
						groupIds = groupIds.substring(0, groupIds.length() - 1);
						userRoleAccessPermissionService.saveGroup(groupIds, roleId);
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "Roles access permissions updated successfully");
					}
					return "redirect:/role/roleData";
				} catch (Exception e) {
					e.printStackTrace();
					testNGlogger.info("role/deleteUrl" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}
		} catch (Exception e) {
			testNGlogger.info("role/deleteUrl" + ",ERROR MESSAGES : " + e.getMessage());
			return "/";
		}

	}

	@PostMapping("/deleteUrlData/{roleId}")
	public String addNewPaydelete(@PathVariable("roleId") Integer roleId, RedirectAttributes redirectAttributes)
			throws Exception {
		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/deleteUrlData");
			if (accessStatus) {
				try {
					if (roleId != 1) {
						userRoleAccessPermissionService.deleteById(roleId);
					}
					return "redirect:/role/roleData";
				} catch (Exception e) {
					testNGlogger.info("role/deleteUrlData" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}
		} catch (Exception e) {
			testNGlogger.info("role/deleteUrlData" + ",ERROR MESSAGES : " + e.getMessage());
			return "/";
		}
	}

	@GetMapping("/addRole")
	public String addPayby(Model model, RedirectAttributes redirectAttributes) throws Exception {

		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/addRole");

			if (accessStatus) {
				Role role = new Role();
				model.addAttribute("role", role);
				return "role/addRole";
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}

		} catch (Exception e) {

			testNGlogger.info("role/deleteUrl" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());

			return "errorpage/error";
		}

	}

	@PostMapping("/addNewRole")
	public String addNewPayby(@ModelAttribute Role role, RedirectAttributes redirectAttributes) throws Exception {

		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/addNewRole");
			if (accessStatus) {
				try {
					if (roleService.isRoleByExist(role.getName())) {
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Role name already exists ");
						return "redirect:/role/roleData";
					} else {
						roleService.save(role);
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "New Role successfully added");
						return "redirect:/role/roleData";
					}
				} catch (Exception e) {

					testNGlogger.info("role/addNewRole" + ",ERROR MESSAGES : " + e.getMessage());
					// testNGlogger.error(e.getMessage());

					return "errorpage/error";
				}
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}

		} catch (Exception e) {

			testNGlogger.info("role/addNewRole" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());

			return "/";
		}

	}

	@GetMapping("/getRole/{roleId}")
	public String getPayby(@PathVariable("roleId") Integer roleId, Model model, RedirectAttributes redirectAttributes)
			throws Exception {

		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/getRole");

			if (accessStatus) {
				try {
					Role role = roleService.findById(roleId);
					model.addAttribute("role", role);
				} catch (Exception e) {
					testNGlogger.info("role/getRole" + ",ERROR MESSAGES : " + e.getMessage());
					return "errorpage/error";
				}
				return "role/editRole";
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}
		} catch (Exception e) {
			testNGlogger.info("role/getRole" + ",ERROR MESSAGES : " + e.getMessage());
			return "/";
		}

	}

	@PostMapping("/updateRole")
	public String updatePayby(@ModelAttribute Role role, RedirectAttributes redirectAttributes) throws Exception {

		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/updateRole");

			if (accessStatus) {
				try {
					if (roleService.isRoleByExist(role.getName())) {
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, "Role name already exists ");
						return "redirect:/role/roleData";
					} else {
						roleService.save(role);
						redirectAttributes.addFlashAttribute(Constants.AttributeNames.SUCCESS_MESSAGE, "Role info updated successfully ");
						return "redirect:/role/roleData";
					}
				} catch (Exception e) {

					testNGlogger.info("role/updateRole" + ",ERROR MESSAGES : " + e.getMessage());
					// testNGlogger.error(e.getMessage());
					return "errorpage/error";
				}
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}
		} catch (Exception e) {

			testNGlogger.info("role/updateRole" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "/";
		}
	}

	@GetMapping("/deleteRole/{roleId}")
	public String deletePayby(@PathVariable("roleId") Integer roleId, RedirectAttributes redirectAttributes)
			throws Exception {

		try {
			boolean accessStatus = accessPermissionUtil.isAccessPermission("role/deleteRole");

			if (accessStatus) {
				try {
					roleService.deleteById(roleId);
				} catch (Exception e) {
					testNGlogger.info("role/deleteRole" + ",ERROR MESSAGES : " + e.getMessage());
					// testNGlogger.error(e.getMessage());
					return "errorpage/error";
				}
				return "redirect:/role/roleData";
			} else {
				redirectAttributes.addFlashAttribute(Constants.AttributeNames.MESSAGE, Constants.Messages.PERMISSION_DENIED);
				return "redirect:" + "/";
			}
		} catch (Exception e) {
			testNGlogger.info("role/deleteRole" + ",ERROR MESSAGES : " + e.getMessage());
			// testNGlogger.error(e.getMessage());
			return "/";
		}

	}
}
