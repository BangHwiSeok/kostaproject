package com.shinseokki.puzzle.dao;

import java.util.HashMap;
import java.util.List;

import com.shinseokki.puzzle.dto.Keyword;

public interface KeywordDao {

	
		public int addkeyword(Keyword keyword);
		public Keyword getKeyword(String K_NAME); //Keyword 타입에 파라미터 값은 Keywordname
		public int updateKeyword(Keyword keyword);
		public int deleteKeyword(Keyword keyword);
		public List<Keyword> getKeywords(HashMap map);
		
		int getKeywordCount();
		/*public int updateKeyword(Keyword keyword);
		public int deleteKeyword(Keyword keyword);*/
		/*public List<Keyword> getKeywords(HashMap map);*/// 총 유저의 수
		/*int getKeywordCount();*///유저의 수
	
	}

