package com.bannershallmark.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class ForgotPassword {

	    @Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer id;
	  	private String userId;
	  	private String randomId;  	
		private String dataAndTime;
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getRandomId() {
			return randomId;
		}
		public void setRandomId(String randomId) {
			this.randomId = randomId;
		}
		public String getDataAndTime() {
			return dataAndTime;
		}
		public void setDataAndTime(String dataAndTime) {
			this.dataAndTime = dataAndTime;
		}
		
	  	
	  	

	
}
