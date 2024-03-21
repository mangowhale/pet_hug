package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Reserve;


public interface ReserveService 
{
	List<Reserve> getAllReserveList(); //전부검색
	List<Reserve> getReserveListByNum(String num); //등록번호검색 % + {@@} + %
	List<Reserve> getReserveListByTitle(String title); //숙소명검색 % + {@@} + %
	List<Reserve> getReserveListByMem_id(String mem_id); //고객id검색 % + {@@} + %
	List<Reserve> getReserveListByName(String name); //고객이름검색 % + {@@} + %
	List<Reserve> getReserveListByTel(String tel); //고객연락처검색 % + {@@} + %
	List<Reserve> getReserveListByDate(String date); //예약날짜검색 % + {@@} + %
	
	Reserve getReserveByMem_id(String mem_id); //상세보기용  reserves/reserve?mem_id=mem_id 일치
	Reserve getReserveByNum(String num); //상세보기용  reserves/reserve?num=num 일치

	void setNewReserve(Reserve reserve); //예약추가용
	
	void setUpdateReserve(Reserve reserve); //예약수정용
	
	void setDeleteReserve(String num); //예약삭제용

}
