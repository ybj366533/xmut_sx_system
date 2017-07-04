package com.test.Aspect;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Component;

import com.test.model.Loganderror;
@Component("logaspect")
@Aspect
public class LogAspect {
	@Pointcut("execution(* com.test.service.UserManageImp.*(..))")
	private void userPointcut(){}
	@After(value="userPointcut()")
	public void after(JoinPoint joinPoint){		
		String method=joinPoint.getSignature().getName();
		String oprate="�û�����";
		writeLog(method, oprate);
	}
	
	private SessionFactory getsessFactory(){
		Configuration configuration=new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
		SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
		//Ϊ��ǰ��sessionFactory��ֵ
		return sessionFactory;	
	}
	
	@Pointcut("execution(* com.test.service.ProfessionalManage.*(..))")
	private void professionalPointcut(){}
	@After(value="professionalPointcut()")
	public void professionalafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="רҵ����";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.DepartmentManage.*(..))")
	private void departmentPointcut(){}
	@After(value="departmentPointcut()")
	public void departmentafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="���Ų���";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.SubjectManage.*(..))")
	private void subjectPointcut(){}
	@After(value="subjectPointcut()")
	public void subjectafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="��Ŀ����";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.GradeManage.*(..))")
	private void gradePointcut(){}
	@After(value="gradePointcut()")
	public void gradeafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="�ɼ�����";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.TestManage.*(..))")
	private void testPointcut(){}
	@After(value="testPointcut()")
	public void testafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="�Ծ����";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.AnswerManage.*(..))")
	private void answerPointcut(){}
	@After(value="answerPointcut()")
	public void answerfter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="�𰸲���";
		writeLog(method, oprate);
	}
	
	/**
	 * д��־�����ݿ���
	 * @param method
	 * @param oprate
	 */
	private void writeLog(String method,String oprate){
		Loganderror loganderror=new Loganderror("Log",method,oprate,new Date().toString());
		Session session=getsessFactory().openSession();
		//��ʼ�������־���в���
		Transaction transaction=session.beginTransaction();
		session.save(loganderror);
		transaction.commit();
		session.close();
	}
	
}
