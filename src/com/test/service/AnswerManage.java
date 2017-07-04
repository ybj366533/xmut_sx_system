package com.test.service;
import java.util.List;
import org.springframework.stereotype.Component;
import com.test.model.Answer;
@Component("answermanage")
public class AnswerManage{

	public List<Answer> getanswers() {
		return Factory.getAnswerDao().getanswers();
	}

	public List<Answer> getAnswersBytid(int tid) {
		return Factory.getAnswerDao().getAnswersBytid(tid);
	}

	public Answer getAnswerById(int id) {
		return Factory.getAnswerDao().getAnswerById(id);
	}

	public int saveanswer(Answer answer) {
		return Factory.getAnswerDao().saveanswer(answer);
	}

	public boolean updateanswer(Answer answer) {
		return Factory.getAnswerDao().updateanswer(answer);
	}

	public boolean deleteanswer(Answer answer) {
		return Factory.getAnswerDao().deleteanswer(answer);
	}
	
}
