package com.test.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.test.model.Student;
import com.test.model.StudentJson;
import com.test.model.Teacher;
import com.test.model.Users;
import com.test.model.UsersJson;

@Component("usermanageimp")
public class UserManageImp {

	public boolean select_user(Users user) {
		return Factory.getUserDao().select_user(user);
	}

	public List<UsersJson> select_userList() {
		return Factory.getUserDao().select_userList();
	}

	public List<UsersJson> select_userList(String txt) {
		return Factory.getUserDao().select_user(txt);
	}

	public UsersJson selectUserByLoginId(String txt) {
		return Factory.getUserDao().selectUserByLoginId(txt);
	}
	public UsersJson selectUserByUId(int uid) {
		return Factory.getUserDao().selectUserByuid(uid);
	}
	public Student select_studentByUid(int uid) {
		return Factory.getUserDao().select_studentByUid(uid);
	}

	public Users getUserByLoginId(String LoginId) {
		return Factory.getUserDao().getUserByLoginId(LoginId);
	}

	public boolean updateStudent(Student student) {
		return Factory.getUserDao().updateStudent(student);
	}
	public boolean updateUsers(Users users) {
		return Factory.getUserDao().updateUser(users);
	}

	public int saveusers(Users user) {
		return Factory.getUserDao().saveUsers(user);
	}

	public int saveStudent(Student student) {
		return Factory.getUserDao().saveStudent(student);
	}

	public int saveTeacher(Teacher teacher) {
		return Factory.getUserDao().saveTeacher(teacher);
	}

	public List<Student> getAllStudents() {
		return Factory.getUserDao().getAllStudents();
	}

	public List<StudentJson> getAllstudentJson() {
		return Factory.getUserDao().getAllstudentJson();
	}

	public Student getstudentByUid(int uid) {
		return Factory.getUserDao().getstudentByUid(uid);
	}

	// 删除学生信息
	public boolean deleteStudent(Student student) {
		return Factory.getUserDao().deleteStudent(student);
	}

	public boolean deleteuser(int uid) {
		return Factory.getUserDao().deleteuser(uid);
	}

	public Teacher getTeacherById(int uid) {
		return Factory.getUserDao().getTeacherById(uid);
	}

}
