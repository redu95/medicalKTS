package com.bannershallmark.vo;

import java.util.List;

import com.bannershallmark.entity.MedicItem;

public class ItemListAjax {
	List<MedicItem> item;
	String searchVal;
	Integer page;
	Integer countItem;
	Integer page1;
	Integer page2;
	Integer page3;
	Integer page4;
	Integer page5;
	Integer pageLimit;
	Integer deletedItem;
	
	
	public ItemListAjax() {
		super();
		// TODO Auto-generated constructor stub
	}


	public List<MedicItem> getItem() {
		return item;
	}


	public void setItem(List<MedicItem> item) {
		this.item = item;
	}


	public String getSearchVal() {
		return searchVal;
	}


	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}


	public Integer getPage() {
		return page;
	}


	public void setPage(Integer page) {
		this.page = page;
	}


	public Integer getCountItem() {
		return countItem;
	}


	public void setCountItem(Integer countItem) {
		this.countItem = countItem;
	}


	public Integer getPage1() {
		return page1;
	}


	public void setPage1(Integer page1) {
		this.page1 = page1;
	}


	public Integer getPage2() {
		return page2;
	}


	public void setPage2(Integer page2) {
		this.page2 = page2;
	}


	public Integer getPage3() {
		return page3;
	}


	public void setPage3(Integer page3) {
		this.page3 = page3;
	}


	public Integer getPage4() {
		return page4;
	}


	public void setPage4(Integer page4) {
		this.page4 = page4;
	}


	public Integer getPage5() {
		return page5;
	}


	public void setPage5(Integer page5) {
		this.page5 = page5;
	}


	public Integer getPageLimit() {
		return pageLimit;
	}


	public void setPageLimit(Integer pageLimit) {
		this.pageLimit = pageLimit;
	}


	public Integer getDeletedItem() {
		return deletedItem;
	}


	public void setDeletedItem(Integer deletedItem) {
		this.deletedItem = deletedItem;
	}
	
	
}
