package com.test.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subitem implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer pid;
	private Subject subject;
	private String days;
	private String number;
	private String address;

	// Constructors

	/** default constructor */
	public Subitem() {
	}

	/** full constructor */
	public Subitem(Integer id, Integer pid, Subject subject, String days, String number, String address) {
		this.id = id;
		this.pid = pid;
		this.subject = subject;
		this.days = days;
		this.number = number;
		this.address = address;

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

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
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

}