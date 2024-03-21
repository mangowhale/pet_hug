package com.springmvc.service;

import java.util.List;


import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Content;
import com.springmvc.repository.SpotRepository;

@Service
public class SpotServiceImpl implements SpotService 
{
	@Autowired
	private SpotRepository spotRepository;
	
	@Override
	public List<Content> getAllSpotList() 
	{
		return spotRepository.getAllSpotList();
	}

	@Override
	public List<Content> getSpotListByContentSeq(String contentSeq) 
	{
		List<Content> spotsByContentSeq = spotRepository.getSpotListByContentSeq(contentSeq);
		return spotsByContentSeq;
	}
	
	@Override
	public List<Content> getSpotListByAreaName(String areaName) 
	{
		List<Content> spotsByAreaName = spotRepository.getSpotListByAreaName(areaName);
		return spotsByAreaName;
	}

	@Override
	public List<Content> getSpotListByTitle(String title) 
	{
		List<Content> spotsByTitle = spotRepository.getSpotListByTitle(title);
		return spotsByTitle;
	}

	@Override
	public List<Content> getSpotListByKeyword(String keyword) 
	{
		List<Content> spotsByKeyword = spotRepository.getSpotListByKeyword(keyword);
		return spotsByKeyword;
	}

	@Override
	public Content getSpotByContentSeq(String contentSeq) 
	{
		Content spotByContentSeq = spotRepository.getSpotByContentSeq(contentSeq);
		return spotByContentSeq;
	}
	
	@Override
	public Content getSpotByAreaName(String areaName) 
	{
		Content spotByAreaName = spotRepository.getSpotByAreaName(areaName);
		return spotByAreaName;
	}
	
	@Override
	public Content getSpotByTitle(String title) 
	{
		Content spotByTitle = spotRepository.getSpotByTitle(title);
		return spotByTitle;
	}
	
	@Override
	public Content getSpotByKeyword(String keyword) 
	{
		Content spotByKeyword = spotRepository.getSpotByKeyword(keyword);
		return spotByKeyword;
	}
	
	@Override //상세보기용
	public Content getSpotByNum(String contentSeq) 
	{
		Content spotByNum = spotRepository.getSpotByNum(contentSeq);
		return spotByNum;
	}

	@Override //관광지추가용
	public void setNewSpot(Content spot) 
	{
		spotRepository.setNewSpot(spot);
	}

	@Override //정보수정용
	public void setUpdateSpot(Content spot) 
	{
		spotRepository.setUpdateSpot(spot);		
	}

	@Override
	public void setDeleteSpot(String contentSeq) 
	{
		spotRepository.setDeleteSpot(contentSeq);
	}


	@Override
	public void add_spots() {
		System.out.println("spotService.add_sports() 도착");
		int[] contentSeqArray = spotRepository.getSpotContetSeq();
		JSONObject[] spotsDetailArray = spotRepository.getSpotAPIByContentSeq(contentSeqArray);
		spotRepository.addSpotByAPI(spotsDetailArray);
		
	}
	
	
}
