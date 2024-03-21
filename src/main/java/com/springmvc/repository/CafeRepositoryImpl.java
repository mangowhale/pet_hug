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
public class CafeRepositoryImpl implements CafeRepository{
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	//cafes

	@Override
	public List<Content> getAllCafeList() {
		String SQL = "SELECT * FROM content WHERE partName = '식음료'";
		List<Content> listOfCafes = template.query(SQL, new ContentRowMapper());
		return listOfCafes;
	}

	@Override
	public List<Content> getCafeListByAreaName(String areaName) {
		List<Content> cafesByAreaName = new ArrayList<Content>();
		
		String SQL = "SELECT * FROM content WHERE partName = '식음료' AND areaName LIKE '%" + areaName + "%'";
		cafesByAreaName =  template.query(SQL, new ContentRowMapper());

		return cafesByAreaName;
	}

	@Override
	public List<Content> getCafelListByTitle(String title) {
		List<Content> cafesByTitle = new ArrayList<Content>();

		String SQL = "SELECT * FROM content WHERE partName = '식음료' AND title LIKE '%" + title + "%'";
		cafesByTitle =  template.query(SQL, new ContentRowMapper());
		
		return cafesByTitle;
	}

	@Override
	public List<Content> getCafelListByKeyword(String keyword) {
		List<Content> cafesByKeyword = new ArrayList<Content>();

		String SQL = "SELECT * FROM content WHERE partName = '식음료' AND keyword LIKE '%" + keyword + "%'";
		cafesByKeyword =  template.query(SQL, new ContentRowMapper());
		 
		return cafesByKeyword;
	}

	@Override
	public Content getCafeByNum(String contentSeq) {
		System.out.println("cafeRepository.getCafeByNum() 도착");
		System.out.println("contentSeq: " + contentSeq);
		Content cafeInfo = null;
		
		String SQL = "SELECT count(*) FROM content WHERE partName = '식음료' AND contentSeq=?";
		int rowCount = template.queryForObject(SQL, Integer.class, contentSeq);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content WHERE partName = '식음료' AND contentSeq=?";
			cafeInfo = template.queryForObject(SQL, new Object[] {contentSeq}, new ContentRowMapper());
		}
		
		
		if (cafeInfo == null)
			throw new IllegalArgumentException("숙소 번호가 " + contentSeq + "인 숙소를 찾을 수 없습니다.");
		return cafeInfo;		
	}
	
	

	@Override
	public int[] getCafeContentSeq() {
		int[] contentSeqArray = null;
		try {
			String reqUrl = "https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=300&partCode=PC01";
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
			//System.out.println("contentSeqArray[" + k + "]: " + contentSeqArray[k]);
		}
		return contentSeqArray;
	}

	@Override
	public JSONObject[] getCafeByContentSeq(int[] cafeContentSeqArray) {
		System.out.println("facilityRepository.getCafeByContentSeq() 도착");
		
		JSONObject[] cafeDetailArray = new JSONObject[cafeContentSeqArray.length];
		
		try {
			for(int i = 0; i<cafeContentSeqArray.length; i++) {
				String detailReqUrl = "https://www.pettravel.kr/api/detailSeqPart.do?partCode=PC01&contentNum=" + cafeContentSeqArray[i];
//				System.out.println("detailReqUrl: " + detailReqUrl);
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
				//배열 객체 객체
				//가장 밖의 [ 꺼냄: { "resultList" : { } }
				JSONObject detailobject = detailjsonArray.getJSONObject(0);
				//[ 안의 { 안의 "resultList":  { afsdf } 상세정보가 담긴 객체
				JSONObject detail_object = detailobject.getJSONObject("resultList");
//				System.out.println("detailarr: " + detail_object.toString());
				cafeDetailArray[i] = detail_object;
			}//for
		}catch(Exception e){
			
		}
		System.out.println("cafeDetailArray[0]: " + cafeDetailArray[0].toString());
		return cafeDetailArray;
	}

	@Override
	public void addCafeByAPI(JSONObject[] cafeDetailArray) {
		//DB에 등록하기
		System.out.println("facilityRepository2.addCafeByAPI() 도착");
		
		String SQL = "DELETE FROM content WHERE partName = '식음료'";
        template.update(SQL);
		
		for(int i = 0; i<cafeDetailArray.length; i++) {
			int contentSeq = cafeDetailArray[i].getInt("contentSeq");
			String areaName = cafeDetailArray[i].getString("areaName");
			String partName = cafeDetailArray[i].getString("partName");
			String title = cafeDetailArray[i].getString("title");
			String keyword = cafeDetailArray[i].getString("keyword");
			String address = cafeDetailArray[i].getString("address");
			String latitude = cafeDetailArray[i].getString("latitude");
			String longitude = cafeDetailArray[i].getString("longitude");
			String tel = cafeDetailArray[i].getString("tel");
			String usedTime = cafeDetailArray[i].getString("usedTime");
			String homePage = cafeDetailArray[i].getString("homePage");
			String content = cafeDetailArray[i].getString("content");
			String provisionSupply = cafeDetailArray[i].getString("provisionSupply");
			String petFacility = cafeDetailArray[i].getString("petFacility");
			String restaurant = cafeDetailArray[i].getString("restaurant");
			String parkingLog = cafeDetailArray[i].getString("parkingLog");
			String mainFacility = cafeDetailArray[i].getString("mainFacility");
			String usedCost = cafeDetailArray[i].getString("usedCost");
			String policyCautions = cafeDetailArray[i].getString("policyCautions");
			String emergencyResponse = cafeDetailArray[i].getString("emergencyResponse");
			String memo = cafeDetailArray[i].getString("memo");
			String bathFlag = cafeDetailArray[i].getString("bathFlag");
			String provisionFlag = cafeDetailArray[i].getString("provisionFlag");
			String petFlag = cafeDetailArray[i].getString("petFlag");
			String petWeight = cafeDetailArray[i].getString("petWeight");
			String dogBreed = cafeDetailArray[i].getString("dogBreed");
			String emergencyFlag = cafeDetailArray[i].getString("emergencyFlag");
			String entranceFlag = cafeDetailArray[i].getString("entranceFlag");
			String parkingFlag = cafeDetailArray[i].getString("parkingFlag");
			String inOutFlag = cafeDetailArray[i].getString("inOutFlag");
			//이미지 배열 처리해야 함
			JSONArray imageList = cafeDetailArray[i].getJSONArray("imageList");
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
