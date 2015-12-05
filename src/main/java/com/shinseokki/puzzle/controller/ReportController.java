package com.shinseokki.puzzle.controller;

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

import com.shinseokki.puzzle.HomeController;
import com.shinseokki.puzzle.dto.ReportForm;
import com.shinseokki.puzzle.service.ReportService;

@RestController
@RequestMapping("/reports")
public class ReportController {
	private static final Logger logger 
		= LoggerFactory.getLogger(HomeController.class);
	private ReportService reportService;

	@Autowired
	public ReportController(ReportService reportService) {
		this.reportService = reportService;
	}

	// report 를 기본으로 호출했을 시 기본으로 거치게 되는 메소드
	@RequestMapping(method=RequestMethod.GET)
	public String getReports(Model model){
		System.out.println("get 겟리포트");
		model.addAttribute("reportForm", new ReportForm());
		return "reports/reportform";
	}
	
	// report 를 기본으로 호출했을 시 기본으로 거치게 되는 메소드
	@RequestMapping(method=RequestMethod.POST)
	public String postReports(ReportForm reportForm){
		System.out.println("post 겟리포트" + reportForm.toString());
		return "reports/reportform";
	}
	
	// 모든 신고내역 보기
	@RequestMapping("/getAllReports")
	public ModelAndView getAllReports(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportList", reportService.getReports(pageNo));

		return mav;
	}

	// 체크한 신고내역 보기
	@RequestMapping("/getCheckReports")
	public ModelAndView getCheckReports(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportList", reportService.getCheckReports(pageNo));

		return mav;
	}

	// 미체크한 신고내역 보기
	@RequestMapping("/getNoCheckReports")
	public ModelAndView getNoCheckReports(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportList", reportService.getNoCheckReports(pageNo));

		return mav;
	}
	
	// 미체크한 신고내역 보기
	@RequestMapping(value = "/{rp_num}/getReport", method = RequestMethod.GET)
	public ModelAndView getReport(@PathVariable Integer rp_num ) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportDetail", reportService.getReport(rp_num));

		return mav;
	}





}
