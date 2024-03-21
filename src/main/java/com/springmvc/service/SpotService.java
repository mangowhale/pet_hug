package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Content;

public interface SpotService 
{
	List<Content> getAllSpotList();
	List<Content> getSpotListByContentSeq(String contentSeq);
	List<Content> getSpotListByAreaName(String areaName);
	List<Content> getSpotListByTitle(String title);
	List<Content> getSpotListByKeyword(String keyword);
	
	Content getSpotByContentSeq(String contentSeq);
	Content getSpotByAreaName(String areaName);
	Content getSpotByTitle(String title);
	Content getSpotByKeyword(String keyword);
	
	Content getSpotByNum(String contentSeq);//상세보기용
	
	
	void setNewSpot(Content spot); //숙소추가용
	
	void setUpdateSpot(Content spot); //정보수정용
	
	void setDeleteSpot(String contentSeq); //숙소삭제용

	
	void add_spots();

}
