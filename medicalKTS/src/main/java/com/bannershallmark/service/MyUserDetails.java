package com.bannershallmark.service;

import java.util.ArrayList;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.Users;

public class MyUserDetails implements UserDetails {
	
	private static final long serialVersionUID = 1L;
	private Users user;

	public MyUserDetails(Users user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Role role = user.getRole();
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority(role.getName()));

		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	public String getFirstname() {
		return user.getFirstname();
	}

	public String getLastname() {
		return user.getLastname();
	}

	public Integer getId() {
		return user.getId();
	}

	
	public Role getRole() {
		return user.getRole();
	}
}
