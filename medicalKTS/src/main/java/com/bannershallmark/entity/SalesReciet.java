package com.bannershallmark.entity;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "salesReciet")
public class SalesReciet {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Date uploadedDate;
	private String docName;
	private String docType;
	@Lob
	private byte[] docData;
	
	
	public SalesReciet() {
		super();
		// TODO Auto-generated constructor stub
	}


	public SalesReciet(Date uploadedDate, String docName, String docType, byte[] docData) {
		super();
		this.uploadedDate = uploadedDate;
		this.docName = docName;
		this.docType = docType;
		this.docData = docData;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Date getUploadedDate() {
		return uploadedDate;
	}


	public void setUploadedDate(Date uploadedDate) {
		this.uploadedDate = uploadedDate;
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

