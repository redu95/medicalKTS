package com.bannershallmark.model;

public class InvoiceVendorVO {
	
	private String invoiceVendorId[];
	private String invoices_id[];
	private String vendor_id[];	
	
	public String[] getInvoiceVendorId() {
		return invoiceVendorId;
	}
	public void setInvoiceVendorId(String[] invoiceVendorId) {
		this.invoiceVendorId = invoiceVendorId;
	}
	public String[] getInvoices_id() {
		return invoices_id;
	}
	public void setInvoices_id(String[] invoices_id) {
		this.invoices_id = invoices_id;
	}
	public String[] getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(String[] vendor_id) {
		this.vendor_id = vendor_id;
	}
}
