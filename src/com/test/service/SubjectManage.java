package com.test.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.test.model.Subitem;
import com.test.model.Subject;
@Component("subjectmanage")
public class SubjectManage {

	public Subject getSubjectByid(int sid) {
		return Factory.getSubjectDao().getSubjectByid(sid);
	}
	public List<Subject> getAllSubject() {
		return Factory.getSubjectDao().getSubjects();
	}
	public List<Subject> getSubjectByPid(int pid) {
		return Factory.getSubjectDao().getSubjectByPid(pid);
	}
	public List<Subject> getSubjectByUid(int uid) {
		return Factory.getSubjectDao().getSubjectByUid(uid);
	}
	public boolean saveSubject(Subject subject) {
		return Factory.getSubjectDao().saveSubject(subject);
	}
	public boolean deleteSubjectByid(int sid) {
		return Factory.getSubjectDao().deleteSubjectByid(sid);
	}

	public boolean updateSubject(Subject subject) {
		return Factory.getSubjectDao().updateSubject(subject);
	}
	

}
