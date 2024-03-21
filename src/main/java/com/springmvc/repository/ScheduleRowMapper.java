package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Schedule;

public class ScheduleRowMapper implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Schedule schedule = new Schedule();
		schedule.setContentSeq(rs.getString(1));
		schedule.setPartName(rs.getString(2));
		schedule.setTitle(rs.getString(3));
		schedule.setKeyword(rs.getString(4));
		schedule.setP1(rs.getString(5));
		schedule.setContent(rs.getString(6));
		return schedule;
	}

}
