package com.test.model;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer uid;
	private String name;
	private Integer professionalId;
	private Integer department;
	private Integer xh;
	private String sex;
	private Integer tiketId;
	private Integer age;

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(Integer uid, String name, Integer professionalId,
			Integer department, Integer xh, String sex, Integer tiketId,
			Integer age) {
		this.uid = uid;
		this.name = name;
		this.professionalId = professionalId;
		this.department = department;
		this.xh = xh;
		this.sex = sex;
		this.tiketId = tiketId;
		this.age = age;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getProfessionalId() {
		return this.professionalId;
	}

	public void setProfessionalId(Integer professionalId) {
		this.professionalId = professionalId;
	}

	public Integer getDepartment() {
		return this.department;
	}

	public void setDepartment(Integer department) {
		this.department = department;
	}

	public Integer getXh() {
		return this.xh;
	}

	public void setXh(Integer xh) {
		this.xh = xh;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getTiketId() {
		return this.tiketId;
	}

	public void setTiketId(Integer tiketId) {
		this.tiketId = tiketId;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

}