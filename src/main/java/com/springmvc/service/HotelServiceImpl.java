package com.springmvc.service;

import java.util.List;

import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Content;
import com.springmvc.repository.HotelRepository;

@Service
public class HotelServiceImpl implements HotelService 
{
	@Autowired
	private HotelRepository hotelRepository;
	
	@Override
	public List<Content> getAllHotelList() 
	{
		return hotelRepository.getAllHotelList();
	}

	@Override
	public List<Content> getHotelListByContentSeq(String contentSeq) 
	{
		List<Content> hotelsByContentSeq = hotelRepository.getHotelListByContentSeq(contentSeq);
		return hotelsByContentSeq;
	}
	
	@Override
	public List<Content> getHotelListByAreaName(String areaName) 
	{
		List<Content> hotelsByAreaName = hotelRepository.getHotelListByAreaName(areaName);
		return hotelsByAreaName;
	}

	@Override
	public List<Content> getHotelListByTitle(String title) 
	{
		List<Content> hotelsByTitle = hotelRepository.getHotelListByTitle(title);
		return hotelsByTitle;
	}

	@Override
	public List<Content> getHotelListByKeyword(String keyword) 
	{
		List<Content> hotelsByKeyword = hotelRepository.getHotelListByKeyword(keyword);
		return hotelsByKeyword;
	}

	@Override //상세보기용 컨트롤러 작업x
	public Content getHotelByContentSeq(String contentSeq) 
	{
		Content hotelByContentSeq = hotelRepository.getHotelByContentSeq(contentSeq);
		return hotelByContentSeq;
	}
	
	@Override //상세보기용 컨트롤러 작업x
	public Content getHotelByAreaName(String areaName) 
	{
		Content hotelByAreaName = hotelRepository.getHotelByAreaName(areaName);
		return hotelByAreaName;
	}
	
	@Override //상세보기용 컨트롤러 작업x
	public Content getHotelByTitle(String title) 
	{
		Content hotelByTitle = hotelRepository.getHotelByTitle(title);
		return hotelByTitle;
	}
	
	@Override //상세보기용 컨트롤러 작업x
	public Content getHotelByKeyword(String keyword) 
	{
		Content hotelByKeyword = hotelRepository.getHotelByKeyword(keyword);
		return hotelByKeyword;
	}
	
	@Override //상세보기용
	public Content getHotelByNum(String contentSeq) 
	{
		Content hotelByNum = hotelRepository.getHotelByNum(contentSeq);
		return hotelByNum;
	}


	@Override //숙소추가용
	public void setNewHotel(Content hotel) 
	{
		hotelRepository.setNewHotel(hotel);
	}


	@Override //정보수정용
	public void setUpdateHotel(Content hotel) 
	{
		hotelRepository.setUpdateHotel(hotel);		
	}

	@Override
	public void setDeleteHotel(String contentSeq) 
	{
		hotelRepository.setDeleteHotel(contentSeq);
	}

	
	@Override
	public void addHotelByAPI() {
		System.out.println("hotelService.addHotelByAPI() 도착");
		int[] hotelContentSeq = hotelRepository.getHotelContetSeq();
		JSONObject[] hotelDetailArray =  hotelRepository.getHotelAPIByContentSeq(hotelContentSeq);
		hotelRepository.addHotelByAPI(hotelDetailArray);
	}

}
