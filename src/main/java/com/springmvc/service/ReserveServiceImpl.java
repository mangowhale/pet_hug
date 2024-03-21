package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Reserve;
import com.springmvc.repository.ReserveRepository;



@Service
public class ReserveServiceImpl implements ReserveService
{
	@Autowired
	private ReserveRepository reserveRepository;

	@Override
	public List<Reserve> getAllReserveList() 
	{
		return reserveRepository.getAllReserveList();
	}

	@Override
	public List<Reserve> getReserveListByNum(String num) //등록번호검색 % + {@@} + %
	{
		List<Reserve> reservesByNum = reserveRepository.getReserveListByNum(num);
		return reservesByNum;
	}
	
	@Override
	public List<Reserve> getReserveListByTitle(String title) //숙소명검색 % + {@@} + %
	{
		List<Reserve> reservesByTitle = reserveRepository.getReserveListByTitle(title);
		return reservesByTitle;
	}

	@Override
	public List<Reserve> getReserveListByMem_id(String mem_id) //고객id검색 % + {@@} + %
	{
		List<Reserve> reservesByMem_id = reserveRepository.getReserveListByMem_id(mem_id);
		return reservesByMem_id;
	}
	
	@Override
	public List<Reserve> getReserveListByName(String name) //고객이름검색 % + {@@} + %
	{
		List<Reserve> reservesByName = reserveRepository.getReserveListByName(name);
		return reservesByName;
	}
	
	@Override
	public List<Reserve> getReserveListByTel(String tel) //고객연락처검색 % + {@@} + %
	{
		List<Reserve> reservesByTel = reserveRepository.getReserveListByTel(tel);
		return reservesByTel;
	}
	
	@Override
	public List<Reserve> getReserveListByDate(String date) //예약날짜검색 % + {@@} + %
	{
		List<Reserve> reservesByDate = reserveRepository.getReserveListByDate(date);
		return reservesByDate;
	}	
	
	@Override
	public Reserve getReserveByMem_id(String mem_id) //상세보기용  reserves/reserve?mem_id=mem_id 일치
	{
		Reserve reserveByMem_id = reserveRepository.getReserveByMem_id(mem_id);
		return reserveByMem_id;
	}
	@Override
	public Reserve getReserveByNum(String num) //상세보기용  reserves/reserve?num=num 일치
	{
		Reserve reserveByNum = reserveRepository.getReserveByNum(num);
		return reserveByNum;
	}

	@Override //예약추가용
	public void setNewReserve(Reserve reserve) 
	{		
		reserveRepository.setNewReserve(reserve);
	}

	@Override //예약 수정용
	public void setUpdateReserve(Reserve reserve) 
	{
		reserveRepository.setUpdateReserve(reserve);		
	}

	@Override //예약 삭제용
	public void setDeleteReserve(String num) 
	{
		reserveRepository.setDeleteReserve(num);
		
	}
	
	
	
}
