package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.Course;
import com.springmvc.domain.Review;
import com.springmvc.domain.Content;
import com.springmvc.service.CourseService;
import com.springmvc.service.ReviewService;
import com.springmvc.service.SpotService;


@Controller
@RequestMapping("/spots")// 리퀘스트매핑을 찾아주는게 핸들러
public class SpotController 
{
	
	@Autowired // 클래스의 프로퍼티(멤버 변수)에 선언
	private SpotService spotService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping
	public String requestSpotList(Model model)
	{
		List<Content> list = spotService.getAllSpotList();
		model.addAttribute("spotList", list);		
		return "spot/spots"; //views폴더 안 리턴값.jsp 파일 servlet-context.xmㅣ 안에 뷰리졸버가 찾아서 연결해줌
	}
	
	@GetMapping("/all")
	public ModelAndView requestAllSpots()
	{
		ModelAndView modelAndView = new ModelAndView();
		List<Content> list = spotService.getAllSpotList();
		modelAndView.addObject("spotList", list);
		modelAndView.setViewName("spot/spots");
		return modelAndView;
	}
	
	@GetMapping("/contentSeq/{contentSeq}") //번호 검색
	public String requestSpotsByContentSeq(@PathVariable("contentSeq") String spotContentSeq, Model model)
	{
		List<Content> spotsByContentSeq = spotService.getSpotListByContentSeq(spotContentSeq);
		
		//예외처리
		//if (spotsByContentSeq == null || spotsByContentSeq.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("spotList", spotsByContentSeq);
		return "spot/spots";
	}
	
	@GetMapping("/areaName/{areaName}") //지역명 검색
	public String requestSpotsByAreaName(@PathVariable("areaName") String spotAreaName, Model model)
	{
		List<Content> spotsByAreaName = spotService.getSpotListByAreaName(spotAreaName);
		
		//예외처리
		//if (spotsByAreaName == null || spotsByAreaName.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("spotList", spotsByAreaName);
		return "spot/spots";
	}
	
	@GetMapping("/title/{title}") //업체명 검색
	public String requestSpotsByTitle(@PathVariable("title") String spotTitle, Model model)
	{
		List<Content> spotsByTitle = spotService.getSpotListByTitle(spotTitle);
		
		//예외처리
		//if (spotsByTitle == null || spotsByTitle.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("spotList", spotsByTitle);
		return "spot/spots";
	}
	
	@GetMapping("/keyword/{keyword}") //키워드 검색
	public String requestSpotsByKeyword(@PathVariable("keyword") String spotKeyword, Model model)
	{
		List<Content> spotsByKeyword = spotService.getSpotListByKeyword(spotKeyword);
		
		//예외처리
		//if (spotsByKeyword == null || spotsByKeyword.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("spotList", spotsByKeyword);
		return "spot/spots";
	}

	@GetMapping("/spot") //상세보기용
	public String requestSpotByNum(@RequestParam("num") String contentSeq, Model model, @ModelAttribute("NewReview") Review review)
	{
		Content spotByNum = spotService.getSpotByNum(contentSeq);
		model.addAttribute("spot", spotByNum);
		
		//리뷰
		List<Review> list = reviewService.getAllReviewList(contentSeq);
		model.addAttribute("reviewList", list);

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
		
		//코스
		int courseCount = courseService.getCourseCountById(sessionId);
		model.addAttribute("courseCount", courseCount);
		
		List<Course> myCourseList = courseService.getCourseList(sessionId);
		model.addAttribute("myCourseList", myCourseList);
		   
		
		return "spot/spot";
	}
	
	@PostMapping("/spot") //리뷰 제출
    public String submitAddReviewForm(@ModelAttribute("NewReview") Review review, @RequestParam("num") String contentSeq, Model model)
    {       
       model.addAttribute("num", contentSeq);
       String sessionId = (String)session.getAttribute("sessionId");
       
      reviewService.setNewReview(review, contentSeq, sessionId);
       return "redirect:/spots/spot";     
    }
	
	@PostMapping("/review/update")
	public String submitUpdateReviewForm() {
		System.out.println("SpotController.submitUpdateReviewForm() 도착");
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

		return "redirect:/spots/spot?num=" + review.getContentSeq(); 
	}
	
	@GetMapping("/review/delete")
	public String deleteReview(@RequestParam("num")String num, @RequestParam("contentSeq")String contentSeq) {
		System.out.println("HotelController.deleteReview() 도착");
		reviewService.deleteReview(num);
		return "redirect:/spots/spot?num=" + contentSeq;
	}
	
	
	//---------------------------------------------------------------------------------------------------------------
	
	
	
	
	
	@GetMapping("/add") //관광지등록 뷰페이지 띄우기
	public String requestAddSpotForm(@ModelAttribute("NewSpot") Content spot)
	{
		return "spot/addSpot";
	}
	
	@PostMapping("/add") //관광지추가용
	public String submitAddSpotForm(@ModelAttribute("NewSpot") Content spot, BindingResult result, HttpServletRequest request)
	{
		if (result.hasErrors())
		{
			return "spot/addSpot";
		}
				
		spotService.setNewSpot(spot);
		return "redirect:/spots";
	}
	
		
	@ModelAttribute //추가등록 뷰 페이지에서 씀
	public void addAttributes(Model model)
	{
		model.addAttribute("addTitle", "신규 관광지 등록");
	}
	
	@GetMapping("/update") //수정페이지용
	public String getUpdateSpotForm(@ModelAttribute("updateSpot") Content spot, @RequestParam("num") String contentSeq, Model model)
	{
		Content spotByNum = spotService.getSpotByNum(contentSeq);
		model.addAttribute("spot", spotByNum);
		return "/spot/updateSpot";
	}
	
	@PostMapping("/update") //수정완료용
	public String submitUpdateSpotForm(@ModelAttribute("updateSpot") Content spot)
	{				
		spotService.setUpdateSpot(spot);
		return "spot/spots";
	}

	@RequestMapping(value="/delete") //삭제용
	public String getDeleteSpotForm(Model model, @RequestParam("num") String contentSeq)
	{
		spotService.setDeleteSpot(contentSeq);
		return "redirect:/spots";
	}
	

	@GetMapping("/add_api")//API DB로 전송
	public String add_spots() {
		System.out.println("SpotController2.add_spots() 도착");
		spotService.add_spots();
		
		return "redirect:/home";
	}

	
	
	
	
	
	
	
	
	
	
	
}
