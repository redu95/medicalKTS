package com.bannershallmark.model;

public class PODetailsModel {
	
	private Integer id;
	private String upc;
	private String itemNumber;
	private String description;
	private Double unitCost;
	private Double discountedCost;
	private Integer pack;
	private Double retail;
	private Double gmPercent;
	private String itemGroup;
	private String itemGroupRepl;
	private String itemGroupSpec;
	private Integer store;
	private String packFactor;
	private String vpn;
	
	private String issue;
	private Integer quantity;
	private Integer receivedQuantity;
	
	private String packingSlipQty;
	private String damagedQty;
	
	private String invoicenumber;
	
	
	
	
	
	
	
	public String getInvoicenumber() {
		return invoicenumber;
	}

	public void setInvoicenumber(String invoicenumber) {
		this.invoicenumber = invoicenumber;
	}

	public String getDamagedQty() {
		return damagedQty;
	}

	public void setDamagedQty(String damagedQty) {
		this.damagedQty = damagedQty;
	}

	public String getPackingSlipQty() {
		return packingSlipQty;
	}

	public void setPackingSlipQty(String packingSlipQty) {
		this.packingSlipQty = packingSlipQty;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getReceivedQuantity() {
		return receivedQuantity;
	}

	public void setReceivedQuantity(Integer receivedQuantity) {
		this.receivedQuantity = receivedQuantity;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUpc() {
		return upc;
	}

	public void setUpc(String upc) {
		this.upc = upc;
	}

	public String getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getUnitCost() {
		return unitCost;
	}

	public void setUnitCost(Double unitCost) {
		this.unitCost = unitCost;
	}

	public Double getDiscountedCost() {
		return discountedCost;
	}

	public void setDiscountedCost(Double discountedCost) {
		this.discountedCost = discountedCost;
	}

	public Integer getPack() {
		return pack;
	}

	public void setPack(Integer pack) {
		this.pack = pack;
	}

	public Double getRetail() {
		return retail;
	}

	public void setRetail(Double retail) {
		this.retail = retail;
	}

	public Double getGmPercent() {
		return gmPercent;
	}

	public void setGmPercent(Double gmPercent) {
		this.gmPercent = gmPercent;
	}

	public String getItemGroup() {
		return itemGroup;
	}

	public void setItemGroup(String itemGroup) {
		this.itemGroup = itemGroup;
	}

	public String getItemGroupRepl() {
		return itemGroupRepl;
	}

	public void setItemGroupRepl(String itemGroupRepl) {
		this.itemGroupRepl = itemGroupRepl;
	}

	public String getItemGroupSpec() {
		return itemGroupSpec;
	}

	public void setItemGroupSpec(String itemGroupSpec) {
		this.itemGroupSpec = itemGroupSpec;
	}

	public Integer getStore() {
		return store;
	}

	public void setStore(Integer store) {
		this.store = store;
	}

	public String getPackFactor() {
		return packFactor;
	}

	public void setPackFactor(String packFactor) {
		this.packFactor = packFactor;
	}

	public String getVpn() {
		return vpn;
	}

	public void setVpn(String vpn) {
		this.vpn = vpn;
	}

	@Override
	public String toString() {
		return "PODetailsModel [id=" + id + ", upc=" + upc + ", itemNumber=" + itemNumber + ", description="
				+ description + ", unitCost=" + unitCost + ", discountedCost=" + discountedCost + ", pack=" + pack
				+ ", retail=" + retail + ", gmPercent=" + gmPercent + ", itemGroup=" + itemGroup + ", itemGroupRepl="
				+ itemGroupRepl + ", itemGroupSpec=" + itemGroupSpec + ", store=" + store + ", packFactor=" + packFactor
				+ ", vpn=" + vpn + "]";
	}
}
