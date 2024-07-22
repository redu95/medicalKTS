package com.bannershallmark.vo;

public class MenuListModel {
	
	private Integer id;
	private String itemName;
	private String itemDescription;
	private String itemPrice;
	
	public MenuListModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MenuListModel(Integer id, String itemName, String itemDescription, String itemPrice) {
		super();
		this.id = id;
		this.itemName = itemName;
		this.itemDescription = itemDescription;
		this.itemPrice = itemPrice;
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

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	
}
