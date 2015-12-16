package com.shinseokki.puzzle.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dao.MessageDao;
import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.History;
import com.shinseokki.puzzle.dto.HistoryInfo;
import com.shinseokki.puzzle.service.HistoryService;

@RestController
@RequestMapping("/histories")
public class HistoryController {
	private MessageDao messageDao;
	private HistoryService historyService;
	
	@Autowired
	public HistoryController(SqlSession sqlSession,HistoryService historyService) {
		messageDao = sqlSession.getMapper(MessageDao.class);
		this.historyService = historyService;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView historyHome(CurrentUser user, Model model){
		ModelAndView mav = new ModelAndView("histories/home");
		/*mav.addObject("total", messageDao.countMessagInfo(42, 21));*/
		Collection<HistoryInfo> info = historyService.find(user.getUserNum());
		System.out.println(info);
		mav.addObject("histories",historyService.find(user.getUserNum()) );
		return mav;
	}
	
	/**
	 * JSon type으로 history 결과값을 반환한다.
	 * 만약 history 저장이 되지 않았을 경우 callback 값이 false 아니면 true
	 *
	 * @param  id  저장하고자 하는 대상의 u_num을 저장
	 * @param  currentUser 현재 로그인한 유저의 정보를 담고 있는 변수
	 * @return	JSon type으로 history 저장 결과를 알려주는 값      
	 */
	
	@RequestMapping(value="/create/{id}", method=RequestMethod.POST)
	public Map<String , Object> saveHisotry(@PathVariable Integer id, CurrentUser currentUser){
		
		Map<String,Object> returnMap = new HashMap<>();
		History history = new History();
		
		history.setH_num(id);
		history.setU_num(currentUser.getUserNum());
		
		boolean isSaved= historyService.save(history) > 0 ? true : false;
		
		returnMap.put("callback", isSaved);
		
		return returnMap;
	}
}
