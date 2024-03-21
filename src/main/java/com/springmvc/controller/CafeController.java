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
import com.springmvc.service.CafeService;
import com.springmvc.service.ReviewService;

@RequestMapping("cafes")
@Controller
public class CafeController {

	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping
	public String requestCafeList(Model model) {
		List<Content> list = cafeService.getAllCafeList();
		model.addAttribute("cafeList", list);
		return "cafe/cafes";
	}
	
	@GetMapping("/areaName/{areaName}") //지역명 검색 % + @@ + %
	public String requestCafesByAreaName(@PathVariable("areaName") String cafeAreaName, Model model)
	{
		List<Content> cafesByAreaName = cafeService.getCafeListByAreaName(cafeAreaName);
		
		//예외처리
		//if (cafesByAreaName == null || cafesByAreaName.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("cafeList", cafesByAreaName);
		return "cafe/cafes";
	}
	
	@GetMapping("/title/{title}") //업체명 검색 % + @@ + %
	public String requestCafesByTitle(@PathVariable("title") String cafeTitle, Model model)
	{
		List<Content> cafesByTitle = cafeService.getCafeListByTitle(cafeTitle);
		
		
		//예외처리
		//if (cafesByTitle == null || cafesByTitle.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("cafeList", cafesByTitle);
		return "cafe/cafes";
	}
	
	@GetMapping("/keyword/{keyword}") //키워드 검색 % + @@ + %
	public String requestCafesByKeyword(@PathVariable("keyword") String cafeKeyword, Model model)
	{
		List<Content> cafesByKeyword = cafeService.getCafeListByKeyword(cafeKeyword);
		
		//예외처리
		//if (cafesByKeyword == null || cafesByKeyword.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("cafeList", cafesByKeyword);
		return "cafe/cafes";
	}
	
	@GetMapping("/cafe")
	public String requestCafeByNum(@RequestParam("num")String contentSeq, Model model, @ModelAttribute("NewReview") Review review) {
		System.out.println("cafeController.requestCafeByNum() 도착");
		System.out.println("contentSeq: " + contentSeq);
		Content cafeByNum = cafeService.getCafeByNum(contentSeq);
		model.addAttribute("cafe", cafeByNum);
		
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
		   
		return "cafe/cafe";
	}
	
	@PostMapping("/cafe") //리뷰 제출
    public String submitAddReviewForm(@ModelAttribute("NewReview") Review review, @RequestParam("num") String contentSeq, Model model)
    {       
       model.addAttribute("num", contentSeq);
       String sessionId = (String)session.getAttribute("sessionId");
      reviewService.setNewReview(review, contentSeq, sessionId);
       return "redirect:/cafes/cafe";     
    }
	
	@PostMapping("/review/update")
	public String submitUpdateReviewForm() {
		System.out.println("CafeController.submitUpdateReviewForm() 도착");
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

		return "redirect:/cafes/cafe?num=" + review.getContentSeq(); 
	}
	
	@GetMapping("/review/delete")
	public String deleteReview(@RequestParam("num")String num, @RequestParam("contentSeq")String contentSeq) {
		System.out.println("CafeController.deleteReview() 도착");
		reviewService.deleteReview(num);
		return "redirect:/cafes/cafe?num=" + contentSeq;
	}
	
	@GetMapping("/add_api")
	public String addCafesByAPI() {
		System.out.println("CafeController.addCafesByAPI() 도착");
		cafeService.addCafeByAPI();
		
		return "redirect:/home";
	}
}
