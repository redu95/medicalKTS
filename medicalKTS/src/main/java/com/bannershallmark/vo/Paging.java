package com.bannershallmark.vo;

public class Paging {
	Integer start; // PageNo 
	Integer length; // pageSize, Rows display per page
    Integer sortColumn; // Sorting Column
    String sortBy; // Sorting Order
    Integer draw;
    String searchValue; // Search value
    Long totalRecords;
    Long filteredRecords;
    Object externalFilter;
    
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getLength() {
		return length;
	}
	public void setLength(Integer length) {
		this.length = length;
	}
	public String getSortBy() {
		return (sortBy == null || sortBy.equalsIgnoreCase("asc")) ? "ASC": "DESC";
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public Integer getDraw() {
		return draw;
	}
	public void setDraw(Integer draw) {
		this.draw = draw;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public Integer getSortColumn() {
		return sortColumn;
	}
	public void setSortColumn(Integer sortColumn) {
		this.sortColumn = sortColumn;
	}
	public Long getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(Long totalRecords) {
		this.totalRecords = totalRecords;
	}
	public Long getFilteredRecords() {
		return filteredRecords;
	}
	public void setFilteredRecords(Long filteredRecords) {
		this.filteredRecords = filteredRecords;
	}
	@Override
	public String toString() {
		return "Paging [draw=" + draw + ", filteredRecords=" + filteredRecords + ", length=" + length + ", searchValue="
				+ searchValue + ", sortBy=" + sortBy + ", sortColumn=" + sortColumn + ", start=" + start
				+ ", totalRecords=" + totalRecords + "]";
	}
	public Object getExternalFilter() {
		return externalFilter;
	}
	public void setExternalFilter(Object externalFilter) {
		this.externalFilter = externalFilter;
	}
}
