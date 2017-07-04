package com.test.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import com.test.model.Professional;

public class ProfessionalDaoImp implements ProfessionalDao {
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

	public ProfessionalDaoImp() {
		Configuration configuration = new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties())
				.buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		// sessionFactory
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Professional getProFeProfessionalById(int pid) {
		createsession();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Professional p where p.pid=" + pid);
		List<Professional> professionals = query.list();
		if (professionals.size() > 0) {
			session.close();
			return professionals.get(0);

		}
		destory();
		return null;
	}

	@Override
	public List<Professional> getProfessionals() {
		createsession();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Professional");
		List<Professional> professionals = query.list();
		session.close();
		destory();
		return professionals;
	}

	@Override
	public boolean saveProfessional(Professional professional) {
		try {
			createsession();
			sess.save(professional);
			transaction.commit();
			destory();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean deleteProfessionalByid(int pid) {
		createsession();
		String sql = "delete from professional where pid=" + pid;
		System.out.println(sql);
		Query query = sess.createQuery(sql);
		if (query.executeUpdate() != 0) {
			destory();
			return true;
		}
		return false;
	}

	@Override
	public boolean updateProfessional(Professional professional) {
		try {
			createsession();
			sess.update(professional);
			destory();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public List<Professional> getProfessionalsBydid(int did) {
		createsession();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Professional p where department.did=" + did);
		List<Professional> professionals = query.list();
		session.close();
		destory();
		return professionals;
	}

}
