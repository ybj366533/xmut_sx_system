package com.test.model;

import java.util.Date;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Works implements java.io.Serializable {

	// Fields
		private Integer id;
		private Integer uid;
		private String title;
		private String content;
		private Date time;
		private Integer pid;
		

		// Constructors

		/** default constructor */
		public Works() {
		}

		/** full constructor */
		public Works(Integer id,Integer pid, Integer uid,String title,String content,Date time) {
			this.id = id;
			this.uid = uid;
			this.title =title;
			this.pid = pid;
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
		public Integer getPid() {
			return pid;
		}
		public void setPid(Integer pid) {
			this.pid = pid;
		}
	
}