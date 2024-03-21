package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.springmvc.domain.Content;
import com.springmvc.domain.HotelCart;
import com.springmvc.domain.HotelCartItem;
import com.springmvc.service.HotelCartService;
import com.springmvc.service.HotelService;

@Controller
@RequestMapping("/hotelcart")
public class HotelCartController 
{
	@Autowired
	private HotelCartService hotelcartService;	
	
	@Autowired
	private HotelService hotelService;
	
	@GetMapping
	public String requestHotelCartId(HttpServletRequest request)
	{
		String sessionid = request.getSession(true).getId();
		return "redirect:/hotelcart/" + sessionid;
	}
	
	@PostMapping
	public @ResponseBody HotelCart create(@RequestBody HotelCart hotelcart)
	{
		return hotelcartService.create(hotelcart);
	}
	
	@GetMapping("/{hotelcartId}")
	public String requestHotelCartList(@PathVariable(value="hotelcartId") String hotelcartId, Model model)
	{
		HotelCart hotelcart = hotelcartService.read(hotelcartId);
		model.addAttribute("hotelcart", hotelcart);
		return "hotel/hotelcart";
	}
	
	@PutMapping("/{hotelcartId}")
	public @ResponseBody HotelCart read(@PathVariable(value="hotelcartId") String hotelcartId)
	{
		return hotelcartService.read(hotelcartId);
	}
	
	@PutMapping("/add/{contentSeq}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT) // 오류 응답 상태 코드 설정
	public void addHotelCartByNewItem(@PathVariable String contentSeq, HttpServletRequest request)
	{
		// 숙소 번호인 세션ID 가져오기
		String sessionId = request.getSession(true).getId(); // 세션 가져와라 없으면 만들어서
		HotelCart hotelcart = hotelcartService.read(sessionId); // 관심목록에 등록된 모든 정보 얻어 오기, 유일한 값(세션)으로 카트 만들어주기
		if (hotelcart == null)
		hotelcart = hotelcartService.create(new HotelCart(sessionId));	// 카트 널이면 만들어라
		// 경로 변수 contentSeq에 대한 정보 얻어 오기
		Content hotel = hotelService.getHotelByNum(contentSeq);
		if (hotel == null)
		throw new IllegalArgumentException(new Exception()); // 없으면 익셉션발생	
		// contentSeq에 대한 숙소 정보를 관심목록에 등록하기
		hotelcart.addHotelCartItem(new HotelCartItem(hotel)); // 카트에 상품 담음
		hotelcartService.update(sessionId, hotelcart); // 세션 ID에 대한 관심목록 갱신하기
	}
	
	@PutMapping("/remove/{contentSeq}")		
	@ResponseStatus(value=HttpStatus.NO_CONTENT) // 오류 응답 상태 코드 설정		
	public void removeHotelCartByItem(@PathVariable String contentSeq, HttpServletRequest request)	
	{
		// 숙소 번호인 세션ID 가져오기
		String sessionId = request.getSession(true).getId(); // 세션 가져와라 없으면 만들어서			
		HotelCart hotelcart = hotelcartService.read(sessionId); // 관심목록에 등록된 모든 정보 얻어 오기, 유일한 값(세션)으로 카트 만들어주기				
		if (hotelcart == null)						
			hotelcart = hotelcartService.create(new HotelCart(sessionId));	// 카트 널이면 만들어라			
		// 경로 변수 contentSeq에 대한 정보 얻어 오기
		Content hotel = hotelService.getHotelByNum(contentSeq); // 관심숙소가 존재하는지 확인				
		if (hotel == null)						
			throw new IllegalArgumentException(new Exception()); // 없으면 익셉션발생				
		// contentSeq에 대한 숙소 정보를 관심목록에 등록하기
		hotelcart.removeHotelCartItem(new HotelCartItem(hotel)); // 카트에 상품 담음				
		hotelcartService.update(sessionId, hotelcart); // 세션 ID에 대한 관심목록 갱신하기				
	}
	
	@DeleteMapping("/{hotelcartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void deleteHotelCartList(@PathVariable(value="hotelcartId") String hotelcartId)
	{
		hotelcartService.delete(hotelcartId);
	}
}
