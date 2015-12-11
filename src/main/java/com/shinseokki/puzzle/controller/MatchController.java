package com.shinseokki.puzzle.controller;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.Profile;
import com.shinseokki.puzzle.service.ProfileService;
import com.shinseokki.puzzle.service.RecommendService;

@Controller
@RequestMapping("/matches")
public class MatchController {
	private final static Logger logger = LoggerFactory.getLogger(MatchController.class) ;
	private RecommendService recommendService;
	private ProfileService profilService;
	
	@Autowired
	public MatchController(RecommendService recommendService,ProfileService profilService) {
		this.recommendService = recommendService;
		this.profilService = profilService;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String matchCouple(Model model){
		logger.info("matchCouple Come In : /matches");
		
		model.addAttribute("first", "matches/meet");
		model.addAttribute("second", "matches/search");
		
		return "matches/home";
	}
	
	@RequestMapping(value="/meet",method=RequestMethod.GET)
	public String matchPerson(Model model){
		logger.info("matchCouple Come In : /matches/meet");
		CurrentUser currentUser = (CurrentUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.info("Logged in User : {}", currentUser.getUserNum());
		int u_num = 0;
		// 추천 2 명을 해준다.
			// 본인과 다른 성을 가진 사람을 추천해준다.
		
		model.addAttribute("users", recommendService.recommendUsers(currentUser.getUserNum(),currentUser.getGender()));
		return "matches/meet";
	}
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public String matchSearch(){
		logger.info("matchCouple Come In : /matches/meet");
		
		
		return "matches/search";
	}
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String searchMatching(@RequestParam("key[]") String[] key, Model model){
		logger.info("보여주기 Come In : /matches/meet");
		System.out.println(key.length);
		Arrays.asList(key).forEach((s) -> {
			System.out.println(s);
		});
		CurrentUser user = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<Integer, Collection<Profile>> usersMap =recommendService.recommendUsers(user.getUserNum(), user.getGender());
		
		model.addAttribute("users", usersMap);
		
		return "matches/searchResult";
	}

}
