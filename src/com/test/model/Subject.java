package com.test.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Integer id;
	private Professional professional;
	private Integer uid;
	private String name;
	private String nature;
	private Double credit;
	private Set tests = new HashSet(0);
	private Set grades = new HashSet(0);

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** minimal constructor */
	public Subject(Integer id, Integer uid, Professional professional, String name, String nature, Double credit) {
		this.id = id;
		this.uid = uid;
		this.professional = professional;
		this.name = name;
		this.nature = nature;
		this.credit = credit;
	}

	/** full constructor */
	public Subject(Integer id, Integer uid, Professional professional, String name, String nature, Double credit,
			Set tests, Set grades) {
		this.id = id;
		this.uid = uid;
		this.professional = professional;
		this.name = name;
		this.nature = nature;
		this.credit = credit;
		this.tests = tests;
		this.grades = grades;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Professional getProfessional() {
		return this.professional;
	}

	public void setProfessional(Professional professional) {
		this.professional = professional;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNature() {
		return this.nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public Double getCredit() {
		return this.credit;
	}

	public void setCredit(Double credit) {
		this.credit = credit;
	}

	public Set getTests() {
		return this.tests;
	}

	public void setTests(Set tests) {
		this.tests = tests;
	}

	public Set getGrades() {
		return this.grades;
	}

	public void setGrades(Set grades) {
		this.grades = grades;
	}

}