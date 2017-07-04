package com.test.dao;

import java.util.List;

import net.sf.json.JSONArray;

import com.test.model.Test;

public interface TestDao {
	/**
	 * 根据科目Id获取当前考试试卷的内容集合
	 * @param sid
	 * @return
	 */
	public List<Test> getTestBySid(int sid);
	/**
	 * 获取所有的试卷
	 * @return
	 */
	/**
	 * 获取试卷
	 * @return
	 */
	public List<Test> getTest();
	
	/**
	 * 根据科目的Id来获取考试试卷的Json数组
	 * @param sid Subject Id
	 * @return Json数组
	 */
	public JSONArray getTestBySidJson(int sid);
	/**
	 * 添加试卷
	 * @param test
	 * @return
	 */
	public int saveTest(Test test);
	/**
	 * 更新试卷
	 * @param test
	 * @return
	 */
	
	public boolean updateTest(Test test);
	/**
	 * 删除试卷
	 * @param test
	 * @return
	 */
	public boolean deleteTest(Test test);
	
	/**
	 * 关联删除，删除问题的时候同时也删除了答案
	 * @param id
	 * @return
	 */
	public boolean deleteTestById(int id);
	
	public Test getTestById(int id);
}
