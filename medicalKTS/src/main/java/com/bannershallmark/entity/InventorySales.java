package com.bannershallmark.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "inventorySales")
public class InventorySales {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer itemId;
	private Date salesDate;
	private Double itemPrice;
	private Double salePrice;
	private Double totalSalePrice;
	private Integer quantity;
	private String itemName;
	private String itemType;
	private String vendorName;
	private String sellerName;
	@OneToOne
	@JoinColumn(name = "storeId")
	private InventoryStore storeId;
	private Integer salesReciet;
	
	public InventorySales() {
		super();
		// TODO Auto-generated constructor stub
	}


	public InventorySales(Integer itemId, Date salesDate, Double itemPrice, Double salePrice, Double totalSalePrice, Integer quantity, String itemName,
			String itemType, String vendorName, String sellerName, InventoryStore storeId) {
		super();
		this.itemId = itemId;
		this.salesDate = salesDate;
		this.itemPrice = itemPrice;
		this.salePrice = salePrice;
		this.totalSalePrice = totalSalePrice;
		this.quantity = quantity;
		this.itemName = itemName;
		this.itemType = itemType;
		this.vendorName = vendorName;
		this.sellerName = sellerName;
		this.storeId = storeId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getItemId() {
		return itemId;
	}


	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}


	public Date getSalesDate() {
		return salesDate;
	}


	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}


	public Double getSalePrice() {
		return salePrice;
	}

	public Double getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}

	
	public Double getTotalSalePrice() {
		return totalSalePrice;
	}


	public void setTotalSalePrice(Double totalSalePrice) {
		this.totalSalePrice = totalSalePrice;
	}


	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getItemType() {
		return itemType;
	}


	public void setItemType(String itemType) {
		this.itemType = itemType;
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


	public InventoryStore getStoreId() {
		return storeId;
	}


	public void setStoreId(InventoryStore storeId) {
		this.storeId = storeId;
	}


	public Integer getSalesReciet() {
		return salesReciet;
	}


	public void setSalesReciet(Integer salesReciet) {
		this.salesReciet = salesReciet;
	} 
	
	
	
}