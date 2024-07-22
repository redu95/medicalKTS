/**
 * 
 */
package com.bannershallmark.vo;

import java.util.List;

/**
 * @author usharma
 *
 */
public class StoreVO {

	private int[] storeId;
	private String purchaseOrderStoreId;
	private String purchaseOrderStoreName;

	public String getPurchaseOrderStoreId() {
		return purchaseOrderStoreId;
	}

	public void setPurchaseOrderStoreId(String purchaseOrderStoreId) {
		this.purchaseOrderStoreId = purchaseOrderStoreId;
	}

	public String getPurchaseOrderStoreName() {
		return purchaseOrderStoreName;
	}

	public void setPurchaseOrderStoreName(String purchaseOrderStoreName) {
		this.purchaseOrderStoreName = purchaseOrderStoreName;
	}

	public int[] getStoreId() {
		return storeId;
	}

	public void setStoreId(int[] storeId) {
		this.storeId = storeId;
	}
	
	

}
