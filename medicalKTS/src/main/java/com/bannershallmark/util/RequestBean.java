package com.bannershallmark.util;

import com.bannershallmark.entity.RequestData;

/**
 * @author radheshyam.kumar
 *
 */
public class RequestBean {

	private RequestData data;

	public RequestData getData() {
		return data;
	}

	public void setData(RequestData data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "RequestBean [data=" + data + "]";
	}

	
}
