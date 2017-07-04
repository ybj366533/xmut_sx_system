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

public class PlacardDaoImp implements PlacardDao{
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
	
	public PlacardDaoImp() {
		 Configuration configuration=new Configuration();
			configuration.configure();
			ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
			SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
			//sessionFactory
			this.sessionFactory=sessionFactory;	
	}
	@Override
	public List<Placard> getPlacard() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Placard");
		List<Placard> placards=query.list();
		session.close();
		return placards;
	}

	@Override
	public List<Placard> getPlacardBytid(int tid) {
		Session session=sessionFactory.openSession();
		String sql="from Placard  where uid="+tid; 
		System.out.println(sql);

		Query query=session.createQuery(sql);
		System.out.println(sql);
		List<Placard> placards=query.list();
		System.out.println(placards.size()+"!!");
		session.close();
		return placards;		
	}

	@Override
	public Placard getPlacardById(int id) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Placard d where d.id="+id);
		
		List<Placard> placards=query.list();
		if(placards.size()>0){
			session.close();
			return placards.get(0);			
		}
		return null;
	}

	@Override
	public int savePlacard(Placard placard) {
		
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
	public boolean updatePlacard(Placard placard) {
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
	public boolean deletePlacard(int tid) {
		createsession();
		String sql="delete from Placard where id="+tid;
		Query query=sess.createQuery(sql);
		if(query.executeUpdate()!=0){
			destory();
			return true;
		}
		return false;
	}

}
