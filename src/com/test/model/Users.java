package com.test.model;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer id;
	private String loginId;
	private String loginPwd;
	private String role; // 0:管理员 1:老师 2:学生
	private String mobile;//电话号码
	private String email;//邮箱
	// Constructors

	/** default constructor */
	public Users() {
	}

	/** full constructor */
	public Users(String loginId, String loginPwd, String role, String mobile) {
		this.loginId = loginId;
		this.loginPwd = loginPwd;
		this.role = role;
		this.mobile = mobile;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginId() {
		return this.loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPwd() {
		return this.loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}