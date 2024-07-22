package com.bannershallmark.compositekey;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class ReceiveIdentity implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer ponumber;
	private Integer store;
	
	public ReceiveIdentity() {
	}

	public ReceiveIdentity(Integer ponumber, Integer store) {
		this.ponumber = ponumber;
		this.store = store;
	}

	public Integer getPonumber() {
		return ponumber;
	}

	public void setPonumber(Integer ponumber) {
		this.ponumber = ponumber;
	}

	public Integer getStore() {
		return store;
	}

	public void setStore(Integer store) {
		this.store = store;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ponumber == null) ? 0 : ponumber.hashCode());
		result = prime * result + ((store == null) ? 0 : store.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReceiveIdentity other = (ReceiveIdentity) obj;
		if (ponumber == null) {
			if (other.ponumber != null)
				return false;
		} else if (!ponumber.equals(other.ponumber))
			return false;
		if (store == null) {
			if (other.store != null)
				return false;
		} else if (!store.equals(other.store))
			return false;
		return true;
	}
	
		
}
