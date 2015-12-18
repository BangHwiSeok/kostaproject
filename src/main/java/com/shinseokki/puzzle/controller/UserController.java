package com.shinseokki.puzzle.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.UserInfo;
import com.shinseokki.puzzle.service.MyKeywordService;
import com.shinseokki.puzzle.service.ProfileService;
import com.shinseokki.puzzle.service.UserService;

@RestController
public class UserController {
	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	private UserService userService;
	private ProfileService profileService;
	private MyKeywordService myKeywordService;

	@Autowired
	public UserController(UserService userService, ProfileService profileService,MyKeywordService myKeywordService) {
		this.userService = userService;
		this.profileService = profileService;
		this.myKeywordService = myKeywordService;
	}

	/*
	 * @param Model model - 기본적인 User 정보를 보여주기 위한 곳
	 * 
	 * @return String - 결과를 보여 주는 view
	 */
	@RequestMapping(value="/console",method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		ModelAndView mav = new ModelAndView("members/adminUserView");
		/*mav.addObject("users", userService.getUsers(1));
		mav.addObject("userPageNo", 1);
		mav.addObject("userTotalPageNum", userService.getTotalPage());*/

		return mav;
	}

	// MyPage 보기 현재 자기의 정보를 볼 수 있다.
	@RequestMapping(value={"/members/{id}", "/members"}, method = RequestMethod.GET)
	public ModelAndView showMyPage(CurrentUser currentUser ) {
		ModelAndView mav = new ModelAndView("members/myInfo");

		mav.addObject("myInfo", userService.getUserInfo(currentUser.getUserNum()));

		/* logger.info(currentUser.getRole().toString()); */

		return mav;
	}

	// Image Update를 위해 따로 Form을 만들어야 함

	@RequestMapping(value="/members/{id}/update", method = RequestMethod.POST)
	public String unapproveUser(@PathVariable Integer id,CurrentUser currentUser, Model model, HttpServletRequest req) {
		logger.info("User unapproval Method : {}", id);
		// 사진 Update 일 경우 RealPath에 있는 file을 바꾼다.
		String path = req.getSession().getServletContext().getRealPath("/resources");

		return "OK";
	}

	@RequestMapping(value="/members/{id}/pwd", method = RequestMethod.POST)
	public String changePWD(@PathVariable Integer id, CurrentUser currentUser ,String pwd) {
		logger.info("User unapproval Method :  ID - {}, PWD - {} ", id, pwd);
		
		if(id == currentUser.getUserNum() || currentUser.getUserNum()==0){
			// UserService 내에서 비밀번호를 암호화 해준다.
			userService.changePwd(id, pwd);
			return "OK";
		}else{
			return "NO";
		}
	}

	@RequestMapping(value="/console/{id}/approval", method = RequestMethod.GET)
	public String approveUser(@PathVariable Integer id, CurrentUser currentUser,Model model) {
		logger.info("User Approval Method : {}", id);
		
		if(currentUser.getUserNum() == 0){
			userService.approvalUser(id);
			return "OK";
		}else{
			return "NO";
		}
	}

	/*
	 * @param String id User ID
	 * 
	 * @praam HttpServletRequest req 사진이 저장된 RealPath를 찾기 위해 사용되는 class
	 * 
	 * @description User의 모든 정보를 지운다.
	 */
	@RequestMapping(value="/members/{id}/delete", method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer id, HttpServletRequest req) {
		logger.info("User Approval Method : {}", id);

		String path = req.getSession().getServletContext().getRealPath("/resources");

		return "" + userService.deleteUser(id, path);
	}
	
	/*
	 * @param String id User ID 쪽지를 보내고자 하는 상대방 ID
	 * @param CurrentUser currentUser 현재 로그인한 사람의 정보
	 * @param Model model 상대방 정보를 담아 보내는 부분
	 * @description 
	 * 	{id}를 가진 상대의 keyword 정보와 사진정보를 반환한다.
	 */
	@RequestMapping(value="/members/{id}/info", method = RequestMethod.GET)
	public ModelAndView getMatchingUser(@PathVariable Integer id, CurrentUser currentUser, Model model) {
		logger.info("User Keyword Info: {}", id);
		ModelAndView mav = new ModelAndView("members/userKeywordInfo");
		
		// Profile
		// MyKeyword를 model에 담아 보내준다.
		
		mav.addObject("userInfo", userService.getUserInfo(id));

		return mav;
	}

	/*
	 * @param int pageNo - Paging 처리를 위해 필요한 page number
	 * 
	 * @param Model model - Paging 결과를 보내기 위한 객체
	 * 
	 * @return ModelAndView - Paging 결과를 보여 주는 view
	 */
	@RequestMapping(value="/console/list" , method = RequestMethod.GET)
	public ModelAndView showUsers(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		logger.info("User List Methd  Page Number : {}", pageNo);
		ModelAndView mav = new ModelAndView("members/userList");

		mav.addObject("users", userService.getUsers(pageNo));
		mav.addObject("userPageNo", pageNo);
		mav.addObject("userTotalPageNum", userService.getTotalPage());

		return mav;
	}

	/*
	 * @param int unApprovalPageNo - Paging 처리를 위해 필요한 page number
	 * 
	 * @param int unApprovalTotalPageNum - Paging 처리를 위해 필요한 total page number
	 * 
	 * @param Model model - Paging 결과를 보내기 위한 객체
	 * 
	 * @return ModelAndView - Paging 결과를 보여 주는 view
	 */
	@RequestMapping(value="/console/members/list/approval", method = RequestMethod.GET)
	public ModelAndView showUsers(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@PathVariable Map<String, String> pathVariable, Model model) {
		logger.info("User List Methd  Page Number : {}", pageNo);
		ModelAndView mav = new ModelAndView("members/unappovalUsers");

		logger.info("TYPE : {}", pathVariable.get("type"));

		// User List에 대한 요청은 PathVariable에 값이 없다
		// PathVariable이 unapproval이었을 때, 승인되지 않은 사람들을 보낸다.
		mav.addObject("unApprovalPageNo", pageNo);
		int unApprovalTotalNum = userService.countByActiveType();
		mav.addObject("unApprovalTotalPageNum", unApprovalTotalNum);
		System.out.println("unApprovalTotalPageNum"+unApprovalTotalNum);
		// User들의 프로파일을 들고오기 위한 것
		Collection<UserInfo> userInfoList = new ArrayList<>();
		if (unApprovalTotalNum > 0) {
			userService.getUnApprovalUsers(pageNo).stream().forEach((u) -> {
				UserInfo info = new UserInfo();
				info.setUser(u);
				info.setProfiles(profileService.find(u.getU_num()));
				userInfoList.add(info);
			});
		}

		mav.addObject("users", userInfoList);

		return mav;
	}
	
	/*
	 */
	@RequestMapping(value = { "/mykeywords" }, method = RequestMethod.GET)
	public ModelAndView selectMyKeywors(CurrentUser currentUser) {
		logger.info("/mykeywords  user : {}", currentUser.getId());
		ModelAndView mav = new ModelAndView("members/keywordCheck");

		mav.addObject("myKeywords", myKeywordService.findMyKeywords(currentUser.getUserNum()));
		// keyword 삭제
		
		// ROLE_USER 로 
		return mav;
	}
	
	/*
	 */
	@RequestMapping(value = { "/mykeywords" }, method = RequestMethod.POST)
	public ModelAndView deleteMyKeywors(@RequestParam("delete") String[] delete, CurrentUser currentUser) {
		logger.info("/mykeywords  user : {}", currentUser.getId());
		logger.info("/mykeywords  POST : {}", delete);
		ModelAndView mav = new ModelAndView("redirect:/logout");
		Arrays.asList(delete).forEach((s)->{
			System.out.println(s);
		});
		
		userService.updateRoleMyKeyword(currentUser.getUser(), delete);
		
		mav.addObject("myKeywords", myKeywordService.findMyKeywords(currentUser.getUserNum()));

		return mav;
	}

	@RequestMapping(value = "/waitingpage" , method = RequestMethod.GET)
	public ModelAndView waitingPage( CurrentUser currentUser) {
		logger.info("/waitingpage  user : {}", currentUser.getId());
		ModelAndView mav = new ModelAndView("waitingpage");
		

		return mav;
	}

}
