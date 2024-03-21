package com.springmvc.domain;

public class Content {
    private String contentSeq;          	//숙소 번호
    private String areaName;           		//지역명
    private String partName;           		//분야명
    private String title;               	//업체명
    private String keyword;             	//검색키워드
    private String address;             	//주소
    private String latitude;            	//위도
    private String longitude;           	//경도
    private String tel;                 	//전화번호
    private String usedTime;            	//이용시간
    private String homePage;            	//홈페이지
    private String content;             	//소개
    private String provisionSupply;     	//비품제공
    private String petFacility;         	//반려동물 시설
    private String restaurant;          	//식당
    private String parkingLog;          	//주차장 수용
    private String mainFacility;        	//주요시설
    private String usedCost;            	//이용요금
    private String policyCautions;      	//애견정책 및 주의사항
    private String emergencyResponse;   	//응급상황 대처 여부
    private String memo;                	//기타
    private String bathFlag;            	//목욕시설 (Y/N)
    private String provisionFlag;       	//비품제공 (Y/N)
    private String petFlag;             	//펫 동반식당 (Y/N)
    private String petWeight;           	//제한 몸무게 (kg)
    private String dogBreed;            	//견종 (현재 사용 안함)
    private String emergencyFlag;       	//응급 수칙 (Y/N)
    private String entranceFlag;        	//입장료 (Y/N)
    private String parkingFlag;         	//주차장 (Y/N)
    private String inOutFlag;           	//실내외 구분 (IN/OUT)
    private String p1;
    private String p2;
    private String p3;
    private String p4;
    private String p5;
    private String p6;
    private String p7;
    private String p8;
    private String p9;
    private String p10;
    private int review_num;
    private int star_avg;

    public String getContentSeq() {
        return contentSeq;
    }

    public void setContentSeq(String contentSeq) {
        this.contentSeq = contentSeq;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getUsedTime() {
        return usedTime;
    }

    public void setUsedTime(String usedTime) {
        this.usedTime = usedTime;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
       String convertedString = content.replaceAll("-", "<br>-");
      convertedString = convertedString.replaceAll("\\*", "<br>\\*");
      this.content = convertedString;
    }

    public String getProvisionSupply() {
        return provisionSupply;
    }

    public void setProvisionSupply(String provisionSupply) {
        this.provisionSupply = provisionSupply;
    }
	    
    public String getPetFacility() {
		return petFacility;
	}

	public void setPetFacility(String petFacility) {
		this.petFacility = petFacility;
	}

    public String getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(String restaurant) {
        this.restaurant = restaurant;
    }

    public String getParkingLog() {
        return parkingLog;
    }

    public void setParkingLog(String parkingLog) {
        this.parkingLog = parkingLog;
    }

    public String getMainFacility() {
        return mainFacility;
    }

    public void setMainFacility(String mainFacility) {
       String convertedString = mainFacility.replaceAll("-", "<br>-");
      convertedString = convertedString.replaceAll("\\*", "<br>\\*");
      this.mainFacility = convertedString;
    }

    public String getUsedCost() {
        return usedCost;
    }

    public void setUsedCost(String usedCost) {
       String convertedString = usedCost.replaceAll("-", "<br>-");
      convertedString = convertedString.replaceAll("\\*", "<br>\\*");
      this.usedCost = convertedString;
    }

    public String getPolicyCautions() {
        return policyCautions;
    }

    public void setPolicyCautions(String policyCautions) {
       String convertedString = policyCautions.replaceAll("-", "<br>-");
      convertedString = convertedString.replaceAll("\\*", "<br>\\*");
      this.policyCautions = convertedString;
    }

    public String getEmergencyResponse() {
        return emergencyResponse;
    }

    public void setEmergencyResponse(String emergencyResponse) {
        this.emergencyResponse = emergencyResponse;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getBathFlag() {
        return bathFlag;
    }

    public void setBathFlag(String bathFlag) {
        this.bathFlag = bathFlag;
    }

    public String getProvisionFlag() {
        return provisionFlag;
    }

    public void setProvisionFlag(String provisionFlag) {
        this.provisionFlag = provisionFlag;
    }

    public String getPetFlag() {
        return petFlag;
    }

    public void setPetFlag(String petFlag) {
        this.petFlag = petFlag;
    }

    public String getPetWeight() {
        return petWeight;
    }

    public void setPetWeight(String petWeight) {
        this.petWeight = petWeight;
    }

    public String getDogBreed() {
        return dogBreed;
    }

    public void setDogBreed(String dogBreed) {
        this.dogBreed = dogBreed;
    }

    public String getEmergencyFlag() {
        return emergencyFlag;
    }

    public void setEmergencyFlag(String emergencyFlag) {
        this.emergencyFlag = emergencyFlag;
    }

    public String getEntranceFlag() {
        return entranceFlag;
    }

    public void setEntranceFlag(String entranceFlag) {
        this.entranceFlag = entranceFlag;
    }

    public String getParkingFlag() {
        return parkingFlag;
    }

    public void setParkingFlag(String parkingFlag) {
        this.parkingFlag = parkingFlag;
    }

    public String getInOutFlag() {
        return inOutFlag;
    }

    public void setInOutFlag(String inOutFlag) {
        this.inOutFlag = inOutFlag;
    }

    public String getP1() {
        return p1;
    }

    public void setP1(String p1) {
        this.p1 = p1;
    }

    public String getP2() {
        return p2;
    }

    public void setP2(String p2) {
        this.p2 = p2;
    }

    public String getP3() {
        return p3;
    }

    public void setP3(String p3) {
        this.p3 = p3;
    }

    public String getP4() {
        return p4;
    }

    public void setP4(String p4) {
        this.p4 = p4;
    }

    public String getP5() {
        return p5;
    }

    public void setP5(String p5) {
        this.p5 = p5;
    }

    public String getP6() {
        return p6;
    }

    public void setP6(String p6) {
        this.p6 = p6;
    }

    public String getP7() {
        return p7;
    }

    public void setP7(String p7) {
        this.p7 = p7;
    }

    public String getP8() {
        return p8;
    }

    public void setP8(String p8) {
        this.p8 = p8;
    }

    public String getP9() {
        return p9;
    }

    public void setP9(String p9) {
        this.p9 = p9;
    }

    public String getP10() {
        return p10;
    }

    public void setP10(String p10) {
        this.p10 = p10;
    }

    public int getReview_num() {
        return review_num;
    }

    public void setReview_num(int review_num) {
        this.review_num = review_num;
    }

    public int getStar_avg() {
        return star_avg;
    }

    public void setStar_avg(int star_avg) {
        this.star_avg = star_avg;
    }   

}