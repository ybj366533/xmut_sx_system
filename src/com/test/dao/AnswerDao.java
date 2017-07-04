package com.test.dao;

import java.util.List;

import com.test.model.Answer;

public interface AnswerDao {
	/**
	 * ��ȡ���еĴ�
	 * @return
	 */
	public List<Answer> getanswers();
	
	/**
	 *������Ŀ��Id����ȡ���ڸ���Ĵ� 
	 * @param tid
	 * @return
	 */
	public List<Answer> getAnswersBytid(int tid);
	/**
	 * ���ݴ𰸵�Id����ȡ��
	 * @param id
	 * @return
	 */
	public Answer getAnswerById(int id);
	
	/**
	 * �����
	 * @param answer
	 * @return
	 */
	public int saveanswer(Answer answer);
	
	/**
	 * ���´�
	 * @param answer
	 * @return
	 */
	public boolean updateanswer(Answer answer);
	
	/**
	 * ɾ����
	 * @param answer
	 * @return
	 */
	public boolean deleteanswer(Answer answer);
}
