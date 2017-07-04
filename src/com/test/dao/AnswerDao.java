package com.test.dao;

import java.util.List;

import com.test.model.Answer;

public interface AnswerDao {
	/**
	 * 获取所有的答案
	 * @return
	 */
	public List<Answer> getanswers();
	
	/**
	 *根据题目的Id来获取属于该题的答案 
	 * @param tid
	 * @return
	 */
	public List<Answer> getAnswersBytid(int tid);
	/**
	 * 根据答案的Id来获取答案
	 * @param id
	 * @return
	 */
	public Answer getAnswerById(int id);
	
	/**
	 * 保存答案
	 * @param answer
	 * @return
	 */
	public int saveanswer(Answer answer);
	
	/**
	 * 更新答案
	 * @param answer
	 * @return
	 */
	public boolean updateanswer(Answer answer);
	
	/**
	 * 删除答案
	 * @param answer
	 * @return
	 */
	public boolean deleteanswer(Answer answer);
}
