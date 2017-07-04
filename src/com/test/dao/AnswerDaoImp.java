package com.test.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Answer;
import com.test.model.Department;

public class AnswerDaoImp implements AnswerDao{
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
	
	public AnswerDaoImp() {
		 Configuration configuration=new Configuration();
			configuration.configure();
			ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
			SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
			this.sessionFactory=sessionFactory;	
	}
	@Override
	public List<Answer> getanswers() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Answer");
		List<Answer> answers=query.list();
		session.close();
		return answers;
	}

	@Override
	public List<Answer> getAnswersBytid(int tid) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Answer  where test.id="+tid);
		List<Answer> answers=query.list();
			session.close();
			return answers;		
	}

	@Override
	public Answer getAnswerById(int id) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Answer d where d.id="+id);
		List<Answer> answers=query.list();
		if(answers.size()>0){
			session.close();
			return answers.get(0);			
		}
		return null;
	}

	@Override
	public int saveanswer(Answer answer) {
		int id=-1;
		try {
			createsession();
			sess.save(answer);
			id=answer.getId();
			destory();		
			return id;
		} catch (Exception e) {
		}
		return id;
	}

	@Override
	public boolean updateanswer(Answer answer) {
		try {
			createsession();
			sess.update(answer);
			destory();		
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean deleteanswer(Answer answer) {
		createsession();
		String sql="delete from Answer where id="+answer.getId();
		Query query=sess.createQuery(sql);
		if(query.executeUpdate()!=0){
			destory();
			return true;
		}
		return false;
	}

}
