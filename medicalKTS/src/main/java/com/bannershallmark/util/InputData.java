/**
 * 
 */
package com.bannershallmark.util;

import java.util.Arrays;

/**
 * @author radheshyam.kumar
 *
 */
public class InputData {

	private String values[];

	public String[] getValues() {
		return values;
	}

	public void setValues(String[] values) {
		this.values = values;
	}

	@Override
	public String toString() {
		return "InputData [values=" + Arrays.toString(values) + "]";
	}
	
	
}
