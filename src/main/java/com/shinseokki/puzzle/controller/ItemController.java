package com.shinseokki.puzzle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.shinseokki.puzzle.dto.Item;

@Controller
@RequestMapping("/items")
public class ItemController {

	private static final Logger logger 
		= LoggerFactory.getLogger(HomeController.class);

	private ItemDao itemDao;

	@Autowired
	public ItemController(SqlSession sqlSession) {
		itemDao = sqlSession.getMapper(ItemDao.class);
	}

	// Items 를 기본으로 호출했을 시 기본으로 거치게 되는 메소드
	@RequestMapping(method=RequestMethod.GET)
	public String getItems(
			HttpServletRequest req,  Model model){

		List<Item> itemList = itemDao.getItems();
		model.addAttribute("itemList", itemList);
		
		return "item/items";
	}
	
	@RequestMapping("/itemlist")
	public String getItemList(
			HttpServletRequest req,  Model model){

		List<Item> itemList = itemDao.getItems();
		model.addAttribute("itemList", itemList);
		
		logger.info("=============== count 진행하기 ================ ");
		int count = itemDao.getItemCount();
		System.out.println("count : " + count);
		model.addAttribute("count", count);
		
		return "item/itemlist";
	}
	
	@RequestMapping("/itemInsertform")
	public String goInsertItemForm(Model model){
		logger.info("=============== insertItemform 으로 이동 ================");
		return "item/itemInsertform";
	}
	
	@RequestMapping(value="/insertItem", method=RequestMethod.POST)
	public String insertItem(HttpServletRequest req ,Model model){

		Item item = new Item();
		item.setI_name(req.getParameter("i_name"));
		//System.out.println(req.getParameter("i_key"));
		item.setI_key(Integer.parseInt(req.getParameter("i_key")));
		item.setI_msg(Integer.parseInt(req.getParameter("i_msg")));
		item.setI_search(Integer.parseInt(req.getParameter("i_search")));
		item.setI_cost(Integer.parseInt(req.getParameter("i_cost")));
		//item.setI_num(Integer.parseInt(req.getParameter("i_num")));
		logger.info("===============insert 진행하기================ {}", item.toString());
		itemDao.addItem(item);
		
		logger.info("===============리스트 부르기================");
		List<Item> itemList = itemDao.getItems();
		model.addAttribute("itemList", itemList);
		
		return "item/redirect";
	}
	
	
	@RequestMapping(value="{i_num}/deleteItem", method=RequestMethod.GET)
	public String deleteItem(@PathVariable String i_num, Model model){

		logger.info("=============== delete 진행하기 ================ ");
		System.out.println(i_num);
		itemDao.deleteItem(i_num);
		
		logger.info("===============리스트 부르기================");
		List<Item> itemList = itemDao.getItems();
		
		model.addAttribute("itemList", itemList);
		
		return "item/redirect";
	}
	
	@RequestMapping(value="{i_num}/updateItem", method=RequestMethod.POST)
	public String updateItem(@PathVariable String i_num, HttpServletRequest req, Model model){

		logger.info("=============== update 진행하기 ================ ");
		Item item = new Item();
		item.setI_name(req.getParameter("i_name"));
		item.setI_key(Integer.parseInt(req.getParameter("i_key")));
		item.setI_msg(Integer.parseInt(req.getParameter("i_msg")));
		item.setI_search(Integer.parseInt(req.getParameter("i_search")));
		item.setI_num(Integer.parseInt(i_num));
		item.setI_cost(Integer.parseInt(req.getParameter("i_cost")));
		//System.out.println(i_num);
		itemDao.updateItem(item);
		
		logger.info("===============리스트 부르기================");
		List<Item> itemList = itemDao.getItems();
		model.addAttribute("itemList", itemList);
		
		return "item/redirect";
	}
	
	@RequestMapping(value="/getItemCount", method=RequestMethod.GET)
	public String getItemCount(HttpServletRequest req ,Model model){

		logger.info("=============== count 진행하기 ================ ");
		itemDao.getItemCount();
		
		logger.info("=============== 리스트 부르기 ================");
		List<Item> itemList = itemDao.getItems();
		
		model.addAttribute("itemList", itemList);
		
		return "item/redirect";
	}
	
}
