package com.bannershallmark.vo;

import java.util.List;

public class DashboardInvalidItemAjaxResponse {
	List<String> data;
	Integer draw;
	Long recordsTotal;
	Long recordsFiltered;
	
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	public Integer getDraw() {
		return draw;
	}
	public void setDraw(Integer draw) {
		this.draw = draw;
	}
	public Long getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(Long recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public Long getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(Long recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
}
