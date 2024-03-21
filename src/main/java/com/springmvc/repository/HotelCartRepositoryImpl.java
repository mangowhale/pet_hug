package com.springmvc.repository;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.springmvc.domain.HotelCart;

@Repository
public class HotelCartRepositoryImpl implements HotelCartRepository
{
	private Map<String, HotelCart> listOfHotelCarts;
	
	public HotelCartRepositoryImpl()
	{
		listOfHotelCarts = new HashMap<String, HotelCart>();
	}
	
	public HotelCart create(HotelCart hotelcart)
	{
		if (listOfHotelCarts.keySet().contains(hotelcart.getHotelcartId()))
		{
			throw new IllegalArgumentException(String.format("관심등록을 생성할 수 없습니다. 관심등록 id(%)가 존재합니다", hotelcart.getHotelcartId()));
		}
		listOfHotelCarts.put(hotelcart.getHotelcartId(), hotelcart);
		return hotelcart;
	}
	
	public HotelCart read(String hotelcartId)
	{
		return listOfHotelCarts.get(hotelcartId);
	}
	
	public void update(String hotelcartId, HotelCart hotelcart) 
	{
		if (!listOfHotelCarts.keySet().contains(hotelcartId))
		{
			// 관심목록 ID가 존재하지 않은 경우 예외 처리
			throw new IllegalArgumentException(String.format("관심목록을 갱신할 수 없습니다. 관심목록 id(%)가 존재하지 않습니다", hotelcartId));
		}
		listOfHotelCarts.put(hotelcartId, hotelcart);
		
	}
	
	public void delete(String hotelcartId)
	{
		if (!listOfHotelCarts.keySet().contains(hotelcartId))
		{
			// 장바구니 ID가 존재하지 않은 경우 예외 처리
			throw new IllegalArgumentException(String.format("관심목록 목록을 삭제할 수 없습니다. 관심목록 id(%)가 존재하지 않습니다", hotelcartId));
		}
		listOfHotelCarts.remove(hotelcartId);
	}
	
}
