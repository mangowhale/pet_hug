package com.springmvc.repository;

import com.springmvc.domain.HotelCart;

public interface HotelCartRepository 
{
	HotelCart create(HotelCart hotelcart);
	HotelCart read(String hotelcartId);
	
	void update(String hotelcartId, HotelCart hotelcart);
	
	void delete(String hotelcartId);
}
