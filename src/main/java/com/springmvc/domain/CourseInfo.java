package com.springmvc.domain;

public class CourseInfo {
	private int duration;
	private String convertedDuration;
	private int distance;
	private String convertedDistance;
	private int tollFare;
	private String convertedTollFare;
	private int fuelPrice;
	private String convertedFuelPrice;
	
	public String getConvertedTollFare() {
		return convertedTollFare;
	}
	public void setConvertedTollFare(String convertedTollFare) {
		this.convertedTollFare = convertedTollFare;
	}
	public String getConvertedFuelPrice() {
		return convertedFuelPrice;
	}
	public void setConvertedFuelPrice(String convertedFuelPrice) {
		this.convertedFuelPrice = convertedFuelPrice;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getConvertedDuration() {
		return convertedDuration;
	}
	public void setConvertedDuration(String convertedDuration) {
		this.convertedDuration = convertedDuration;
	}
	public int getTollFare() {
		return tollFare;
	}
	public void setTollFare(int tollFare) {
		this.tollFare = tollFare;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getConvertedDistance() {
		return convertedDistance;
	}
	public void setConvertedDistance(String convertedDistance) {
		this.convertedDistance = convertedDistance;
	}
	public int getFuelPrice() {
		return fuelPrice;
	}
	public void setFuelPrice(int fuelPrice) {
		this.fuelPrice = fuelPrice;
	}
	
	public void convertDuration(int duration) {
		int hour = 0;
		while(duration > 60) {
			duration = duration - 60;
			hour++;
		}
		if(hour >= 1) {
			this.convertedDuration = hour + "시간 " + duration + "분";
		}else {
			this.convertedDuration = duration + "분";
		}
		
	}
	
	public void convertDistance(int distance) {
		this.convertedDistance = distance/1000 + "km";
	}
	
	public String convertPrice(int price) {
		String convertedPrice = String.format("%,d", fuelPrice);
		return convertedPrice + "원";
	}
}
