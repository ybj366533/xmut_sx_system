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
		String oprate="用户操作";
		writeLog(method, oprate);
	}
	
	private SessionFactory getsessFactory(){
		Configuration configuration=new Configuration();
		configuration.configure();
		ServiceRegistry serviceRegistry=new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();		
		SessionFactory sessionFactory=configuration.buildSessionFactory(serviceRegistry);
		//为当前的sessionFactory赋值
		return sessionFactory;	
	}
	
	@Pointcut("execution(* com.test.service.ProfessionalManage.*(..))")
	private void professionalPointcut(){}
	@After(value="professionalPointcut()")
	public void professionalafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="专业操作";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.DepartmentManage.*(..))")
	private void departmentPointcut(){}
	@After(value="departmentPointcut()")
	public void departmentafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="部门操作";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.SubjectManage.*(..))")
	private void subjectPointcut(){}
	@After(value="subjectPointcut()")
	public void subjectafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="科目操作";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.GradeManage.*(..))")
	private void gradePointcut(){}
	@After(value="gradePointcut()")
	public void gradeafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="成绩操作";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.TestManage.*(..))")
	private void testPointcut(){}
	@After(value="testPointcut()")
	public void testafter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="试卷操作";
		writeLog(method, oprate);
	}
	
	@Pointcut("execution(* com.test.service.AnswerManage.*(..))")
	private void answerPointcut(){}
	@After(value="answerPointcut()")
	public void answerfter(JoinPoint joinPoint){	
		String method=joinPoint.getSignature().getName();
		String oprate="答案操作";
		writeLog(method, oprate);
	}
	
	/**
	 * 写日志到数据库中
	 * @param method
	 * @param oprate
	 */
	private void writeLog(String method,String oprate){
		Loganderror loganderror=new Loganderror("Log",method,oprate,new Date().toString());
		Session session=getsessFactory().openSession();
		//开始事务对日志进行操作
		Transaction transaction=session.beginTransaction();
		session.save(loganderror);
		transaction.commit();
		session.close();
	}
	
}
