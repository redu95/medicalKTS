package com.bannershallmark.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "productData")
public class ProductData {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String productName;
	private String productCode;
	private String productType;
	private String extraNote;
	
	public ProductData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductData(String productName, String productCode, String productType, String extraNote) {
		super();
		this.productName = productName;
		this.productCode = productCode; 
		this.productType = productType;
		this.extraNote = extraNote;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getExtraNote() {
		return extraNote;
	}

	public void setExtraNote(String extraNote) {
		this.extraNote = extraNote;
	};
	
	
	
	
	
	
}
