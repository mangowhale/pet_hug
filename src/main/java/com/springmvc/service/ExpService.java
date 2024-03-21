package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Content;

public interface ExpService {
	public List<Content> getAllExpList();
	public List<Content> getExpListByAreaName(String areaName);
	public List<Content> getExpListByTitle(String title);
	public List<Content> getExpListByKeyword(String keyword);
	
	public Content getExpByNum(String contentSeq);
	
	public void addExpByAPI();
}
