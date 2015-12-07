package com.shinseokki.puzzle.service;

import java.util.Collection;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinseokki.puzzle.dao.EvalHistoryDao;
import com.shinseokki.puzzle.dao.EvaluationDao;
import com.shinseokki.puzzle.dto.Evaluation;

@Service
public class EvaluationService {
	
	
	private EvaluationDao evaluationDao;
	private EvalHistoryDao evalHistoryDao;
	
	@Autowired
	public EvaluationService(SqlSession sqlSession) {
		evaluationDao = sqlSession.getMapper(EvaluationDao.class);
		evalHistoryDao = sqlSession.getMapper(EvalHistoryDao.class);
	}
	
	@Transactional
	public int addEvaluation(int u_num){
		return evaluationDao.addEvaluation(u_num);
	}
	
	/*
	 * @param int e_eval - 평가를 시작할 사람
	 * @description
	 * 	관리자 승인 후, Keyword를 받기 위한 유저를 넣기 위해 사용
	 * 	
	 */
	public Evaluation selectEvaluation(int e_eval){
		// 키워드를 다 받지 않았고, 가장 빨리 가입한 사용자 한명을 
		
		Evaluation eval = evaluationDao.selectEvaluation(e_eval);
		eval.setE_eval(e_eval);
		evaluationDao.updateEVAL(eval.getE_eval(), eval.getU_num());
		
		return eval;
	}
	
	public Evaluation findEvaluation(int u_num){
		return evaluationDao.findEvaluation(u_num);
	}
	public Collection<Evaluation> findEvaluations(){
		return evaluationDao.findEvaluations();
	}
	public int deleteEvaluation(int u_num){
		return evaluationDao.deleteEvaluation(u_num);
	}
	public int countEvaluations(){
		return evaluationDao.countEvaluations();
	}
	
	public int updateEVAL(int e_eval, int u_num){
		return evaluationDao.updateEVAL(e_eval, u_num);
	}

}
