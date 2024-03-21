package com.springmvc.repository;

import java.util.List;

import org.json.JSONObject;
import com.springmvc.domain.Content;

public interface HotelRepository 
{
	List<Content> getAllHotelList();
	List<Content> getHotelListByContentSeq(String contentSeq);
	List<Content> getHotelListByAreaName(String areaName);
	List<Content> getHotelListByTitle(String title);
	List<Content> getHotelListByKeyword(String keyword);
	
	/* Set<Hotel> getHotelListByFilter(Map<String, List<String>> filter); */
	
	Content getHotelByContentSeq(String contentSeq);
	Content getHotelByAreaName(String areaName);
	Content getHotelByTitle(String title);
	Content getHotelByKeyword(String keyword);
	
	Content getHotelByNum(String contentSeq);//상세보기용
	
	
	void setNewHotel(Content hotel); //숙소추가용
	
	void setUpdateHotel(Content hotel); //정보수정용
	
	void setDeleteHotel(String contentSeq); //숙소삭제용
	
	public int[] getHotelContetSeq();
	public JSONObject[] getHotelAPIByContentSeq(int[] contentSeqArray);
	public void addHotelByAPI(JSONObject[] hotelsDetailArray);
}
