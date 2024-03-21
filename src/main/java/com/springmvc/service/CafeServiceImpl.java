package com.springmvc.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Content;
import com.springmvc.repository.CafeRepository;

@Service
public class CafeServiceImpl implements CafeService{

	@Autowired
	private CafeRepository cafeRepository;
	
	@Override
	public List<Content> getAllCafeList() {
		List<Content> list = cafeRepository.getAllCafeList();
		return list;
	}

	
	@Override
	public List<Content> getCafeListByAreaName(String areaName) {
		List<Content> cafesByAreaName = cafeRepository.getCafeListByAreaName(areaName);
		return cafesByAreaName;
	}

	@Override
	public List<Content> getCafeListByTitle(String title) {
		List<Content> cafesByTitle = cafeRepository.getCafelListByTitle(title);
		return cafesByTitle;
	}

	
	@Override
	public List<Content> getCafeListByKeyword(String keyword) {
		List<Content> cafesByKeyword = cafeRepository.getCafelListByKeyword(keyword);
		return cafesByKeyword;
	}

	@Override
	public Content getCafeByNum(String contentSeq) {
		System.out.println("cafeService.getCafeByNum() 도착");
		Content cafeInfo = cafeRepository.getCafeByNum(contentSeq);
		return cafeInfo;
	}

	@Override
	public void addCafeByAPI() {
		System.out.println("facilityService.addFacilityByAPI() 도착");
		int[] cafeContentSeq = cafeRepository.getCafeContentSeq();
		JSONObject[] cafeDetailArray = cafeRepository.getCafeByContentSeq(cafeContentSeq);
		cafeRepository.addCafeByAPI(cafeDetailArray);
	}


}
