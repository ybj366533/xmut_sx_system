package com.test.model;

/**
 * Loganderror entity. @author MyEclipse Persistence Tools
 */

public class Loganderror implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private String method;
	private String vaule;
	private String date;

	// Constructors

	/** default constructor */
	public Loganderror() {
	}

	/** full constructor */
	public Loganderror(String type, String method, String vaule, String date) {
		this.type = type;
		this.method = method;
		this.vaule = vaule;
		this.date = date;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMethod() {
		return this.method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getVaule() {
		return this.vaule;
	}

	public void setVaule(String vaule) {
		this.vaule = vaule;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}