package com.test.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Department;
import com.test.model.Professional;
import com.test.model.Student;
import com.test.model.StudentJson;
import com.test.model.Teacher;
import com.test.model.Users;
import com.test.model.UsersJson;
import com.test.service.Factory;

public class UserDaoImp implements UserDao {
	private SessionFactory sessionFactory;
	private Session sess;
	private Transaction transaction;

	private void createsession() {
		sess = sessionFactory.openSession();
		transaction = sess.beginTransaction();
	}
	
	private void destory() {
		transaction.commit();
		sess.close();
		sessionFactory.close();

	}

	public UserDaoImp() {
		Configuration configuration = new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties())
				.buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean select_user(Users user) {
		Configuration configuration = new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties())
				.buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();
		// Transaction transaction=session.beginTransaction();
		String sql = " from Users as u where u.loginId='" + user.getLoginId() + "' and u.loginPwd='"
				+ user.getLoginPwd() + "' and u.role='" + user.getRole() + "'";

		Query query = session.createQuery(sql);
		List<Users> alluser = query.list();
		// System.out.println(alluser);
		if (alluser.size() > 0) {
			session.close();
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Student select_studentByUid(int uid) {
		Session session = sessionFactory.openSession();
		String hsql = "from Student as s where s.uid=" + uid;
		Query query = session.createQuery(hsql);
		Student student = null;
		List<Student> students = query.list();
		session.close();
		if (students.size() > 0) {
			student = students.get(0);
			return student;
		} else {
			return student;
		}

	}

	@Override
	public Users getUserByLoginId(String LoginId) {
		Session session = sessionFactory.openSession();
		String sql = " from Users as u where u.loginId='" + LoginId + "'";
		Query query = session.createQuery(sql);
		List<Users> alluser = query.list();
		if (alluser.size() > 0) {
			session.close();
			return alluser.get(0);
		} else {
			return null;
		}

	}

	@Override
	public boolean updateStudent(Student student) {
		try {
			createsession();
			sess.update(student);
			destory();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public int saveUsers(Users user) {
		int uid = -1;
		try {
			createsession();
			sess.save(user);
			uid = user.getId();
			destory();
			return uid;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return uid;
	}

	@Override
	public int saveStudent(Student student) {
		int id = -1;
		try {
			createsession();
			sess.save(student);
			id = student.getId();
			destory();
			return id;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}

	@Override
	public List<Student> getAllStudents() {
		Session session = sessionFactory.openSession();
		String sql = " from Student";
		Query query = session.createQuery(sql);
		List<Student> alluser = query.list();
		if (alluser.size() > 0) {
			session.close();
			return alluser;
		} else {
			return null;
		}
	}

	@Override
	public List<StudentJson> getAllstudentJson() {
		createsession();
		String sql = " from Student";
		Query query = sess.createQuery(sql);
		List<Student> alluser = query.list();
		List<StudentJson> studentJsons = new ArrayList<StudentJson>();
		if (alluser.size() > 0) {
			for (Student student : alluser) {
				StudentJson studentJson = new StudentJson();
				studentJson.setAge(student.getAge().toString());
				Department department = Factory.getDepartmentManage().getDepartMentById(student.getDepartment());
				Professional professional = Factory.getProfessionalManage()
						.getProFeProfessionalById(student.getProfessionalId());
				studentJson.setDepartment(department.getDname());
				studentJson.setId(student.getId());
				studentJson.setName(student.getName());
				studentJson.setProfessional(professional.getPname());
				studentJson.setSex(student.getSex());
				studentJson.setXh(student.getXh());
				studentJsons.add(studentJson);
			}
			destory();
			return studentJsons;
		} else {
			return null;
		}
	}

	@Override
	public Student getstudentByUid(int uid) {
		Session session = sessionFactory.openSession();
		String sql = " from Student as s where s.uid='" + uid + "'";
		Query query = session.createQuery(sql);
		List<Student> alluser = query.list();
		if (alluser.size() > 0) {
			session.close();
			return alluser.get(0);
		} else {
			return null;
		}
	}

	@Override
	public boolean deleteStudent(Student student) {
		createsession();
		String sql = "delete from Student where id=" + student.getId();
		Query query = sess.createQuery(sql);
		if (query.executeUpdate() != 0) {
			destory();
			return true;
		}
		destory();
		return false;
	}

	@Override
	public boolean deleteuser(int uid) {
		createsession();
		String sql = "delete from Users where id=" + uid;
		Query query = sess.createQuery(sql);
		if (query.executeUpdate() != 0) {
			destory();
			return true;
		}
		destory();
		return false;
	}

	@Override
	public List<UsersJson> select_userList() {

		Session session = sessionFactory.openSession();
		// Transaction transaction=session.beginTransaction();
		String sql = "from Users";
		Query query = session.createQuery(sql);
		List<Users> alluser = query.list();
		List<UsersJson> usersJsons = new ArrayList<UsersJson>();
		if (alluser.size() > 0) {
			for (Users users : alluser) {
				UsersJson usersJson = new UsersJson();
				usersJson.setUid(users.getId());
				usersJson.setUserName(users.getLoginId());
				usersJson.setMobile(users.getMobile());
				usersJson.setRole(users.getRole());
				usersJson.setEmail(users.getEmail());
				usersJsons.add(usersJson);
			}
			session.close();
			return usersJsons;
		} else {
			return null;
		}
	}

	@Override
	public List<UsersJson> select_user(String uid) {

		Session session = sessionFactory.openSession();
		// Transaction transaction=session.beginTransaction();
		String sql = "from Users where LoginId like'%" + uid + "%'";
		Query query = session.createQuery(sql);
		List<Users> alluser = query.list();
		List<UsersJson> usersJsons = new ArrayList<UsersJson>();
		if (alluser.size() > 0) {
			for (Users users : alluser) {
				UsersJson usersJson = new UsersJson();
				usersJson.setUid(users.getId());
				usersJson.setUserName(users.getLoginId());
				usersJson.setMobile(users.getMobile());
				usersJson.setRole(users.getRole());
				usersJson.setEmail(users.getEmail());
				usersJsons.add(usersJson);
			}
			session.close();
			return usersJsons;
		} else {
			return null;
		}
	}

	@Override
	public UsersJson selectUserByLoginId(String uid) {
		// TODO Auto-generated method stub

		Session session = sessionFactory.openSession();
		// Transaction transaction=session.beginTransaction();

		String sql = " from Users as u where u.id='" + uid + "'";
		Query query = session.createQuery(sql);
		List<Users> alluser = query.list();
		UsersJson usersJson = new UsersJson();
		if (alluser.size() > 0) {
			usersJson.setUid(alluser.get(0).getId());
			usersJson.setUserName(alluser.get(0).getLoginId());
			usersJson.setMobile(alluser.get(0).getMobile());
			usersJson.setRole(alluser.get(0).getRole());
			usersJson.setEmail(alluser.get(0).getEmail());
			System.out.println(usersJson.getUserName());
			session.close();
			return usersJson;
		} else {
			return null;
		}
	}

	@Override
	public boolean updateUser(Users users) {
		try {
			System.out.println("aaa");
			
	        Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        session.update(users);
	        transaction.commit();
	        session.close();
			sessionFactory.close();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public Teacher getTeacherById(int uid) {
		// TODO Auto-generated method stub

		Session session = sessionFactory.openSession();
		String sql = " from Teacher as s where s.uid='" + uid + "'";
		Query query = session.createQuery(sql);
		List<Teacher> alluser = query.list();
		if (alluser.size() > 0) {
			session.close();
			return alluser.get(0);
		} else {
			return null;
		}
	}

	@Override
	public int saveTeacher(Teacher teacher) {
		int id = -1;
		try {
			createsession();
			sess.save(teacher);
			id = teacher.getId();
			destory();
			return id;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}

	@Override
	public UsersJson selectUserByuid(int uid) {
		// TODO Auto-generated method stub

		Session session = sessionFactory.openSession();
		// Transaction transaction=session.beginTransaction();

		String sql = " from Users as u where u.id='" + uid + "'";
		Query query = session.createQuery(sql);
		List<Users> alluser = query.list();
		UsersJson usersJson = new UsersJson();
		if (alluser.size() > 0) {
			usersJson.setUid(alluser.get(0).getId());
			usersJson.setUserName(alluser.get(0).getLoginId());
			usersJson.setMobile(alluser.get(0).getMobile());
			usersJson.setRole(alluser.get(0).getRole());
			usersJson.setEmail(alluser.get(0).getEmail());
			System.out.println(usersJson.getUserName());
			session.close();
			return usersJson;
		} else {
			return null;
		}
	}

}
