package com.test.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Professional entity. @author MyEclipse Persistence Tools
 */

public class Professional implements java.io.Serializable {

	// Fields

	private Integer pid;
	private Department department;
	private String pname;
	private Integer puid;
	private Integer count;
	private Set subjects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Professional() {
	}

	/** minimal constructor */
	public Professional(Department department, String pname, Integer puid, Integer count) {
		this.department = department;
		this.pname = pname;
		this.puid = puid;
		this.count = count;
	}

	/** full constructor */
	public Professional(Department department, String pname, Set subjects, Integer puid, Integer count) {
		this.department = department;
		this.pname = pname;
		this.subjects = subjects;
		this.puid = puid;
		this.count = count;
	}

	// Property accessors

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Set getSubjects() {
		return this.subjects;
	}

	public void setSubjects(Set subjects) {
		this.subjects = subjects;
	}

	public Integer getPuid() {
		return puid;
	}

	public void setPuid(Integer puid) {
		this.puid = puid;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}