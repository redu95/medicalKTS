/**
 * 
 */
package com.bannershallmark.entity;

import com.bannershallmark.util.HeaderLabel;

/**
 * @author radheshyam.kumar
 *
 */
public class RequestData {

	private HeaderLabel[] data;
	
	private String rowCount; 

	private InputData[] inputDataSet;

	public HeaderLabel[] getData() {
		return data;
	}

	public void setData(HeaderLabel[] data) {
		this.data = data;
	}

	public InputData[] getInputDataSet() {
		return inputDataSet;
	}

	public void setInputDataSet(InputData[] inputDataSet) {
		this.inputDataSet = inputDataSet;
	}

	public String getRowCount() {
		return rowCount;
	}

	public void setRowCount(String rowCount) {
		this.rowCount = rowCount;
	}
	
	
	
	

}
