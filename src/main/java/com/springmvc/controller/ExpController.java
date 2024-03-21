package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.domain.Content;
import com.springmvc.domain.Review;
import com.springmvc.service.ExpService;
import com.springmvc.service.ReviewService;

@RequestMapping("exps")
@Controller
public class ExpController {
	
	@Autowired
	private ExpService expService;
	@Autowired
	private HttpSession session;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping
	public String requestExpList(Model model) {
		List<Content> list = expService.getAllExpList();
		model.addAttribute("expList", list);
		return "exp/exps";
	}
	
	@GetMapping("/areaName/{areaName}") //지역명 검색 % + @@ + %
	public String requestExpsByAreaName(@PathVariable("areaName") String expAreaName, Model model)
	{
		List<Content> expsByAreaName = expService.getExpListByAreaName(expAreaName);
		
		model.addAttribute("expList", expsByAreaName);
		return "exp/exps";
	}
	
	@GetMapping("/title/{title}") //업체명 검색 % + @@ + %
	public String requestExpsByTitle(@PathVariable("title") String expTitle, Model model)
	{
		List<Content> expsByTitle = expService.getExpListByTitle(expTitle);
		
		model.addAttribute("expList", expsByTitle);
		return "exp/exps";
	}
	
	@GetMapping("/keyword/{keyword}") //키워드 검색 % + @@ + %
	public String requestExpsByKeyword(@PathVariable("keyword") String expKeyword, Model model)
	{
		List<Content> expsByKeyword = expService.getExpListByKeyword(expKeyword);
		
		model.addAttribute("expList", expsByKeyword);
		return "exp/exps";
	}
	
	@GetMapping("/exp")
	public String requestExpByNum(@RequestParam("num")String contentSeq, Model model, @ModelAttribute("NewReview") Review review) {
		System.out.println("expController.requestExpByNum() 도착");
		System.out.println("contentSeq: " + contentSeq);
		Content expByNum = expService.getExpByNum(contentSeq);
		model.addAttribute("exp", expByNum);
		
		//리뷰
		List<Review> list = reviewService.getAllReviewList(contentSeq);   // ${}를 나오게 해줌
		   model.addAttribute("reviewList", list);                // ${}를 나오게 해줌
		   
		String sessionId = (String)session.getAttribute("sessionId");
		System.out.println("sessionId: " + sessionId);
		int verify = reviewService.getCountReviewByIdAndContentSeq(sessionId, contentSeq);
		model.addAttribute("verify", verify);
		if(verify == 1) {
			System.out.println("리뷰 있음");
			Review myReview = reviewService.getReviewByIdAndContentSeq(sessionId, contentSeq);
			System.out.println("myReview text: " + myReview.getText());
			model.addAttribute("myReview", myReview);
		}
		   
		return "exp/exp";
	}
	
	@PostMapping("/exp")
    public String submitAddReviewForm(@ModelAttribute("NewReview") Review review, @RequestParam("num") String contentSeq, Model model){       
       model.addAttribute("num", contentSeq);
       String sessionId = (String)session.getAttribute("sessionId");
      reviewService.setNewReview(review, contentSeq, sessionId);
       return "redirect:/exps/exp";     
    }
	
	@PostMapping("/review/update")
	public String submitUpdateReviewForm() {
		System.out.println("ExpController.submitUpdateReviewForm() 도착");
		Review review = new Review();
		String contentSeq = (String)request.getParameter("contentSeq");
		String star = (String)request.getParameter("star");
		String text = (String)request.getParameter("text");
		String mem_id = (String)request.getParameter("mem_id");
		
		review.setContentSeq(contentSeq);
		review.setStar(star);
		review.setText(text);
		review.setMem_id(mem_id);
		
		System.out.println("contentSeq: " + review.getContentSeq());
		System.out.println("mem_id: " + review.getMem_id());
		System.out.println("text: " + review.getText());
		reviewService.updateReview(review);
		System.out.println("Controller 복귀");

		return "redirect:/exps/exp?num=" + review.getContentSeq(); 
	}
	
	@GetMapping("/review/delete")
	public String deleteReview(@RequestParam("num")String num, @RequestParam("contentSeq")String contentSeq) {
		System.out.println("ExpController.deleteReview() 도착");
		reviewService.deleteReview(num);
		return "redirect:/exps/exp?num=" + contentSeq;
	}
	
	@GetMapping("/add_api")
	public String addExpsByAPI() {
		System.out.println("ExpController.addExpsByAPI() 도착");
		expService.addExpByAPI();
		
		return "redirect:/home";
	}
	
}
