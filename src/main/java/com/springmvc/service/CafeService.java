package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Content;

public interface CafeService {
	public List<Content> getAllCafeList();
	public List<Content> getCafeListByAreaName(String areaName);
	public List<Content> getCafeListByTitle(String title);
	public List<Content> getCafeListByKeyword(String keyword);
	
	public Content getCafeByNum(String contentSeq);
	
	public void addCafeByAPI();
	
	
}
