package com.test.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.test.model.Answer;
import com.test.model.Department;
import com.test.model.Grade;
import com.test.model.GradeJSon;
import com.test.model.Placard;
import com.test.model.Professional;
import com.test.model.Student;
import com.test.model.StudentJson;
import com.test.model.Subitem;
import com.test.model.Subject;
import com.test.model.Test;
import com.test.model.Users;
import com.test.model.Works;
import com.test.service.Factory;

public class TestAction extends ActionSupport {
	private String opt;

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("opt" + opt);
		if (opt == null) {
			return NONE;
		}
		if (opt.equals("gettests")) {
			return gettests();
		} else if (opt.equals("savegrade")) {
			return savegrade();
		} else if (opt.equals("getscore")) {
			return getscore();
		} else if (opt.equals("postgrade")) {
			return postgrade();
		} else if (opt.equals("getSubjects")) {
			return getSubjects();
		} else if (opt.equals("saveSubject")) {
			return saveSubject();
		} else if (opt.equals("deletegrade")) {
			return deletegrade();
		} else if (opt.equals("deletesubject")) {
			return deletesubject();
		} else if (opt.equals("savetest")) {
			return saveTest();
		} else if (opt.equals("updatetest")) {
			return updateTest();
		} else if (opt.equals("gettestsbysid")) {
			return gettestsBySid();
		} else if (opt.equals("deletetest")) {
			return deletetest();
		} else if (opt.equals("savePlacard")) {
			System.out.println("opt" + opt);
			return savePlacard();
		} else if (opt.equals("saveprofessional")) {
			return saveProfessional();
		} else if (opt.equals("deleteprofessional")) {
			return deleteProfessional();
		} else if (opt.equals("savesubject")) {
			return saveSubject();
		} else if (opt.equals("savesubitem")) {
			return saveSubitem();
		} else if (opt.equals("saveWorks")) {
			return saveWorks();
		} else if (opt.equals("savemGrade")) {
			return savemGrade();
		} else if (opt.equals("updateGrade")) {
			return updateGrade();
		}
		return super.execute();
	}

	public String gettests() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session.getAttribute("currentsubject") == null) {
			return NONE;
		}
		Subject subject = (Subject) session.getAttribute("currentsubject");
		JSONArray result = Factory.getTestManage().getTestBySidJson(subject.getId());
		System.out.println(result);
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(result);
		pw.close();
		return NONE;
	}

	public String gettestsBySid() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		int sid = -1;
		if (request.getParameter("sid") != null) {
			sid = Integer.parseInt(request.getParameter("sid"));
		}
		JSONArray result = Factory.getTestManage().getTestBySidJson(sid);
		System.out.println(result);
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(result);
		pw.close();
		return NONE;
	}

	public String updateGrade() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		float currentgrade = Float.parseFloat(request.getParameter("count"));
		Grade grade = new Grade();

		//
		System.out.println("sid" + request.getParameter("sid"));
		int currentsubjectId = Integer.parseInt(request.getParameter("sid"));
		String studentId = request.getParameter("uid");
		Subject subject = new Subject();
		subject.setId(currentsubjectId);
		if (studentId != null) {
			Users users = Factory.getUserManageImp().getUserByLoginId(studentId);
			Student student = Factory.getUserManageImp().getstudentByUid(users.getId());
			grade.setStudent(student);
		}
		grade.setTime(new Date());
		grade.setScore(currentgrade);
		grade.setSubject(subject);
		PrintWriter pw = response.getWriter();

		if (Factory.getGradeManage().updateGrade(grade)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		pw.close();
		return NONE;
	}

	public String savemGrade() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		float currentgrade = Float.parseFloat(request.getParameter("count"));
		Grade grade = new Grade();
		//
		int currentsubjectId = Integer.parseInt(request.getParameter("sid"));
		String studentId = request.getParameter("uid");
		Subject subject = new Subject();
		subject.setId(currentsubjectId);
		if (studentId != null) {
			Users users = Factory.getUserManageImp().getUserByLoginId(studentId);
			Student student = Factory.getUserManageImp().getstudentByUid(users.getId());
			grade.setStudent(student);
		}
		grade.setTime(new Date());
		grade.setScore(currentgrade);
		grade.setSubject(subject);
		PrintWriter pw = response.getWriter();

		if (Factory.getGradeManage().saveGrade(grade)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		pw.close();
		return NONE;
	}

	public String savegrade() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		float currentgrade = Float.parseFloat(request.getParameter("grade"));
		Grade grade = new Grade();
		//
		int currentsubjectId = 0;
		if (session.getAttribute("currentsubject") != null) {
			currentsubjectId = Integer.parseInt(session.getAttribute("currentsubject").toString());
		}
		Subject subject = new Subject();
		subject.setId(currentsubjectId);
		if (session.getAttribute("student") != null) {
			Student student = (Student) session.getAttribute("student");
			grade.setStudent(student);
		}
		grade.setTime(new Date());
		grade.setScore(currentgrade);
		grade.setSubject(subject);
		PrintWriter pw = response.getWriter();

		if (Factory.getGradeManage().saveGrade(grade)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		pw.close();
		return NONE;
	}

	public String getscore() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		List<GradeJSon> gradeJSons = Factory.getGradeManage().getAllGradeJSON();
		JSONArray grades = new JSONArray().fromObject(gradeJSons);
		pw.print(grades.toString());
		System.out.println(grades.toString());
		return NONE;
	}

	public String postgrade() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		float score = Float.parseFloat(request.getParameter("grade"));
		Grade grade = new Grade();
		grade.setScore(score);
		Student student = (Student) session.getAttribute("student");
		Subject subject = (Subject) session.getAttribute("currentsubject");
		grade.setStudent(student);
		grade.setSubject(subject);
		grade.setTime(new Date());
		if (Factory.getGradeManage().saveGrade(grade)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String deletegrade() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		//
		int id = Integer.parseInt(request.getParameter("id"));
		if (Factory.getGradeManage().deleteGradeByid(id)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String deletesubject() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		//
		int id = Integer.parseInt(request.getParameter("id"));
		if (Factory.getSubjectManage().deleteSubjectByid(id)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String getSubjects() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		List<Subject> subjects = Factory.getSubjectManage().getSubjectByPid(-1);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "professional", "tests", "grades" });
		JSONArray grades = new JSONArray().fromObject(subjects, jsonConfig);
		pw.print(grades.toString());
		System.out.println(grades.toString());
		return NONE;
	}

	public String saveSubject() throws IOException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		System.out.println("pid" + request.getParameter("pid"));

		String uid = request.getParameter("uid");
		int pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println("pid" + pid);
		Subject subject = new Subject();
		Professional professional = new Professional();
		professional.setPid(pid);
		String name = request.getParameter("name");
		System.out.println("name" + name);
		String nature = request.getParameter("nature");
		System.out.println("nature" + nature);
		Users users = Factory.getUserManageImp().getUserByLoginId(uid);
		Double credit = Double.parseDouble(request.getParameter("credit"));
		System.out.println("credit" + credit);
		subject.setCredit(credit);
		subject.setUid(users.getId());
		subject.setName(name);
		subject.setNature(nature);
		subject.setProfessional(professional);

		if (Factory.getSubjectManage().saveSubject(subject)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String saveSubitem() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();

		int pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println("pid" + pid);
		int sid = Integer.parseInt(request.getParameter("sid"));
		System.out.println("sid" + sid);
		String days = request.getParameter("days");
		String number = request.getParameter("number");
		String address = request.getParameter("address");
		System.out.println("address" + address);
		Subject subject = Factory.getSubjectManage().getSubjectByid(sid);
		Subitem subitem = new Subitem();
		subitem.setPid(pid);
		subitem.setDays(days);
		subitem.setNumber(number);
		subitem.setAddress(address);
		subitem.setSubject(subject);
		boolean isok = Factory.getSubitemManage().saveSubitem(subitem);
		if (isok) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String saveTest() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		int sid = Integer.parseInt(request.getParameter("sid"));
		String content = request.getParameter("content");
		int option = Integer.parseInt(request.getParameter("option"));
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		String c = request.getParameter("c");
		String d = request.getParameter("d");
		ArrayList answers = new ArrayList();
		answers.add(a);
		answers.add(b);
		answers.add(c);
		answers.add(d);
		Test test = new Test();
		test.setAnswerid(0);
		test.setContent(content);
		test.setGrade(2);
		test.setTestid(0);
		Subject subject = Factory.getSubjectManage().getSubjectByid(sid);
		test.setSubject(subject);
		int tesid = Factory.getTestManage().saveTest(test);
		if (tesid == -1) {
			pw.print("false");
			return NONE;
		}
		System.out.println("ID" + tesid);
		int i = 0;
		for (Object one : answers) {
			Answer answer = new Answer();
			Test test1 = new Test();
			test1.setId(tesid);
			answer.setTest(test);
			answer.setContent(one.toString());
			int anId = Factory.getAnswerManage().saveanswer(answer);

			if (anId == -1) {
				pw.print("false");
				return NONE;
			}
			if (i == option) {
				Test test2 = Factory.getTestManage().getTestById(tesid);
				test2.setAnswerid(anId);
				Factory.getTestManage().updateTest(test2);
			}
			i++;
		}
		pw.print("true");
		return NONE;
	}

	public String updateTest() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		int tid = Integer.parseInt(request.getParameter("tid"));
		String content = request.getParameter("content");
		int option = Integer.parseInt(request.getParameter("option"));
		int sid = Integer.parseInt(request.getParameter("sid"));
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		String c = request.getParameter("c");
		String d = request.getParameter("d");
		ArrayList answers = new ArrayList();
		answers.add(a);
		answers.add(b);
		answers.add(c);
		answers.add(d);
		Test test = Factory.getTestManage().getTestById(tid);
		Subject subject = new Subject();
		subject.setId(sid);
		test.setAnswerid(option);
		test.setContent(content);
		test.setSubject(subject);
		if (!Factory.getTestManage().updateTest(test)) {
			pw.print("false");
			return NONE;
		}
		int i = 0;
		List<Answer> ansList = Factory.getAnswerManage().getAnswersBytid(tid);
		for (Object one : answers) {
			Answer answer = ansList.get(i);
			answer.setContent(one.toString());
			if (!Factory.getAnswerManage().updateanswer(answer)) {
				pw.print("false");
				return NONE;
			}
			i++;
		}
		pw.print("true");
		return NONE;
	}

	public String deletetest() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));

		if (Factory.getTestManage().deleteTestById(id)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}

	public String savePlacard() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		int uid = 23;
		String title = request.getParameter("title");
		System.out.println("title" + request.getParameter("title"));

		String content = request.getParameter("content");
		System.out.println("content" + request.getParameter("content"));
		Date time = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 可以方便地修改日期格式

		Placard placard = new Placard();
		placard.setUid(uid);
		System.out.println("uid" + uid);
		placard.setTitle(title);
		System.out.println("title" + title);
		placard.setContent(content);
		System.out.println("content" + content);
		placard.setTime(time);
		System.out.println("time" + time);
		int tesid = Factory.getPlacardManage().savePlacard(placard);
		if (tesid == -1) {
			pw.print("false");
			return NONE;
		}
		System.out.println("ID" + tesid);
		pw.print("true");
		return NONE;
	}

	public String saveWorks() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		int uid = 30;
		String title = request.getParameter("title");
		System.out.println("title" + request.getParameter("title"));
		// int pid = Integer.parseInt(request.getParameter("pid"));
		int pid = 1;
		String content = request.getParameter("content");
		System.out.println("content" + request.getParameter("content"));
		Date time = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 可以方便地修改日期格式

		Works works = new Works();
		works.setUid(uid);
		System.out.println("uid" + uid);
		works.setTitle(title);
		System.out.println("title" + title);
		works.setContent(content);
		System.out.println("content" + content);
		works.setTime(time);
		works.setPid(pid);
		System.out.println("time" + time);
		int tesid = Factory.getWorksManage().saveWorks(works);
		if (tesid == -1) {
			pw.print("false");
			return NONE;
		}
		System.out.println("ID" + tesid);
		pw.print("true");
		return NONE;
	}

	public String saveProfessional() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();

		String pname = request.getParameter("pname");
		System.out.println("pname" + request.getParameter("pname"));
		int did = Integer.parseInt(request.getParameter("did"));
		String puid = request.getParameter("puid");
		int count = Integer.parseInt(request.getParameter("count"));

		Professional professional = new Professional();
		professional.setPname(pname);

		professional.setCount(count);
		Department department = Factory.getDepartmentManage().getDepartMentById(did);
		Users users = Factory.getUserManageImp().getUserByLoginId(puid);
		System.out.println("!!" + users.getId());
		professional.setPuid(users.getId());
		professional.setDepartment(department);
		boolean isok = Factory.getProfessionalManage().saveProfessional(professional);
		System.out.println("!!" + isok);
		if (isok) {
			pw.print("false");
			return NONE;
		}
		pw.print("true");
		return NONE;
	}

	public String deleteProfessional() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		System.out.println("id" + request.getParameter("id"));
		int id = Integer.parseInt(request.getParameter("id"));
		if (Factory.getProfessionalManage().deleteProfessionalByid(id)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}
	public String uploadFile() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		System.out.println("id" + request.getParameter("id"));

		int id = Integer.parseInt(request.getParameter("id"));

		if (Factory.getProfessionalManage().deleteProfessionalByid(id)) {
			pw.print("true");
		} else {
			pw.print("false");
		}
		return NONE;
	}


}
