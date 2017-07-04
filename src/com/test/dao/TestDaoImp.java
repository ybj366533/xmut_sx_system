package com.test.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.aspectj.weaver.ast.And;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Answer;
import com.test.model.Subject;
import com.test.model.Test;
import com.test.service.Factory;

public class TestDaoImp implements TestDao{
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
	public TestDaoImp() {
		Configuration configuration=new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
		SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
		//Ϊ��ǰ��sessionFactory��ֵ
		this.sessionFactory=sessionFactory;	
	}
	@Override
	public List<Test> getTestBySid(int sid) {
		Session session=sessionFactory.openSession();
		Query query;
		if(sid==-1){
			query=session.createQuery("from Test");
		}
		else{
			 query=session.createQuery("from Test where subject.id="+sid);
		}		
		List<Test> tests=query.list();
		session.close();
		return tests;
	}
	
	@Override
	public JSONArray getTestBySidJson(int sid){
		Session session=sessionFactory.openSession();
		Query query;
		if(sid==-1){
			query=session.createQuery("from Test");
		}
		else{
			 query=session.createQuery("from Test where subject.id="+sid);
		}
		List<Test> tests=query.list();
		JSONObject jsonObject;
		
		List<Test> alltest=new ArrayList<Test>();
		for (Test test : tests) {
		Set<Answer> answers = new HashSet();
		//List<Answer> listanswers=Factory.getAnswerManage().getAnswersBytid(test.getId());		
		Set<Answer> currentanswer=test.getAnswers();
		for (Answer answer : currentanswer) {
				answer.setTest(null);
				answers.add(answer);
			}
			test.setAnswers(answers);
			test.setSubject(null);
			alltest.add(test);
		}
		JSONArray jsonArray=new JSONArray().fromObject(tests);
		session.close();
		return jsonArray;
	}
	@Override
	public List<Test> getTest() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveTest(Test test) {
		int id=-1;
		try {
			createsession();
			sess.save(test);
			id=test.getId();
			destory();		
			return id;
		} catch (Exception e) {
		}
		return id;
	}

	@Override
	public boolean updateTest(Test test) {
		try {
			createsession();
			sess.update(test);
			destory();		
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	@Override
	public boolean deleteTest(Test test) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public Test getTestById(int id) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Test t where t.id="+id);
		List<Test> subjects=query.list();
		if(subjects.size()>0){
			session.close();
			return subjects.get(0);			
		}
		return null;
	}

	@Override
	public boolean deleteTestById(int id) {
		createsession();
		String sql="delete from Test where id="+id;
		String sql2="delete from Answer where test.id="+id;
		try {
			Query query=sess.createQuery(sql2);
			if(query.executeUpdate()!=0){
				Query query2=sess.createQuery(sql);
				if(query2.executeUpdate()!=0){
					destory();
					return true;
				}
			}
		} catch (Exception e) {
			System.out.println("ɾ��������������"+e.getMessage());
		}
		return false;
	}

}
