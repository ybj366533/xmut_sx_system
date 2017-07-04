package com.test.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.hibernate.type.descriptor.java.UUIDTypeDescriptor;

import com.opensymphony.xwork2.ActionSupport;
import com.test.dao.UserDao;
import com.test.dao.UserDaoImp;
import com.test.model.Student;
import com.test.model.StudentJson;
import com.test.model.Subject;
import com.test.model.Teacher;
import com.test.model.Users;
import com.test.service.Factory;
import com.test.service.UserManageImp;

public class userAction extends ActionSupport {
	private String opt;

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	@Override
	public String execute() throws Exception {
		// HttpServletRequest request=ServletActionContext.getRequest();
		if (opt == null) {
			return NONE;
		}
		System.out.println("!!!!!" + opt);
		if (opt.equals("login")) {
			return login();
		} else if (opt.equals("forget")) {
			return forget();
		} else if (opt.equals("logout")) {
			return logout();
		} else if (opt.equals("addusers")) {
			return addUsers();
		} else if (opt.equals("updatesusers")) {
			return updatesusers();
		} else if (opt.equals("deleteusers")) {
			return deleteUser();
		} else if (opt.equals("addteacher")) {
			return addteacher();
		} else if (opt.equals("updatesteacher")) {

		} else if (opt.equals("deleteteacher")) {

		} else if (opt.equals("updatestudent")) {
			return updatestudent();
		} else if (opt.equals("addstudent")) {
			return addstudent();
		} else if (opt.equals("getStudents")) {
			return getStudents();
		} else if (opt.equals("deleteStudent")) {
			return deleteStudent();
		} else if (opt.equals("updatebigstudent")) {
			return updateBigStudent();
		}
		return NONE;
	}

	public String updatestudent() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String age = request.getParameter("age");
		String department = request.getParameter("department");
		String professional = request.getParameter("professional");
		System.out.println(age + department + professional);
		HttpSession session = request.getSession();
		if (session.getAttribute("student") != null) {
			Student student = (Student) session.getAttribute("student");
			student.setAge(Integer.parseInt(age));
			student.setDepartment(Integer.parseInt(department));
			student.setProfessionalId(Integer.parseInt(professional));
			HttpServletResponse response = ServletActionContext.getResponse();
			PrintWriter pw = response.getWriter();

			if (Factory.getUserManageImp().updateStudent(student)) {

				session.setAttribute("student", student);
				pw.write("true");
			} else {

				pw.write("false");
			}
		}

		return NONE;
	}

	public String login() {
		UserManageImp userManage = Factory.getUserManageImp();
		Users user = new Users();
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("u_name");
		String password = request.getParameter("password");
		user.setLoginId(name);
		user.setLoginPwd(password);
		String role = request.getParameter("role");
		// Role用户权限 0:管理员 1:老师 2:学生

		if (role != null) {
			if (role.equals("2")) {
				user.setRole("student");
			} else if (role.equals("1")) {
				user.setRole("teacher");
			} else if (role.equals("0")) {
				user.setRole("admin");
			} else {
				user.setRole("student");
			}
		} else {
			user.setRole("student");
		}

		if (userManage.select_user(user)) {
			if (role.equals("2")) {
				Users account = Factory.getUserManageImp().getUserByLoginId(user.getLoginId());
				Student student = Factory.getUserManageImp().select_studentByUid(account.getId());
				HttpSession session = request.getSession();
				session.setAttribute("student", student);
				session.setAttribute("professional",
						Factory.getProfessionalManage().getProFeProfessionalById(student.getProfessionalId()));
				session.setAttribute("department",
						Factory.getDepartmentManage().getDepartMentById(student.getDepartment()));
				List<Subject> subjects = Factory.getSubjectManage().getSubjectByPid(student.getProfessionalId());
				session.setAttribute("subjects", subjects);
				//
				session.setAttribute("currentsubject", subjects.get(0));
				session.setAttribute("users", account);
				return "student";
			} else if (role.equals("1")) {
				Users users = Factory.getUserManageImp().getUserByLoginId(user.getLoginId());
				Teacher teacher = Factory.getUserManageImp().getTeacherById(users.getId());
				HttpSession session = request.getSession();
				session.setAttribute("teacher", teacher);
				session.setAttribute("department",
						Factory.getDepartmentManage().getDepartMentById(teacher.getDepartment()));
				session.setAttribute("users", users);
				return "teacher";
			} else {
				Users users = Factory.getUserManageImp().getUserByLoginId(user.getLoginId());
				HttpSession session = request.getSession();
				session.setAttribute("admin", users);
				return "admin";
			}
		} else {
			return "FALSE";
		}
	}

	public String forget()  throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		System.out.println("u_name:"+name);
		String password = request.getParameter("password");
		System.out.println("password:"+password);
		String text = request.getParameter("ctext");
		System.out.println("text:"+text);
		
		if (null==name||"".equals(name)||null==text||"".equals(text)) {
			pw.print("false");
			return NONE;
		}else {
			Users users = Factory.getUserManageImp().getUserByLoginId(name);
				String mobile = users.getMobile();
				System.out.println("11"+mobile);
				if (text.equals(mobile)) {
					users.setLoginPwd(password);
					boolean isok = Factory.getUserManageImp().updateUsers(users);
					if (isok) {
						System.out.println("ok");
						pw.print("true");
					}else {
						pw.print("false");
					}
				}else {
					pw.print("false");
				}
		}
		pw.close();
		return "FALSE";
	}
	public String logout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("admin") != null) {
			session.removeAttribute("admin");
		}
		if (session.getAttribute("teacher") != null) {
			session.removeAttribute("admin");
		}
		if (session.getAttribute("student") != null) {
			session.removeAttribute("student");
		}
		return "logout";
	}

	public void getStudent() {

	}

	public String addstudent() throws IOException {

		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		String loginId = request.getParameter("loginId");
		System.out.println("LoginId" + loginId);
		String password = request.getParameter("password");
		System.out.println("password" + password);
		String mobile = request.getParameter("mobile");
		System.out.println("mobile" + mobile);
		String email = request.getParameter("email");
		System.out.println("email" + email);
		String name = request.getParameter("name");
		System.out.println("name" + name);
		int professionalId = Integer.parseInt(request.getParameter("professional"));
		System.out.println("professionalId" + professionalId);
		int departmentId = Integer.parseInt(request.getParameter("department"));
		System.out.println("department" + departmentId);
		int xh = Integer.parseInt(request.getParameter("xh"));
		System.out.println("xh" + xh);
		String sex = request.getParameter("sex");
		System.out.println("sex" + sex);
		int age = Integer.parseInt(request.getParameter("age"));
		int tiketId = Integer.parseInt(request.getParameter("tiketId"));
		System.out.println("tiketId" + tiketId);

		Student student = new Student();
		student.setAge(age);
		student.setDepartment(departmentId);
		student.setName(name);
		student.setProfessionalId(professionalId);
		student.setSex(sex);
		student.setXh(xh);
		student.setTiketId(tiketId);

		Users user = new Users();
		user.setLoginId(loginId);
		user.setLoginPwd(password);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setRole("student");
		int uid = Factory.getUserManageImp().saveusers(user);
		// 添加登陆账号
		System.out.println("UserId" + uid);
		if (uid == -1) {
			pw.print("false");
			return NONE;
		}
		student.setUid(uid);
		if (Factory.getUserManageImp().saveStudent(student) != -1) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		pw.close();
		return NONE;
	}

	public String addteacher() throws IOException {

		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		String loginId = request.getParameter("loginId");
		System.out.println("LoginId" + loginId);
		String password = request.getParameter("password");
		System.out.println("password" + password);
		String mobile = request.getParameter("mobile");
		System.out.println("mobile" + mobile);
		String email = request.getParameter("email");
		System.out.println("email" + email);
		String name = request.getParameter("name");
		System.out.println("name" + name);
		int departmentId = Integer.parseInt(request.getParameter("department"));
		System.out.println("department" + departmentId);
		String cid = request.getParameter("cid");
		System.out.println("cid" + cid);
		String sex = request.getParameter("sex");
		System.out.println("sex" + sex);
		int age = Integer.parseInt(request.getParameter("age"));
		System.out.println("age" + age);
		Teacher teacher = new Teacher();
		teacher.setName(name);
		teacher.setSex(sex);
		teacher.setAge(age);
		teacher.setDepartment(departmentId);
		teacher.setCid(cid);

		Users user = new Users();
		user.setLoginId(loginId);
		user.setLoginPwd(password);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setRole("teacher");
		int uid = Factory.getUserManageImp().saveusers(user);
		// 添加登陆账号
		System.out.println("UserId" + uid);
		if (uid == -1) {
			pw.print("false");
			return NONE;
		}
		teacher.setUid(uid);
		if (Factory.getUserManageImp().saveTeacher(teacher) != -1) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		pw.close();
		return NONE;
	}

	public String getStudents() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		List<StudentJson> studentJsons = Factory.getUserManageImp().getAllstudentJson();
		JSONArray studentArray = new JSONArray().fromObject(studentJsons);
		pw.print(studentArray);
		pw.close();
		return NONE;
	}

	public String deleteStudent() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		//
		int uid = Integer.parseInt(request.getParameter("id"));
		Student student = Factory.getUserManageImp().getstudentByUid(uid);
		if (Factory.getUserManageImp().deleteStudent(student)) {
			if (Factory.getUserManageImp().deleteuser(uid)) {
				pw.print("true");
			} else {
				pw.print("false");
			}
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String updateBigStudent() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		System.out.println("name" + name);
		int professionalId = Integer.parseInt(request.getParameter("professional"));
		System.out.println("professionalId" + professionalId);
		int departmentId = Integer.parseInt(request.getParameter("department"));
		System.out.println("department" + departmentId);
		int xh = Integer.parseInt(request.getParameter("xh"));
		System.out.println("xh" + xh);
		String sex = request.getParameter("sex");
		System.out.println("sex" + sex);

		int age = Integer.parseInt(request.getParameter("age"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		Student student = Factory.getUserManageImp().getstudentByUid(uid);
		student.setAge(age);
		student.setDepartment(departmentId);
		student.setName(name);
		student.setProfessionalId(professionalId);
		student.setSex(sex);
		student.setXh(xh);

		if (Factory.getUserManageImp().updateStudent(student)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		pw.close();
		return NONE;
	}

	public String addUsers() throws IOException {

		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		String loginId = request.getParameter("loginId");
		System.out.println("LoginId" + loginId);
		String password = request.getParameter("password");
		System.out.println("password" + password);
		String mobile = request.getParameter("mobile");
		System.out.println("mobile" + mobile);
		String email = request.getParameter("email");
		System.out.println("email" + email);

		Users user = new Users();
		user.setLoginId(loginId);
		user.setLoginPwd(password);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setRole("admin");

		int uid = Factory.getUserManageImp().saveusers(user);
		if (uid == -1) {
			pw.print("false");
			return NONE;
		} else {
			pw.print("true");
		}
		pw.close();
		return NONE;
	}

	public String updatesusers() throws IOException {

		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		response.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String loginId = request.getParameter("loginId");
		System.out.println("LoginId" + loginId);
		String password = request.getParameter("password");
		System.out.println("password" + password);
		String mobile = request.getParameter("mobile");
		System.out.println("mobile" + mobile);
		String email = request.getParameter("email");
		System.out.println("email" + email);
		String role = request.getParameter("role");
		System.out.println("role" + role);

		Users user = Factory.getUserManageImp().getUserByLoginId(loginId);
		user.setId(id);
		user.setLoginId(loginId);
		user.setLoginPwd(password);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setRole(role);

		if (Factory.getUserManageImp().updateUsers(user)) {
			pw.print("false");
			return NONE;
		} else {
			pw.print("true");
		}
		pw.close();
		return NONE;
	}

	public String deleteUser() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		int uid = Integer.parseInt(request.getParameter("id"));
		if (Factory.getUserManageImp().deleteuser(uid)) {
			pw.print("true");
		} else {
			pw.print("false");
		}

		return NONE;
	}
}
