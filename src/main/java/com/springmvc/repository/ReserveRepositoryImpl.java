package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Reserve;

@Repository
public class ReserveRepositoryImpl implements ReserveRepository
{
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Reserve> getAllReserveList() 
	{
		// db연동 + ${reserve} 사용
		String SQL = "SELECT * FROM Reserve";
		List<Reserve> listOfReserves = template.query(SQL, new ReserveRowMapper());
		
		return listOfReserves;
	}

	@Override
	public List<Reserve> getReserveListByNum(String num) 
	{
		List<Reserve> reservesByNum = new ArrayList<Reserve>();
		
		//db연결 
		String SQL = "SELECT * FROM Reserve where num LIKE '%" + num + "%'";
		reservesByNum =  template.query(SQL, new ReserveRowMapper());
		
		return reservesByNum;
	}
	
	@Override
	public List<Reserve> getReserveListByTitle(String title) 
	{
		List<Reserve> reservesByTitle = new ArrayList<Reserve>();
		
		//db연결 
		String SQL = "SELECT * FROM Reserve where title LIKE '%" + title + "%'";
		reservesByTitle =  template.query(SQL, new ReserveRowMapper());
		
		return reservesByTitle;
	}

	@Override
	public List<Reserve> getReserveListByMem_id(String mem_id) 
	{
		List<Reserve> reservesByMem_id = new ArrayList<Reserve>();
		
		//db연결 
		String SQL = "SELECT * FROM Reserve where mem_id LIKE '%" + mem_id + "%'";
		reservesByMem_id =  template.query(SQL, new ReserveRowMapper());
		
		return reservesByMem_id;
	}

	@Override
	public List<Reserve> getReserveListByName(String name) 
	{
		List<Reserve> reservesByName = new ArrayList<Reserve>();
		
		//db연결 
		String SQL = "SELECT * FROM Reserve where name LIKE '%" + name + "%'";
		reservesByName =  template.query(SQL, new ReserveRowMapper());
		
		return reservesByName;
	}

	@Override
	public List<Reserve> getReserveListByTel(String tel) 
	{
		List<Reserve> reservesByTel = new ArrayList<Reserve>();
		
		//db연결 
		String SQL = "SELECT * FROM Reserve where tel LIKE '%" + tel + "%'";
		reservesByTel =  template.query(SQL, new ReserveRowMapper());
		
		return reservesByTel;
	}

	@Override
	public List<Reserve> getReserveListByDate(String date) 
	{
		List<Reserve> reservesByDate = new ArrayList<Reserve>();
		
		//db연결 
		String SQL = "SELECT * FROM Reserve where date LIKE '%" + date + "%'";
		reservesByDate =  template.query(SQL, new ReserveRowMapper());
		
		return reservesByDate;
	}

	public Reserve getReserveByMem_id(String mem_id) //상세보기용  reserves/reserve?mem_id=mem_id 일치
	{
		Reserve reserveInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM Reserve where mem_id=?";
		int rowCount = template.queryForObject(SQL, Integer.class, mem_id);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM Reserve where mem_id=?";
			reserveInfo = template.queryForObject(SQL, new Object[] {mem_id}, new ReserveRowMapper());
		}
		
		
		if (reserveInfo == null)
			throw new IllegalArgumentException("회원 ID가 " + mem_id + "인 예약을 찾을 수 없습니다.");
		return reserveInfo;			
	}
	
	public Reserve getReserveByNum(String num) //상세보기용  reserves/reserve?num=num 일치
	{
		Reserve reserveInfo = null;
		
		
		//db연동
		String SQL = "SELECT count(*) FROM Reserve where num=?";
		int rowCount = template.queryForObject(SQL, Integer.class, num);
		if (rowCount != 0)
		{
			SQL = "SELECT * FROM Reserve where num=?";
			reserveInfo = template.queryForObject(SQL, new Object[] {num}, new ReserveRowMapper());
		}
		
		
		if (reserveInfo == null)
			throw new IllegalArgumentException("예약번호가 " + num + "인 예약을 찾을 수 없습니다.");
		return reserveInfo;			
	}
	
	public void setNewReserve(Reserve reserve) //예약저장용
	{ 		
		String SQL ="INSERT INTO Reserve (title, mem_id, name, tel, date, contentSeq)" + "VALUES(?,?,?,?,?,?)";
		template.update(SQL, reserve.getTitle(), reserve.getMem_id(), reserve.getName(), reserve.getTel(), reserve.getDate(), reserve.getContentSeq());
	}

	@Override
	public void setUpdateReserve(Reserve reserve) //예약수정용
	{
		String SQL = "UPDATE Reserve SET title = ?, mem_id = ?, name = ?, tel = ?, date = ? where num = ?";
		template.update(SQL, reserve.getTitle(), reserve.getMem_id(), reserve.getName(), reserve.getTel(), reserve.getDate(), reserve.getNum());
		
	}
	
	@Override //예약삭제용
	public void setDeleteReserve(String num) 
	{
		String SQL = "DELETE from Reserve where num = ?";
		this.template.update(SQL, num);
		
	}
	
}
