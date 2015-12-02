package com.shinseokki.puzzle.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.KeywordDao;
import com.shinseokki.puzzle.dto.Keyword;

@Service
public abstract class KeywordService {
	private KeywordDao keywordDao;
	
	@Autowired
	public KeywordService(SqlSession sqlSession){
		keywordDao = sqlSession.getMapper(KeywordDao.class);
	}
	
	public int addKeyword(Keyword keyword){
		return keywordDao.addkeyword(keyword);
	}
	public Keyword getKeyword(){
		return keywordDao.getKeyword();
	}
	
	public int updateKeyword(Keyword keyword){
		return keywordDao.updateKeyword(keyword);
	}
	
	public int deleteKeyword(String K_NAME){
		return keywordDao.deleteKeyword(K_NAME);
	}
	
	public List<Keyword> getKeywords(int start, int end){
		return keywordDao.getKeywords(start, end);
	}
	
	public int getKeywordCount(){
		return keywordDao.getKeywordCount();
	}
	
}
