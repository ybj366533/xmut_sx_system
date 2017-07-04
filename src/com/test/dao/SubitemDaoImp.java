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
import com.test.model.Subitem;
import com.test.model.SubitemJson;
import com.test.model.Subject;
import com.test.model.Teacher;
import com.test.model.Users;
import com.test.service.Factory;

public class SubitemDaoImp implements SubitemDao {
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

	public SubitemDaoImp() {
		Configuration configuration = new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties())
				.buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		// sessionFactory
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Subitem getSubitemByid(int sid) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from subitem s where s.id=" + sid);
		List<Subitem> subjects = query.list();
		if (subjects.size() > 0) {
			session.close();
			return subjects.get(0);
		}
		return null;
	}

	@Override
	public List<Subitem> getSubitemByPid(int pid) {
		Session session = sessionFactory.openSession();
		Query query;
		if (pid == -1) {
			query = session.createQuery("from Subitem");
		} else {
			query = session.createQuery("from Subitem where pid=" + pid);
		}
		System.out.println(query);
		List<Subitem> subjects = query.list();
		session.close();
		return subjects;
	}

	@Override
	public boolean saveSubitem(Subitem subitem) {
		try {
			createsession();
			sess.save(subitem);
			destory();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean deleteSubitemByid(int sid) {
		createsession();
		String sql = "delete from Subitem where id=" + sid;
		Query query = sess.createQuery(sql);
		if (query.executeUpdate() != 0) {
			destory();
			return true;
		}
		return false;
	}

	@Override
	public boolean updateSubitem(Subitem subitem) {
		try {
			createsession();
			sess.update(subitem);
			destory();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public List<Subitem> getSubitem() {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Subitem");
		List<Subitem> subjects = query.list();
		session.close();
		return subjects;
	}

	@Override
	public List<SubitemJson> getSubitemJsonByPid(int pid) {

		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Subitem where pid=" + pid);
		System.out.println(query);
		List<Subitem> subjects = query.list();
		System.out.println(query.list().size());
		List<SubitemJson> subitemJsons = new ArrayList<SubitemJson>();
		for (int i = 0; i < subjects.size(); i++) {
			SubitemJson subitemJson = new SubitemJson();
			subitemJson.setAddress(subjects.get(i).getAddress());
			String days = subjects.get(i).getDays();
			System.out.println("qq"+days);
			subitemJson.setDays(days);
			String number = subjects.get(i).getNumber();
			subitemJson.setNumber(number);
			subitemJson.setMkey(days+number);
			subitemJson.setPid(subjects.get(i).getPid());
			Subject subject = Factory.getSubjectManage().getSubjectByid(subjects.get(i).getSubject().getId());
			subitemJson.setSubjectname(subject.getName());
			//Teacher teacher = Factory.getUserManageImp().getTeacherById(subject.getUid());
			//subitemJson.setTeacherName(teacher.getName());
			subitemJsons.add(subitemJson);
		}
		session.close();
		return subitemJsons;
	}

	@Override
	public List<SubitemJson> getSubitemJsonByUid(int uid) {
		Session session = sessionFactory.openSession();
		Query query;
		query = session.createQuery("from Subitem where subject.uid=" + uid);
		System.out.println(query);
		List<Subitem> subjects = query.list();
		System.out.println(query.list().size());
		List<SubitemJson> subitemJsons = new ArrayList<SubitemJson>();
		for (int i = 0; i < subjects.size(); i++) {
			SubitemJson subitemJson = new SubitemJson();
			subitemJson.setAddress(subjects.get(i).getAddress());
			String days = subjects.get(i).getDays();
			System.out.println("qq"+days);
			subitemJson.setDays(days);
			String number = subjects.get(i).getNumber();
			subitemJson.setNumber(number);
			subitemJson.setMkey(days+number);
			subitemJson.setPid(subjects.get(i).getPid());
			Subject subject = Factory.getSubjectManage().getSubjectByid(subjects.get(i).getSubject().getId());
			subitemJson.setSubjectname(subject.getName());
			//Teacher teacher = Factory.getUserManageImp().getTeacherById(subject.getUid());
			//subitemJson.setTeacherName(teacher.getName());
			subitemJsons.add(subitemJson);
		}
		session.close();
		return subitemJsons;
	}

}
