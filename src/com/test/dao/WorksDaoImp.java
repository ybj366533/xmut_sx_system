package com.test.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Placard;
import com.test.model.Works;

public class WorksDaoImp implements WorksDao{
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
	
	public WorksDaoImp() {
		 Configuration configuration=new Configuration();
			configuration.configure();
			ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
			SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
			//sessionFactory
			this.sessionFactory=sessionFactory;	
	}
	@Override
	public List<Works> getWorks() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Works");
		List<Works> works=query.list();
		session.close();
		return works;
	}

	@Override
	public List<Works> getWorksBytid(int tid) {
		Session session=sessionFactory.openSession();
		String sql="from Works  where uid="+tid; 
		System.out.println(sql);

		Query query=session.createQuery(sql);
		System.out.println(sql);
		List<Works> placards=query.list();
		System.out.println(placards.size()+"!!");
		session.close();
		return placards;		
	}

	@Override
	public Works getWorksById(int id) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Works d where d.id="+id);
		
		List<Works> placards=query.list();
		if(placards.size()>0){
			session.close();
			return placards.get(0);			
		}
		return null;
	}

	@Override
	public int saveWorks(Works placard) {
		
		int id=-1;
		try {
			createsession();
			sess.save(placard);
			id=placard.getId();
			destory();		
			return id;
		} catch (Exception e) {
			System.out.println("!!"+e.getMessage());
		}
		return id;
	}

	@Override
	public boolean updateWorks(Works placard) {
		try {
			createsession();
			sess.update(placard);
			destory();		
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean deleteWorks(int tid) {
		createsession();
		String sql="delete from Works where id="+tid;
		Query query=sess.createQuery(sql);
		if(query.executeUpdate()!=0){
			destory();
			return true;
		}
		return false;
	}
	@Override
	public List<Works> getWorksList() {
		Session session=sessionFactory.openSession();
		String sql="from Works"; 
		System.out.println(sql);

		Query query=session.createQuery(sql);
		System.out.println(sql);
		List<Works> placards=query.list();
		System.out.println(placards.size()+"!!");
		session.close();
		return placards;		
	}

}
