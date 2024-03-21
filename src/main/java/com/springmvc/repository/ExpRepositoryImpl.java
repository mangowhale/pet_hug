package com.springmvc.repository;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Content;

@Repository
public class ExpRepositoryImpl implements ExpRepository{
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Content> getAllExpList() {
		String SQL = "SELECT * FROM content WHERE partName = '체험'";
		List<Content> listOfExps = template.query(SQL, new ContentRowMapper());
		return listOfExps;
	}

	@Override
	public List<Content> getExpListByAreaName(String areaName) {
		List<Content> expsByAreaName = new ArrayList<Content>();
		
		String SQL = "SELECT * FROM content WHERE partName = '체험' AND areaName LIKE '%" + areaName + "%'";
		expsByAreaName =  template.query(SQL, new ContentRowMapper());
		
		return expsByAreaName;
	}

	@Override
	public List<Content> getExplListByTitle(String title) {
		List<Content> expsByTitle = new ArrayList<Content>();
		
		String SQL = "SELECT * FROM content WHERE partName = '체험' AND title LIKE '%" + title + "%'";
		expsByTitle =  template.query(SQL, new ContentRowMapper());
		
		return expsByTitle;
	}

	@Override
	public List<Content> getExplListByKeyword(String keyword) {
		List<Content> expsByKeyword = new ArrayList<Content>();

		String SQL = "SELECT * FROM content WHERE partName = '체험' AND keyword LIKE '%" + keyword + "%'";
		expsByKeyword =  template.query(SQL, new ContentRowMapper());
		 
		return expsByKeyword;
	}

	@Override
	public Content getExpByNum(String contentSeq) {
		System.out.println("expRepository.getExpByNum() 도착");
		System.out.println("contentSeq: " + contentSeq);
		Content expInfo = null;
		
		String SQL = "SELECT count(*) FROM content WHERE partName = '체험' AND contentSeq=?";
		int rowCount = template.queryForObject(SQL, Integer.class, contentSeq);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '체험' AND contentSeq=?";
			expInfo = template.queryForObject(SQL, new Object[] {contentSeq}, new ContentRowMapper());
		}
		
		if (expInfo == null)
			throw new IllegalArgumentException("숙소 번호가 " + contentSeq + "인 숙소를 찾을 수 없습니다.");
		return expInfo;	
	}

	@Override
	public int[] getExpContentSeq() {
		int[] contentSeqArray = null;
		try {
			String reqUrl = "https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=100&partCode=PC04";
			URL url = new URL(reqUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			BufferedReader br;
			int responseCode = con.getResponseCode();
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			}else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String line;
			StringBuffer response = new StringBuffer();
			while((line = br.readLine()) != null) {
				response.append(line);
			}
			br.close();
			
			JSONArray jsonArray = new JSONArray(response.toString());
			JSONObject object = jsonArray.getJSONObject(0);
			JSONArray arr = (JSONArray)object.getJSONArray("resultList");
			System.out.println(arr.toString());
			
			 contentSeqArray = new int[arr.length()];
			
			for(int i = 0; i<arr.length(); i++) {
				JSONObject object2 = arr.getJSONObject(i);
				
				int contentSeq = object2.getInt("contentSeq");		
				
				contentSeqArray[i] = contentSeq;
			}//for
		}catch(Exception e){
			e.printStackTrace();
		}
		for(int k = 0; k<contentSeqArray.length; k++) {
			System.out.println("contentSeqArray[" + k + "]: " + contentSeqArray[k]);
		}
		return contentSeqArray;
	}

	@Override
	public JSONObject[] getExpByContentSeq(int[] ExpContentSeqArray) {
System.out.println("facilityRepository.getExpByContentSeq() 도착");
		
		JSONObject[] expDetailArray = new JSONObject[ExpContentSeqArray.length];
		
		try {
			for(int i = 0; i<ExpContentSeqArray.length; i++) {
				System.out.println(ExpContentSeqArray[i]);
				String detailReqUrl = "https://www.pettravel.kr/api/detailSeqPart.do?partCode=PC04&contentNum=" + ExpContentSeqArray[i];
				URL detailurl = new URL(detailReqUrl);
				HttpURLConnection detailCon = (HttpURLConnection)detailurl.openConnection();
				detailCon.setRequestMethod("GET");
				
				BufferedReader detailbr;
				int detailresponseCode = detailCon.getResponseCode();
				System.out.println("응답코드: "+detailresponseCode);
				
				if(detailresponseCode == 200) {
					detailbr = new BufferedReader(new InputStreamReader(detailCon.getInputStream(), "UTF-8"));
				}else {
					detailbr = new BufferedReader(new InputStreamReader(detailCon.getErrorStream()));
				}
				String detailline;
				StringBuffer detailresponse = new StringBuffer();
				while((detailline = detailbr.readLine()) != null) {
					detailresponse.append(detailline);
				}
				detailbr.close();
				
				JSONArray detailjsonArray = new JSONArray(detailresponse.toString());
				System.out.println("detailjsonArray: " + detailjsonArray.toString());
				JSONObject detailobject = detailjsonArray.getJSONObject(0);
				JSONObject detail_object = detailobject.getJSONObject("resultList");
				expDetailArray[i] = detail_object;
			}//for
		}catch(Exception e){
			
		}
		System.out.println("expDetailArray[0]: " + expDetailArray[0].toString());
		return expDetailArray;
	}

	@Override
	public void addExpByAPI(JSONObject[] expDetailArray) {
		System.out.println("facilityRepository2.addExpByAPI() 도착");
		
		String SQL = "DELETE FROM content WHERE partName = '체험'";
        template.update(SQL);
		
		for(int i = 0; i<expDetailArray.length; i++) {
			int contentSeq = expDetailArray[i].getInt("contentSeq");
			String areaName = expDetailArray[i].getString("areaName");
			String partName = expDetailArray[i].getString("partName");
			String title = expDetailArray[i].getString("title");
			String keyword = expDetailArray[i].getString("keyword");
			String address = expDetailArray[i].getString("address");
			String latitude = expDetailArray[i].getString("latitude");
			String longitude = expDetailArray[i].getString("longitude");
			String tel = expDetailArray[i].getString("tel");
			String usedTime = expDetailArray[i].getString("usedTime");
			String homePage = expDetailArray[i].getString("homePage");
			String content = expDetailArray[i].getString("content");
			String provisionSupply = expDetailArray[i].getString("provisionSupply");
			String petFacility = expDetailArray[i].getString("petFacility");
			String restaurant = expDetailArray[i].getString("restaurant");
			String parkingLog = expDetailArray[i].getString("parkingLog");
			String mainFacility = expDetailArray[i].getString("mainFacility");
			String usedCost = expDetailArray[i].getString("usedCost");
			String policyCautions = expDetailArray[i].getString("policyCautions");
			String emergencyResponse = expDetailArray[i].getString("emergencyResponse");
			String memo = expDetailArray[i].getString("memo");
			String bathFlag = expDetailArray[i].getString("bathFlag");
			String provisionFlag = expDetailArray[i].getString("provisionFlag");
			String petFlag = expDetailArray[i].getString("petFlag");
			String petWeight = expDetailArray[i].getString("petWeight");
			String dogBreed = expDetailArray[i].getString("dogBreed");
			String emergencyFlag = expDetailArray[i].getString("emergencyFlag");
			String entranceFlag = expDetailArray[i].getString("entranceFlag");
			String parkingFlag = expDetailArray[i].getString("parkingFlag");
			String inOutFlag = expDetailArray[i].getString("inOutFlag");
			JSONArray imageList = expDetailArray[i].getJSONArray("imageList");
			String[] imageListContent = new String[10];
			for(int k = 0; k<imageList.length(); k++) {
				JSONObject imageObject = imageList.getJSONObject(k);
			    String imageUrl = imageObject.getString("image");
			    imageListContent[k] = imageUrl;
			}
			
			String sql = "INSERT INTO content VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			template.update(sql, contentSeq, areaName, partName, title, keyword, address, latitude, longitude, tel, usedTime, homePage, content, provisionSupply, petFacility, restaurant, parkingLog, mainFacility, usedCost, policyCautions, emergencyResponse, memo, bathFlag, provisionFlag, petFlag, petWeight, dogBreed, emergencyFlag, entranceFlag, parkingFlag, inOutFlag, imageListContent[0], imageListContent[1], imageListContent[2], imageListContent[3], imageListContent[4], imageListContent[5], imageListContent[6], imageListContent[7], imageListContent[8], imageListContent[9], 0, 0 );
		}//for
	}

}
