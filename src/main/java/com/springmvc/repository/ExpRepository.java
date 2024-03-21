package com.springmvc.repository;

import java.util.List;

import org.json.JSONObject;

import com.springmvc.domain.Content;

public interface ExpRepository {
	public List<Content> getAllExpList();
	public List<Content> getExpListByAreaName(String areaName);
	public List<Content> getExplListByTitle(String title);
	public List<Content> getExplListByKeyword(String keyword);
	
	public Content getExpByNum(String contentSeq);
	
	public int[] getExpContentSeq();
	public JSONObject[] getExpByContentSeq(int[] ExpContentSeqArray);
	public void addExpByAPI(JSONObject[] expDetailArray);
}
