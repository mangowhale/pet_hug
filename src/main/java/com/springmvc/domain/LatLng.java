package com.springmvc.domain;

public class LatLng {
	private String lat;
	private String lng;
	private String title;
	private String contentSeq;
	private String p1;
	private String partName;
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentSeq() {
		return contentSeq;
	}
	public void setContentSeq(String contentSeq) {
		this.contentSeq = contentSeq;
	}
	public String getP1() {
		return p1;
	}
	public void setP1(String p1) {
		this.p1 = p1;
	}
	public String getPartName() {
		return partName;
	}
	public void setPartName(String partName) {
		if(partName.equals("숙박"))
			this.partName = "hotel";
		else if(partName.equals("관광지"))
			this.partName = "spot";
		else if(partName.equals("식음료"))
			this.partName = "cafe";
		else if(partName.equals("체험"))
			this.partName = "exp";
	}
	
	
}
