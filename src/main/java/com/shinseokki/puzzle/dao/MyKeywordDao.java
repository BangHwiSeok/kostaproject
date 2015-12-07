package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Keyword;
import com.shinseokki.puzzle.dto.MyKeyword;

public interface MyKeywordDao {
	
		public int addMyKeyword(MyKeyword keyword);
		public Keyword findMyKeyword(int m_num); 
		public int updateMyKeyword(int m_num);
		public int deleteMyKeyword(int m_num);
		public Collection<MyKeyword> findMyKeywords(int u_num);
		int getMyKeywordCount();
		
	
	}

