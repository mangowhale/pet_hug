package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springmvc.domain.HotelCart;
import com.springmvc.repository.HotelCartRepository;

@Service
public class HotelCartServiceImpl implements HotelCartService
{
	@Autowired
	private HotelCartRepository hotelcartRepository;
	
	public HotelCart create(HotelCart hotelcart)
	{
		return hotelcartRepository.create(hotelcart);
	}
	
	public HotelCart read(String hotelcartId)
	{
		return hotelcartRepository.read(hotelcartId);
	}
	
	public void update(String hotelcartId, HotelCart hotelcart)
	{
		hotelcartRepository.update(hotelcartId, hotelcart);
	}
	
	public void delete(String hotelcartId)
	{
		hotelcartRepository.delete(hotelcartId);
	}
}
