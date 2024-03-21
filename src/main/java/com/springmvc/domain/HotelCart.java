package com.springmvc.domain;

import java.util.*;

public class HotelCart 
{
	private String hotelcartId;								//관심목록 ID
	private Map<String, HotelCartItem> hotelcartItems;		//관심목록 항목
	
	public HotelCart() 
	{
		hotelcartItems = new HashMap<String, HotelCartItem>();
	}

	public HotelCart(String hotelcartId) 
	{	
		this();
		this.hotelcartId = hotelcartId;		
	}

	public String getHotelcartId() {
		return hotelcartId;
	}

	public void setHotelcartId(String hotelcartId) {
		this.hotelcartId = hotelcartId;
	}

	public Map<String, HotelCartItem> getHotelcartItems() {
		return hotelcartItems;
	}

	public void setHotelcartItems(Map<String, HotelCartItem> hotelcartItems) {
		this.hotelcartItems = hotelcartItems;
	}

	@Override
	public int hashCode() {
		return Objects.hash(hotelcartId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HotelCart other = (HotelCart) obj;
		return Objects.equals(hotelcartId, other.hotelcartId);
	}
	
	public void addHotelCartItem(HotelCartItem item)
	{
		String contentSeq = item.getHotel().getContentSeq(); // 현재 등록하기 위한 숙소 번호 가져오기
		
		// 숙소 번호가 hotelcartItems 객체에 등록되어 있는지 여부 확인
		if (hotelcartItems.containsKey(contentSeq))
		{
			HotelCartItem hotelcartItem = hotelcartItems.get(contentSeq); // 등록된 숙소 번호에 대한 정보 가져오기		
			hotelcartItems.put(contentSeq, hotelcartItem); // 등록된 숙소 번호에 대한 변경 정보(hotelcartItem) 저장
		}
		else
		{
			hotelcartItems.put(contentSeq, item); // 숙소 번호에 대한 숙소 정보(item) 저장
		}
		
	}
	
	public void removeHotelCartItem(HotelCartItem item)
	{
		String contentSeq = item.getHotel().getContentSeq();
		hotelcartItems.remove(contentSeq); // contentSeq 숙소 삭제		
	}
}
