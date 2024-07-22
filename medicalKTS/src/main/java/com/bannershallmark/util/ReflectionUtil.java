package com.bannershallmark.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Objects;

import org.springframework.beans.BeanUtils;

public class ReflectionUtil {
		public static <T extends Serializable> Method getterMethodByProperty(String propertyName,Class<T> clazz) {
			Method getter = null;
			if(propertyName == null) {
				return null;
			}
			String getterName = getterMethodName(propertyName);
				try {
					getter = clazz.getMethod(getterName);
				} catch (NoSuchMethodException e) {
					System.err.println("Method :" + getterName + " :::: getter method for " + propertyName + " not found");
				} catch (SecurityException e) {
					System.err.println("Method :" + getterName + e.getMessage());
				}
			return getter;
		}

		public static <T extends Serializable> Method setterMethodByProperty(String propertyName,Class<T> clazz,Class... parameters) {
			Method setter = null;
			if(propertyName == null) {
				return null;
			}
			String setterName = setterMethodName(propertyName);
			try {
				setter = clazz.getMethod(setterName,parameters);
			} catch (NoSuchMethodException e) {
				System.err.println("Method :" + setterName + " :::: setter method for " + propertyName + " not found");
			} catch (SecurityException e) {
				System.err.println("Method :" + setterName + e.getMessage());
			}
			return setter;
		}
		
		private static String getterMethodName(String propertyName) {
			if(propertyName == null) {
				return null;
			}
			if('A' <= propertyName.charAt(1) && propertyName.charAt(1) <= 'Z') {
				return "get" + propertyName;
			} else {
				return "get"+(propertyName.charAt(0)+"").toUpperCase() + propertyName.substring(1);
			}
		}
		
		private static String setterMethodName(String propertyName) {
			if(propertyName == null) {
				return null;
			}
			if('A' <= propertyName.charAt(1) && propertyName.charAt(1) <= 'Z') {
				return "set" + propertyName;
			} else {
				return "set"+(propertyName.charAt(0)+"").toUpperCase() + propertyName.substring(1);
			}
		}

		/**
		 * This method will compare all same properties of both objects under below circumstances
		 * 
		 * @param fromObject values picked up from this object to compare
		 * @param withObject values picked up from this object to compare with another
		 * @param ignoreProperties ignores Properties to compare which are available in list
		 * @param hardCheck to check all properties in {@code fromObject} must exists in {@code withObject} except {@code ignoreProperties}
		 * 			<p>
		 * 				if hardCheck is true then if any property which is exists in {@code fromObject} and not exists in {@code withObject} will prevent execution and returns false immediately.
		 * 			<p>
		 * 			<p>
		 * 				if hardCheck is false then properties which are exist in {@code fromObject} but not exists in {@code withObject} will be ignored and resultant true for this property.
		 * 			<p>
		 * @return true if all values are same under {@code hardCheck} and {@code ignoreProperties} checks, otherwise false;
		 * @throws IntrospectionException
		 */
		public static boolean haveSameValues(Object fromObject, Object withObject, ArrayList<String> ignoreProperties,boolean hardCheck) throws IntrospectionException {
			BeanInfo beanInfo = Introspector.getBeanInfo(fromObject.getClass());
			for (PropertyDescriptor pd : beanInfo.getPropertyDescriptors()) {
				if (!ignoreProperties.contains(pd.getName()) && !pd.getName().equals("class")) {
					Method sourceReader = pd.getReadMethod();
					try {
						PropertyDescriptor withObjectPd = BeanUtils.getPropertyDescriptor(withObject.getClass(), pd.getName());
						if(withObjectPd != null) {
							Method destReader = withObjectPd.getReadMethod();
							Object o1 = sourceReader.invoke(fromObject);
							Object o2 = destReader.invoke(withObject);
							if (!Objects.equals(o1, o2)) {
								 System.out.println("Not Match : " + pd.getName() + " = " + o1 + ", " + o2 + " = " + Objects.equals(o1, o2));
								return false;
							}
						} else if(hardCheck) {
							return false;
						}
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						e.printStackTrace();
						System.out.println(fromObject.getClass() + ", getName() :: " + pd.getName());
						if(hardCheck) {
							return false;
						}
						return false;
					}
				}
			}
			return true;
		}
}
