package com.bannershallmark.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "accesspermission")
public class AccessPermission {
	@Id
    @Column(name = "accessPermissionId")
    //@GeneratedValue(strategy = GenerationType.IDENTITY)	    
    private int id;
	
	@Column(name = "accessPermissionDesc", length = 1000)
    private String urlPath;
	

	@Column(name = "accessPermissionDetailedDesc", length = 2000)
	 private String accessPermissionDetailedDesc;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrlPath() {
		return urlPath;
	}

	public void setUrlPath(String urlPath) {
		this.urlPath = urlPath;
	}

	public String getAccessPermissionDetailedDesc() {
		return accessPermissionDetailedDesc;
	}

	public void setAccessPermissionDetailedDesc(String accessPermissionDetailedDesc) {
		this.accessPermissionDetailedDesc = accessPermissionDetailedDesc;
	}
	
	
	
}
