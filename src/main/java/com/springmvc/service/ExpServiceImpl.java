package com.springmvc.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Content;
import com.springmvc.repository.ExpRepository;

@Service
public class ExpServiceImpl implements ExpService{

	@Autowired
	private ExpRepository expRepository;

	@Override
	public List<Content> getAllExpList() {
		List<Content> list = expRepository.getAllExpList();
		return list;
	}

	@Override
	public List<Content> getExpListByAreaName(String areaName) {
		List<Content> expsByAreaName = expRepository.getExpListByAreaName(areaName);
		return expsByAreaName; 
	}

	@Override
	public List<Content> getExpListByTitle(String title) {
		List<Content> expsByTitle = expRepository.getExplListByTitle(title);
		return expsByTitle;
	}

	@Override
	public List<Content> getExpListByKeyword(String keyword) {
		List<Content> expsByKeyword = expRepository.getExplListByKeyword(keyword);
		return expsByKeyword;
	}

	@Override
	public Content getExpByNum(String contentSeq) {
		Content expInfo = expRepository.getExpByNum(contentSeq);
		return expInfo;
	}

	@Override
	public void addExpByAPI() {
		int[] expContentSeq = expRepository.getExpContentSeq();
		JSONObject[] expDetailArray = expRepository.getExpByContentSeq(expContentSeq);
		expRepository.addExpByAPI(expDetailArray);
		
	}
}
