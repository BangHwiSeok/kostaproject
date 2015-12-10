package com.shinseokki.puzzle.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.MyKeywordDao;
import com.shinseokki.puzzle.dto.Keyword;
import com.shinseokki.puzzle.dto.MyKeyword;
import com.shinseokki.puzzle.dto.User;

@Service
public class RecommendService {

	private MyKeywordDao myKeywordDao;

	@Autowired
	public RecommendService(SqlSession sqlSession) {
		myKeywordDao = sqlSession.getMapper(MyKeywordDao.class);

	}

	public Map<Integer, Long> recommendUsers(int u_num,String gender) {
		// 나의 키워드 가져오기
		Collection<MyKeyword> myKeywords = findMyKeyword(u_num);
		// 나의 키워드와 같은 사람들 모으기
		/* Collection<Integer> userList = findUserByKeyword(k) */
		Collection<Integer> userList = new ArrayList<>();
		myKeywords.forEach((s) -> {
			Collection<Integer> keyUsers = findUserByKeyword(s.getU_num(),s.getKeyword(),gender);
			if (keyUsers != null) {
				System.out.println("Keyword User Size : " + keyUsers.size());
				keyUsers.stream().forEach((user) -> {
					userList.add(user);
				});
			}
		});

		// 중복된 사람의 수 세기
		Map<Integer, Long> list = userList.stream().collect(Collectors.groupingBy((s) -> {
			return s;
		} , Collectors.counting()));

		//
		Map<Integer, Long> sortedMap = list.entrySet().stream().sorted(Map.Entry.comparingByValue())
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
		// 중복된 것이 많은 상위 2명 추천하기

		return sortedMap;
	}

	/*
	 * @param int u_num - 회원번호
	 * 
	 * @return Collection<MyKeyword> - MyKeyword Table에 있는 키워드 모두 가져온다.
	 * 
	 * @description 회원의 키워드를 가져오는 Method
	 */
	private Collection<MyKeyword> findMyKeyword(int u_num) {
		return myKeywordDao.findMyKeywords(u_num);
	}

	/*
	 * @param MyKeyword - 회원의 키워드를 가지고 온다.
	 * 
	 * @return Collection<MyKeyword> - MyKeyword Table에 있는 키워드 모두 가져온다.
	 * 
	 * @description 
	 * 	키워드가 같은 사람들을 가져오는 메서드
	 */
	private Collection<Integer> findUserByKeyword(int u_num,String keyword, String gender) {
		return myKeywordDao.findUserNumByKeyword(u_num,keyword, gender);
	}

}
