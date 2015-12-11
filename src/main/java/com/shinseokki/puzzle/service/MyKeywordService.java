package com.shinseokki.puzzle.service;

import java.util.Collection;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shinseokki.puzzle.dao.EvalHistoryDao;
import com.shinseokki.puzzle.dao.EvaluationDao;
import com.shinseokki.puzzle.dao.KeywordDao;
import com.shinseokki.puzzle.dao.MyKeywordDao;
import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.Keyword;
import com.shinseokki.puzzle.dto.KeywordSelected;
import com.shinseokki.puzzle.dto.MyKeyword;
import com.shinseokki.puzzle.dto.User;

@Service
public class MyKeywordService {
	private MyKeywordDao myKeywordDao;
	private EvalHistoryDao evalHistoryDao;
	private UserDao userDao;
	private EvaluationDao evaluationDao;
	private KeywordService keywordService;
	
	private final int MAXMYKEYWORD = 2;
	
	@Autowired
	public MyKeywordService(SqlSession sqlSession,KeywordService keywordService) {
		myKeywordDao = sqlSession.getMapper(MyKeywordDao.class);
		evalHistoryDao = sqlSession.getMapper(EvalHistoryDao.class);
		userDao = sqlSession.getMapper(UserDao.class);
		evaluationDao = sqlSession.getMapper(EvaluationDao.class);
		this.keywordService = keywordService;
	}
	
	@Transactional
	public boolean saveKeywords(int u_num, int e_num, String key1, String key2){
		boolean isSaved= true;
		// 첫번째 키워드 저장
			// 키워드를 가지고 있는 경우, Exception을 발생시켜 Keyword 저장을 못하게 한다. 
		/*if(!duplicatedKeyword(u_num, key1) &&  ( keywordService.find(key1) != null  ) ){
			System.out.println("Keyword1 : "+key1);
			MyKeyword k = new MyKeyword();
			k.setKeyword(key1);
			k.setU_num(u_num);
			k.setStatus(KeywordSelected.RECEIVED);
			
			addMyKeyword(k);
			
		}else{
			isSaved= false;
		}*/
		
		if( (!duplicatedKeyword(u_num, key1) &&  ( keywordService.find(key1) != null  ) ) &&  (!duplicatedKeyword(u_num, key2) &&  ( keywordService.find(key2) != null  )) ){
			System.out.println("Keyword1 : "+key2);
			MyKeyword k = new MyKeyword();
			k.setKeyword(key1);
			k.setU_num(u_num);
			k.setStatus(KeywordSelected.RECEIVED);
			addMyKeyword(k);
			
			k.setKeyword(key1);
			addMyKeyword(k);
		}else{
			isSaved =false;
		}
		
		if(!isSaved)
			return isSaved;
		// 현재 평가한 사람이 다시 평가를 못하게, 평가 기록을 남긴다.
		saveHistory(u_num, e_num);
		
		// 키워드를 받은 사람의 키워드가 MAXMYKEYWORD 보다 크거나 같으면  TRUE를 반환한다.
		boolean isFullMyKeyword = myKeywordDao.countMyKeywords(u_num) >= MAXMYKEYWORD;
		
		// 키워드가 MAXMYKEYWORD보다 클 경우
			// 키워드를 받은 USER의 ROLE을 변경한다.
			// Evaluation Table에서 해당 유저를 지운다.
		if(isFullMyKeyword){
			User u = userDao.findByUserNum(u_num);
			u.setU_role(u.getU_role().nextRole());
			userDao.changeRole(u);
			
			evaluationDao.deleteEvaluation(u.getU_num());
		}
		
		return isSaved;
	}
	
	public int saveHistory(int u_num, int e_num){
		return evalHistoryDao.save(u_num, e_num);
	}
	
	public boolean duplicatedKeyword(int u_num, String keyword){
		MyKeyword k = new MyKeyword();
		k.setKeyword(keyword);
		k.setU_num(u_num);
		k.setStatus(KeywordSelected.RECEIVED);
		
		return (myKeywordDao.findMyKeyword(k) != null );
	}
	
	
	public int addMyKeyword(MyKeyword keyword) {
		
		return myKeywordDao.addMyKeyword(keyword);
	}

	public Keyword findMyKeyword(MyKeyword keyword) {
		return myKeywordDao.findMyKeyword(keyword);
	}

	public int upcountMyKeyword(int n_num, String keyword) {
		return myKeywordDao.upcountMyKeyword(n_num, keyword);
	}

	public int deleteMyKeyword(int u_num, String keyword) {
		return myKeywordDao.deleteMyKeyword(u_num, keyword);
	}

	public Collection<MyKeyword> findMyKeywords(int u_num) {
		return myKeywordDao.findMyKeywords(u_num);
	}

	public int getMyKeywordCount() {
		return myKeywordDao.getMyKeywordCount();
	}

}
