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

import com.springmvc.domain.Content;
import com.springmvc.domain.Review;
import com.springmvc.service.HotelService;
import com.springmvc.service.ReviewService;


@Controller
@RequestMapping("/hotels")// 리퀘스트매핑을 찾아주는게 핸들러
public class HotelController 
{
	@Autowired // 클래스의 프로퍼티(멤버 변수)에 선언
	private HotelService hotelService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping
	public String requestHotelList(Model model)
	{
		List<Content> list = hotelService.getAllHotelList();
		model.addAttribute("hotelList", list);
		return "hotel/hotels"; //views폴더 안 리턴값.jsp 파일 servlet-context.xmㅣ 안에 뷰리졸버가 찾아서 연결해줌
	}
	
	@GetMapping("/all")
	public ModelAndView requestAllHotels()
	{
		ModelAndView modelAndView = new ModelAndView();
		List<Content> list = hotelService.getAllHotelList();
		modelAndView.addObject("hotelList", list);
		modelAndView.setViewName("hotel/hotels");
		return modelAndView;
	}
	
	@GetMapping("/contentSeq/{contentSeq}") //번호 검색 % + @@ + %
	public String requestHotelsByContentSeq(@PathVariable("contentSeq") String hotelContentSeq, Model model)
	{
		List<Content> hotelsByContentSeq = hotelService.getHotelListByContentSeq(hotelContentSeq);
		
		//예외처리
		//if (hotelsByContentSeq == null || hotelsByContentSeq.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("hotelList", hotelsByContentSeq);
		return "hotel/hotels";
	}
	
	@GetMapping("/areaName/{areaName}") //지역명 검색 % + @@ + %
	public String requestHotelsByAreaName(@PathVariable("areaName") String hotelAreaName, Model model)
	{
		List<Content> hotelsByAreaName = hotelService.getHotelListByAreaName(hotelAreaName);
		
		//예외처리
		//if (hotelsByAreaName == null || hotelsByAreaName.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("hotelList", hotelsByAreaName);
		return "hotel/hotels";
	}
	
	@GetMapping("/title/{title}") //업체명 검색 % + @@ + %
	public String requestHotelsByTitle(@PathVariable("title") String hotelTitle, Model model)
	{
		List<Content> hotelsByTitle = hotelService.getHotelListByTitle(hotelTitle);
		
		//예외처리
		//if (hotelsByTitle == null || hotelsByTitle.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("hotelList", hotelsByTitle);
		return "hotel/hotels";
	}
	
	@GetMapping("/keyword/{keyword}") //키워드 검색 % + @@ + %
	public String requestHotelsByKeyword(@PathVariable("keyword") String hotelKeyword, Model model)
	{
		List<Content> hotelsByKeyword = hotelService.getHotelListByKeyword(hotelKeyword);
		
		//예외처리
		//if (hotelsByKeyword == null || hotelsByKeyword.isEmpty())
		//{
			//throw new SearchException();
		//}
		
		model.addAttribute("hotelList", hotelsByKeyword);
		return "hotel/hotels";
	}

	
	/*
	 * @GetMapping("/filter/{hotelFilter}") // 키 밸류 스트링만 들어가는 리스트 public String
	 * requestHotelsByFilter(@MatrixVariable(pathVar="hotelFilter") Map<String,
	 * List<String>> hotelFilter, Model model) { Set<Hotel> hotelsByFilter =
	 * hotelService.getHotelListByFilter(hotelFilter);
	 * model.addAttribute("hotelList", hotelsByFilter); return "hotel/hotels"; }
	 */
	
	
	
	@GetMapping("/hotel") //상세보기용 ?num=contentSeq
	public String requestHotelByNum(@RequestParam("num") String contentSeq, Model model, @ModelAttribute("NewReview") Review review)
	{
		System.out.println("HotelController.requestHotelByNum() 도착");
		Content hotelByNum = hotelService.getHotelByNum(contentSeq);
		model.addAttribute("hotel", hotelByNum);
		
		//리뷰
		List<Review> list = reviewService.getAllReviewList(contentSeq);   // ${}를 나오게 해줌
	   	model.addAttribute("reviewList", list);                						// ${}를 나오게 해줌
		   
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
		   
		return "hotel/hotel";
	}
	
	@PostMapping("/hotel") //리뷰 제출
    public String submitAddReviewForm(@ModelAttribute("NewReview") Review review, @RequestParam("num") String contentSeq, Model model)
    {       
       model.addAttribute("num", contentSeq);
       String sessionId = (String)session.getAttribute("sessionId");
       reviewService.setNewReview(review, contentSeq, sessionId);
       return "redirect:/hotels/hotel";     
    }

	               
	@PostMapping("/review/update")
	public String submitUpdateReviewForm() {
		System.out.println("HotelController.submitUpdateReviewForm() 도착");
		Review review = new Review();
		String contentSeq = (String)request.getParameter("contentSeq");
		/* String star = (String)request.getParameter("star"); */
		String text = (String)request.getParameter("text");
		String mem_id = (String)request.getParameter("mem_id");
		
		review.setContentSeq(contentSeq);
		/* review.setStar(star); */
		review.setText(text);
		review.setMem_id(mem_id);
		
		System.out.println("contentSeq: " + review.getContentSeq());
		System.out.println("mem_id: " + review.getMem_id());
		System.out.println("text: " + review.getText());
		reviewService.updateReview(review);
		System.out.println("Controller 복귀");

		return "redirect:/hotels/hotel?num=" + review.getContentSeq(); 
	}
	
	@GetMapping("/review/delete")
	public String deleteReview(@RequestParam("num")String num, @RequestParam("contentSeq")String contentSeq) {
		System.out.println("HotelController.deleteReview() 도착");
		reviewService.deleteReview(num);
		return "redirect:/hotels/hotel?num=" + contentSeq;
	}
	
	//---------------------------------------------------------------------------------------------------------------
	

	@GetMapping("/add") //호텔등록 뷰페이지 띄우기
	public String requestAddHotelForm(@ModelAttribute("NewHotel") Content hotel)
	{
		return "hotel/addHotel";
	}
	
	@PostMapping("/add") //숙소추가용
	public String submitAddHotelForm(@ModelAttribute("NewHotel") Content hotel, BindingResult result, HttpServletRequest request)
	{
		if (result.hasErrors())
		{
			return "hotel/addHotel";
		}

		hotelService.setNewHotel(hotel);
		return "redirect:/home";
	}
	
		
	/*
	 * @ModelAttribute //추가등록 뷰 페이지에서 씀 public void addAttributes(Model model) {
	 * model.addAttribute("addTitle", "신규 숙소 등록"); }
	 */
		
	@GetMapping("/update") //수정페이지용
	public String getUpdateHotelForm(@ModelAttribute("updateHotel") Content hotel, @RequestParam("num") String contentSeq, Model model)
	{
		Content hotelByNum = hotelService.getHotelByNum(contentSeq);
		model.addAttribute("hotel", hotelByNum);
		return "/hotel/updateHotel";
	}
	
	@PostMapping("/update") //수정완료용
	public String submitUpdateHotelForm(@ModelAttribute("updateHotel") Content hotel)
	{				
		hotelService.setUpdateHotel(hotel);
		return "redirect:/home";
	}

	@RequestMapping(value="/delete") //삭제용
	public String getDeleteHotelForm(Model model, @RequestParam("num") String contentSeq)
	{
		hotelService.setDeleteHotel(contentSeq);
		return "redirect:/home";
	}
	
	
	//API
	@GetMapping("/add_api")
	public String addHotelsByAPI() {
		System.out.println("SpotController2.add_spots() 도착");
		hotelService.addHotelByAPI();
		
		return "redirect:/home";
	}

	
}
