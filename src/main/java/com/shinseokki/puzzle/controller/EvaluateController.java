package com.shinseokki.puzzle.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dao.EvalHistoryDao;
import com.shinseokki.puzzle.dto.EvalHistory;
import com.shinseokki.puzzle.dto.Evaluation;
import com.shinseokki.puzzle.service.EvaluationService;

@RestController
@RequestMapping("/evalues")
public class EvaluateController {
	private final static Logger logger = LoggerFactory.getLogger(EvaluateController.class);
	private EvalHistoryDao evalHistoryDao;
	private EvaluationService evaluationService;
	
	@Autowired
	public EvaluateController(EvaluationService evaluationService) {
		this.evaluationService = evaluationService;
	}
	
	/*
	 * @param CurrentUser currentUser - 평가하고 있는 user
	 * @description
	 * 	Evaluation Table에 있는 사람 중에서 
	 * 	가입 완료 전인 사람 한 명을 가져와 보여준다. 
	 * 	현재의 날짜에 평가를 한 기록이 있으면 평가를 못하게 한다.
	 */
	@SuppressWarnings("unused")
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView eveluateHome(HttpServletRequest req){
		// 현재 사용자가 오늘 평가를 한 기록이 있는 지 확인한다.
			// 평가한 기록이 없을 때
				// -> Keyword를 줄 사람을 선정한다.
				// -> 평가한 기록을 남긴다.
			// 평가한 기록이 있을 때
				// -> MadelAndView에 redirect로 MainView로 보낸다.
		ModelAndView mav;
		int e_eval = 0;
		Evaluation eval = evaluationService.selectEvaluation(e_eval);
		
		if(eval == null){
			mav = new ModelAndView("evalues/home","non_eval","평가 중인 사람이 없습니다.");
		}else{
				mav = new ModelAndView("evalues/home","eval",eval);
		}
		
		
		
		
		System.out.println(req.getRealPath("/resources"));
		
		return mav;
	}
	
	@RequestMapping(value="/create/{u_num}", method=RequestMethod.POST)
	public HashMap<String, String>  putKeywords(@RequestParam HashMap<String, String> params,@PathVariable Integer u_num){
		logger.info("User : {} ",u_num);
		logger.info("Key1 : {} ",params.get("keyword1"));
		logger.info("Key2 : {} ",params.get("keyword2"));
		
		HashMap<String, String>  returnValue = new HashMap<String,String>();
		
		returnValue.put("callback", "OK");
		
		return returnValue;
	}
	
}
