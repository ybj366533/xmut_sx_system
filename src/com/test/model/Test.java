package com.test.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Test entity. @author MyEclipse Persistence Tools
 */

public class Test implements java.io.Serializable {

	// Fields

	private Integer id;
	private Subject subject;
	private Integer testid;
	private String content;
	private Integer grade;
	private Integer answerid;
	private Set answers = new HashSet(0);

	// Constructors

	/** default constructor */
	public Test() {
	}

	/** minimal constructor */
	public Test(Integer testid, String content, Integer grade, Integer answerid) {
		this.testid = testid;
		this.content = content;
		this.grade = grade;
		this.answerid = answerid;
	}

	/** full constructor */
	public Test(Subject subject, Integer testid, String content, Integer grade,
			Integer answerid, Set answers) {
		this.subject = subject;
		this.testid = testid;
		this.content = content;
		this.grade = grade;
		this.answerid = answerid;
		this.answers = answers;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Integer getTestid() {
		return this.testid;
	}

	public void setTestid(Integer testid) {
		this.testid = testid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getGrade() {
		return this.grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Integer getAnswerid() {
		return this.answerid;
	}

	public void setAnswerid(Integer answerid) {
		this.answerid = answerid;
	}

	public Set getAnswers() {
		return this.answers;
	}

	public void setAnswers(Set answers) {
		this.answers = answers;
	}

}