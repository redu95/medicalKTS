package com.bannershallmark.util;

import javax.servlet.http.HttpServletRequest;

import com.bannershallmark.vo.Paging;

public class PagingUtil {
	public static Paging getPagingFromRequest(HttpServletRequest request) {
		Paging paging = new Paging();
		// Process parsing data from request to Paging
		Integer start = 0;
		try {
			start = Integer.parseInt(request.getParameter(Constants.PaginationParameters.START));
		} catch (Exception e) {}
		Integer length = 10;
		try {
			length = Integer.parseInt(request.getParameter(Constants.PaginationParameters.LENGTH));
		} catch (Exception e) {}
		Integer draw = 10;
		try {
			draw = Integer.parseInt(request.getParameter(Constants.PaginationParameters.DRAW));
		} catch (Exception e) {}
		Integer sortIndex = 0;
		try {
			sortIndex = Integer.parseInt(request.getParameter(Constants.PaginationParameters.SORTING_COLUMN));
		} catch (Exception e) {}
		
		paging.setStart(start);
		paging.setLength(length);
		paging.setDraw(draw);
		paging.setSortColumn(sortIndex);
		
		paging.setSearchValue(request.getParameter(Constants.PaginationParameters.SEARCH_VALUE));
		paging.setSortBy(request.getParameter(Constants.PaginationParameters.SORTING_ORDER));
		
		return paging;
	}
}
