package com.test.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.test.dao.ProfessionalDao;
import com.test.model.Professional;
@Component("professionalmanage")
public class ProfessionalManage{

	
	public Professional getProFeProfessionalById(int pid) {
		return Factory.getProfessionalDao().getProFeProfessionalById(pid);
	}

	public List<Professional> getProfessionals() {
		return Factory.getProfessionalDao().getProfessionals();
	}
	
	public List<Professional> getProfessionalByDid(int did){
		return Factory.getProfessionalDao().getProfessionalsBydid(did);
	}

	public boolean saveProfessional(Professional professional) {
		return Factory.getProfessionalDao().saveProfessional(professional);
	}

	public boolean deleteProfessionalByid(int pid) {
		return Factory.getProfessionalDao().deleteProfessionalByid(pid);
	}

	public boolean updateProfessional(Professional professional) {
		return Factory.getProfessionalDao().updateProfessional(professional);
	}
	
}
