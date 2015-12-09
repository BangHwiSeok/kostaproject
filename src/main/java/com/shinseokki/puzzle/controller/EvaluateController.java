package com.shinseokki.puzzle.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

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
import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.Evaluation;
import com.shinseokki.puzzle.dto.KeywordSelected;
import com.shinseokki.puzzle.dto.MyKeyword;
import com.shinseokki.puzzle.service.EvaluationService;
import com.shinseokki.puzzle.service.MyKeywordService;

@RestController
@RequestMapping("/evalues")
public class EvaluateController {
	private final static Logger logger = LoggerFactory.getLogger(EvaluateController.class);
	private EvaluationService evaluationService;
	private MyKeywordService myKeywordService;
	
	private int currentUserNum = 15;
	@Autowired
	public EvaluateController(EvaluationService evaluationService,MyKeywordService myKeywordService) {
		this.evaluationService = evaluationService;
		this.myKeywordService = myKeywordService;
	}

	/*
	 * @param CurrentUser currentUser - 평가하고 있는 user
	 * 
	 * @description Evaluation Table에 있는 사람 중에서 가입 완료 전인 사람 한 명을 가져와 보여준다. 현재의
	 * 날짜에 평가를 한 기록이 있으면 평가를 못하게 한다.
	 */
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView eveluateHome(HttpServletRequest req){
		ModelAndView mav = new ModelAndView("evalues/home");
		CurrentUser currentUser = (CurrentUser) req.getSession().getAttribute("currentUser");
		if(currentUser != null)
			currentUserNum=currentUser.getUserNum();
		
		Evaluation eval = evaluationService.selectEvaluation(currentUserNum);
		// 현재 사용자가 오늘 평가를 한 기록이 있는 지 확인한다.
			// 평가한 기록이 있을 때
		if(eval == null){
			logger.info("EVAL NULL");
			mav.addObject("non_eval",true);
				// -> MadelAndView에 redirect로 MainView로 보낸다.
			// 평가한 기록이 없을 때
		}else{
				// -> Keyword를 줄 사람을 선정한다.
				// -> 평가한 기록을 남긴다.
			mav.addObject("non_eval",false);
			mav.addObject("eval",eval);
			logger.info("EVAL {} ",eval.getE_eval());
		}
		
		System.out.println(req.getRealPath("/resources"));
		
		return mav;
	}

	//    Session을 받아와 evalHistory에 저장한다.
	
	@RequestMapping(value = "/create/{u_num}", method = RequestMethod.POST)
	public HashMap<String, Boolean> putKeywords(@RequestParam HashMap<String, String> params,
			@PathVariable Integer u_num) {
		logger.info("User : {} ", u_num);
		logger.info("Key1 : {} ", params.get("keyword1"));
		logger.info("Key2 : {} ", params.get("keyword2"));
		
		
		HashMap<String, Boolean> returnValue = new HashMap<String, Boolean>();
		// 기존에 있었던 키워드인지 확인한다.
			// 있었던 키워드라면 다시 입력하라고 알려준다.
		// 상대방의 키워드에 추가한다.
		
		returnValue.put("callback", myKeywordService.saveKeywords(u_num, currentUserNum, params.get("keyword1"), params.get("keyword2")));
		/*if( !myKeywordService.duplicatedKeyword(u_num, params.get("keyword1"))){
			if(!myKeywordService.duplicatedKeyword(u_num, params.get("keyword2"))){
				MyKeyword k = new MyKeyword();
				k.setKeyword(params.get("keyword1"));
				k.setU_num(u_num);
				k.setStatus(KeywordSelected.RECEIVED);
				
				System.out.println(k.toString());
				
				myKeywordService.addMyKeyword(k);
				
				k.setKeyword(params.get("keyword2"));
				myKeywordService.addMyKeyword(k);
				
				returnValue.put("callback", true);
				
				// 키워드를 준 것을 완료했다면, EvalHistory Table 저장한다.
				myKeywordService.saveHistory(u_num, currentUserNum);
				
				
			}else{
				returnValue.put("callback", false);
			}
		}*/

		return returnValue;
	}

}
