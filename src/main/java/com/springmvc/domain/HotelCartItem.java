package com.springmvc.domain;

import java.util.Objects;

public class HotelCartItem 
{
	private Content hotel;		//호텔
	
	public HotelCartItem() 
	{

	}
	
	public HotelCartItem(Content hotel) 
	{
		super();
		this.hotel = hotel;
	}

	public Content getHotel() {
		return hotel;
	}

	public void setHotel(Content hotel) {
		this.hotel = hotel;
	}

	
	
	
	@Override
	public int hashCode() {
		return Objects.hash(hotel);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HotelCartItem other = (HotelCartItem) obj;
		return Objects.equals(hotel, other.hotel);
	}

}
