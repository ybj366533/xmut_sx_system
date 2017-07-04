package com.test.model;

import java.util.Date;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Placard implements java.io.Serializable {

	// Fields
		private Integer id;
		private Integer uid;
		private String title;
		private String content;
		private Date time;
		

		// Constructors

		/** default constructor */
		public Placard() {
		}

		/** full constructor */
		public Placard(Integer id, Integer uid,String title,String content,Date time) {
			this.id = id;
			this.uid = uid;
			this.title =title;
			this.time =time;
			this.content = content;
			
			
		}

		// Property accessors

		public Integer getId() {
			return this.id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Integer getUid() {
			return this.uid;
		}

		public void setUid(Integer uid) {
			this.uid = uid;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public Date getTime() {
			return time;
		}
		public void setTime(Date time) {
			this.time = time;
		}
	
}