package com.test.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Department;
import com.test.model.Subject;

public class SubjectDaoImp implements SubjectDao{
	private SessionFactory sessionFactory;
	private Session sess;
	private Transaction transaction;
	private void createsession(){
		sess=sessionFactory.openSession();
		transaction=sess.beginTransaction();
	}
	private void destory(){
		transaction.commit();
		sess.close();
		sessionFactory.close();
		
	}
	public SubjectDaoImp() {
		Configuration configuration=new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
		SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
		//sessionFactory
		this.sessionFactory=sessionFactory;	
	}
	@Override
	public Subject getSubjectByid(int sid) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Subject s where s.id="+sid);
		List<Subject> subjects=query.list();
		if(subjects.size()>0){
			session.close();
			return subjects.get(0);			
		}
		return null;
	}

	@Override
	public List<Subject> getSubjectByPid(int pid) {
		Session session=sessionFactory.openSession();
		Query query;
		if(pid==-1){
			query=session.createQuery("from Subject");
		}
		else{
			 query=session.createQuery("from Subject where professional.pid="+pid);
		}		
		List<Subject> subjects=query.list();
		session.close();
		return subjects;
	}

	@Override
	public boolean saveSubject(Subject subject) {
		try {
			createsession();
			sess.save(subject);
			destory();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean deleteSubjectByid(int sid) {
		createsession();
		String sql="delete from Subject where id="+sid;
		Query query=sess.createQuery(sql);
		if(query.executeUpdate()!=0){
			destory();
			return true;
		}
		return false;
	}

	@Override
	public boolean updateSubject(Subject subject) {
		try {
			createsession();
			sess.update(subject);
			destory();		
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	@Override
	public List<Subject> getSubjects() {
		Session session=sessionFactory.openSession();
		Query query;
		query=session.createQuery("from Subject");
		List<Subject> subjects=query.list();
		session.close();
		return subjects;
	}
	@Override
	public List<Subject> getSubjectByUid(int uid) {
		Session session=sessionFactory.openSession();
		Query query;
		String sql=null;
		if(uid==-1){
			sql="from Subject";
		}
		else{
			sql = "from Subject where uid="+uid;
		}
		System.out.println(sql);
		query=session.createQuery(sql);
		List<Subject> subjects=query.list();
		session.close();
		return subjects;
	}
	
}
