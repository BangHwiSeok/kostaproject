package com.shinseokki.puzzle.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.service.UserService;


@RestController
@RequestMapping("/members")
public class UserController {
	private final static Logger logger = LoggerFactory.getLogger(UserController.class);
	private UserService userService;
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
		
	}

	/*
	 * @param Model model - 기본적인 User 정보를 보여주기 위한 곳
	 * 
	 * @return String - 결과를 보여 주는 view
	 */
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		ModelAndView mav = new ModelAndView("members/adminUserView");

		return mav;
	}

	// MyPage 보기 현재 자기의 정보를 볼 수 있다.
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView showMyPage(@PathVariable("id") Integer id /*,CurrentUser currentUser*/) {
		ModelAndView mav = new ModelAndView("members/myInfo");
		
		mav.addObject("myInfo", userService.findByUserNum(id).get());
		
		/*logger.info(currentUser.getRole().toString());*/

		return mav;
	}

	// Image Update를 위해 따로 Form을 만들어야 함
	
	@RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
	public String unapproveUser(@PathVariable Integer id, Model model, HttpServletRequest req) {
		logger.info("User unapproval Method : {}", id);
		// 사진 Update 일 경우 RealPath에 있는 file을 바꾼다.
		String path =req.getSession().getServletContext().getRealPath("/resources");
		
		return "OK";
	}
	
	@RequestMapping(value = "/{id}/pwd", method = RequestMethod.POST)
	public String changePWD(@PathVariable Integer id, String pwd) {
		logger.info("User unapproval Method :  ID - {}, PWD - {} ", id, pwd);
		
		// UserService 내에서 비밀번호를 암호화 해준다.
		userService.changePwd(id, pwd);
		
		return "OK";
	}
	
	
	
	@RequestMapping(value = "/{id}/approval", method = RequestMethod.GET)
	public String approveUser(@PathVariable Integer id, Model model) {
		logger.info("User Approval Method : {}", id);
		userService.approvalUser(id);
		
		return "OK";
	}
	
	/*
	 * @param String id  User ID
	 * @praam HttpServletRequest req 사진이 저장된 RealPath를 찾기 위해 사용되는 class
	 * @description 
	 * 	User의 모든 정보를 지운다.
	 */
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
	public String deleteUser(@PathVariable Integer id,HttpServletRequest req) {
		logger.info("User Approval Method : {}", id);
		
		String path = req.getSession().getServletContext().getRealPath("/resources");
		
		return ""+userService.deleteUser(id, path);
	}

	/*
	 * @param int pageNo - Paging 처리를 위해 필요한 page number
	 * 
	 * @param Model model - Paging 결과를 보내기 위한 객체
	 * 
	 * @return ModelAndView - Paging 결과를 보여 주는 view
	 */
	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
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
	 * @param int unApprovalTotalPageNum  - Paging 처리를 위해 필요한 total page number
	 * @param Model model - Paging 결과를 보내기 위한 객체
	 * 
	 * @return ModelAndView - Paging 결과를 보여 주는 view
	 */
	@RequestMapping(value = "/list/approval", method = RequestMethod.GET)
	public ModelAndView showUsers(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@PathVariable Map<String, String> pathVariable, Model model) {
		logger.info("User List Methd  Page Number : {}", pageNo);
		ModelAndView mav = new ModelAndView("members/unappovalUsers");

		logger.info("TYPE : {}", pathVariable.get("type"));

		// User List에 대한 요청은 PathVariable에 값이 없다
		// PathVariable이 unapproval이었을 때, 승인되지 않은 사람들을 보낸다.
		mav.addObject("unApprovalPageNo", pageNo);
		mav.addObject("unApprovalTotalPageNum", userService.countByActiveType());
		mav.addObject("users", userService.getUnApprovalUsers(pageNo));

		return mav;
	}
	

    @RequestMapping("/findid")
    @ResponseBody
    public String findIdByPhone(String u_pnum){
    	logger.info("User phonenumber :{} ", u_pnum);
    	
    	String id = userService.findIdByPhone(u_pnum);
    	
    	if(id.equals("")){
    		id= "해당 휴대폰 번호를 찾을 수 없습니다.";
    	}
    	
        return id;
    }

    @RequestMapping("/findpwd")
    public String findPwdByIdPhone(String u_id, String u_pnum){
    	logger.info("User ID:{}  User Phone:{}", u_id, u_pnum);
    
    	String findpwd = userService.findPwdByIdPhone(u_id, u_pnum);
    	if(findpwd==""){
    		findpwd= "해당 비밀번호를 찾을 수 없습니다.";
    	}
    	
    	return findpwd;
    }
    
    
    
}
