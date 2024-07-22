package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "medicItem")
public class MedicItem {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String itemName;
	private String description;
	private String itemType;
	private String uniqueNo;
	private String vendorName;
	private Integer onHand;
	private Integer totalQuanitiy;
	private Integer minimunStock;
	private String measmurmentUnit;
	private Date recievedDate;
	private String placementDesc;
	private Integer instituteId;
	private Integer isActive;
	
	public MedicItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedicItem(String itemName, String description, String itemType, String uniqueNo, String vendorName,
			Integer onHand, Integer totalQuanitiy, Integer minimunStock, String measmurmentUnit, Date recievedDate,
			String placementDesc, Integer instituteId, Integer isActive) {
		super();
		this.itemName = itemName;
		this.description = description;
		this.itemType = itemType;
		this.uniqueNo = uniqueNo;
		this.vendorName = vendorName;
		this.onHand = onHand;
		this.totalQuanitiy = totalQuanitiy;
		this.minimunStock = minimunStock;
		this.measmurmentUnit = measmurmentUnit;
		this.recievedDate = recievedDate;
		this.placementDesc = placementDesc;
		this.instituteId = instituteId;
		this.isActive = isActive;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public String getUniqueNo() {
		return uniqueNo;
	}

	public void setUniqueNo(String uniqueNo) {
		this.uniqueNo = uniqueNo;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public Integer getOnHand() {
		return onHand;
	}

	public void setOnHand(Integer onHand) {
		this.onHand = onHand;
	}

	public Integer getTotalQuanitiy() {
		return totalQuanitiy;
	}

	public void setTotalQuanitiy(Integer totalQuanitiy) {
		this.totalQuanitiy = totalQuanitiy;
	}

	public Integer getMinimunStock() {
		return minimunStock;
	}

	public void setMinimunStock(Integer minimunStock) {
		this.minimunStock = minimunStock;
	}

	public String getMeasmurmentUnit() {
		return measmurmentUnit;
	}

	public void setMeasmurmentUnit(String measmurmentUnit) {
		this.measmurmentUnit = measmurmentUnit;
	}

	public Date getRecievedDate() {
		return recievedDate;
	}

	public void setRecievedDate(Date recievedDate) {
		this.recievedDate = recievedDate;
	}

	public String getPlacementDesc() {
		return placementDesc;
	}

	public void setPlacementDesc(String placementDesc) {
		this.placementDesc = placementDesc;
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
	
	
	
}
