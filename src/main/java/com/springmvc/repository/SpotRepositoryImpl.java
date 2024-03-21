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
public class SpotRepositoryImpl implements SpotRepository 
{
	private JdbcTemplate template;
	private List<Content> listOfSpots = new ArrayList<Content>();
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Content> getAllSpotList() 
	{		
		// db연동
		String SQL = "SELECT * FROM content WHERE partName = '관광지'";
		List<Content> listOfSpots = template.query(SQL, new ContentRowMapper());
		
		return listOfSpots;
	}

	@Override
	public List<Content> getSpotListByContentSeq(String contentSeq) 
	{
		List<Content> spotsByContentSeq = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content WHERE partName = '관광지' AND contentSeq LIKE '%" + contentSeq + "%'";
		spotsByContentSeq =  template.query(SQL, new ContentRowMapper());
		
		 
		return spotsByContentSeq;
	}
	
	@Override
	public List<Content> getSpotListByAreaName(String areaName) 
	{
		List<Content> spotsByAreaName = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content WHERE partName = '관광지' AND areaName LIKE '%" + areaName + "%'";
		spotsByAreaName =  template.query(SQL, new ContentRowMapper());
		 
		
		return spotsByAreaName;
	}

	@Override
	public List<Content> getSpotListByTitle(String title) 
	{
		List<Content> spotsByTitle = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content WHERE partName = '관광지' AND title LIKE '%" + title + "%'";
		spotsByTitle =  template.query(SQL, new ContentRowMapper());
		 
		
		return spotsByTitle;
	}

	@Override
	public List<Content> getSpotListByKeyword(String keyword) 
	{
		List<Content> spotsByKeyword = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content WHERE partName = '관광지' AND keyword LIKE '%" + keyword + "%'";
		spotsByKeyword =  template.query(SQL, new ContentRowMapper());
		 
		 
		return spotsByKeyword;
	}
	
	@Override
	public Content getSpotByContentSeq(String contentSeq) 
	{
		Content spotInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content where contentSeq=? and partName = '관광지'";
		int rowCount = template.queryForObject(SQL, Integer.class, contentSeq);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '관광지' AND contentSeq=?";
			spotInfo = template.queryForObject(SQL, new Object[] {contentSeq}, new ContentRowMapper());
		}
		
		
		if (spotInfo == null)
			throw new IllegalArgumentException("숙소 번호가 " + contentSeq + "인 숙소를 찾을 수 없습니다.");
		return spotInfo;			
	}

	@Override
	public Content getSpotByAreaName(String areaName) 
	{
		Content spotInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content WHERE partName = '관광지' AND areaName=?";
		int rowCount = template.queryForObject(SQL, Integer.class, areaName);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '관광지' AND areaName=?";
			spotInfo = template.queryForObject(SQL, new Object[] {areaName}, new ContentRowMapper());
		}
				
				
		if (spotInfo == null)
			throw new IllegalArgumentException("지역 이름이 " + areaName + "인 숙소를 찾을 수 없습니다.");
		return spotInfo;			
	}
	
	@Override
	public Content getSpotByTitle(String title) 
	{
		Content spotInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content WHERE partName = '관광지' AND title=?";
		int rowCount = template.queryForObject(SQL, Integer.class, title);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '관광지' AND title=?";
			spotInfo = template.queryForObject(SQL, new Object[] {title}, new ContentRowMapper());
		}
		
		
		if (spotInfo == null)
			throw new IllegalArgumentException("숙소 이름이 " + title + "인 숙소를 찾을 수 없습니다.");
		return spotInfo;			
	}
	
	@Override
	public Content getSpotByKeyword(String keyword) 
	{
		Content spotInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content WHERE partName = '관광지' AND keyword=?";
		int rowCount = template.queryForObject(SQL, Integer.class, keyword);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '관광지' AND keyword=?";
			spotInfo = template.queryForObject(SQL, new Object[] {keyword}, new ContentRowMapper());
		}
		
		
		if (spotInfo == null)
			throw new IllegalArgumentException("키워드가 " + keyword + "인 숙소를 찾을 수 없습니다.");
		return spotInfo;			
	}
	
	
	
	
	
	
	
	@Override     //상세보기용
	public Content getSpotByNum(String contentSeq) 
	{
		Content spotInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content WHERE partName = '관광지' AND contentSeq=?";
		int rowCount = template.queryForObject(SQL, Integer.class, contentSeq);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '관광지' AND contentSeq=?";
			spotInfo = template.queryForObject(SQL, new Object[] {contentSeq}, new ContentRowMapper());
		}
		
		
		if (spotInfo == null)
			throw new IllegalArgumentException("숙소 번호가 " + contentSeq + "인 숙소를 찾을 수 없습니다.");
		return spotInfo;			
	}
	
	
	@Override  //신규관광지저장용
	public void setNewSpot(Content spot) 
	{
		String SQL = "INSERT INTO content (areaName, title, address, tel, usedTime, homePage, keyword, content, mainFacility, usedCost, policyCautions, p1,p2,p3,p4,p5,p6,p7,p8,p9,p10)" + "VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		template.update(SQL, spot.getAreaName(), spot.getTitle(), spot.getAddress(), spot.getTel(), spot.getUsedTime(), spot.getHomePage(), spot.getKeyword(), spot.getContent(), spot.getMainFacility(), spot.getUsedCost(), spot.getPolicyCautions(), spot.getP1(), spot.getP2(), spot.getP3(), spot.getP4(), spot.getP5(), spot.getP6(), spot.getP7(), spot.getP8(), spot.getP9(), spot.getP10());
		
	}

	@Override //관광지수정용
	public void setUpdateSpot(Content spot) 
	{
		String SQL = "UPDATE content SET areaName = ?, title = ?, address = ?, tel = ?, usedTime = ?, homePage = ?, keyword = ?, content = ?, mainFacility = ?, usedCost = ?, policyCautions = ?, p1 = ?, p2 = ?, p3 = ?, p4 = ?, p5 = ?, p6 = ?, p7 = ?, p8 = ?, p9 = ?, p10 = ? where contentSeq = ?";
		template.update(SQL, spot.getAreaName(), spot.getTitle(), spot.getAddress(), spot.getTel(), spot.getUsedTime(), spot.getHomePage(), spot.getKeyword(), spot.getContent(), spot.getMainFacility(), spot.getUsedCost(), spot.getPolicyCautions(), spot.getP1(), spot.getP2(), spot.getP3(), spot.getP4(), spot.getP5(), spot.getP6(), spot.getP7(), spot.getP8(), spot.getP9(), spot.getP10(), spot.getContentSeq());
		
	}

	@Override //관광지삭제용
	public void setDeleteSpot(String contentSeq) 
	{
		String SQL = "DELETE from content where contentSeq = ?";
		this.template.update(SQL, contentSeq);
		
	}

	//API
	@Override
	public int[] getSpotContetSeq() {
		int[] contentSeqArray = null;
		try {
			String reqUrl = "https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=300&partCode=PC03";
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
			//배열 객체 배열 객체
			//가장 밖의 [ 꺼냄: { "resultList" : [{ }] }
			JSONObject object = jsonArray.getJSONObject(0);
			//[ 안의 { 안의 "resultList": [ { afsdf } ] 
			JSONArray arr = (JSONArray)object.getJSONArray("resultList");
			System.out.println(arr.toString());
			
			 contentSeqArray = new int[arr.length()];
			
			for(int i = 0; i<arr.length(); i++) {
				JSONObject object2 = arr.getJSONObject(i);
//				System.out.println(i+"번째");
//				System.out.println(object2.toString());
				
				int contentSeq = object2.getInt("contentSeq");		
				System.out.println("contentSeq: " + contentSeq);
				
				contentSeqArray[i] = contentSeq;
			}//for
		}catch(Exception e){
			e.printStackTrace();
		}
		//contentSeqArray[] 확인
		for(int k = 0; k<contentSeqArray.length; k++) {
			System.out.println("contentSeqArray[" + k + "]: " + contentSeqArray[k]);
		}
		return contentSeqArray;
	}

	@Override
	public JSONObject[] getSpotAPIByContentSeq(int[] contentSeqArray) {
		
		JSONObject[] spotsDetailArray = new JSONObject[contentSeqArray.length];
		
		try {
			for(int i = 0; i<contentSeqArray.length; i++) {
				String detailReqUrl = "https://www.pettravel.kr/api/detailSeqPart.do?partCode=PC03&contentNum=" + contentSeqArray[i];
				URL detailurl = new URL(detailReqUrl);
				HttpURLConnection detailCon = (HttpURLConnection)detailurl.openConnection();
				detailCon.setRequestMethod("GET");
				
				BufferedReader detailbr;
				int detailresponseCode = detailCon.getResponseCode();
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
				JSONObject detailobject = detailjsonArray.getJSONObject(0);
				JSONObject detail_object = detailobject.getJSONObject("resultList");
				spotsDetailArray[i] = detail_object;
			
				
				
			}//for
		}catch(Exception e){
			
		}
		System.out.println("spotsDetailArray[0]: " + spotsDetailArray[0].toString());
		return spotsDetailArray;
	}
	
	@Override
	public void addSpotByAPI(JSONObject[] spotsDetailArray) {
		//DB에 등록하기
		System.out.println("SpotRepository2.addSpot() 도착");
		
		String SQL = "DELETE FROM content WHERE partName = '관광지'";
        template.update(SQL);
		
		for(int i = 0; i<spotsDetailArray.length; i++) {
			int contentSeq = spotsDetailArray[i].getInt("contentSeq");
			String areaName = spotsDetailArray[i].getString("areaName");
			String partName = spotsDetailArray[i].getString("partName");
			String title = spotsDetailArray[i].getString("title");
			String keyword = spotsDetailArray[i].getString("keyword");
			String address = spotsDetailArray[i].getString("address");
			String latitude = spotsDetailArray[i].getString("latitude");
			String longitude = spotsDetailArray[i].getString("longitude");
			String tel = spotsDetailArray[i].getString("tel");
			String usedTime = spotsDetailArray[i].getString("usedTime");
			String homePage = spotsDetailArray[i].getString("homePage");
			String content = spotsDetailArray[i].getString("content");
			String provisionSupply = spotsDetailArray[i].getString("provisionSupply");
			String petFacility = spotsDetailArray[i].getString("petFacility");
			String restaurant = spotsDetailArray[i].getString("restaurant");
			String parkingLog = spotsDetailArray[i].getString("parkingLog");
			String mainFacility = spotsDetailArray[i].getString("mainFacility");
			String usedCost = spotsDetailArray[i].getString("usedCost");
			String policyCautions = spotsDetailArray[i].getString("policyCautions");
			String emergencyResponse = spotsDetailArray[i].getString("emergencyResponse");
			String memo = spotsDetailArray[i].getString("memo");
			String bathFlag = spotsDetailArray[i].getString("bathFlag");
			String provisionFlag = spotsDetailArray[i].getString("provisionFlag");
			String petFlag = spotsDetailArray[i].getString("petFlag");
			String petWeight = spotsDetailArray[i].getString("petWeight");
			String dogBreed = spotsDetailArray[i].getString("dogBreed");
			String emergencyFlag = spotsDetailArray[i].getString("emergencyFlag");
			String entranceFlag = spotsDetailArray[i].getString("entranceFlag");
			String parkingFlag = spotsDetailArray[i].getString("parkingFlag");
			String inOutFlag = spotsDetailArray[i].getString("inOutFlag");
			//이미지 배열 처리해야 함
			JSONArray imageList = spotsDetailArray[i].getJSONArray("imageList");
			String[] imageListContent = new String[10];
			for(int k = 0; k<imageList.length(); k++) {
				JSONObject imageObject = imageList.getJSONObject(k);
			    String imageUrl = imageObject.getString("image");
			    imageListContent[k] = imageUrl;
			}//inner for
			
			String sql = "INSERT INTO content VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			template.update(sql, contentSeq, areaName, partName, title, keyword, address, latitude, longitude, tel, usedTime, homePage, content, provisionSupply, petFacility, restaurant, parkingLog, mainFacility, usedCost, policyCautions, emergencyResponse, memo, bathFlag, provisionFlag, petFlag, petWeight, dogBreed, emergencyFlag, entranceFlag, parkingFlag, inOutFlag, imageListContent[0], imageListContent[1], imageListContent[2], imageListContent[3], imageListContent[4], imageListContent[5], imageListContent[6], imageListContent[7], imageListContent[8], imageListContent[9], 0, 0 );
		}//for
		
		
	}

	
}
