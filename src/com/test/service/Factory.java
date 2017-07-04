package com.test.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.test.dao.AnswerDao;
import com.test.dao.AnswerDaoImp;
import com.test.dao.DepartMentDao;
import com.test.dao.DepartMentDaoImp;
import com.test.dao.GradeDao;
import com.test.dao.GradeDaoImp;
import com.test.dao.PlacardDao;
import com.test.dao.PlacardDaoImp;
import com.test.dao.ProfessionalDao;
import com.test.dao.ProfessionalDaoImp;
import com.test.dao.SubitemDao;
import com.test.dao.SubitemDaoImp;
import com.test.dao.SubjectDao;
import com.test.dao.SubjectDaoImp;
import com.test.dao.TestDao;
import com.test.dao.TestDaoImp;
import com.test.dao.UserDao;
import com.test.dao.UserDaoImp;
import com.test.dao.WorksDao;
import com.test.dao.WorksDaoImp;
import com.test.model.Works;

public class Factory {
	protected static UserDao getUserDao() {
		return new UserDaoImp();
	}

	public static UserManageImp getUserManageImp() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (UserManageImp) context.getBean("usermanageimp");
	}

	protected static ProfessionalDao getProfessionalDao() {
		return new ProfessionalDaoImp();
	}

	public static ProfessionalManage getProfessionalManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (ProfessionalManage) context.getBean("professionalmanage");
	}

	protected static DepartMentDao getDepartmentDao() {
		return new DepartMentDaoImp();
	}

	public static DepartmentManage getDepartmentManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (DepartmentManage) context.getBean("departmentmanage");
	}

	protected static SubjectDao getSubjectDao() {
		return new SubjectDaoImp();
	}

	public static SubjectManage getSubjectManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (SubjectManage) context.getBean("subjectmanage");
	}

	protected static SubitemDao getSubitemDao() {
		return new SubitemDaoImp();
	}

	public static SubitemManage getSubitemManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (SubitemManage) context.getBean("subitemmanage");

	}

	protected static GradeDao getGradeDao() {
		return new GradeDaoImp();
	}

	public static GradeManage getGradeManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (GradeManage) context.getBean("grademanage");
	}

	protected static TestDao getTestDao() {
		return new TestDaoImp();
	}

	public static TestManage getTestManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (TestManage) context.getBean("testmanage");
	}

	protected static AnswerDao getAnswerDao() {
		return new AnswerDaoImp();
	}

	public static AnswerManage getAnswerManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (AnswerManage) context.getBean("answermanage");
	}

	protected static PlacardDao getPlacardDao() {
		return new PlacardDaoImp();
	}

	public static PlacardManage getPlacardManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (PlacardManage) context.getBean("placardmanage");
	}
	
	protected static WorksDao getWorksDao() {
		return new WorksDaoImp();
	}

	public static WorksManage getWorksManage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return (WorksManage) context.getBean("worksmanage");
	}

}
