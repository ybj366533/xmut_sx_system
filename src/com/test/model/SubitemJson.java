package com.test.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class SubitemJson implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer pid;
	private String subjectname;
	private String teacherName;
	private String days;
	private String number;
	private String address;
	private String mkey;

	// Constructors

	/** default constructor */
	public SubitemJson() {
	}

	/** full constructor */
	public SubitemJson(Integer id,String mkey, Integer pid, String subjectname, String days, String number, String address,String teacherName) {
		this.id = id;
		this.pid = pid;
		this.subjectname = subjectname;
		this.teacherName = teacherName;
		this.days = days;
		this.number = number;
		this.address = address;
		this.mkey = mkey;

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public String getMkey() {
		return mkey;
	}
	public void setMkey(String mkey) {
		this.mkey = mkey;
	}

}