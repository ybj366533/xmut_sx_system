package com.test.dao;

import java.util.List;

import com.test.model.Student;
import com.test.model.StudentJson;
import com.test.model.Teacher;
import com.test.model.Users;
import com.test.model.UsersJson;

public interface UserDao {
	/**
	 * 查询用户
	 * 
	 * @param user
	 * @return
	 */
	public boolean select_user(Users user);

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<UsersJson> select_userList();

	/**
	 * 查询用户 返回用户信息
	 * 
	 * @return
	 */
	public List<UsersJson> select_user(String uid);

	/**
	 * 查询用户 返回用户信息
	 * 
	 * @return
	 */
	public UsersJson selectUserByLoginId(String uid);
	
	public UsersJson selectUserByuid(int uid);

	/**
	 * 更新用户信息
	 * 
	 * @param student
	 * @return
	 */
	public boolean updateUser(Users users);

	/**
	 * @param LoginId
	 * @return
	 */
	public Users getUserByLoginId(String LoginId);

	public Teacher getTeacherById(int uid);

	public Student select_studentByUid(int uid);

	/**
	 * 更新学生信息
	 * 
	 * @param student
	 * @return
	 */
	public boolean updateStudent(Student student);

	public int saveUsers(Users user);

	public int saveStudent(Student student);

	public int saveTeacher(Teacher teacher);

	public List<Student> getAllStudents();

	public List<StudentJson> getAllstudentJson();

	// 查询单个学生用户
	public Student getstudentByUid(int uid);

	// 删除学生用户
	public boolean deleteStudent(Student student);

	public boolean deleteuser(int uid);
}
