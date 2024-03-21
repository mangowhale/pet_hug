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
public class HotelRepositoryImpl implements HotelRepository 
{
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	private List<Content> listOfHotels = new ArrayList<Content>();
	
	@Override
	public List<Content> getAllHotelList() 
	{		
		// db연동
		String SQL = "select * from content where partName='숙박'";
		List<Content> listOfHotels = template.query(SQL, new ContentRowMapper());
		
		return listOfHotels;
	}

	@Override
	public List<Content> getHotelListByContentSeq(String contentSeq) 
	{
		List<Content> hotelsByContentSeq = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content where partName='숙박' AND contentSeq LIKE '%" + contentSeq + "%'";
		hotelsByContentSeq =  template.query(SQL, new ContentRowMapper());
		
		 
		return hotelsByContentSeq;
	}
	
	@Override
	public List<Content> getHotelListByAreaName(String areaName) 
	{
		List<Content> hotelsByAreaName = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content where partName='숙박' AND areaName LIKE '%" + areaName + "%'";
		hotelsByAreaName =  template.query(SQL, new ContentRowMapper());
		 
		
		return hotelsByAreaName;
	}

	@Override
	public List<Content> getHotelListByTitle(String title) 
	{
		List<Content> hotelsByTitle = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content where partName='숙박' AND title LIKE '%" + title + "%'";
		hotelsByTitle =  template.query(SQL, new ContentRowMapper());
		 
		
		return hotelsByTitle;
	}

	@Override
	public List<Content> getHotelListByKeyword(String keyword) 
	{
		List<Content> hotelsByKeyword = new ArrayList<Content>();
		
		
		//db연결 
		String SQL = "SELECT * FROM content where partName='숙박' AND keyword LIKE '%" + keyword + "%'";
		hotelsByKeyword =  template.query(SQL, new ContentRowMapper());
		 
		 
		return hotelsByKeyword;
	}
	
	@Override
	public Content getHotelByContentSeq(String contentSeq) 
	{
		Content hotelInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content where partName='숙박' AND contentSeq=?";
		int rowCount = template.queryForObject(SQL, Integer.class, contentSeq);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content where partName='숙박' AND contentSeq=?";
			hotelInfo = template.queryForObject(SQL, new Object[] {contentSeq}, new ContentRowMapper());
		}
		
		
		if (hotelInfo == null)
			throw new IllegalArgumentException("숙소 번호가 " + contentSeq + "인 숙소를 찾을 수 없습니다.");
		return hotelInfo;			
	}

	@Override
	public Content getHotelByAreaName(String areaName) 
	{
		Content hotelInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content where partName='숙박' AND areaName=?";
		int rowCount = template.queryForObject(SQL, Integer.class, areaName);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content where partName='숙박' AND areaName=?";
			hotelInfo = template.queryForObject(SQL, new Object[] {areaName}, new ContentRowMapper());
		}
				
				
		if (hotelInfo == null)
			throw new IllegalArgumentException("지역 이름이 " + areaName + "인 숙소를 찾을 수 없습니다.");
		return hotelInfo;			
	}
	
	@Override
	public Content getHotelByTitle(String title) 
	{
		Content hotelInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content where partName='숙박' AND title=?";
		int rowCount = template.queryForObject(SQL, Integer.class, title);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content where partName='숙박' AND title=?";
			hotelInfo = template.queryForObject(SQL, new Object[] {title}, new ContentRowMapper());
		}
		
		
		if (hotelInfo == null)
			throw new IllegalArgumentException("숙소 이름이 " + title + "인 숙소를 찾을 수 없습니다.");
		return hotelInfo;			
	}
	
	@Override
	public Content getHotelByKeyword(String keyword) 
	{
		Content hotelInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content where partName='숙박' AND keyword=?";
		int rowCount = template.queryForObject(SQL, Integer.class, keyword);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content where partName='숙박' AND keyword=?";
			hotelInfo = template.queryForObject(SQL, new Object[] {keyword}, new ContentRowMapper());
		}
		
		
		if (hotelInfo == null)
			throw new IllegalArgumentException("키워드가 " + keyword + "인 숙소를 찾을 수 없습니다.");
		return hotelInfo;			
	}
	@Override     //상세보기용 + 수정페이지용
	public Content getHotelByNum(String contentSeq) 
	{
		Content hotelInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM content where contentSeq=?";
		int rowCount = template.queryForObject(SQL, Integer.class, contentSeq);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM content where contentSeq=?";
			hotelInfo = template.queryForObject(SQL, new Object[] {contentSeq}, new ContentRowMapper());
		}
		
		
		if (hotelInfo == null)
			throw new IllegalArgumentException("컨텐츠 번호가 " + contentSeq + "인 컨텐츠를 찾을 수 없습니다.");
		return hotelInfo;			
	}
	
	
	@Override  //신규숙소저장용
	public void setNewHotel(Content hotel) 
	{
		String SQL = "INSERT INTO content (areaName, partName, title, address, tel, usedTime, homePage, keyword, content, mainFacility, usedCost, policyCautions, p1,p2,p3,p4,p5,p6,p7,p8,p9,p10)" + "VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		template.update(SQL, hotel.getAreaName(), hotel.getPartName(), hotel.getTitle(), hotel.getAddress(), hotel.getTel(), hotel.getUsedTime(), hotel.getHomePage(), hotel.getKeyword(), hotel.getContent(), hotel.getMainFacility(), hotel.getUsedCost(), hotel.getPolicyCautions(), hotel.getP1(), hotel.getP2(), hotel.getP3(), hotel.getP4(), hotel.getP5(), hotel.getP6(), hotel.getP7(), hotel.getP8(), hotel.getP9(), hotel.getP10());
		
	}

	@Override //숙소수정용
	public void setUpdateHotel(Content hotel) 
	{
		String SQL = "UPDATE content SET areaName = ?, partName = ?, title = ?, address = ?, tel = ?, usedTime = ?, homePage = ?, keyword = ?, content = ?, mainFacility = ?, usedCost = ?, policyCautions = ?, p1 = ?, p2 = ?, p3 = ?, p4 = ?, p5 = ?, p6 = ?, p7 = ?, p8 = ?, p9 = ?, p10 = ? where contentSeq = ?";
		template.update(SQL, hotel.getAreaName(), hotel.getPartName(), hotel.getTitle(), hotel.getAddress(), hotel.getTel(), hotel.getUsedTime(), hotel.getHomePage(), hotel.getKeyword(), hotel.getContent(), hotel.getMainFacility(), hotel.getUsedCost(), hotel.getPolicyCautions(), hotel.getP1(), hotel.getP2(), hotel.getP3(), hotel.getP4(), hotel.getP5(), hotel.getP6(), hotel.getP7(), hotel.getP8(), hotel.getP9(), hotel.getP10(), hotel.getContentSeq());
		
	}

	@Override //숙소삭제용
	public void setDeleteHotel(String contentSeq) 
	{
		String SQL = "DELETE from content where contentSeq = ?";
		this.template.update(SQL, contentSeq);
		
	}


	
	
	@Override
	public int[] getHotelContetSeq() {
		int[] contentSeqArray = null;
		try {
			String reqUrl = "https://www.pettravel.kr/api/listPart.do?page=1&pageBlock=300&partCode=PC02";
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
				
				int contentSeq = object2.getInt("contentSeq");		
				
				contentSeqArray[i] = contentSeq;
			}//for
		}catch(Exception e){
			e.printStackTrace();
		}
		return contentSeqArray;
	}

	@Override
	public JSONObject[] getHotelAPIByContentSeq(int[] contentSeqArray) {
		JSONObject[] hotelsDetailArray = new JSONObject[contentSeqArray.length];
		try {
			for(int i = 0; i<contentSeqArray.length; i++) {
				
				String detailReqUrl = "https://www.pettravel.kr/api/detailSeqPart.do?partCode=PC02&contentNum=" + contentSeqArray[i];
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
				hotelsDetailArray[i] = detail_object;
				
			}//for
		}catch(Exception e){
			
		}
		return hotelsDetailArray;
	}

	@Override
	public void addHotelByAPI(JSONObject[] hotelsDetailArray) {
		//DB에 등록하기
				System.out.println("SpotRepository2.addSpot() 도착");
				
				String SQL = "DELETE FROM content WHERE partName = '숙박'";
                template.update(SQL);
                
				for(int i = 0; i<hotelsDetailArray.length; i++) {
						int contentSeq = hotelsDetailArray[i].getInt("contentSeq");
						String areaName = hotelsDetailArray[i].getString("areaName");
						String partName = hotelsDetailArray[i].getString("partName");
						String title = hotelsDetailArray[i].getString("title");
						String keyword = hotelsDetailArray[i].getString("keyword");
						String address = hotelsDetailArray[i].getString("address");
						String latitude = hotelsDetailArray[i].getString("latitude");
						String longitude = hotelsDetailArray[i].getString("longitude");
						String tel = hotelsDetailArray[i].getString("tel");
						String usedTime = hotelsDetailArray[i].getString("usedTime");
						String homePage = hotelsDetailArray[i].getString("homePage");
						String content = hotelsDetailArray[i].getString("content");
						String provisionSupply = hotelsDetailArray[i].getString("provisionSupply");
						String petFacility = hotelsDetailArray[i].getString("petFacility");
						String restaurant = hotelsDetailArray[i].getString("restaurant");
						String parkingLog = hotelsDetailArray[i].getString("parkingLog");
						String mainFacility = hotelsDetailArray[i].getString("mainFacility");
						String usedCost = hotelsDetailArray[i].getString("usedCost");
						String policyCautions = hotelsDetailArray[i].getString("policyCautions");
						String emergencyResponse = hotelsDetailArray[i].getString("emergencyResponse");
						String memo = hotelsDetailArray[i].getString("memo");
						String bathFlag = hotelsDetailArray[i].getString("bathFlag");
						String provisionFlag = hotelsDetailArray[i].getString("provisionFlag");
						String petFlag = hotelsDetailArray[i].getString("petFlag");
						String petWeight = hotelsDetailArray[i].getString("petWeight");
						String dogBreed = hotelsDetailArray[i].getString("dogBreed");
						String emergencyFlag = hotelsDetailArray[i].getString("emergencyFlag");
						String entranceFlag = hotelsDetailArray[i].getString("entranceFlag");
						String parkingFlag = hotelsDetailArray[i].getString("parkingFlag");
						String inOutFlag = hotelsDetailArray[i].getString("inOutFlag");
						//이미지 배열 처리해야 함
						JSONArray imageList = hotelsDetailArray[i].getJSONArray("imageList");
						String[] imageListContent = new String[10];
					
						for(int k = 0; k<imageList.length(); k++) {
							JSONObject firstImageObject = imageList.getJSONObject(k);
						    String imageUrl = firstImageObject.getString("image");
						    imageListContent[k] = imageUrl;
						}//inner for
												 						
						String sql = "INSERT INTO content VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						template.update(sql, contentSeq, areaName, partName, title, keyword, address, latitude, longitude, tel, usedTime, homePage, content, provisionSupply, petFacility, restaurant, parkingLog, mainFacility, usedCost, policyCautions, emergencyResponse, memo, bathFlag, provisionFlag, petFlag, petWeight, dogBreed, emergencyFlag, entranceFlag, parkingFlag, inOutFlag, imageListContent[0], imageListContent[1], imageListContent[2], imageListContent[3], imageListContent[4], imageListContent[5], imageListContent[6], imageListContent[7], imageListContent[8], imageListContent[9], 0, 0 );
					}//for
	}

	
}
