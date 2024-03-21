package com.springmvc.repository;

import java.util.List;

import org.json.JSONObject;
import com.springmvc.domain.Content;

public interface CafeRepository {
	public List<Content> getAllCafeList();
	public List<Content> getCafeListByAreaName(String areaName);
	public List<Content> getCafelListByTitle(String title);
	public List<Content> getCafelListByKeyword(String keyword);
	
	public Content getCafeByNum(String contentSeq);
	
	public int[] getCafeContentSeq();
	public JSONObject[] getCafeByContentSeq(int[] cafeContentSeqArray);
	public void addCafeByAPI(JSONObject[] cafeDetailArray);
}
