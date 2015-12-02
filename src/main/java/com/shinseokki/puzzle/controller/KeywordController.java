package com.shinseokki.puzzle.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dao.KeywordDao;
import com.shinseokki.puzzle.dto.Keyword;

@Controller
public class KeywordController {
private static final Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	private KeywordDao keywordDao;
	private static final int ROWSIZE = 10; 
	
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
		
		return "home";
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
       
         
	@RequestMapping(value="/keywords/list", method=RequestMethod.GET)
	public ModelAndView getKeywords(@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo, HttpServletResponse resp) throws Exception {
		logger.info("getKeywordPaging!");
		int start = (pageNo-1) * ROWSIZE + 1; //현재페이지가 pageNo, 기본 defaultValue로 1잡아놔서 1로 시작함
		int end = start + ROWSIZE-1;
		
		int total = keywordDao.getKeywordCount(); //총 개수
		int totalpage = (int) Math.ceil(total/(double)ROWSIZE); //total page        ceil: 올림
		
		List<Keyword> list = keywordDao.getKeywords(start,end);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("keywords", list); //RequestsetAttribute 이거랑 쓰는 방법이 똑같다!!
		mav.setViewName("keywordList"); //EL언어 keywords  $keywords.(list의 value를 불러내 쓸 수 있다)
		
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String upadteform(String K_NAME, Model model) {
		//model은 객체를 담아주는 역할
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword();
		
		keywordDao.updateKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "updateform"; // updateform.jsp
	}

	@RequestMapping("/updateform")
	public String update(String K_NAME, String K_GROUP, Model model) {
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword();
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.updateKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "myinfo";
	}
	
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteform(String K_NAME) {
		
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword(); 
		
		keywordDao.deleteKeyword(K_NAME);
		
		
		return "deleteform"; // deleteform.jsp
	}
	
	@RequestMapping("/deleteform")
	public String delete(String K_NAME, String K_GROUP, Model model) {
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword();
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.deleteKeyword(K_NAME);
		
		model.addAttribute("keyword", keyword);
		
		return "home"; //home.jsp
	}


}



