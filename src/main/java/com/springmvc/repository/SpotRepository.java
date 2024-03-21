package com.springmvc.repository;

import java.util.List;
import org.json.JSONObject;
import com.springmvc.domain.Content;

public interface SpotRepository 
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
	
	
	void setNewSpot(Content spot); //관광지추가용
	
	void setUpdateSpot(Content hotel); //정보수정용
	
	void setDeleteSpot(String contentSeq); //관광지삭제용

	
	public int[] getSpotContetSeq();
	public JSONObject[] getSpotAPIByContentSeq(int[] contentSeqArray);
	public void addSpotByAPI(JSONObject[] spotsDetailArray);

}
