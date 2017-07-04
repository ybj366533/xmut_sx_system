package com.test.service;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Component;

import com.test.dao.GradeDao;
import com.test.model.Grade;
import com.test.model.GradeJSon;
@Component("grademanage")
public class GradeManage {

	public Grade getGradeByid(int id) {
		return Factory.getGradeDao().getGradeByid(id);
	}

	public List<Grade> getGradeByUid(int uid) {
		return Factory.getGradeDao().getGradeByUid(uid);
	}

	public List<Grade> getGradeBySid(int sid) {
		return Factory.getGradeDao().getGradeBySid(sid);
	}

	public boolean saveGrade(Grade grade) {
		return Factory.getGradeDao().saveGrade(grade);
	}

	public boolean deleteGradeByid(int id) {
		// TODO Auto-generated method stub
		return Factory.getGradeDao().deleteGradeByid(id);
	}

	public boolean updateSubject(Grade grade) {
		// TODO Auto-generated method stub
		return Factory.getGradeDao().updateSubject(grade);
	}
	public boolean updateGrade(Grade grade) {
		// TODO Auto-generated method stub
		return Factory.getGradeDao().updateGrade(grade);
	}
	public List<GradeJSon> getAllGradeJSON(){
		return Factory.getGradeDao().getAllGradeJSON();
	}

}
