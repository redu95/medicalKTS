package com.bannershallmark.vo;

import java.util.Date;

import org.json.JSONObject;

public class NewPatientVo {
	private Integer id;
	private String name;
	private String lastName;
	private String note;
	private Integer age;
	private String sex;
	private String phoneNumber;
	private String address;
	private String registryDate;
	private Integer instituteId;
	private Integer isActive;
	private String doctorId;
	private String assignedTo;
	private JSONObject jsonObj;
	
	public NewPatientVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public NewPatientVo(Integer id, String name, String lastName, String note, Integer age, String sex,
			String phoneNumber, String address, String registryDate, Integer instituteId, Integer isActive,
			String doctorId, String assignedTo) {
		super();
		this.id = id;
		this.name = name;
		this.lastName = lastName;
		this.note = note;
		this.age = age;
		this.sex = sex;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.registryDate = registryDate;
		this.instituteId = instituteId;
		this.isActive = isActive;
		this.doctorId = doctorId;
		this.assignedTo = assignedTo;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getRegistryDate() {
		return registryDate;
	}


	public void setRegistryDate(String registryDate) {
		this.registryDate = registryDate;
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


	public String getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}


	public String getAssignedTo() {
		return assignedTo;
	}


	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}


	public JSONObject getJsonObj() {
		return jsonObj;
	}


	public void setJsonObj(JSONObject jsonObj) {
		this.jsonObj = jsonObj;
	}
	
	
	
}
