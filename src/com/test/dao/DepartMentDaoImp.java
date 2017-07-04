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
import com.test.model.Professional;

public class DepartMentDaoImp implements DepartMentDao {
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
	 public DepartMentDaoImp() {
		 Configuration configuration=new Configuration();
			configuration.configure();
			ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
			SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
			
			this.sessionFactory=sessionFactory;	
	}
	@Override
	public Department getDepartMentById(int did) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Department d where d.did="+did);
		List<Department> departments=query.list();
		if(departments.size()>0){
			session.close();
			return departments.get(0);			
		}
		return null;
	}

	@Override
	public List<Department> getDepartments() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Department");
		List<Department> departments=query.list();
		session.close();
		return departments;
	}

	@Override
	public boolean saveDepartment(Department department) {
		try {
			createsession();
			sess.save(department);
			transaction.commit();
			destory();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	@Override
	public boolean deleteDepartmentByid(int did) {
		createsession();
		String sql="delete from Department where did="+did;
		Query query=sess.createQuery(sql);
		if(query.executeUpdate()!=0){
			destory();
			return true;
		}
		return false;
	}

	@Override
	public boolean updateDepartment(Department department) {
		try {
			createsession();
			sess.update(department);
			destory();		
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

}
