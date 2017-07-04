package com.test.dao;

import java.util.List;

import com.test.model.Department;
import com.test.model.Subject;

public interface SubjectDao {

	public Subject getSubjectByid(int sid);

	public List<Subject> getSubjectByPid(int pid);

	public List<Subject> getSubjectByUid(int uid);

	public boolean saveSubject(Subject subject);

	public boolean deleteSubjectByid(int sid);

	public boolean updateSubject(Subject subject);

	public List<Subject> getSubjects();
}
