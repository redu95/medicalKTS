package com.bannershallmark.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import com.bannershallmark.dao.UserRoleAccessPermissionDao;
import com.bannershallmark.service.MyUserDetails;

@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

	@Autowired
	HttpSession session;
	private RequestCache requestCache = new HttpSessionRequestCache();

	@Autowired
	UserRoleAccessPermissionDao userRoleAccessPermissionDao;

	@Value("${profileName}")
	String profileName;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String r = authentication.getAuthorities().toString();
		HttpSession session = request.getSession();
		session.setAttribute("path", userRoleAccessPermissionDao.findAccessPermissionByRole(r));

		MyUserDetails user = (MyUserDetails) authentication.getPrincipal();
//		if (user.getStore() != null) {
//			session.setAttribute("loggedInUserStore", user.getStore());
//		} else {
//			session.setAttribute("loggedInUserStore", null);
//		}

		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if (savedRequest != null) {
			System.out.println("savedRequest.getRedirectUrl()" + savedRequest.getRedirectUrl());
			System.out.println("profileName " + profileName);
			response.sendRedirect(savedRequest.getRedirectUrl());
		} else {
			System.out.println("savedRequest NULL");
			response.sendRedirect(request.getContextPath() + "/");
		}
	}
}
