package com.bannershallmark.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "accessPermissionsByGroup")
public class AccessPermissionsByGroup {
	@Id
    @Column(name = "accessPermissionsByGroupID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)	    
    private int accessPermissionsByGroupID;
    
	@Column(length = 100)
    String accessPermissionsByGroupName;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			  name = "accessPermissionsByGroup_mapped_accessPermission", 
			  joinColumns = @JoinColumn(name = "accessPermissionsByGroupID"), 
			  inverseJoinColumns = @JoinColumn(name = "accessPermissionId"))
	private List<AccessPermission> accessPermission;

	public int getAccessPermissionsByGroupID() {
		return accessPermissionsByGroupID;
	}

	public void setAccessPermissionsByGroupID(int accessPermissionsByGroupID) {
		this.accessPermissionsByGroupID = accessPermissionsByGroupID;
	}

	public String getAccessPermissionsByGroupName() {
		return accessPermissionsByGroupName;
	}

	public void setAccessPermissionsByGroupName(String accessPermissionsByGroupName) {
		this.accessPermissionsByGroupName = accessPermissionsByGroupName;
	}

	public List<AccessPermission> getAccessPermission() {
		return accessPermission;
	}

	public void setAccessPermission(List<AccessPermission> accessPermission) {
		this.accessPermission = accessPermission;
	}
}
