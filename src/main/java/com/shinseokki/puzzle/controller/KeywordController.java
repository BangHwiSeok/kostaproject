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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dao.KeywordDao;
import com.shinseokki.puzzle.dto.Keyword;

@RestController
@RequestMapping("/keywords")
public class KeywordController {
private static final Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	private KeywordDao keywordDao;
	private static final int ROWSIZE = 10; 
	
	@Autowired
	public KeywordController(SqlSession sqlSession) {
		keywordDao = sqlSession.getMapper(KeywordDao.class);
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView  home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		ModelAndView mav = new ModelAndView("keywordView"); //view를 이거로한다
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return mav;
	}
	
         
	@RequestMapping(value="/list", method=RequestMethod.GET)
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
	
	
	
	
	@RequestMapping(value="{id}/update", method=RequestMethod.GET)
	public String upadteform(String K_NAME, Model model) {
		//model은 객체를 담아주는 역할
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword();
		
		keywordDao.updateKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "ok"; 
	}

	
	
	
	@RequestMapping(value="{id}/delete", method=RequestMethod.GET)
	public String deleteform(String K_NAME) {
		
		
		Keyword keyword = new Keyword();
		keyword = keywordDao.getKeyword(); 
		
		keywordDao.deleteKeyword(K_NAME);
		
		
		return "ok";
	}
	
	@RequestMapping(value="/{words}/find", method=RequestMethod.GET)
	public List<Keyword> findKeyword(@PathVariable String words){
		List<Keyword> list = keywordDao.findKeywords('%'+words+'%');
		
		return list;
	}


}



