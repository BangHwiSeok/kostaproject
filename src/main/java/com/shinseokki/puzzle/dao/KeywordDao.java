package com.shinseokki.puzzle.dao;

import java.util.List;

import com.shinseokki.puzzle.dto.Keyword;

public interface KeywordDao {

	
		public int addkeyword(Keyword keyword);
		public Keyword getKeyword(); 
		public int updateKeyword(Keyword keyword);
		public int deleteKeyword(String K_NAME);
		public List<Keyword> getKeywords(int start, int end);
		int getKeywordCount();
		
	
	}

