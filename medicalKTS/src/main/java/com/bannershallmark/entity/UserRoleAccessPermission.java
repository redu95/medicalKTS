package com.bannershallmark.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "userroleaccesspermission")
public class UserRoleAccessPermission {
	@Id
    @Column(name = "userRoleAccessPermissionId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)	    
    private int id;
	
	
	@ManyToOne
	@JoinColumn(name="userRoleId")
	private Role role;
	
	@OneToOne
	@JoinColumn(name="accessPermissionId")
	private AccessPermission accessPermission;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public AccessPermission getAccessPermission() {
		return accessPermission;
	}

	public void setAccessPermission(AccessPermission accessPermission) {
		this.accessPermission = accessPermission;
	}
	
	
}
