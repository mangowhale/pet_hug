package com.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.domain.Content;
import com.springmvc.domain.Reserve;
import com.springmvc.service.HotelService;
import com.springmvc.service.ReserveService;

@Controller
@RequestMapping("/reserves")// 리퀘스트매핑을 찾아주는게 핸들러
public class ReserveController 
{
	@Autowired // 클래스의 프로퍼티(멤버 변수)에 선언
	private ReserveService reserveService;
	
	@Autowired // 클래스의 프로퍼티(멤버 변수)에 선언
	private HotelService hotelService;

	
	@GetMapping
	public String requestReserveList(Model model)
	{
		List<Reserve> list = reserveService.getAllReserveList();	// ${}를 나오게 해줌
		model.addAttribute("reserveList", list);		 			// ${}를 나오게 해줌
		return "reserve/reserves"; //views폴더 안 리턴값.jsp 파일 servlet-context.xmㅣ 안에 뷰리졸버가 찾아서 연결해줌
	}	
	
	@GetMapping("/all")
	public ModelAndView requestAllReserves()
	{
		ModelAndView modelAndView = new ModelAndView();
		List<Reserve> list = reserveService.getAllReserveList();
		modelAndView.addObject("reserveList", list);
		modelAndView.setViewName("reserve/reserves");
		return modelAndView;
	}
	
	@GetMapping("/num/{num}") //번호 검색 % + {@@} + %
	public String requestReservesByNum(@PathVariable("num") String reserveNum, Model model)
	{
		List<Reserve> reservesByNum = reserveService.getReserveListByNum(reserveNum);
		model.addAttribute("reserveList", reservesByNum);
		return "reserve/reserves";
	}
	
	@GetMapping("/mem_id/{mem_id}") //고객id 검색 % + {@@} + %
	public String requestReservesByMem_id(@PathVariable("mem_id") String reserveMem_id, Model model)
	{
		List<Reserve> reservesByMem_id = reserveService.getReserveListByMem_id(reserveMem_id);
		model.addAttribute("reserveList", reservesByMem_id);
		return "reserve/reserves";
	}
	
	@GetMapping("/name/{name}") //고객이름 검색 % + {@@} + %
	public String requestReservesByName(@PathVariable("name") String reserveName, Model model)
	{
		List<Reserve> reservesByName = reserveService.getReserveListByName(reserveName);
		model.addAttribute("reserveList", reservesByName);
		return "reserve/reserves";
	}
	
	@GetMapping("/tel/{tel}") //고객연락처 검색 % + {@@} + %
	public String requestReservesByTel(@PathVariable("tel") String reserveTel, Model model)
	{
		List<Reserve> reservesByTel = reserveService.getReserveListByTel(reserveTel);
		model.addAttribute("reserveList", reservesByTel);
		return "reserve/reserves";
	}
	
	@GetMapping("/date/{date}") //고객연락처 검색 % + {@@} + %
	public String requestReservesByDate(@PathVariable("date") String reserveDate, Model model)
	{
		List<Reserve> reservesByDate = reserveService.getReserveListByDate(reserveDate);
		model.addAttribute("reserveList", reservesByDate);
		return "reserve/reserves";
	}
	
	@GetMapping("/id/reserve") //상세보기용 reserves/reserve?mem_id=mem_id 일치
	   public String requestReserveByMem_id(@RequestParam("id") String mem_id, Model model)
	   {
	      Reserve reserveByMem_id = reserveService.getReserveByMem_id(mem_id);
	      model.addAttribute("reserve", reserveByMem_id);	      	
	         	         
	      return "reserve/reserve";
	   }
	@GetMapping("/num/reserve") //상세보기용 reserves/reserve?num=num 일치
	   public String requestReserveByNum(@RequestParam("num") String num, Model model)
	   {
	      Reserve reserveByNum = reserveService.getReserveByNum(num);
	      model.addAttribute("reserve", reserveByNum);	      	
	         	         
	      return "reserve/reserve";
	   }
	
	//---------------------------------------------------------------------------------------------------------------


	
	@GetMapping("/add") //예약등록 뷰페이지 띄우기
	public String requestAddReserveForm(@ModelAttribute("NewReserve") Reserve reserve)
	{						
		return "reserve/addReserve";
	}
	
	@PostMapping("/add") //예약추가 서브밋용
	public String submitAddReserveForm(@ModelAttribute("NewReserve") Reserve reserve, Model model)
	{			
		reserveService.setNewReserve(reserve);
		model.addAttribute("reserve", reserve); //finish 페이지에서 ${reserve.date} 나오게
		return "reserve/finish";
	}

	//---------------------------------------------------------------------------------------------------------------

	@GetMapping("/update") //예약수정페이지용
	public String getUpdateReserveForm(@ModelAttribute("updateReserve") Reserve reserve, @RequestParam("num") String num, Model model)
	{
		Reserve reserveByNum = reserveService.getReserveByNum(num);
		model.addAttribute("reserve", reserveByNum);
		return "/reserve/updateReserve";
	}
			
	@PostMapping("/update") //예약수정완료용
	public String submitUpdateReserveForm(@ModelAttribute("updateReserve") Reserve reserve, Model model)
	{		
		List<Content> list = hotelService.getAllHotelList();	// Hotel의 ${}를 나오게 해줌
		model.addAttribute("hotelList", list);				// Hotel의 ${}를 나오게 해줌
				
		reserveService.setUpdateReserve(reserve);
		
		model.addAttribute("reserve", reserve); //finish 페이지에서 ${reserve.date} 나오게
		
		return "reserve/finish"; // 수정완료버튼 클릭 시 수정 후 호텔즈 페이지로 넘어감
	}
	
	
	//---------------------------------------------------------------------------------------------------------------

	@RequestMapping(value="/delete") //삭제용
	public String getDeleteReserveForm(Model model, @RequestParam("num") String num)
	{
		reserveService.setDeleteReserve(num);
		return "redirect:/reserves";
	}
	
}