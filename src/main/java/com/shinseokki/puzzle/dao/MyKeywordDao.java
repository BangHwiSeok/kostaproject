package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Keyword;
import com.shinseokki.puzzle.dto.MyKeyword;

public interface MyKeywordDao {
		public int addMyKeyword(MyKeyword keyword);
		public Keyword findMyKeyword(MyKeyword keyword); 
		public int upcountMyKeyword(int n_num,String keyword);
		public int deleteMyKeyword(int u_num,String keyword);
		public Collection<MyKeyword> findMyKeywords(int u_num);
		int getMyKeywordCount();
		int countMyKeywords(int u_num);
		
		public Collection<Integer> findUserNumByKeyword(int u_num,String keyword,String gender);
		public Collection<MyKeyword> findMyKeywordByNumKeyword(int u_num, String keyword);
	}

