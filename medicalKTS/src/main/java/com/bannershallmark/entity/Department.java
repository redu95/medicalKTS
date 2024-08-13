package com.bannershallmark.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "department")
public class Department {
	@Id
	@Column(name = "departmentId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String departmentName;
	private String description;
	private String departmentHead;
	private Integer stuffNumber;
	private Integer registeredServices;
	private String extraNote;
	private Integer instituteId;
	private Integer isActive;
	
	private String docName;
	private String docType;
	@Lob
	private byte[] docData;
	
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Department(String departmentName, String description, String departmentHead, Integer stuffNumber, Integer registeredServices, String extraNote, Integer institutionId, Integer isActive) {
		super();
		this.departmentName = departmentName;
		this.description = description;
		this.departmentHead = departmentHead;
		this.stuffNumber = stuffNumber;
		this.registeredServices = registeredServices;
		this.extraNote = extraNote;
		this.instituteId = institutionId;
		this.isActive = isActive;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDepartmentHead() {
		return departmentHead;
	}

	public void setDepartmentHead(String departmentHead) {
		this.departmentHead = departmentHead;
	}

	public Integer getStuffNumber() {
		return stuffNumber;
	}

	public void setStuffNumber(Integer stuffNumber) {
		this.stuffNumber = stuffNumber;
	}

	public Integer getRegisteredServices() {
		return registeredServices;
	}

	public void setRegisteredServices(Integer registeredServices) {
		this.registeredServices = registeredServices;
	}

	public String getExtraNote() {
		return extraNote;
	}

	public void setExtraNote(String extraNote) {
		this.extraNote = extraNote;
	}

	public Integer getInstituteId() {
		return instituteId;
	}

	public void setInstituteId(Integer instituteId) {
		this.instituteId = instituteId;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}
	
	
	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public byte[] getDocData() {
		return docData;
	}

	public void setDocData(byte[] docData) {
		this.docData = docData;
	}
	
	

}
