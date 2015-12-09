package com.shinseokki.puzzle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shinseokki.puzzle.HomeController;
import com.shinseokki.puzzle.dao.ItemDao;
import com.shinseokki.puzzle.dao.UserDao;
import com.shinseokki.puzzle.dto.CurrentUser;
import com.shinseokki.puzzle.dto.Item;

@Controller
@RequestMapping("/shop")
public class ShopController {

	private static final Logger logger 
		= LoggerFactory.getLogger(HomeController.class);

	private ItemDao itemDao;
	private UserDao userDao;
	
	@Autowired
	public ShopController(SqlSession sqlSession) {
		itemDao = sqlSession.getMapper(ItemDao.class);
		userDao = sqlSession.getMapper(UserDao.class);
	}
	
	
	// shop을 기본으로 호출했을 시 기본으로 거치게 되는 메소드
	@RequestMapping(method=RequestMethod.GET)
	public String getItems(
			HttpServletRequest req,  Model model){

		List<Item> itemList = itemDao.getItems();
		model.addAttribute("itemList", itemList);
		
		return "shop/shopitemlist";
	}
	
	@RequestMapping("/getItems")
	public String getItemlist(
			HttpServletRequest req,  Model model){

		List<Item> itemList = itemDao.getItems();
		model.addAttribute("itemList", itemList);
		
		return "shop/shopitemlist";
	}
	
	@RequestMapping(value="{i_num}/buyItem", method=RequestMethod.GET)
	public String getItemList(CurrentUser user, HttpServletRequest req, Model model,
			@PathVariable int i_num){

		Item item = itemDao.getItem(i_num);
		int cost = item.getI_cost();
		int userPoint = user.getPoint();
		
		// 구현해야 될 부분
		if(userPoint >= cost){
		}
		
		logger.info("=============== count 진행하기 ================ ");
		int count = itemDao.getItemCount();
		System.out.println("count : " + count);
		model.addAttribute("count", count);
		
		return "shop/shopitemlist";
	}
	
}
