package com.test.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department implements java.io.Serializable {

	// Fields

	private Integer did;
	private String dname;
	private Set professionals = new HashSet(0);

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** minimal constructor */
	public Department(String dname) {
		this.dname = dname;
	}

	/** full constructor */
	public Department(String dname, Set professionals) {
		this.dname = dname;
		this.professionals = professionals; 
	}

	// Property accessors

	public Integer getDid() {
		return this.did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public String getDname() {
		return this.dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public Set getProfessionals() {
		return this.professionals;
	}

	public void setProfessionals(Set professionals) {
		this.professionals = professionals;
	}

}