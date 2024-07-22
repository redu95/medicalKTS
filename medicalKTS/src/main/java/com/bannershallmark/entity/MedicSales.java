package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "medicSales")
public class MedicSales {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer serviceId;
	private Date salesDate;
	private Double servicePrice;
	private Double serviceSalePrice;
	private Double totalSalePrice;
	private Integer quantity;
	private String serviceName;
	private String serviceType;
	private String vendorName;
	private String sellerName;
	private Integer instituteId;
	private Integer salesReciet;
	private String departmentId;
	
	public MedicSales() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedicSales(Integer serviceId, Date salesDate, Double servicePrice, Double serviceSalePrice,
			Double totalSalePrice, Integer quantity, String serviceName, String serviceType, String vendorName,
			String sellerName, Integer instituteId, Integer salesReciet, String departmentId) {
		super();
		this.serviceId = serviceId;
		this.salesDate = salesDate;
		this.servicePrice = servicePrice;
		this.serviceSalePrice = serviceSalePrice;
		this.totalSalePrice = totalSalePrice;
		this.quantity = quantity;
		this.serviceName = serviceName;
		this.serviceType = serviceType;
		this.vendorName = vendorName;
		this.sellerName = sellerName;
		this.instituteId = instituteId;
		this.salesReciet = salesReciet;
		this.departmentId = departmentId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Date getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}

	public Double getServicePrice() {
		return servicePrice;
	}

	public void setServicePrice(Double servicePrice) {
		this.servicePrice = servicePrice;
	}

	public Double getServiceSalePrice() {
		return serviceSalePrice;
	}

	public void setServiceSalePrice(Double serviceSalePrice) {
		this.serviceSalePrice = serviceSalePrice;
	}

	public Double getTotalSalePrice() {
		return totalSalePrice;
	}

	public void setTotalSalePrice(Double totalSalePrice) {
		this.totalSalePrice = totalSalePrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public Integer getInstituteId() {
		return instituteId;
	}

	public void setInstituteId(Integer instituteId) {
		this.instituteId = instituteId;
	}

	public Integer getSalesReciet() {
		return salesReciet;
	}

	public void setSalesReciet(Integer salesReciet) {
		this.salesReciet = salesReciet;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

		
}
