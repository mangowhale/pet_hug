package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Reserve;

public class ReserveRowMapper implements RowMapper<Reserve>
{
	public Reserve mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Reserve reserve = new Reserve();
		reserve.setNum(rs.getString(1));
		reserve.setTitle(rs.getString(2));
		reserve.setMem_id(rs.getString(3));
		reserve.setName(rs.getString(4));
		reserve.setTel(rs.getString(5));		
		reserve.setDate(rs.getString(6));
		reserve.setContentSeq(rs.getString(7));
		return reserve;
	}
}
