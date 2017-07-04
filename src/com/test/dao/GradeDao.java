package com.test.dao;

import java.util.List;

import net.sf.json.JSONArray;

import com.test.model.Grade;
import com.test.model.GradeJSon;
import com.test.model.Subject;

public interface GradeDao {

	public Grade getGradeByid(int id);

	public List<Grade> getGradeByUid(int uid);

	public List<Grade> getGradeBySid(int sid);

	public boolean saveGrade(Grade grade);

	public boolean deleteGradeByid(int id);
	public boolean updateGrade(Grade grade);
	public boolean updateSubject(Grade grade);

	public List<GradeJSon> getAllGradeJSON();

}
