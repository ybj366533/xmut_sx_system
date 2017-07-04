package com.test.dao;

import java.util.List;

import net.sf.json.JSONArray;

import com.test.model.Test;

public interface TestDao {
	/**
	 * ���ݿ�ĿId��ȡ��ǰ�����Ծ�����ݼ���
	 * @param sid
	 * @return
	 */
	public List<Test> getTestBySid(int sid);
	/**
	 * ��ȡ���е��Ծ�
	 * @return
	 */
	/**
	 * ��ȡ�Ծ�
	 * @return
	 */
	public List<Test> getTest();
	
	/**
	 * ���ݿ�Ŀ��Id����ȡ�����Ծ��Json����
	 * @param sid Subject Id
	 * @return Json����
	 */
	public JSONArray getTestBySidJson(int sid);
	/**
	 * ����Ծ�
	 * @param test
	 * @return
	 */
	public int saveTest(Test test);
	/**
	 * �����Ծ�
	 * @param test
	 * @return
	 */
	
	public boolean updateTest(Test test);
	/**
	 * ɾ���Ծ�
	 * @param test
	 * @return
	 */
	public boolean deleteTest(Test test);
	
	/**
	 * ����ɾ����ɾ�������ʱ��ͬʱҲɾ���˴�
	 * @param id
	 * @return
	 */
	public boolean deleteTestById(int id);
	
	public Test getTestById(int id);
}
