package com.shinseokki.puzzle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public ModelAndView getReports(){
		System.out.println("get 겟리포트");
		ModelAndView mav = new ModelAndView("reports/reportform");
		mav.addObject("reportForm", new ReportForm());
		return mav;
	}
	
	// report 를 기본으로 호출했을 시 기본으로 거치게 되는 메소드
	@RequestMapping(method=RequestMethod.POST)
	public void postReports(@ModelAttribute("reportForm") ReportForm reportForm,
			HttpServletRequest req, int u_num){
		System.out.println("post 겟리포트" + reportForm.toString());
		try {
			reportService.sendReport(reportForm, req.getSession().getServletContext().getRealPath("/resources"), u_num);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 모든 신고내역 보기
	@RequestMapping("/reportlist")
	public ModelAndView Reports(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		ModelAndView mav = new ModelAndView("reports/reports");
		
		mav.addObject("reportList", reportService.getReports(pageNo));
		mav.addObject("allCount", reportService.getReportCount());
		mav.addObject("noCheckCount", reportService.getNoCheckCount());
		mav.addObject("pageNo", 1);
		return mav;
	}
	
	
	// 모든 신고내역 보기
	@RequestMapping("/getAllReports")
	public ModelAndView getAllReports(//@PathVariable 
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") 
										Integer pageNo,	Model model) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportList", reportService.getReports(pageNo));
		mav.addObject("allCount", reportService.getReportCount());
		mav.addObject("noCheckCount", reportService.getNoCheckCount());
		mav.addObject("pageNo", reportService.getTotalPage());
		return mav;
	}

	// 체크한 신고내역 보기
	@RequestMapping("/getCheckReports")
	public ModelAndView getCheckReports(//@PathVariable 
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") 
			Integer pageNo, Model model) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportList", reportService.getCheckReports(pageNo));
		mav.addObject("allCount", reportService.getReportCount());
		mav.addObject("noCheckCount", reportService.getNoCheckCount());
		mav.addObject("pageNo", reportService.getCheckTotalPage());
		return mav;
	}

	// 미체크한 신고내역 보기
	@RequestMapping("/getNoCheckReports")
	public ModelAndView getNoCheckReports(//@PathVariable 
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") 
			Integer pageNo, Model model) {
		ModelAndView mav = new ModelAndView("reports/reportlist");
		
		mav.addObject("reportList", reportService.getNoCheckReports(pageNo));
		mav.addObject("allCount", reportService.getReportCount());
		mav.addObject("noCheckCount", reportService.getNoCheckCount());
		mav.addObject("pageNo", reportService.getNoCheckTotalPage());
		return mav;
	}
	
	// 신고내역 디테일 뷰 보기
	@RequestMapping(value = "/{rp_num}/getReport", method = RequestMethod.GET)
	public ModelAndView getReport(@PathVariable Integer rp_num ) {
		ModelAndView mav = new ModelAndView("reports/reportdetail");
		
		mav.addObject("reportDetail", reportService.getReport(rp_num));

		return mav;
	}
	
	// 신고내역 체크하기
	@RequestMapping(value = "/{rp_num}/checkReport", method = RequestMethod.GET)
	public ModelAndView checkReport(@PathVariable Integer rp_num) {
		ModelAndView mav = new ModelAndView("reports/redirect");
		reportService.checkReport(rp_num);
		
		return mav;
		
	}

	// 신고내역 삭제하기
	@RequestMapping(value = "/{rp_num}/deleteReport", method = RequestMethod.GET)
	public ModelAndView deleteReport(@PathVariable Integer rp_num, HttpServletRequest req ) {
		
		ModelAndView mav = new ModelAndView("reports/redirect");
		reportService.deleteReport(rp_num, req.getSession().getServletContext().getRealPath("/resources"));
		
		return mav;
	}
	

}
