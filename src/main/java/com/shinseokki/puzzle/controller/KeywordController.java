package com.shinseokki.puzzle.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shinseokki.puzzle.dao.KeywordDao;
import com.shinseokki.puzzle.dto.Keyword;

@Controller
public class KeywordController {
private static final Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	private KeywordDao keywordDao;
	
	@Autowired
	public KeywordController(SqlSession sqlSession) {
		keywordDao = sqlSession.getMapper(KeywordDao.class);
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "addKeyword";
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String addKeyword(String K_NAME, String K_GROUP, Model model){
		
		logger.info("Register Keyword : {}, Keyword Group : {}",K_NAME, K_GROUP);
		Keyword keyword = new Keyword();
		keyword.setK_NAME(K_NAME);
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.addkeyword(keyword);
		model.addAttribute("keyword",keyword);
		
		return "myinfo";
		}
       
         
	@RequestMapping("/list")
	public String list(HttpServletRequest request) {

		int currentpage = 1; //현재 페이지
		String pageNum = request.getParameter("currentpage"); //넘어온 페이지 번호
		if (pageNum != null) { //넘어온 페이지가 있으면!
			currentpage = Integer.parseInt(pageNum);
		}
		int rowSize = 10; //한 페이지에 표시할 게시물 개수
		
		
		//테이블에서 가져올 시작과 끝 위치
		int start = (currentpage * rowSize) - (rowSize - 1);
		int end = currentpage * rowSize;
		
		//전체 키워드 개수 구하기
		int total = keywordDao.getKeywordCount(); 

		System.out.println("시작 : " + start + " 끝:" + end);
		System.out.println("키워드의 수 : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		System.out.println("페이지수 : " + allPage);

		int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
						// [10] >>
		int fromPage = ((currentpage - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((currentpage - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}

		HashMap map = new HashMap();

		map.put("start", start); //Hashmap으로 start,end 담기
		map.put("end", end);

		List<Keyword> list = keywordDao.getKeywords(map); //리스트목록
		
		
		//페이징처리
		request.setAttribute("list", list); //페이지 리스트
		request.setAttribute("currentpage", currentpage);	//현재 페이지
		request.setAttribute("allPage", allPage); //전체 페이지 개수
		request.setAttribute("block", block); //한페이지에 보여줄 범위
		request.setAttribute("fromPage", fromPage); //보여줄 페이지의 시작
		request.setAttribute("toPage", toPage); //보여줄 페이지의 끝

		return "list"; // list.jsp로 리턴
	}
	
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String upadteform(String K_NAME, Model model) {
		//model은 객체를 담아주는 역할
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword(K_NAME);
		
		keywordDao.updateKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "updateform"; // updateform.jsp
	}

	@RequestMapping("/updateform")
	public String update(String K_NAME, String K_GROUP, Model model) {
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword(K_NAME);
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.updateKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "myinfo";
	}
	
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteform(String K_NAME) {
		
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword(K_NAME); 
		
		keywordDao.deleteKeyword(keyword);
		
		
		return "deleteform"; // deleteform.jsp
	}
	
	@RequestMapping("/deleteform")
	public String delete(String K_NAME, String K_GROUP, Model model) {
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword(K_NAME);
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.deleteKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "home"; //home.jsp
	}


}



