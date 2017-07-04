package com.test.dao;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Grade;
import com.test.model.GradeJSon;
import com.test.model.Professional;
import com.test.model.Student;
import com.test.model.Subject;
import com.test.service.Factory;

public class GradeDaoImp implements GradeDao{
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
	public GradeDaoImp() {
		Configuration configuration=new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
		SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
		
		this.sessionFactory=sessionFactory;	
	}
	@Override
	public Grade getGradeByid(int id) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Grade g where g.id="+id);
		List<Grade> grades=query.list();
		if(grades.size()>0){
			session.close();
			return grades.get(0);
			
		}
		return null;
	}

	@Override
	public List<Grade> getGradeByUid(int uid) {
		createsession();
		Query query;
		if(uid==-1){
			query=sess.createQuery("from Grade");
		}
		else{
			 query=sess.createQuery("from Grade where student.uid="+uid);
		}		
		List<Grade> grades=query.list();
		for (Grade grade : grades) {
			System.out.println(grade.getId());
			System.out.println(grade.getSubject().getName());
			System.out.println(grade.getStudent().getUid());
		}
		destory();
		return grades;
	}

	@Override
	public boolean saveGrade(Grade grade) {
		try {
			createsession();
			sess.save(grade);
			destory();
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean deleteGradeByid(int id) {
		createsession();
		String sql="delete from Grade where id="+id;
		Query query=sess.createQuery(sql);
		if(query.executeUpdate()!=0){
			destory();
			return true;
		}
		return false;
	}

	@Override
	public boolean updateSubject(Grade grade) {
		try {
			createsession();
			sess.update(grade);
			destory();		
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	@Override
	public List<Grade> getGradeBySid(int sid) {
		Session session=sessionFactory.openSession();
		Query query;
		if(sid==-1){
			query=session.createQuery("from Grade");
		}
		else{
			 query=session.createQuery("from Grade where subject.id="+sid);
		}		
		List<Grade> grades=query.list();
		session.close();
		return grades;
	}
	
	@Override
	public List<GradeJSon> getAllGradeJSON() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Grade");
		List<Grade> grades=query.list();
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"subject"});		
		List<GradeJSon> gradeJSons=new ArrayList<GradeJSon>();
		for(Grade grade:grades){
			GradeJSon gradeJSon=new GradeJSon();
			gradeJSon.setName(grade.getStudent().getName());
			gradeJSon.setPid(grade.getSubject().getProfessional().getPid());
			gradeJSon.setProfessionalName(grade.getSubject().getProfessional().getPname());
			gradeJSon.setScore(grade.getScore());
			gradeJSon.setXh(grade.getStudent().getXh());
			gradeJSon.setTime(grade.getTime().toString());
			gradeJSons.add(gradeJSon);
		}	
		
		//JSONArray result=new JSONArray().fromObject(gradeJSons);

		//result.fromObject(grades,config);
		session.close();
		return gradeJSons;	
	}
	@Override
	public boolean updateGrade(Grade grade) {
		try {
			createsession();
			sess.update(grade);
			destory();		
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		return false;
	}
	
}
