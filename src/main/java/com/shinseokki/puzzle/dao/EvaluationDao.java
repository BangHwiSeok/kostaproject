package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Evaluation;

public interface EvaluationDao {
	public int addEvaluation(int u_num);
	
	// 가장 빨리 가입한 사람을 뽑아준다.
	//	단, 지금 평가 받고 있는 사람을 제외한다.
	public Evaluation selectEvaluation(int e_eval);
	
	public Evaluation findEvaluation(int u_num);
	public Collection<Evaluation> findEvaluations();
	public int deleteEvaluation(int u_num);
	public int countEvaluations();
	
	public int updateEVAL(int e_eval, int u_num);
	
}
