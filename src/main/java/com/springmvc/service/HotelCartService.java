package com.springmvc.service;

import com.springmvc.domain.HotelCart;

public interface HotelCartService 
{
	HotelCart create(HotelCart hotelcart);
	HotelCart read(String hotelcartId);
	
	void update(String hotelcartId, HotelCart hotelcart);
	
	void delete(String hotelcartId);
}
