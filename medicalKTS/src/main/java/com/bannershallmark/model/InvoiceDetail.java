package com.bannershallmark.model;

import java.util.List;

public class InvoiceDetail {
	
	private Integer invoiceDetailsId;
	private String invoicenumber;
	private String ponumber;
	private String store;
	private String vendor;
	private String discountOnEntireSubtotal;
	private String discountOptions;
	private String discountPercentOnEachProduct;
	private String discountPercentOnSubtotal;
	private String dueDate;
	private String extendedUnitPrice;
	private String invShipping;
	private String invStatus;
	private String invSubtotal;
	private String invTotal;
	private String invoiceDate;
	private String originalUnitPrice;
	private String qb;
	private String shippingMethod;
	private String invoiceLink;
	private String vendorUnqId;
	private String storeUnqId;
	private String invoiceUnqId;
	private Boolean isZapData;
	private String documentId;
	private Integer venderId;
	private Integer purchargeOrderAutoId;

	private String productReceived;

	private String storee;

	private String receiveLink;


	private List<String> stores;

	public String getStoree() {
	    return storee;
	}
	public void setStoree(String storee) {
	    this.storee = storee;
	}
	private boolean status;
	private String subTotal;
	private String importedDate;
	private String firstParseDate;
	private String lastParseDate;
	private String layoutModel;
	private String freight;
	private String paymentTerm;
	private String fileName;
	private String remoteID;
	private String tax;
	
	
	public Integer getInvoiceDetailsId() {
		return invoiceDetailsId;
	}
	public void setInvoiceDetailsId(Integer invoiceDetailsId) {
		this.invoiceDetailsId = invoiceDetailsId;
	}
	public String getDiscountOnEntireSubtotal() {
		return discountOnEntireSubtotal;
	}
	public void setDiscountOnEntireSubtotal(String discountOnEntireSubtotal) {
		this.discountOnEntireSubtotal = discountOnEntireSubtotal;
	}
	public String getDiscountOptions() {
		return discountOptions;
	}
	public void setDiscountOptions(String discountOptions) {
		this.discountOptions = discountOptions;
	}
	public String getDiscountPercentOnEachProduct() {
		return discountPercentOnEachProduct;
	}
	public void setDiscountPercentOnEachProduct(String discountPercentOnEachProduct) {
		this.discountPercentOnEachProduct = discountPercentOnEachProduct;
	}
	public String getDiscountPercentOnSubtotal() {
		return discountPercentOnSubtotal;
	}
	public void setDiscountPercentOnSubtotal(String discountPercentOnSubtotal) {
		this.discountPercentOnSubtotal = discountPercentOnSubtotal;
	}
	public String getExtendedUnitPrice() {
		return extendedUnitPrice;
	}
	public void setExtendedUnitPrice(String extendedUnitPrice) {
		this.extendedUnitPrice = extendedUnitPrice;
	}
	public String getInvShipping() {
		return invShipping;
	}
	public void setInvShipping(String invShipping) {
		this.invShipping = invShipping;
	}
	public String getInvSubtotal() {
		return invSubtotal;
	}
	public void setInvSubtotal(String invSubtotal) {
		this.invSubtotal = invSubtotal;
	}
	public String getInvTotal() {
		return invTotal;
	}
	public void setInvTotal(String invTotal) {
		this.invTotal = invTotal;
	}
	public String getOriginalUnitPrice() {
		return originalUnitPrice;
	}
	public void setOriginalUnitPrice(String originalUnitPrice) {
		this.originalUnitPrice = originalUnitPrice;
	}
	public String getShippingMethod() {
		return shippingMethod;
	}
	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}
	public String getInvoiceLink() {
		return invoiceLink;
	}
	public void setInvoiceLink(String invoiceLink) {
		this.invoiceLink = invoiceLink;
	}
	public String getVendorUnqId() {
		return vendorUnqId;
	}
	public void setVendorUnqId(String vendorUnqId) {
		this.vendorUnqId = vendorUnqId;
	}
	public String getStoreUnqId() {
		return storeUnqId;
	}
	public void setStoreUnqId(String storeUnqId) {
		this.storeUnqId = storeUnqId;
	}
	public String getInvoiceUnqId() {
		return invoiceUnqId;
	}
	public void setInvoiceUnqId(String invoiceUnqId) {
		this.invoiceUnqId = invoiceUnqId;
	}
	public Boolean getIsZapData() {
		return isZapData;
	}
	public void setIsZapData(Boolean isZapData) {
		this.isZapData = isZapData;
	}
	public String getDocumentId() {
		return documentId;
	}
	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}
	public Integer getVenderId() {
		return venderId;
	}
	public void setVenderId(Integer venderId) {
		this.venderId = venderId;
	}
	public Integer getPurchargeOrderAutoId() {
		return purchargeOrderAutoId;
	}
	public void setPurchargeOrderAutoId(Integer purchargeOrderAutoId) {
		this.purchargeOrderAutoId = purchargeOrderAutoId;
	}
	public String getProductReceived() {
		return productReceived;
	}
	public void setProductReceived(String productReceived) {
		this.productReceived = productReceived;
	}
	public String getReceiveLink() {
		return receiveLink;
	}
	public void setReceiveLink(String receiveLink) {
		this.receiveLink = receiveLink;
	}
	public List<String> getStores() {
		return stores;
	}
	public void setStores(List<String> stores) {
		this.stores = stores;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}
	public String getImportedDate() {
		return importedDate;
	}
	public void setImportedDate(String importedDate) {
		this.importedDate = importedDate;
	}
	public String getFirstParseDate() {
		return firstParseDate;
	}
	public void setFirstParseDate(String firstParseDate) {
		this.firstParseDate = firstParseDate;
	}
	public String getLastParseDate() {
		return lastParseDate;
	}
	public void setLastParseDate(String lastParseDate) {
		this.lastParseDate = lastParseDate;
	}
	public String getLayoutModel() {
		return layoutModel;
	}
	public void setLayoutModel(String layoutModel) {
		this.layoutModel = layoutModel;
	}
	public String getFreight() {
		return freight;
	}
	public void setFreight(String freight) {
		this.freight = freight;
	}
	public String getPaymentTerm() {
		return paymentTerm;
	}
	public void setPaymentTerm(String paymentTerm) {
		this.paymentTerm = paymentTerm;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRemoteID() {
		return remoteID;
	}
	public void setRemoteID(String remoteID) {
		this.remoteID = remoteID;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getPonumber() {
		return ponumber;
	}
	public void setPonumber(String ponumber) {
		this.ponumber = ponumber;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
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
	public String getInvoicenumber() {
		return invoicenumber;
	}
	public void setInvoicenumber(String invoicenumber) {
		this.invoicenumber = invoicenumber;
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
	
	
	

}
