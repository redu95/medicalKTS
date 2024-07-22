package com.bannershallmark.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AccessPermissionUtil {
	
	@Autowired
	ObjectFactory<HttpSession> httpSessionFactory;
	@Autowired
	HttpServletRequest request;
	
	public boolean isAccessPermission(String url) {
		HttpSession session = httpSessionFactory.getObject();
		boolean accessStatus = false;
		
		List<String> str =(List<String>) session.getAttribute("path");
		if(str != null && str.size() > 0) {
			for(String path : str) {
				if(path.contains(url)) {
					accessStatus = true;
					break;
				}
			}
		}
		return accessStatus;
	}
	
	public String redirectUrl() {
		
		
		String referrer = request.getHeader("referer");
		String host = "http://localhost:8084/Bannershallmark/";
		
		int index = host.length();
		if (index > 0) {
			referrer = referrer.substring(index);
		}
		return referrer;
	}

}
