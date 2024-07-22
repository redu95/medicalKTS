package com.bannershallmark.model;

public class InvoiceDetailsModel {

	
	private String invoiceLink;
	private Integer invoiceDetailsId;
	//private String vendorUnqId;
	private String invoicenumber;
	private String ponumber;

	private String vendorName;
	private String store;
	private String invStatus;
	private String qb;

	private String shipmentCheckin;

	private String invoiceDate;
	private String dueDate;
	private Double invSubtotal;
	private String freight;
	private Double tax;
	private Double invTotal;
	private String shippingMethod;
	private Integer vendorNo;
	
	private String subTotal;
	
	private Double dueAmount;
	private String approvalStatusText;
	
	private String shippingMethodPo;
	
	private Boolean isActive;
	
	
	public String getInvoiceLink() {
		return invoiceLink;
	}
	public void setInvoiceLink(String invoiceLink) {
		this.invoiceLink = invoiceLink;
	}
	public Integer getInvoiceDetailsId() {
		return invoiceDetailsId;
	}
	public void setInvoiceDetailsId(Integer invoiceDetailsId) {
		this.invoiceDetailsId = invoiceDetailsId;
	}
	/*
	 * public String getVendorUnqId() { return vendorUnqId; } public void
	 * setVendorUnqId(String vendorUnqId) { this.vendorUnqId = vendorUnqId; }
	 */
	public String getInvoicenumber() {
		return invoicenumber;
	}
	public void setInvoicenumber(String invoicenumber) {
		this.invoicenumber = invoicenumber;
	}
	public String getPonumber() {
		return ponumber;
	}
	public void setPonumber(String ponumber) {
		this.ponumber = ponumber;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getInvStatus() {
		return invStatus;
	}
	public void setInvStatus(String invStatus) {
		this.invStatus = invStatus;
	}
	public String getQb() {
		return qb;
	}
	public void setQb(String qb) {
		this.qb = qb;
	}
	public String getShipmentCheckin() {
		return shipmentCheckin;
	}
	public void setShipmentCheckin(String shipmentCheckin) {
		this.shipmentCheckin = shipmentCheckin;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public Double getInvSubtotal() {
		return invSubtotal;
	}
	public void setInvSubtotal(Double invSubtotal) {
		this.invSubtotal = invSubtotal;
	}
	public String getFreight() {
		return freight;
	}
	public void setFreight(String freight) {
		this.freight = freight;
	}
	public Double getTax() {
		return tax;
	}
	public void setTax(Double tax) {
		this.tax = tax;
	}
	public Double getInvTotal() {
		return invTotal;
	}
	public void setInvTotal(Double invTotal) {
		this.invTotal = invTotal;
	}
	public String getShippingMethod() {
		return shippingMethod;
	}
	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}
	public String getShippingMethodPo() {
		return shippingMethodPo;
	}
	public void setShippingMethodPo(String shippingMethodPo) {
		this.shippingMethodPo = shippingMethodPo;
	}
	public Integer getVendorNo() {
		return vendorNo;
	}
	public void setVendorNo(Integer vendorNo) {
		this.vendorNo = vendorNo;
	}
	public Double getDueAmount() {
		return dueAmount;
	}
	public void setDueAmount(Double dueAmount) {
		this.dueAmount = dueAmount;
	}
	public String getApprovalStatusText() {
		return approvalStatusText;
	}
	public void setApprovalStatusText(String approvalStatusText) {
		this.approvalStatusText = approvalStatusText;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public String getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}
	

	
}
