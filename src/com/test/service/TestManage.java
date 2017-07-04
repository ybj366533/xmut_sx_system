package com.test.service;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Component;

import com.test.dao.TestDao;
import com.test.model.Placard;
import com.test.model.Test;
@Component("testmanage")
public class TestManage {

	public List<Test> getTestBySid(int sid) {
		return Factory.getTestDao().getTestBySid(sid);
	}

	public List<Test> getTest() {
		return Factory.getTestDao().getTest();
	}

	public int saveTest(Test test) {
		return Factory.getTestDao().saveTest(test);
	}

	public boolean updateTest(Test test) {
		return Factory.getTestDao().updateTest(test);
	}

	public boolean deleteTest(Test test) {
		return Factory.getTestDao().deleteTest(test);
	}
	
	public JSONArray getTestBySidJson(int sid){
		return Factory.getTestDao().getTestBySidJson(sid);
	}
	public Test getTestById(int id){
		return Factory.getTestDao().getTestById(id);
	}
	public boolean deleteTestById(int id){
		return Factory.getTestDao().deleteTestById(id);
	}
}
