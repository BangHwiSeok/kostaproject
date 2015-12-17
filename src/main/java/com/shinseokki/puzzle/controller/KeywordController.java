package com.shinseokki.puzzle.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		ModelAndView mav = new ModelAndView("keywords/findKeyword");
		
		model.addAttribute("serverTime");
		
		
		
		return mav;
	}
	
         
	/*@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView getKeywords(@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo, HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView("keywords/findKeyword");
		return mav;
	}*/
	
	@RequestMapping(method=RequestMethod.POST)
	public String addKeyword(String K_NAME, String K_GROUP, Model model){
		
		logger.info("Register Keyword : {}, Keyword Group : {}",K_NAME, K_GROUP);
		Keyword keyword = new Keyword();
		keyword.setK_NAME(K_NAME);
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.addkeyword(keyword);
		model.addAttribute("keyword",keyword);
		
		return "myinfo";
		}
       
         
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView getKeywords(@RequestParam(value="pageNo", required=false, defaultValue="1") Integer pageNo) throws Exception {

		logger.info("getKeywordPaging!");
		int start = (pageNo-1) * ROWSIZE + 1; 
		int end = start + ROWSIZE-1;
		
		int total = keywordDao.getKeywordCount(); 
		int totalpage = (int) Math.ceil(total/(double)ROWSIZE);       
		
		List<Keyword> list = keywordDao.getKeywords(start,end);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("keywords", list); 
		mav.setViewName("keywordList"); 
		
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value="{id}/update", method=RequestMethod.GET)
	public String upadteform(@PathVariable("id") Integer id, String k_name, Model model) {

		
		Keyword keyword = new Keyword();
		keyword = keywordDao.find(k_name);
		
		keywordDao.updateKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		
		return "ok"; 
	}


	
	
	

	@RequestMapping("/updateform")
	public String update(String k_name, String K_GROUP, Model model) {
		
		Keyword keyword = keywordDao.find(k_name);
		keyword.setK_GROUP(K_GROUP);
		
		keywordDao.updateKeyword(keyword);
		
		
		return "OK";
	}
	
	
	@RequestMapping(value="{id}/delete", method=RequestMethod.GET)
	public String deleteform(@PathVariable("id") Integer id,String k_name) {
		
		
		Keyword keyword = keywordDao.find(k_name);
		
		keywordDao.deleteKeyword(keyword.getK_NAME());
		
		

		return "ok";
	}
	
	@RequestMapping(value="/{words}/find", method=RequestMethod.GET)
	public List<Keyword> findKeyword(@PathVariable String words){
		List<Keyword> list = keywordDao.findLikeWord('%'+words+'%');
		
		return list;

		
	}
	
	@RequestMapping(value="/find/{word}", method=RequestMethod.GET)
	public List<Keyword> findKeywords(@PathVariable("word") String word) {
		/*List<String> test = new ArrayList<String>();*/
		List<Keyword> keywords = keywordDao.findLikeWord(word);
		
		
		
		//keywordDao.deleteKeyword(K_NAME);
		logger.info("findKeywords : {}",keywords.toString());
		
		return keywords; 

	}
	
	


}



